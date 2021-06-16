using Application.DataTransfer.Size;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
    public class RequestCreateSizeDtoValidator : AbstractValidator<RequestCreateSizeDto>
    {
        public RequestCreateSizeDtoValidator()
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name shouldn't be empty.");
        }
    }
}
