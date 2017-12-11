using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;
using Model.EF;
using Model.EF.OverView;

namespace BigShop.Areas.Admin.Controllers
{
    public class HomeController : SecurityController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            var NewOrder = new OrderDao().NewOrder();
            var FBack = new FeedBackDao().ListAll();
            ViewBag.NewOrder = NewOrder;
            ViewBag.FBack = FBack;
            return View();
        }
        public ActionResult HasReadAll()
        {
            var dao = new FeedBackDao();
            dao.HasReadAll();
            return RedirectToAction("Index");
        }
        public JsonResult FeedBackByStatus(int status)
        {
            var data = new FeedBackDao().ListByStatus(status);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FeedBackByStatus1(int a)
        {
            return Json(a, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ViewDetailOrder(int ID)
        {
            var data = new OrderDetailDao().GetOrderByID(ID);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ChangeStatus(int id)
        {
            var dao = new OrderDao();
            dao.ChangeStatus(id);
            return Json(new { status = true });
        }
        public JsonResult GetFBByID(int id)
        {
            var data = new FeedBackDao().GetbyID(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult FBChangeStatus(int id, int status)
        {
            new FeedBackDao().ChangeStatus(id, status);
            return Json(new { status = true });
        }
        public JsonResult FBDel(int id)
        {
            new FeedBackDao().DelFeedBack(id);
            return Json(new { status = true });
        }
    }
}