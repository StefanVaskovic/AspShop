using Application.DataTransfer.Categories;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(ShopContext context)
        {
            RuleFor(x => x.Id)
                .Must(id => context.Categories.Any(c => c.Id == id))
                .WithMessage("There is no such category")
                .DependentRules(() => 
                {
                    RuleFor(x => x.Id)
                        .Must((dto, id) => !context.Categories.Any(c => c.Id != id && c.Name == dto.Name))
                        .WithMessage("There is already category with a name");
                });
        }
    }
}
