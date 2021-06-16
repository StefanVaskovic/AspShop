using Application.Commands;
using Application.DataTransfer.Categories;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class CreateCategoryCommand : UseCaseBase, ICreateCategoryCommand
    {
        private readonly RequestCreateCategoryDtoValidator _validator;

        public CreateCategoryCommand(ShopContext context, RequestCreateCategoryDtoValidator validator)
            :base(context)
        {
            _validator = validator;
        }

        public int Id => 16;

        public string Name => "Create category using EF";

        public void Execute(RequestCreateCategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Categories.Add(new Category
            {
                Name = request.Name
            });

            _context.SaveChanges();
        }
    }
}
