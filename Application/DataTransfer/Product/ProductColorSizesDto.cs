using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class ProductColorSizesDto : Dto
    {
        public int Id { get; set; }
        public int ProductColorId { get; set; }
        public int SizeId { get; set; }
        public int Quantity { get; set; }
    }
}
