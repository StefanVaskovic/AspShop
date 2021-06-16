using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class OrderLine : Entity
    {
        public int OrderId { get; set; }
        public int? ProductId { get; set; }
        public string ProductName { get; set; }
        public int Quantity { get; set; }
        public int SizeId { get; set; }
        public int ColorId { get; set; }
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }

        public virtual Size Size { get; set; }
        public virtual Color Color { get; set; }
        public virtual Order Order { get; set; }
        public virtual Product Product { get; set; }
    }
}
