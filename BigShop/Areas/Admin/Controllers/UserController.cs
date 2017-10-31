using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BigShop.Areas.Admin.Controllers
{
    public class UserController : SecurityController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            var model = new UserDao().ListAll();
            return View(model);
        }
        public JsonResult Delete(int id)
        {
            var result = new UserDao().Delete(id);

            return Json(new
            {
                status = true
            });
        }
        public JsonResult Manipulation(int id)
        {
            var result = new UserDao().Manipulation(id);

            return Json(new
            {
                status = true
            });
        }

        public ActionResult Insert(string username, string password, string confirmpassword, string name, string email, string phone, string address)
        {
            ViewBag.Notif = null;
            if (ModelState.IsValid)
            {
                var dao = new UserDao();

                if (dao.CheckUserName(username))
                {
                    ViewBag.Notif = "Tên đăng nhập đã tồn tại";
                }
                else
                {
                    var user = new User();
                    user.UserName = username;
                    user.PassWord = password;
                    user.Name = name;
                    user.Address = address;
                    user.Email = email;
                    user.Phone = phone;

                    var result = dao.Insert(user);

                    if (result > 0)
                    {
                        ViewBag.Notif = "Thành công";
                    }
                    else
                    {
                        ViewBag.Notif = "Có Lỗi xảy ra, vui lòng đăng kí lại";
                    }
                }
            }
            return View();
        }
        public JsonResult ChangeType(int id, string action)
        {
            var result = new UserDao().ChangeType(id,action);

            return Json(new
            {
                status = true
            });
        }

        public ActionResult PersonalInformation()
        {
            return View();
        }
    }
}