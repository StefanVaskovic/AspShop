using Application.Commands;
using Application.DataTransfer.Size;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class CreateSizeCommand :UseCaseBase, ICreateSizeCommand
    {
        private readonly RequestCreateSizeDtoValidator _validator;
        public CreateSizeCommand(ShopContext context, RequestCreateSizeDtoValidator validator) : base(context)
        {
            _validator = validator;
        }
        public int Id => 26;

        public string Name => "Create size using EF";

        public void Execute(RequestCreateSizeDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Sizes.Add(new Size
            {
                Name = request.Name
            });

            _context.SaveChanges();
        }
    }
}
