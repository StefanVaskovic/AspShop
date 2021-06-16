using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class CreateProductValidator : AbstractValidator<CreateProductDto>
    {
        private const int MB = 2;
        private const int bytes = MB * 1024 * 1024;
        public CreateProductValidator(ShopContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .MinimumLength(3)
                .Must(name => !context.Products.Any(p => p.Name == name))
                .WithMessage("Product name must be unique");

            RuleFor(x => x.Description).NotEmpty();

            RuleFor(x => x.DiscountRate)
                .GreaterThanOrEqualTo(1)
                .LessThanOrEqualTo(100);

            RuleFor(x => x.CurrentPrice)
                .NotEmpty()
                .GreaterThan(0);

            RuleFor(x => x.CategoryId)
                .NotEmpty()
                .WithMessage("Category is required.")
                .DependentRules(() =>
                {
                    RuleFor(x => x.CategoryId)
                        .Must(catId => context.Categories.Any(c => c.Id == catId))
                        .WithMessage("Given category doesn't exist.");
                });
                

            RuleFor(x => x.Gender)
                .NotNull()
                .WithMessage("Gender is required.")
                .IsInEnum();

            RuleFor(x => x.CoverImage.Length)
                .NotNull()
                .LessThanOrEqualTo(bytes)
                .WithMessage($"File size is larger than {MB} MB");

            RuleFor(x => x.CoverImage.ContentType)
                .NotNull()
                .Must(x => x.Equals("image/jpeg") || x.Equals("image/jpg") || x.Equals("image/png"))
                .WithMessage("Allowed formats are jpeg/jpg/png");


            RuleFor(x => x.SizesColorsQuantities.Select(s => s.SizeId))
                .Must(s => s.Distinct().Count() == s.Count())
                .WithMessage("There must be non repetitive sizes.");
                

            RuleForEach(x => x.SizesColorsQuantities).SetValidator(new SizeForProductDtoValidator(context));
        }
    }
}
