using Application.DataTransfer.Size;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateSizeValidator : AbstractValidator<SizeDto>
    {
        public UpdateSizeValidator(ShopContext context)
        {
            RuleFor(x => x.Id)
                .Must(id => context.Sizes.Any(c => c.Id == id))
                .WithMessage("There is no such size")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Id)
                        .Must((dto, id) => !context.Sizes.Any(c => c.Id != id && c.Name == dto.Name))
                        .WithMessage("There is already size with a name");
                });
        }
    }
}
