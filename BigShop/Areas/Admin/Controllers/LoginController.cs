using BigShop.Areas.Admin.Models;
using BigShop.Common;
using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigShop.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [ChildActionOnly]
        public ActionResult acc_cmt()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            ViewBag.Notif = null;
            if (ModelState.IsValid)
            {
                var admin = new UserDao();
                var result = admin.Login(username, password);

                if (result == 3 || result == 2)
                {
                    var user = admin.GetUserByUserName(username);

                    var user_session = new AdLoginModel();
                    user_session.username = user.UserName;
                    user_session.userID = user.ID;
                    user_session.userType = user.Type;
                    Session.Add(CommonConst.AdminSession, user_session);
                    return RedirectToAction("Index", "Home");
                }
                else if (result == 1)
                {
                    ViewBag.Notif = "Tài khoản của bạn không phải là admin";
                }
                else if (result == 0)
                {
                    ViewBag.Notif = "Tài khoản không tồn tại";
                }
                else if (result == -1)
                {
                    ViewBag.Notif = "Tài khoản hiện đan tạm khóa";
                }
                else if (result == -2)
                {
                    ViewBag.Notif = "Mật khẩu không đúng";
                }
                else
                {
                    ViewBag.Notif = "Đăng nhập thất bại";
                }
           }
            return View();
        }
        
    }

}