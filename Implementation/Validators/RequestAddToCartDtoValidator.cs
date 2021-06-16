using Application.DataTransfer.Cart;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class RequestAddToCartDtoValidator : AbstractValidator<CartDto>
    {
        public RequestAddToCartDtoValidator(ShopContext context)
        {
            RuleFor(x => x)
                .Must(x => context.ProductColorSizes
                    .Any(pcs => pcs.Id == x.ProductColorSizeId))
                .WithMessage("There is no product with a given criteria")
                .DependentRules(() =>
                {
                    RuleFor(x => x)
                    .Must(x => context.ProductColorSizes.Any(pcs =>
                                pcs.Id == x.ProductColorSizeId &&
                                pcs.Quantity >= x.Quantity
                            ))
                    .WithMessage("Quantity you requested exceeds our limitation");
                });
        }
    }
}
