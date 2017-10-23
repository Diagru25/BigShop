using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

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

            return View(model);
        }

        public ActionResult ProductCategory(long id, long sid)
        {
            var dao = new ProductDao();

            var model = dao.GetListByCategoryId(id, sid);

            ViewBag.CategoryName = dao.GetNameCategory(id, sid);

            return View(model);
        }
    }
}