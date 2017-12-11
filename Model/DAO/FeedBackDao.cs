using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model.EF;


namespace Model.DAO
{
    public class FeedBackDao
    {
        BigShopDbContext db = null;
        public FeedBackDao()
        {
            db = new BigShopDbContext();
        }
        public List<FeedBack> ListAll()
        {
            return db.FeedBacks.ToList();
        }
        public void HasReadAll()
        {
            var list = db.FeedBacks.ToList();
            foreach(var item in list)
            {
                if(item.Status == null)
                {
                    item.Status = 1;
                }
            }
            db.SaveChanges();
        }
        public List<FeedBack> ListByStatus(int status)
        {
            return db.FeedBacks.Where(x => x.Status == status).ToList();
        }
        public FeedBack GetbyID(int id)
        {
            return db.FeedBacks.SingleOrDefault(x => x.ID == id);
        }
        public void ChangeStatus(int id ,int status)
        {
            var fb = this.GetbyID(id);
            fb.Status = status;
            db.SaveChanges();
        }
        public void DelFeedBack(int id)
        {
            var fb = db.FeedBacks.SingleOrDefault(x => x.ID == id);
            db.FeedBacks.Remove(fb);
            db.SaveChanges();
        }
    }
}
