using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;

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
        public ActionResult Insert(string name, int categoryid, int brandid, string price, string metatitle, string metakeyword, string warranty, string description, int quantity, HttpPostedFileBase file)
        {
            var product = new Product();
            try
            {
                string pic = name.Replace(" ","-").ToLower() + System.IO.Path.GetExtension(file.FileName).ToLower();
                string path = System.IO.Path.Combine(Server.MapPath("/Assets/client/images"),pic);
                file.SaveAs(path);
                product.Name = name;
                product.CategoryID = categoryid;
                product.BrandID = brandid;
                product.MetaTitle = metatitle;
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
            return View();
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

        [HttpPost]
        public JsonResult GetBrand(int id)
        {
            List<ProductCategorySmall> data = new ProductCategorySmallDao().ListByCategory(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCategory()
        {
            List<ProductCategory> data = new ProductCategoryDao().ListAll();
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetBrandCategory(int brandid, int cateid)
        {
            var data = new ProductDao().GetProductByBrandAndCategory(brandid, cateid);
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
            return regex.Replace(strFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }

    }
}