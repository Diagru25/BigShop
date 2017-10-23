using Model.EF_province;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class WardDao
    {
        ProvinceDbContext db = null;

        public WardDao()
        {
            db = new ProvinceDbContext();
        }

        public List<ward> GetListByDistrictId(string id)
        {
            return db.wards.Where(x => x.districtid == id).ToList();
        }
    }
}
