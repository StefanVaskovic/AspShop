using Application.DataTransfer.User;
using EfDataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Validators
{
    public class RegisterUserValidator : AbstractValidator<RegisterUserDto>
    {
        public RegisterUserValidator(ShopContext context)
        {
            RuleFor(x => x.FirstName).NotEmpty();
            RuleFor(x => x.LastName).NotEmpty();
            RuleFor(x => x.Password)
                .NotEmpty()
                .MinimumLength(6);

            RuleFor(x => x.Email)
                .NotEmpty()
                .MinimumLength(4)
                .Must(x => !context.Users.Any(user => user.Email == x))
                .WithMessage("Email is already taken.");

            RuleFor(x => x.Email)
                .NotEmpty()
                .EmailAddress();
        }
    }
}
