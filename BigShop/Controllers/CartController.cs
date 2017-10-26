using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BigShop.Common;
using BigShop.Models;
using Model.EF_province;

namespace BigShop.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CommonConst.CartSession];
            var list = new List<CartItem>();
            if (cart != null)
            {
                list = (List<CartItem>)cart;
            }
            return View(list);
        }
        public JsonResult Delete(long id)
        {
            var cart = (List<CartItem>)Session[CommonConst.CartSession];
            var cart_item = cart.SingleOrDefault(x => x.Product.ID == id);
            cart.Remove(cart_item);

            return Json(new
            {
                status = true
            });
        }
        public JsonResult Idenquantity(long id)
        {
            var session = (List<CartItem>)Session[CommonConst.CartSession];

            foreach (var item in session)
            {
                if (item.Product.ID == id)
                {
                    item.Quantity += 1;
                    break;
                }
            }
            //SaveDb();
            return Json(new
            {
                status = true
            });
        }
        public JsonResult Desquantity(long id)
        {
            var session = (List<CartItem>)Session[CommonConst.CartSession];

            foreach (var item in session)
            {
                if (item.Product.ID == id && item.Quantity > 0)
                {
                    item.Quantity -= 1;
                    if (item.Quantity == 0)
                    {
                        session.Remove(item);
                    }
                    break;
                }

            }
            //SaveDb();
            return Json(new
            {
                status = true
            });
        }
        public ActionResult Add_Item(long id)
        {
            var cart = Session[CommonConst.CartSession];

            if (cart != null)
            {
                var list = (List<CartItem>)cart;

                if (list.Exists(x => x.Product.ID == id))
                {
                    foreach (var item in list)
                    {
                        if (item.Product.ID == id)
                        {
                            item.Quantity += 1;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();

                    item.Product = new ProductDao().GetById(id);
                    item.Quantity = 1;
                    list.Add(item);
                }
                Session[CommonConst.CartSession] = list;
            }
            else
            {
                var item = new CartItem();

                item.Product = new ProductDao().GetById(id);
                item.Quantity = 1;
                var list = new List<CartItem>();
                list.Add(item);

                Session[CommonConst.CartSession] = list;
            }
            var _cart = (List<CartItem>)Session[CommonConst.CartSession];
            var lo = _cart.Sum(x => x.Quantity);
            return Json(lo, JsonRequestBehavior.AllowGet);
        }

        [HttpGet]
        public ActionResult Payment()
        {
            var islogin = Session[CommonConst.UserSession];
            if (islogin != null)
            {
                var temp = (LoginModel)islogin;
                ViewBag.User = new UserDao().GetById(temp.UserID);

                // laays thoong tin province
                ViewBag.province = new ProvinceDao().LoadAll();

                var cart = Session[CommonConst.CartSession];
                var list = new List<CartItem>();
                if (cart != null)
                {
                    list = (List<CartItem>)cart;
                }
                return View(list);
            }
            else
            {
                return RedirectToAction("Login", "User");
            }
        }
        [HttpPost]
        public ActionResult Payment(string email, string name, string city, string district , string commune, string address, string phone)
        {
            var order = new Order();
            order.ShipName = name;
            order.ShipMobile = phone;
            order.ShipAdress = address + "-" + commune + "-" + district + "-" + city;
            order.ShipEmail = email;

            try
            {
                var id = new OrderDao().Insert(order);
                var cart = (List<CartItem>)Session[CommonConst.CartSession];
                var orderdetail = new OrderDetailDao();
                foreach (var item in cart)
                {
                    var detail = new OrderDetail();
                    detail.OrderID = id;
                    detail.ProductID = item.Product.ID;
                    detail.Price = item.Product.Price;
                    detail.Quantity = item.Quantity;
                    orderdetail.Insert(detail);
                }
            }
            catch
            {

            }
            return RedirectToAction("Index", "Home");
        }

        // hàm này để đây và không có tác dụng gì
        public void SaveDb()
        {
            var session = (List<CartItem>)Session[CommonConst.CartSession];
            foreach (var item in session)
            {
                var _cart = new Cart();
                _cart.ProductID = item.Product.ID;
                _cart.Quantity = item.Quantity;
                _cart.UserID = ((LoginModel)Session[CommonConst.UserSession]).UserID;
                _cart.Status = false;

                var result = new CartDao().Insert(_cart);
            }
        }
        public JsonResult GetProvince()
        {
            List<province> data = new ProvinceDao().LoadAll();

            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetDistrictByProvinceId(string id)
        {
            List<district> data = new DistrictDao().GetListByProvinceId(id);

            return Json(data, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetWardByDistrictId(string id)
        {
            List<ward> data = new WardDao().GetListByDistrictId(id);

            return Json(data, JsonRequestBehavior.AllowGet);
        }
    }
}