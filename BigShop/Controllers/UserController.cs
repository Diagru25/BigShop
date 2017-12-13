using BigShop.Models;
using Model.DAO;
using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BigShop.Common;

namespace BigShop.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Logout()
        {
            Session[CommonConst.UserSession] = null;
            Session[CommonConst.CartSession] = null;
            return RedirectToAction("Index", "Home");
        }
        public JsonResult GetUrl(string _url)
        {
            CommonConst.url = _url;
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            ViewBag.Notif = null;
            if (ModelState.IsValid)
            {
                var dao_user = new UserDao();

                var result = dao_user.Login(username, password);

                if (result == 1 || result == 2)
                {
                    var user = dao_user.GetUserByUserName(username);

                    var user_session = new Account();
                    user_session.UserName = user.UserName;
                    user_session.PassWord = user.PassWord;
                    user_session.Role = new UserDao().GetRoleByUserName(user.UserName);
                    Session.Add(CommonConst.UserSession, user_session);

                    /*// lay danh sach gio hang cua User
                    var list = new CartDao().ListByUserID(user.ID);
                    var cart_list = new List<CartItem>();
                    foreach (var item in list)
                    {
                        var cart_session = new CartItem();
                        cart_session.Product = new ProductDao().GetById(item.ProductID);
                        cart_session.Quantity = item.Quantity;
                        cart_list.Add(cart_session);
                    }
                    Session[CommonConst.CartSession] = cart_list;*/
                    return Redirect(CommonConst.url);
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
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public JsonResult Register(string username, string password, string name, string email, string phone, string address, string province, string district, string ward, string day, string month, string year)
        {
            string data = "";
            if (ModelState.IsValid)
            {
                var dao = new UserDao();

                if (dao.CheckUserName(username))
                {
                    data = "Tên đăng nhập đã tồn tại";
                }
                else if (dao.CheckEmail(email))
                {
                    data = "Email đã được đăng kí";
                }
                else
                {
                    try
                    {
                        string dob = month + "/" + day + "/" + year;
                        var user = new User();
                        user.UserName = username;
                        user.PassWord = password;
                        user.Name = name;
                        user.Address = address + "-" + ward + "-" + district + "-" + province;
                        user.Email = email;
                        user.Phone = phone;
                        user.Dayofbirth = Convert.ToDateTime(dob);
                        user.CreatedDate = DateTime.Now;

                        var result = dao.Insert(user);

                        data = "Đăng kí thành công";
                    }
                    catch(Exception)
                    {
                        data = "Lỗi không xác định ( Bạn hãy kiểm tra lại ngày, tháng, năm )";
                    }
                }
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult check()
        {
            string data = "";
            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}