using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProductCategorySmallDao
    {
        BigShopDbContext db = null;

        public ProductCategorySmallDao()
        {
            db = new BigShopDbContext();
        }

        public List<ProductCategorySmall> ListAll()
        {
            return db.ProductCategorySmalls.Where(x => x.Status == true).ToList();
        }
        public List<ProductCategorySmall> ListByCategory(int ctg_id)
        {
            return db.ProductCategorySmalls.Where(x => x.Status == true).Where(x=>x.ProductCategoryID == ctg_id).ToList();
        }
    }
}
