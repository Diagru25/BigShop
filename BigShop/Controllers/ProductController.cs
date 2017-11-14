using Model.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml.Linq;

namespace BigShop.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Detail(long id)
        {

            var dao = new ProductDao();

            var model = dao.GetById(id);

            ViewBag.RelatedProduct = dao.RelatedProduct(id);

            ViewBag.image = LoadImage(id);

            return View(model);
        }

        public ActionResult ProductCategory(long id, long sid)
        {
            var dao = new ProductDao();

            var model = dao.GetListByCategoryId(id, sid);

            ViewBag.CategoryName = dao.GetNameCategory(id, sid);

            return View(model);
        }

        public List<string> LoadImage(long id)
        {
            var product = new ProductDao().GetById(id);
            var images = product.MoreImages;
            List<string> listImagesReturn = new List<string>();
            try
            {
                XElement xml = XElement.Parse(images);

                foreach (XElement element in xml.Elements())
                {
                    listImagesReturn.Add(element.Value);
                }
                return listImagesReturn;
            }
            catch (Exception)
            {
                return listImagesReturn;
            }
        }
    }
}