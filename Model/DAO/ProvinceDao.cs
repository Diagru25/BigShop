using Model.EF_province;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class ProvinceDao
    {
        ProvinceDbContext db = null;

        public ProvinceDao()
        {
            db = new ProvinceDbContext();
        }

        public List<province> LoadAll()
        {
            return db.provinces.ToList();
        }
    }
}
