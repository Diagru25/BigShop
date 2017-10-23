namespace Model.EF_province
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("province")]
    public partial class province
    {
        [StringLength(255)]
        public string provinceid { get; set; }

        [StringLength(255)]
        public string name { get; set; }

        [StringLength(255)]
        public string type { get; set; }
    }
}
