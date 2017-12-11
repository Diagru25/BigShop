﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.EF.OverView
{
    public class OrderDetailView
    {
        public string Name { get; set; }

        public long ProductID { get; set; }

        public long OrderID { get; set; }

        public int? Quantity { get; set; }

        public decimal? Price { get; set; }
    }
}