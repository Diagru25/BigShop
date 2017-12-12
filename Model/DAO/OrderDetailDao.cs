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
        public void DelOrderDetail(long id)
        {
            var list = db.OrderDetails.Where(x => x.OrderID == id);
            foreach(var item in list)
            {
                db.OrderDetails.Remove(item);
            }
            db.SaveChanges();
        }
        public List<TopOrder> Top()
        {
            var ord = from q in db.OrderDetails
                      join p in db.Products on q.ProductID equals p.ID
                      select new OrderDetailView() { Name = p.Name, ProductID = q.ProductID, OrderID = q.OrderID, Quantity = q.Quantity, Price = q.Price };
            var list = from item in ord
                       group item by item.Name into g
                       select new { name = g.Key, quantity = g.Sum(x => x.Quantity) };
            var result = from q in list
                         join p in ord on q.name equals p.Name
                         select new TopOrder() { ID = p.ProductID, Name = p.Name, Price = p.Price, Quantity = q.quantity, Revenue = p.Price * q.quantity };
            return result.ToList();     
        }
    }
        

}