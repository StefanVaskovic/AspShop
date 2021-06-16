using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Order
{
    public class GetOrdersDto : Dto
    {
        public string Order { get; set; }
        public decimal TotalPrice { get; set; }
        public string Address { get; set; }
        public DateTime Date { get; set; }
    }
}
