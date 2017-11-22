using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using System.Xml.Linq;

namespace BigShop.Areas.Admin.Controllers
{
    public class ProductController : SecurityController
    {
        private Product item = new Product();
        private BigShopDbContext _context;
        public ProductController()
        {
            _context = new BigShopDbContext();
        }

        // GET: Admin/Product
        // Danh sách các sản phẩm
        public ActionResult Index()
        {
            var model = new ProductDao().Products();
            return View(model);
        }

        // Lấy ra 1 sản phẩm theo ID để đấy lên Modal
        public ActionResult Get(long id)
        {
            var product = new ProductDao().GetById(id);
            return Json(product, JsonRequestBehavior.AllowGet);
        }


        /*[HttpPost]
        public ActionResult Edit(Product product)
        {
            if(ModelState.IsValid)
            {
                _context.Entry(product).State = System.Data.Entity.EntityState.Modified;
                _context.SaveChanges();
            }
            return Json(product, JsonRequestBehavior.AllowGet);
        }*/

        // Thêm 1 sản phẩm
        [HttpPost]
        public ActionResult Insert(string name, int categoryid, int brandid, string price, string metakeyword, string warranty, string description, int quantity, HttpPostedFileBase file)
        {
            var product = new Product();
            try
            {
                string pic = name.Replace(" ", "-").ToLower() + System.IO.Path.GetExtension(file.FileName).ToLower();
                string path = System.IO.Path.Combine(Server.MapPath("/Assets/client/images"), pic);
                file.SaveAs(path);
                product.Name = name;
                product.CategoryID = categoryid;
                product.BrandID = brandid;
                product.MetaTitle = ConvertToUnSign(name);
                product.MetaKeywords = System.Convert.ToInt64(metakeyword);
                product.Warranty = Convert.ToInt32(warranty);
                product.Price = System.Convert.ToDecimal(price);
                product.Description = description;
                product.Quantity = quantity;
                product.Image = "/Assets/client/images/" + pic;
                var dao = new ProductDao();
                dao.Insert(product);
            }
            catch (Exception)
            {
            }

            return RedirectToAction("Index");

        }

        [HttpPost]
        public ActionResult Edit(string name, string code, string metakeyword, string price, string quantity, string image, long ProductID)
        {
            var product = new ProductDao().GetById(ProductID);
            product.Name = name;
            product.Code = code;
            product.MetaKeywords = System.Convert.ToInt64(metakeyword);
            product.Price = System.Convert.ToDecimal(price);
            product.Quantity = Convert.ToInt32(quantity);
            // ảnh

            // thích thì kiểm tra bên hàm của productDao()
            var result = new ProductDao().Edit(product);

            return View();
        }

        // Xóa 1 sản phẩm
        public JsonResult Delete(long id)
        {
            var result = new ProductDao().Delete(id);

            return Json(new
            {
                status = true
            });
        }

        // Trang danh mục sản phẩm
        public ActionResult Category()
        {
            var model = new ProductCategoryDao().ListAllAdmin();
            return View(model);
        }

        // Thống kê sản phẩm bán chạy nhất
        public ActionResult HotProduct()
        {
            return View();
        }

        // Thống kê Doanh thu
        public ActionResult Revenue()
        {
            return View();
        }

