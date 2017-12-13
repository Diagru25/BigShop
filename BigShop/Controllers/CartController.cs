using Model.DAO;
using Model.EF;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using BigShop.Common;
using BigShop.Models;
using Model.EF_province;
using FlatShop.Models.Security;

namespace BigShop.Controllers
{
    public class CartController : Controller
    {
        // GET: Cart
        public ActionResult Index()
        {
            var islogin = Session[CommonConst.UserSession];
            var temp = (Account)islogin;
            //if(temp != null)
                //ViewBag.Is_Login = temp.UserID;
            //else
                ViewBag.Is_Login = 0;
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
            int q = 0;
            foreach (var item in session)
            {
                if (item.Product.ID == id && new ProductDao().GetById(id).Quantity > 0)
                {
                    item.Quantity += 1;
                    new ProductDao().Add_Cart(id, 0);
                    q = item.Quantity;
                    break;
                }
            }
            //SaveDb();
            return Json(q, JsonRequestBehavior.AllowGet);
        }
        public JsonResult Desquantity(long id)
        {
            var session = (List<CartItem>)Session[CommonConst.CartSession];
            int q = 0;

            foreach (var item in session)
            {
                if (item.Product.ID == id && item.Quantity > 0)
                {
                    item.Quantity -= 1;
                    new ProductDao().Add_Cart(id, 1);
                    q = item.Quantity;
                    if (item.Quantity == 0)
                    {
                        session.Remove(item);
                    }
                    break;
                }

            }
            //SaveDb();
            return Json(q, JsonRequestBehavior.AllowGet);
            
        }
        public ActionResult Add_Item(long id)
        {
            bool check = true;

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
                            new ProductDao().Add_Cart(id, 0);
                            item.Quantity += 1;
                        }
                    }
                }
                else
                {
                    var item = new CartItem();
                    Product p = new ProductDao().GetById(id);
                    if (p.Quantity > 0)
                    {
                        new ProductDao().Add_Cart(id, 0);
                        item.Product = p ;
                        item.Quantity = 1;
                        list.Add(item);
                    }
                    else
                    {
                        check = false;
                    }
                }
                Session[CommonConst.CartSession] = list;
            }
            else
            {
                var list = new List<CartItem>();
                var item = new CartItem();

                Product p = new ProductDao().GetById(id);
                if (p.Quantity > 0)
                {
                    new ProductDao().Add_Cart(id, 0);
                    item.Product = p;
                    item.Quantity = 1;
                    list.Add(item);
                }
                else
                {
                    check = false;
                }

                Session[CommonConst.CartSession] = list;
            }
            var _cart = (List<CartItem>)Session[CommonConst.CartSession];
            //var lo = _cart.Sum(x => x.Quantity);
            return Json(check, JsonRequestBehavior.AllowGet);
        }
        [CustomAuthorizeAttribute(Roles = "Admin")]
        [HttpGet]
        public ActionResult Payment()
        {
            var islogin = Session[CommonConst.UserSession];
            if (islogin != null)
            {
                var temp = (Account)islogin;
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
        public JsonResult Payment(string email, string name, string province, string district , string ward, string address, string phone)
        {
            var order = new Order();
            order.ShipName = name;
            order.ShipMobile = phone;
            order.ShipAdress = address + "-" + ward + "-" + district + "-" + province;
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
            return Json(new
            {
                status = true
            });
           // return RedirectToAction("Index", "Home");
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
            var result = Json(data, JsonRequestBehavior.AllowGet);
            return result;
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