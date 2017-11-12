using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigShop.Areas.Admin.Controllers
{
    public class SettingController : SecurityController
    {
        // GET: Admin/Setting
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Menu()
        {
            return View();
        }
        public ActionResult Slide()
        {
            return View();
        }
    }
}