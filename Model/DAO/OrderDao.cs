using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF.OverView;

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
        public List<OrderView> NewOrder()
        {
            var list = this.ListAll();
            return list.Where(x => x.Status == null).ToList();
        }
        public IEnumerable<OrderView> ListAll()
        {
            var Sum = from item in db.OrderDetails
                      group item by item.OrderID into g
                      select new { id = g.Key, value = g.Sum(item => item.Price) };
            var list = from q in db.Orders
                       join p in Sum on q.ID equals p.id
                       select new OrderView() { ID = q.ID, UserID = q.UserID, CreatedDate = q.CreatedDate, OrderValue = p.value, ShipAdress = q.ShipAdress, ShipEmail = q.ShipEmail, ShipMobile = q.ShipMobile, ShipName = q.ShipName, Status = q.Status };
            return list;
        }
        public void ChangeStatus(long id, int status)
        {
            var ord = db.Orders.SingleOrDefault(x => x.ID == id);
            ord.Status = status;
            db.SaveChanges();
        }
    }
}
