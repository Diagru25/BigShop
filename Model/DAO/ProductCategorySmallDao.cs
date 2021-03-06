﻿using Model.EF;
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
        public bool DelBrand(int brandid)
        {
            var brand = db.ProductCategorySmalls.SingleOrDefault(x=>x.ID == brandid);
            db.ProductCategorySmalls.Remove(brand);
            db.SaveChanges();
            return true;
        }
        public void ChangeStatus(long id)
        {
            var brand = db.ProductCategorySmalls.SingleOrDefault(x => x.ID == id);
            brand.Status = !brand.Status;
            db.SaveChanges();
        }
        public List<ProductCategorySmall> ListByCategoryAdmin(int ctg_id)
        {
            return db.ProductCategorySmalls.Where(x => x.ProductCategoryID == ctg_id).ToList();
        }
        public bool Insert(ProductCategorySmall pcs)
        {
            try
            {
                db.ProductCategorySmalls.Add(pcs);
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
