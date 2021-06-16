using Application;
using Application.DataTransfer.Order;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetOrdersQuery : UseCaseBase, IGetOrdersQuery
    {
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public GetOrdersQuery(ShopContext context, IApplicationActor actor, IMapper mapper)
            : base(context)
        {
            _actor = actor;
            _mapper = mapper;
        }
        public int Id => 12;

        public string Name => "Get orders using EF";

        public ICollection<GetOrdersDto> Execute(SearchOrdersDto request)
        {
            return _context.Orders
                .Where(o => o.UserId == _actor.Id)
                .Select(o => _mapper.Map<GetOrdersDto>(o))
                .ToList();
        }
    }
}
