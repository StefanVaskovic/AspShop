using Application;
using Application.Commands;
using Application.DataTransfer.Cart;
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
    public class AddToCartCommand : UseCaseBase, IAddToCartCommand
    {
        private readonly AddToCartValidator _validator;
        private readonly IApplicationActor _actor;

        public AddToCartCommand(ShopContext context, AddToCartValidator validator, IApplicationActor actor)
            :base(context)
        {
            _validator = validator;
            _actor = actor;
        }
        public int Id => 6;

        public string Name => "Add to cart using EF";

        public void Execute(ICollection<CartDto> request)
        {
            _validator.ValidateAndThrow(request);

            _context.Carts.AddRange(request.Select(dto => new Cart
            {
                ProductColorSizeId = dto.ProductColorSizeId,
                Quantity = dto.Quantity,
                UserId = _actor.Id
            }));

            _context.SaveChanges();
        }
    }
}
