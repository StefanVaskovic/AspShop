using Application.DataTransfer.Color;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class UpdateColorValidator : AbstractValidator<ColorDto>
    {
        public UpdateColorValidator(ShopContext context)
        {
            RuleFor(x => x.Id)
                .Must(id => context.Colors.Any(c => c.Id == id))
                .WithMessage("There is no such color")
                .DependentRules(() =>
                {
                    RuleFor(x => x.Id)
                        .Must((dto, id) => !context.Colors.Any(c => c.Id != id && c.Name == dto.Name))
                        .WithMessage("There is already color with a name");
                });
        }
    }
}
