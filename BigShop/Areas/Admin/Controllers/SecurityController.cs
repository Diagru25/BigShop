using BigShop.Areas.Admin.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BigShop.Common;

namespace BigShop.Areas.Admin.Controllers
{
    public class SecurityController : Controller
    {
        // GET: Admin/Security
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var session = (AdLoginModel)Session[CommonConst.AdminSession];
            if (session == null)
            {
                filterContext.Result = new RedirectToRouteResult(new System.Web.Routing.RouteValueDictionary(new { controller = "Login", action = "Index", Area = "Admin" }));
            }
            base.OnActionExecuting(filterContext);
        }

    }
}