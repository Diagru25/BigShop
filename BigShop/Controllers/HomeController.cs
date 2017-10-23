using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigShop.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var dao = new ProductDao();

            var model = dao.GetNewPhone();

            return View(model);
        }

        [ChildActionOnly]
        public ActionResult LeftMenu()
        {
            var dao = new ProductCategoryDao();
            var dao1 = new ProductCategorySmallDao();

            var model = dao.ListAll();

            ViewBag.LiSmall = dao1.ListAll();

            return View(model);
        }
        [ChildActionOnly]
        public ActionResult Footer()
        {
            var model = new MenuDao().ListAll();
            ViewBag.ProductCategory = new ProductCategoryDao().ListAll();
            ViewBag.a = "dhsfhsf";
            return View(model);
        }
    }
}