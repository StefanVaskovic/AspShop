using Application.DataTransfer.Cart;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetCartQuery : IQuery<SearchCartDto, ICollection<GetCartDto>>
    {
    }
}
