using Application;
using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class UpdateProductColorCommand : UseCaseBase, IUpdateProductColorCommand
    {
        private readonly UpdateProductColorValidator _validator;

        public UpdateProductColorCommand(ShopContext context, UpdateProductColorValidator validator)
            :base(context)
        {
            _validator = validator;
        }
        public int Id => 4;

        public string Name => "Update product color command using EF";

        public void Execute(RequestProductColorDto request)
        {
            _validator.ValidateAndThrow(request);

            var productColor = _context.ProductColors.Find(request.Id);

            productColor.ColorId = request.ColorId;

            _context.SaveChanges();
        }
    }
}
