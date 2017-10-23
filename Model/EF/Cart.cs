namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Cart")]
    public partial class Cart
    {
        public long ID { get; set; }

        public long ProductID { get; set; }

        public int Quantity { get; set; }

        public long? UserID { get; set; }

        public bool? Status { get; set; }
    }
}
