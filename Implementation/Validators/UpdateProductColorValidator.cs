using Application.DataTransfer.Product;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateProductColorValidator : AbstractValidator<RequestProductColorDto>
    {
        public UpdateProductColorValidator(ShopContext context)
        {
            RuleFor(x => x.ColorId).Must((dto, x) => !context.ProductColors.Any(pc => 
                pc.ProductId == dto.ProductId && 
                pc.ColorId == x && 
                pc.Id != dto.Id
            )).WithMessage("There is already product with specified color");


        }
    }
}
