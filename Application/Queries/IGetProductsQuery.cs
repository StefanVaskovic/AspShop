using Application.DataTransfer.Product;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetProductsQuery : IQuery<SearchProductsDto, PagedResponse<GetProductsDto>>
    {
    }
}
