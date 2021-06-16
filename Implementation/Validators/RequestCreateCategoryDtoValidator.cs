using Application.DataTransfer.Categories;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Validators
{
    public class RequestCreateCategoryDtoValidator : AbstractValidator<RequestCreateCategoryDto>
    {
        public RequestCreateCategoryDtoValidator()
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name shouldn't be empty.");
        }
    }
}
