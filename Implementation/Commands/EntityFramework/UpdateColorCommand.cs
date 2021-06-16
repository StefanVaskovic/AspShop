using Application.Commands;
using Application.DataTransfer.Color;
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
    public class UpdateColorCommand : UseCaseBase, IUpdateColorCommand
    {
        private readonly UpdateColorValidator _validator;

        public UpdateColorCommand(ShopContext context, UpdateColorValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public int Id => 22;

        public string Name => "Update color using EF";

        public void Execute(ColorDto request)
        {
            _validator.ValidateAndThrow(request);

            var color = _context.Colors.Find(request.Id);

            if (color == null)
                throw new EntityNotFoundException(request.Id.Value, typeof(Color));

            color.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
