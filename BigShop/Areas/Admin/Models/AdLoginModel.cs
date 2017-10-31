using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BigShop.Areas.Admin.Models
{
    public class AdLoginModel { 

        public string username { get; set; }
        public long userID { get; set; }
        public int userType { get; set; }
    }
}