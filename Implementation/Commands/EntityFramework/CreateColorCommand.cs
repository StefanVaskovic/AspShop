using Application.Commands;
using Application.DataTransfer.Color;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class CreateColorCommand : UseCaseBase, ICreateColorCommand
    {
        private readonly RequestCreateColorDtoValidator _validator;
        public CreateColorCommand(ShopContext context, RequestCreateColorDtoValidator validator) : base(context)
        {
            _validator = validator;
        }

        public int Id => 21;

        public string Name => "Create color using EF";

        public void Execute(RequestCreateColorDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Colors.Add(new Color
            {
                Name = request.Name
            });

            _context.SaveChanges();
        }
    }
}
