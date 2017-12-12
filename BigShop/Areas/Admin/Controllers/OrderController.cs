using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;

namespace BigShop.Areas.Admin.Controllers
{
    public class OrderController : Controller
    {
        // GET: Admin/Order
        public ActionResult Index()
        {
            ViewBag.Order = new OrderDao().ListAll().ToList();
            return View();
        }
        public JsonResult GetDetail(int id)
        {
            var data = new OrderDetailDao().GetOrderByID(id);
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult ChangeStatus(long id, int status)
        {
            new OrderDao().ChangeStatus(id, status);
            return Json(new { status = true });
        }
        public JsonResult DelOrder(long id)
        {
            new OrderDao().DelOrder(id);
            return Json(new { status = true });
        }
    }
}