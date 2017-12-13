using BigShop.Common;
using BigShop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlatShop.Models.Security
{
    public class CustomAuthorizeAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            if(HttpContext.Current==null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary(
                        new 
                        {
                            Controller = "User",
                            Action = "Login",
                            ReturnUrl = filterContext.HttpContext.Request.RawUrl
                        }
                        ));
            }

            var acc = (Account)HttpContext.Current.Session[CommonConst.UserSession];

            if(acc==null)
            {
                filterContext.Result = new RedirectToRouteResult(
                    new System.Web.Routing.RouteValueDictionary(
                        new { Controller="User",Action="Login",
                            ReturnUrl=filterContext.HttpContext.Request.RawUrl
                        }
                        ));
            }
            else
            {
                CustomPrincipal cp = new CustomPrincipal(acc);
                if(!cp.IsInRole(Roles))
                {
                    filterContext.Result = new RedirectToRouteResult(
                        new System.Web.Routing.RouteValueDictionary(
                            new { Controller = "User", Action = "Login" }));
                }
            }
        }

    }
}