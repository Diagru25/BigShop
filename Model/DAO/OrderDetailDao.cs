using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDetailDao
    {
        BigShopDbContext db = null;

        public OrderDetailDao()
        {
            db = new BigShopDbContext();
        }

        public bool Insert(OrderDetail item)
        {
            try
            {
                db.OrderDetails.Add(item);
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
