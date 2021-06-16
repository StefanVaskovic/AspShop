using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class ProductColorSize : Entity
    {
        public int ProductColorId { get; set; }
        public int SizeId { get; set; }
        public int Quantity { get; set; }

        public virtual ProductColor ProductColor { get; set; }
        public virtual Size Size { get; set; }
        public virtual ICollection<Cart> Carts { get; set; } = new HashSet<Cart>();
    }
}
