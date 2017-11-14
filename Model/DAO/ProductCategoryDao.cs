using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProductCategoryDao
    {
        BigShopDbContext db = null;

        public ProductCategoryDao()
        {
            db = new BigShopDbContext();
        }

        public List<ProductCategory> ListAll()
        {
            return db.ProductCategories.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
        public void DelCategory(int id)
        {
            var cate = db.ProductCategories.SingleOrDefault(x => x.ID == id);
            db.ProductCategories.Remove(cate);
            db.SaveChanges();
        }

        public void ChangeStatus(long id)
        {
            var cate = db.ProductCategories.SingleOrDefault(x => x.ID == id);
            cate.Status = !cate.Status;
            db.SaveChanges();
        }
        public List<ProductCategory> ListAllAdmin()
        {
            return db.ProductCategories.OrderBy(x => x.DisplayOrder).ToList();
        }
        public bool Insert(ProductCategory pc)
        {
            try
            {
                db.ProductCategories.Add(pc);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
