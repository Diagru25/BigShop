using Model.EF_province;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.DAO
{
    public class DistrictDao
    {
        ProvinceDbContext db = null;
        public DistrictDao()
        {
            db = new ProvinceDbContext();
        }

        public List<district> GetListByProvinceId(string id)
        {
            return db.districts.Where(x => x.provinceid == id).ToList();
        }
    }


}
