using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class Size : Entity
    {
        public string Name { get; set; }

        public virtual ICollection<ProductColorSize> ProductColorSizes { get; set; } = new HashSet<ProductColorSize>();
    }
}
