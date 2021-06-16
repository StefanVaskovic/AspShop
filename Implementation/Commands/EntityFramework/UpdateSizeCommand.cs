using Application.Commands;
using Application.DataTransfer.Size;
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
    public class UpdateSizeCommand : UseCaseBase, IUpdateSizeCommand
    {
        private readonly UpdateSizeValidator _validator;

        public UpdateSizeCommand(ShopContext context, UpdateSizeValidator validator)
            : base(context)
        {
            _validator = validator;
        }

        public int Id => 27;

        public string Name => "Updating size using EF";

        public void Execute(SizeDto request)
        {
            _validator.ValidateAndThrow(request);

            var size = _context.Sizes.Find(request.Id);

            if (size == null)
                throw new EntityNotFoundException(request.Id.Value, typeof(Size));

            size.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
