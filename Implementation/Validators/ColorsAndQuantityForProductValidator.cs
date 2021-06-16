using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class ColorsAndQuantityForProductValidator : AbstractValidator<ColorsQuantitiesDto>
    {
        public ColorsAndQuantityForProductValidator(ShopContext context)
        {
            RuleFor(x => x.ColorId)
                .NotEmpty()
                .WithMessage("Color is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.ColorId)
                        .Must(colorId => context.Colors.Any(c => c.Id == colorId))
                        .WithMessage("Given color doesn't exist.");
                });
                

            RuleFor(x => x.Quantity)
                .GreaterThanOrEqualTo(0);
        }
    }
}
