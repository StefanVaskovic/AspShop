using Application.DataTransfer.Product;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using Domain;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetProductQuery : UseCaseBase, IGetProductQuery
    {
        private readonly IMapper _mapper;
        public GetProductQuery(ShopContext context, IMapper mapper) : base(context)
        {
            _mapper = mapper;
        }

        public int Id => 29;

        public string Name => "Get product using EF";

        public GetProductDto Execute(int id)
        {
            var product = _context.Products.Include(p => p.ProductColors)
                                        .ThenInclude(pc => pc.Color)
                                        .Include(p => p.ProductColors)
                                        .ThenInclude(pc => pc.ProductColorSizes)
                                        .ThenInclude(pcs => pcs.Size)
                                        .FirstOrDefault(p => p.Id == id);

            if (product == null)
                throw new EntityNotFoundException(id, typeof(Product));

            return product.GetDto<GetProductDto>(_context, _mapper);
        }
    }
}
