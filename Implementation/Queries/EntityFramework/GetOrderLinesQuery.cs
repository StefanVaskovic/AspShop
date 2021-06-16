using Application;
using Application.DataTransfer.Order;
using Application.Exceptions;
using Application.Queries;
using Application.Searches;
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
    public class GetOrderLinesQuery : UseCaseBase, IGetOrderLinesQuery
    {
        private readonly IApplicationActor _actor;
        private readonly IMapper _mapper;

        public GetOrderLinesQuery(ShopContext context, IApplicationActor actor, IMapper mapper)
            : base(context)
        {
            _actor = actor;
            _mapper = mapper;
        }
        public int Id => 13;

        public string Name => "Get order lines using EF";

        public ICollection<OrderLinesDto> Execute(GetOrderLinesDto request)
        {

            var order = _context.Orders
                                .Include(o => o.OrderLines)
                                .ThenInclude(ol => ol.Product)
                                .Include(o => o.OrderLines)
                                .ThenInclude(ol => ol.Color)
                                .Include(o => o.OrderLines)
                                .ThenInclude(ol => ol.Size)
                                .FirstOrDefault(o => o.UserId == _actor.Id && o.Id == request.OrderId);

            if (order == null)
                throw new EntityNotFoundException(order.Id, typeof(Order));


            return order.OrderLines
                .Select(ol => _mapper.Map<OrderLinesDto>(ol)).ToList();
        }
    }
}
