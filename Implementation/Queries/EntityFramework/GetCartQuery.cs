using Application;
using Application.DataTransfer.Cart;
using Application.DataTransfer.Color;
using Application.DataTransfer.Size;
using Application.Queries;
using AutoMapper;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetCartQuery : UseCaseBase, IGetCartQuery
    {
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public GetCartQuery(ShopContext context, IApplicationActor actor, IMapper mapper)
            : base(context)
        {
            _actor = actor;
            _mapper = mapper;
        }
        public int Id => 10;

        public string Name => "Get cart items using EF";

        public ICollection<GetCartDto> Execute(SearchCartDto request)
        {
            return _context.Carts
                .Include(c => c.ProductColorSize.ProductColor.Product)
                .Include(c => c.ProductColorSize.ProductColor.Color)
                .Include(c => c.ProductColorSize.Size)
                .Where(c => c.UserId == _actor.Id)
                .Select(c =>_mapper.Map<GetCartDto>(c)).ToList();

        }
    }
}
