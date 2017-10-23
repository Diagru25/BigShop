using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BigShop.Models
{
    [Serializable]
    public class LoginModel
    {
        public string UserName { get; set; }
        public long UserID { get; set; }
    }
}