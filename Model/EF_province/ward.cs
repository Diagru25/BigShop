namespace Model.EF_province
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ward")]
    public partial class ward
    {
        [StringLength(255)]
        public string wardid { get; set; }

        [StringLength(255)]
        public string name { get; set; }

        [StringLength(255)]
        public string type { get; set; }

        [StringLength(255)]
        public string location { get; set; }

        [StringLength(255)]
        public string districtid { get; set; }
    }
}
