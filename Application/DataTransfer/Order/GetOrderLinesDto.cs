using Application.Searches;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Order
{
    public class GetOrderLinesDto
    {
        public SearchOrderLinesDto SearchOrderLinesDto { get; set; }
        public Domain.Order Order { get; set; }
        public int OrderId { get; set; }
    }
}
