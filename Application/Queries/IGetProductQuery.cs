using Application.DataTransfer.Product;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetProductQuery : IQuery<int, GetProductDto>
    {
    }
}
