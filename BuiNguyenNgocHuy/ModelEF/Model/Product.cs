namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }
        [DisplayName("Don_Gia")]
        public int? UnitCost { get; set; }
        [DisplayName("So_luong")]
        public int? Quantity { get; set; }

        [StringLength(150)]
        public string Image { get; set; }
        [DisplayName("LoaiSP_ID")]
        public int? IDDM { get; set; }

        [StringLength(150)]
        public string Description { get; set; }

        public bool Status { get; set; }

        public virtual Category Category { get; set; }
    }
}
