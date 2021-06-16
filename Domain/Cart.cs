using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Cart : Entity
    {
        public int UserId { get; set; }
        public int ProductColorSizeId { get; set; }
        public int Quantity { get; set; }

        public virtual ProductColorSize ProductColorSize { get; set; }
        public virtual User User { get; set; }
    }
}
