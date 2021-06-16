using Application.DataTransfer.Order;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetOrdersQuery : IQuery<SearchOrdersDto, ICollection<GetOrdersDto>>
    {
    }
}
