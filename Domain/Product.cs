using Domain.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Product : Entity
    {
        public string Cover { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Gender Gender { get; set; }
        public int? DiscountRate { get; set; }
        public decimal CurrentPrice { get; set; }
        public decimal? OldPrice { get; set; }
        //public int Rate { get; set; }
        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
        //public virtual ICollection<Comment> Comments { get; set; } = new HashSet<Comment>();
        public virtual ICollection<ProductColor> ProductColors { get; set; } = new HashSet<ProductColor>();
    }
}
