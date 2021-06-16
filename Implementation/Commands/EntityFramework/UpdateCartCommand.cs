using Application.Commands;
using Application.DataTransfer.Cart;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class UpdateCartCommand : UseCaseBase, IUpdateCartCommand
    {
        private readonly RequestUpdateCartDtoValidator _validator;

        public UpdateCartCommand(ShopContext context, RequestUpdateCartDtoValidator validator)
            :base(context)
        {
            _validator = validator;
        }
        public int Id => 7;

        public string Name => "Update cart using EF";

        public void Execute(CartDto request)
        {

            _validator.ValidateAndThrow(request);

            var cart = _context.Carts.Find(request.Id);

            if (cart == null)
                throw new EntityNotFoundException(request.Id, typeof(Cart));

            cart.Quantity = request.Quantity;

            _context.SaveChanges();
        }
    }
}
