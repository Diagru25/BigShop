using BigShop.Common;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace BigShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(long id)
        {

            var dao = new ProductDao();

            var model = dao.GetById(id);

            ViewBag.RelatedProduct = dao.RelatedProduct(id);

            ViewBag.image = LoadImage(id);

            return View(model);
        }
        public ActionResult ProductCategory(long id, long sid, int page_index = 1, int con = 0)
        {

            var dao = new ProductDao();

            int total_page = 1;
            int page_size = 1;
            List<Product> model = new List<Product>();

            if (con != 0)
            {
                CommonConst._con = con;
            }
            if (CommonConst._con != 0)
            {
                model = dao.GetListByCategoryId(id, sid, CommonConst._con);
            }
            else
            {
                model = dao.GetListByCategoryId(id, sid, con);
            }
            ViewBag.CategoryName = dao.GetNameCategory(id, sid);
            ViewBag.id = id;
            ViewBag.sid = sid;

            total_page = (model.Count % page_size == 0) ? (model.Count / page_size) : (model.Count / page_size + 1);
            ViewBag.total_page = total_page;

            List<Product> _model = new List<Product>();
            if (model.Count > 0)
            {
                for (int i = (page_index - 1) * page_size; i <= (page_index * page_size) - 1; i++)
                {
                    _model.Add(model[i]);
                }
            }

            return View(_model);
        }

        public JsonResult ProductCategory_Sort(long id, long sid, int con = 0)
        {
            var dao = new ProductDao();

            var data = dao.GetListByCategoryId(id, sid, con);

            return Json(data, JsonRequestBehavior.AllowGet);
        }

        public List<string> LoadImage(long id)
        {
            var product = new ProductDao().GetById(id);
            var images = product.MoreImages;
            List<string> listImagesReturn = new List<string>();
            try
            {
                XElement xml = XElement.Parse(images);

                foreach (XElement element in xml.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
                return listImagesReturn;
            }
            catch (Exception)
            {
                return listImagesReturn;
            }
        }
        public ActionResult Search(string text, int page_index = 1)
        {
            int total_page = 1;
            int page_size = 1;

            string[] term = text.Split(' ');
            List<string> ls = term.ToList();
            var model = new ProductDao().Search(ls);

            total_page = (model.Count % page_size == 0) ? (model.Count / page_size) : (model.Count / page_size + 1);
            ViewBag.total_page = total_page;
            ViewBag.text = text;

            List<Product> _model = new List<Product>();
            if (model.Count > 0)
            {
                for (int i = (page_index - 1) * page_size; i <= (page_index * page_size) - 1; i++)
                {
                    _model.Add(model[i]);
                }
            }

            return View(_model);
        }
    }
}