namespace Model.EF_province
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ProvinceDbContext : DbContext
    {
        public ProvinceDbContext()
            : base("name=ProvinceDbContext")
        {
        }

        public virtual DbSet<district> districts { get; set; }
        public virtual DbSet<province> provinces { get; set; }
        public virtual DbSet<ward> wards { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
