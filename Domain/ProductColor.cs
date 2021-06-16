using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class ProductColor : Entity
    {
        public int ProductId { get; set; }
        public int ColorId { get; set; }

        public virtual Product Product { get; set; }
        public virtual Color Color { get; set; }
        public virtual ICollection<ProductColorSize> ProductColorSizes { get; set; } = new HashSet<ProductColorSize>();
    }
}
