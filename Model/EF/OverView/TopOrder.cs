using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.EF.OverView
{
    public class TopOrder
    {
        public long ID { get; set; }
        public string Name { get; set; }
        public decimal? Price { get; set; }
        public int? Quantity { get; set; }
        public decimal? Revenue { get; set; }
    }
}
