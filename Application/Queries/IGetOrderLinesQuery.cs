using Application.DataTransfer.Order;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetOrderLinesQuery : IQuery<GetOrderLinesDto, ICollection<OrderLinesDto>>
    {
    }
}
