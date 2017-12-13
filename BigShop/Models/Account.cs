using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BigShop.Models
{
    public class Account
    {
        public string UserName { get; set; }

        public string PassWord { get; set; }

        public List<string> Role { get; set; }
    }
}