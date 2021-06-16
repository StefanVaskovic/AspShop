using Application.DataTransfer.Size;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class SizesQuantitiesDto : Dto
    {
        public SizeDto Size { get; set; }
        public int Quantity { get; set; }
    }
}
