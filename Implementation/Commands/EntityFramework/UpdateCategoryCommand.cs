using Application.Commands;
using Application.DataTransfer.Categories;
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
    public class UpdateCategoryCommand : UseCaseBase, IUpdateCategoryCommand
    {
        private readonly UpdateCategoryValidator _validator;

        public UpdateCategoryCommand(ShopContext context, UpdateCategoryValidator validator)
            :base(context)
        {
            _validator = validator;
        }
        public int Id => 17;

        public string Name => "Update category using EF";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = _context.Categories.Find(request.Id);

            if (category == null)
                throw new EntityNotFoundException(request.Id.Value, typeof(Category));

            category.Name = request.Name;

            _context.SaveChanges();
        }
    }
}
