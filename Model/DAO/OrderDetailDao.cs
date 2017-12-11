using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF.OverView;

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
        public List<OrderDetailView> GetOrderByID(long id)
        {
            var list = from q in db.OrderDetails
                       join p in db.Products on q.ProductID equals p.ID where q.OrderID == id
                       select new OrderDetailView(){Name = p.Name,ProductID = q.ProductID, OrderID = q.OrderID,Quantity = q.Quantity,Price = q.Price};
            return list.ToList();
        }

    }


}