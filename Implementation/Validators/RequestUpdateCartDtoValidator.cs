using Application;
using Application.DataTransfer.Cart;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class RequestUpdateCartDtoValidator : AbstractValidator<CartDto>
    {
        public RequestUpdateCartDtoValidator(ShopContext context, IApplicationActor actor)
        {
                RuleFor(RequestUpdateCartDto => RequestUpdateCartDto)
                .Must(x => context.Carts.Any(c => 
                                        c.UserId == actor.Id && 
                                        c.ProductColorSizeId == x.ProductColorSizeId
                                        ))
                .WithMessage("There is no such a product to be updated.")
                .DependentRules(() => 
                {
                    RuleFor(RequestUpdateCartDto => RequestUpdateCartDto.ProductColorSizeId)
                            .Must((dto, x) => !context.Carts.Any(c => c.ProductColorSizeId == x && c.Id != dto.Id))
                            .WithMessage("Specified product is already in cart.");
                });
        }
    }
}
