using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Order : Entity
    {
        public int UserId { get; set; }
        public decimal TotalPrice { get; set; }
        public string Address { get; set; }

        public virtual User User { get; set; }
        public virtual ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
    }
}
