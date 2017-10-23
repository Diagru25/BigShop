using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class CartDao
    {

        // cái class này cũng không có tác dụng gì

        BigShopDbContext db = null;

        public CartDao()
        {
            db = new BigShopDbContext();
        }

        public bool Insert(Cart item)
        {
            Cart cart = db.Carts.SingleOrDefault(x => x.ProductID == item.ProductID && x.UserID == item.UserID);
            if (cart == null)
            {
                db.Carts.Add(item);
                db.SaveChanges();

                return item.ID > 0;
            }
            else
            {
                if (Edit(cart, item.Quantity))
                    return true;
                else
                    return false;
            }
        }
        public bool Edit(Cart item, int quantity)
        {
            try
            {
                var cart = db.Carts.Find(item.ID);
                cart.Quantity = quantity;
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public List<Cart> ListByUserID(long id)
        {
            return db.Carts.Where(x => x.UserID == id).ToList();
        }
    }
}
