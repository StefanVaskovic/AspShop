using Application.DataTransfer.Order;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
    public class AddOrderValidator : AbstractValidator<RequestOrderDto>
    {
        public AddOrderValidator()
        {
            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Address shouldn't be empty.");
        }
    }
}
