namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ProductCategorySmall")]
    public partial class ProductCategorySmall
    {
        public long ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        [StringLength(50)]
        public string MetaTitle { get; set; }

        public int? ProductCategoryID { get; set; }

        public int? DisplayOrder { get; set; }

        [StringLength(250)]
        public string SeoTitle { get; set; }

        public DateTime? CreatedDate { get; set; }

        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifedDate { get; set; }

        [StringLength(50)]
        public string ModifedBy { get; set; }

        [StringLength(250)]
        public string MetaKeywords { get; set; }

        [StringLength(10)]
        public string MetaDiscriptions { get; set; }

        public bool? Status { get; set; }

        public bool? ShowOnHome { get; set; }
    }
}
