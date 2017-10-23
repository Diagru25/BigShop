using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class MenuDao
    {
        BigShopDbContext db = null;

        public MenuDao()
        {
            db = new BigShopDbContext();
        }

        public List<Menu> ListAll()
        {
            return db.Menus.Where(x => x.Status == true).OrderBy(x => x.DisplayOrder).ToList();
        }
    }
}
