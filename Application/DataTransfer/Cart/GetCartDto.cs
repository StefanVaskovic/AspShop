using Application.DataTransfer.Color;
using Application.DataTransfer.Size;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Cart
{
    public class GetCartDto
    {
        public int ProductId { get; set; }
        public string CoverImage { get; set; }
        public string ProductName { get; set; }
        public ColorDto Color { get; set; }
        public SizeDto Size { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal SumPrice { get; set; }
    }
}
