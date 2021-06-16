using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Order
{
    public class OrderLinesDto : Dto
    {
        public string CoverImage { get; set; }
        public string ProductName { get; set; }
        public string Color { get; set; }
        public string Size { get; set; }
        //public string Size { get; set; }
    }
}
