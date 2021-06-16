using Application;
using Application.Commands;
using Application.DataTransfer.Order;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class AddOrderCommand : UseCaseBase, IAddOrderCommand
    {
        private readonly AddOrderValidator _validator;
        private readonly IApplicationActor _actor;

        public AddOrderCommand(ShopContext context, IApplicationActor actor, AddOrderValidator validator) 
            :base(context)
        {
            _actor = actor;
            _validator = validator;
        }
        public int Id => 11;

        public string Name => "Adding order using EF";

        public void Execute(CreateOrderDto request)
        {
            _validator.ValidateAndThrow(request.RequestOrderDto);

            var order = new Order
            {
                TotalPrice = request.GetCartDtos.Sum(x => x.Price * x.Quantity),
                UserId = _actor.Id,
                Address = request.RequestOrderDto.Address,
                OrderLines = request.GetCartDtos.Select(dto => new OrderLine
                {
                    ColorId = dto.Color.Id.Value,
                    SizeId = dto.Size.Id.Value,
                    Price = dto.Price,
                    ProductId = dto.ProductId,
                    Quantity = dto.Quantity,
                    TotalPrice = dto.Price * dto.Quantity,
                    ProductName = dto.ProductName
                }).ToList()
            };

            _context.Orders.Add(order);

            var cartsToDelete = _context.Carts.Where(c => c.UserId == _actor.Id).ToList();

            _context.Carts.RemoveRange(cartsToDelete);

            _context.SaveChanges();
        }
    }
}
