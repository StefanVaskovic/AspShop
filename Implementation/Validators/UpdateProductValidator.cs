using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateProductValidator : AbstractValidator<UpdateProductDto>
    {
        private const int MB = 2;
        private const int bytes = MB * 1024 * 1024;
        public UpdateProductValidator(ShopContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .MinimumLength(3)
                .Must((dto, name) => !context.Products.Any(p => p.Name == name && p.Id != dto.Id))
                .WithMessage("Product name must be unique");

            RuleFor(x => x.Description).NotEmpty();

            RuleFor(x => x.DiscountRate)
                .GreaterThanOrEqualTo(0)
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


            RuleFor(x => x.ProductColorSizes.Select(s => s.ProductColorId))
                .Must(s => s.Distinct().Count() == s.Count())
                .WithMessage("There must be non repetitive entries.");

            RuleFor(x => x.ProductColorSizes.Select(pcs => new { pcs.Id ,pcs.ProductColorId, pcs.SizeId }))
                .Must(y => !y.Any(x => context.ProductColorSizes.Any(pcs => 
                pcs.ProductColorId == x.ProductColorId && 
                pcs.SizeId == x.SizeId && pcs.Id != x.Id
                )))
                .WithMessage("There is already a product with a given size and color.");
        }
    }
}
