using Model.DAO;
using Model.EF;
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

            //ServiceReference2.WebService1SoapClient s = new ServiceReference2.WebService1SoapClient();
            //var a = s.Tesst();


            var dao = new ProductDao();

            var model = dao.GetNewPhone();

            ViewBag.Hot = new OrderDetailDao().Top().Take(4);

            ViewBag.NewTV = dao.GetNew(1);

            ViewBag.NewPro = dao.GetNewProduct();

            ViewBag.NewLap = dao.GetNew(2);



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
        [HttpGet]
        public ActionResult FeedBack()
        {
            return View();
        }
        [HttpPost]
        public JsonResult FeedBack(string name, string email, string content)
        {
            FeedBack fb = new FeedBack();
            fb.Name = name;
            fb.Email = email;
            fb.Content = content;
            fb.CreatedDate = DateTime.Now;
            fb.Status = 0;
            new FeedBackDao().Insert(fb);

            return Json(new
            {
                status = true
            });
        }
    }
}