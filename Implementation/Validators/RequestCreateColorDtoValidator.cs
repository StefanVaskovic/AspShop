using Application.DataTransfer.Color;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
    public class RequestCreateColorDtoValidator : AbstractValidator<RequestCreateColorDto>
    {
        public RequestCreateColorDtoValidator()
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name shouldn't be empty.");
        }
    }
}
