using Application;
using Application.DataTransfer.Color;
using Application.Searches;
using Application.DataTransfer.Size;
using Application.Queries;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Application.DataTransfer.Product;
using AutoMapper;

namespace Implementation.Queries
{
    public class GetProductsQuery : UseCaseBase, IGetProductsQuery
    {
        private readonly IMapper _mapper;
        public GetProductsQuery(ShopContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 3;

        public string Name => "Get products using EF";

        public PagedResponse<GetProductsDto> Execute(SearchProductsDto request)
        {
            var query = _context.Products.AsQueryable();

            if (!string.IsNullOrEmpty(request.Keyword))
            {
                query = query.Where(x => x.Name.ToLower().Contains(request.Keyword.ToLower()));
            }
            
            if(request.PriceMax.HasValue)
            {
                query = query.Where(x => x.CurrentPrice <= request.PriceMax);
            }

            if (request.PriceMin.HasValue)
            {
                query = query.Where(x => x.CurrentPrice >= request.PriceMin);
            }

            if(request.ColorIds.Any())
            {
                query = query.Where(x => x.ProductColors.Any(pc => request.ColorIds.Contains(pc.ColorId)));
            }

            if (request.CategoryIds.Any())
            {
                query = query.Where(x => request.CategoryIds.Contains(x.CategoryId));
            }

            if (request.SizeIds.Any())
            {
                query = query.Where(x => x.ProductColors.Any(pc => pc.ProductColorSizes.Any(pcs => request.SizeIds.Contains(pcs.SizeId))));
            }

            var skip = request.PerPage * (request.Page - 1);

            query = query.Skip(skip).Take(request.PerPage);

            return new PagedResponse<GetProductsDto>
            {
                Page = request.Page,
                PerPage = request.PerPage,
                TotalCount = query.Count(),
                Items = query.Include(p => p.ProductColors)
                             .ThenInclude(pc => pc.Color)
                             .Include(p => p.ProductColors)
                             .ThenInclude(pc => pc.ProductColorSizes)
                             .ThenInclude(pcs => pcs.Size)
                             .Select(x => x.GetDto<GetProductsDto>(_context, _mapper)).ToList()
            };
        }
    }
}
