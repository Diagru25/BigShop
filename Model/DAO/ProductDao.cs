using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProductDao
    {
        BigShopDbContext db = null;

        public ProductDao()
        {
            db = new BigShopDbContext();
        }

        public List<Product> GetNewPhone()
        {
            return db.Products.Where(x => x.Code == "A01").OrderBy(x => x.CreatedDate).Take(4).ToList();
        }
        public List<Product> GetNew(long id)
        {
            return db.Products.Where(x => x.CategoryID == id).OrderBy(x => x.CreatedDate).Take(4).ToList();
        }

        public List<Product> GetNewProduct()
        {
            return db.Products.OrderBy(x => x.CreatedDate).Take(4).ToList();
        }

        public Product GetById(long id)
        {
            return db.Products.Find(id);
        }

        public List<Product> RelatedProduct(long id)
        {
            Product item = db.Products.Find(id);

            return db.Products.Where(x => x.Code == item.Code && x.ID != item.ID).ToList();
        }

        public List<Product> GetListByCategoryId(long id, long sid, int con )
        {

            if (sid == 0)
            {
                if(con == 1)
                    return db.Products.Where(x => x.CategoryID == id).OrderBy(x=>x.ViewCount).ToList();
                else if(con == 2)
                    return db.Products.Where(x => x.CategoryID == id).OrderBy(x => x.CreatedDate).ToList();
                else if (con == 3)
                    return db.Products.Where(x => x.CategoryID == id).OrderBy(x => x.Price).ToList();
                else if (con == 4)
                    return db.Products.Where(x => x.CategoryID == id).OrderByDescending(x => x.CreatedDate).ToList();
                else
                    return db.Products.Where(x => x.CategoryID == id).ToList();
            }
            else
            {
                if(con == 1)
                    return db.Products.Where(x => x.CategoryID == id && x.BrandID == sid).OrderBy(x=>x.ViewCount).ToList();
                else if (con == 2)
                    return db.Products.Where(x => x.CategoryID == id && x.BrandID == sid).OrderBy(x => x.CreatedDate).ToList();
                else if (con == 3)
                    return db.Products.Where(x => x.CategoryID == id && x.BrandID == sid).OrderBy(x => x.Price).ToList();
                else if (con == 4)
                    return db.Products.Where(x => x.CategoryID == id && x.BrandID == sid).OrderByDescending(x => x.Price).ToList();
                else 
                    return db.Products.Where(x => x.CategoryID == id && x.BrandID == sid).ToList();
            }
        }

        public string GetNameCategory(long id, long sid)
        {
            string name = "";

            if (sid == 0)
            {
                name = db.ProductCategories.Find(id).Name.ToString();
            }
            else
            {
                name = db.ProductCategories.Find(id).Name.ToString() + " >>> " + db.ProductCategorySmalls.Find(sid).Name.ToString();
            }
            return name;
        }
        public long Insert(Product item)
        {
            db.Products.Add(item);
            db.SaveChanges();
            return item.ID;
        }
        public bool Edit(Product item)
        {
            // hôm sau m chỉnh cho nó hết điều kiện :))

            var product = db.Products.Find(item.ID);
            product.Name = item.Name;
            product.Price = item.Price;
            product.Quantity = item.Quantity;
            product.Image = item.Image;
            db.SaveChanges();
            return true;
        }

        // add vao gio hang thi tru so luong di 1
        public bool Add_Cart(long id, int c)
        {
            var p = db.Products.Find(id);
            // c = 0 la giam so luong
            if (c == 0)
                p.Quantity -= 1;
            //c = 1 la tang so luong san pham
            else
                p.Quantity += 1;
            db.SaveChanges();
            return true;
        }
        public bool Delete(long id)
        {
            var item = db.Products.Find(id);

            db.Products.Remove(item);
            db.SaveChanges();
            return true;
        }
        public List<Product> Products()
        {
            return db.Products.ToList();
        }
        public List<Product> GetProductByBrandAndCategory(long brandID, long cateID)
        {
            if(cateID == 0)
            {
                return db.Products.ToList();
            }
            else if(brandID == 0)
            {
                return db.Products.Where(x => x.CategoryID == cateID).ToList();
            }
            else
            {
                return db.Products.Where(x => x.CategoryID == cateID).Where(x => x.BrandID == brandID).ToList();
            }
        }

        public void UpdateImages(long productId, string images)
        {
            var product = db.Products.Find(productId);
            product.MoreImages = images;
            db.SaveChanges();
        }

        public bool delBrand(int brandid, int cateid)
        {
            var pro = db.Products.Where(x => x.BrandID == brandid && x.CategoryID == cateid).ToList();
            foreach(var item in pro)
            {
                db.Products.Remove(item);
            }
            db.SaveChanges();
            return true;
        }
        public List<Product> GetProductByBrand(long id)
        {
            return  db.Products.Where(x => x.BrandID == id).ToList();
        }

        public void ChangeStatus(long id)
        {
            var pro = db.Products.SingleOrDefault(x => x.ID == id);
            pro.Status = !pro.Status;
            db.SaveChanges();
        }
        public List<Product> Search(List<string> model)
        {
            List<Product> result = new List<Product>();
            foreach(var item in model)
            {
                var temp = db.Products.Where(x => x.Name.Contains(item) || x.MetaTitle.Contains(item)).ToList();
                foreach(var item1 in temp)
                {
                    if(result.Any(x=>x.ID == item1.ID) == false)
                    {
                        result.Add(item1);
                    }
                }
            }
            return result;
        }
    }
}
