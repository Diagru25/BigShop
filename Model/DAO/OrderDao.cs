using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class OrderDao
    {
        BigShopDbContext db = null;

        public OrderDao()
        {
            db = new BigShopDbContext();
        }

        public long Insert(Order item)
        {
                db.Orders.Add(item);
                db.SaveChanges();
                return item.ID;
            
        }
        public List<Order> NewOrder()
        {
            return db.Orders.Where(x => x.Status == null).ToList();
        }
        public void ChangeStatus(long id)
        {
            var ord = db.Orders.SingleOrDefault(x => x.ID == id);
            ord.Status = 1;
            db.SaveChanges();
        }
    }
}