        //Lấy brand theo cate
        [HttpPost]
        public JsonResult GetBrand(int id)
        {
            List<ProductCategorySmall> data = new ProductCategorySmallDao().ListByCategoryAdmin(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //Lấy cate
        public JsonResult GetCategory()
        {
            List<ProductCategory> data = new ProductCategoryDao().ListAllAdmin();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //Lấy sp theo brand cate
        public JsonResult GetBrandCategory(int brandid, int cateid)
        {
            var data = new ProductDao().GetProductByBrandAndCategory(brandid, cateid);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        //Load Images xml
        public JsonResult LoadImages(long id)
        {
            var product = new ProductDao().GetById(id);
            var images = product.MoreImages;
            try
            {
                XElement xml = XElement.Parse(images);
                List<string> listImagesReturn = new List<string>();

                foreach (XElement element in xml.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
                return Json(new
                {
                    data = listImagesReturn,
                    status = true
                }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception)
            {
                return Json(new
                {
                    status = false
                }, JsonRequestBehavior.AllowGet);
            }


        }
        // Save Images XML
        public JsonResult SaveImages(long id, string images)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            var listImages = serializer.Deserialize<List<string>>(images);

            XElement xElement = new XElement("Images");

            foreach (var item in listImages)
            {
                xElement.Add(new XElement("Image", item));
            }
            ProductDao dao = new ProductDao();
            try
            {
                dao.UpdateImages(id, xElement.ToString());
                return Json(new { status = true });
            }
            catch (Exception ex)
            {
                return Json(new { status = false });
            }

        }

        public JsonResult DeleteBrand(int brandid, int cateid)
        {
            ProductDao pd = new ProductDao();
            ProductCategorySmallDao psd = new ProductCategorySmallDao();
            pd.delBrand(brandid, cateid);
            psd.DelBrand(brandid);           
            return Json(new { status = true},JsonRequestBehavior.AllowGet);
        }
        // Thay đổi status
        public JsonResult BrandStatus(int id)
        {
            ProductCategorySmallDao psd = new ProductCategorySmallDao();
            psd.ChangeStatus(id);
            ProductDao pd = new ProductDao();

            var product = pd.GetProductByBrand(id);
            foreach(var item in product)
            {
                pd.ChangeStatus(item.ID);
            }

            return Json(new { status = true});
        }
        //Xóa cate
        public JsonResult DelCategory(int id)
        {
            ProductCategoryDao pd = new ProductCategoryDao();
            pd.DelCategory(id);
            return Json(new { status = true });
        }
        // Thay đổi cate status
        public JsonResult CateStatus(int id)
        {
            ProductCategoryDao pcd = new ProductCategoryDao();
            ProductCategorySmallDao pcsd = new ProductCategorySmallDao();
            ProductDao pd = new ProductDao();
            
            var brand = pcsd.ListByCategoryAdmin(id);
            foreach(var item in brand)
            {
                pcsd.ChangeStatus(item.ID);
                var product = pd.GetProductByBrand(item.ID).ToList();
                foreach(var item2 in product)
                {
                    pd.ChangeStatus(item2.ID);
                }
            }

            pcd.ChangeStatus(id);
            return Json(new { status = true });
        }
        // Thêm cate
        public JsonResult AddCategory(string CateName, int CateSeq)
        {
            string data = "";
            ProductCategory pc = new ProductCategory();
            ProductCategoryDao pcd = new ProductCategoryDao();
            try
            {
                pc.Name = CateName.ToUpper();
                pc.DisplayOrder = CateSeq;
                pc.MetaTitle = ConvertToUnSign(CateName);
                pc.Status = false;
                pcd.Insert(pc);
                data = "Thêm thành công";
            }
            catch
            {
                data = "Lỗi";
            }
            return Json(data,JsonRequestBehavior.AllowGet);
        }
        //Thêm Brand
        public JsonResult AddBrand(string BrandName,int BrandSeq, int CateID)
        {
            string data = "";
            ProductCategorySmall pcs = new ProductCategorySmall();
            ProductCategorySmallDao pcsd = new ProductCategorySmallDao();
            try
            {
                pcs.Name = BrandName.ToUpper();
                pcs.DisplayOrder = BrandSeq;
                pcs.MetaTitle = ConvertToUnSign(BrandName);
                pcs.ProductCategoryID = CateID;
                pcs.Status = false;
                pcsd.Insert(pcs);
                data = "Thêm thành công";
            }
            catch
            {
                data = "Lỗi";
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        // chuyển chuỗi có dấu thành meta-title (vũ tuấn sơn ==> vu-tuan-son)
        public static string ConvertToUnSign(string text)
        {

            for (int i = 33; i < 48; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            for (int i = 58; i < 65; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            for (int i = 91; i < 97; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            for (int i = 123; i < 127; i++)
            {
                text = text.Replace(((char)i).ToString(), "");
            }
            text = text.Replace(" ", "-");
            Regex regex = new Regex(@"\p{IsCombiningDiacriticalMarks}+");
            string strFormD = text.Normalize(System.Text.NormalizationForm.FormD);
            return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D').ToLower();
        }

    }
}