using Application.DataTransfer.Cart;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class AddToCartValidator : AbstractValidator<ICollection<CartDto>>
    {
        public AddToCartValidator(ShopContext context)
        {
            RuleForEach(x => x).SetValidator(new RequestAddToCartDtoValidator(context));
        }
    }
}
