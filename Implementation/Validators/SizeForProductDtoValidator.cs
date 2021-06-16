using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class SizeForProductDtoValidator : AbstractValidator<SizeColorsQuantitiesDto>
    {
        public SizeForProductDtoValidator(ShopContext context)
        {
            RuleFor(x => x.SizeId)
                .NotEmpty()
                .WithMessage("Size is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.SizeId)
                        .Must(sizeId => context.Sizes.Any(s => s.Id == sizeId))
                        .WithMessage("Given size doesn't exist.");
                });


            RuleFor(x => x.ColorsQuantities.Select(caq => caq.ColorId))
                .Must(x => x.Distinct().Count() == x.Count())
                .WithMessage("There must be non repetitive colors.");

            RuleForEach(x => x.ColorsQuantities).SetValidator(new ColorsAndQuantityForProductValidator(context));
        }
    }
}
