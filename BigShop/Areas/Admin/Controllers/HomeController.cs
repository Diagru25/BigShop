using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigShop.Areas.Admin.Controllers
{
    public class HomeController : SecurityController
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }
    }
}