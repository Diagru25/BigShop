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

        public Product GetById(long id)
        {
            return db.Products.Find(id);
        }

        public List<Product> RelatedProduct(long id)
        {
            Product item = db.Products.Find(id);

            return db.Products.Where(x => x.Code == item.Code && x.ID != item.ID).ToList();
        }

        public List<Product> GetListByCategoryId(long id, long sid)
        {
            if (sid == 0)
            {
                return db.Products.Where(x => x.CategoryID == id).ToList();
            }
            else
            {
                return db.Products.Where(x => x.CategoryID == id && x.MetaKeywords == sid).ToList();
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
            product = item;
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
    }
}
