using Application;
using Application.DataTransfer.Email;
using Application.DataTransfer.User;
using Application.Email;
using Domain;
using EfDataAccess;
using FluentValidation;
using Implementation.Validators;
using System;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class RegisterUserCommand : UseCaseBase, IRegisterUserCommand
    {
        private readonly RegisterUserValidator _validator;
        private readonly IEmailSender _sender;

        public RegisterUserCommand(ShopContext context, RegisterUserValidator validator, IEmailSender sender)
            :base(context)
        {
            _validator = validator;
            _sender = sender;
        }
        public int Id => 5;

        public string Name => "Register user using EF";

        public void Execute(RegisterUserDto request)
        {
            _validator.ValidateAndThrow(request);

            _context.Users.Add(new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Email = request.Email,
                Password = EncryptPassword.Encrypt(request.Password),
                UserUseCases = new List<UserUseCase>
                {
                    new UserUseCase{UseCaseId = 3},
                    new UserUseCase{UseCaseId = 11},
                    new UserUseCase{UseCaseId = 6},
                    new UserUseCase{UseCaseId = 8},
                    new UserUseCase{UseCaseId = 7},
                    new UserUseCase{UseCaseId = 10},
                    new UserUseCase{UseCaseId = 15},
                    new UserUseCase{UseCaseId = 16},
                    new UserUseCase{UseCaseId = 20},
                    new UserUseCase{UseCaseId = 18},
                    new UserUseCase{UseCaseId = 13},
                    new UserUseCase{UseCaseId = 12},
                    new UserUseCase{UseCaseId = 25},
                    new UserUseCase{UseCaseId = 29},
                    new UserUseCase{UseCaseId = 24}
                }
            });

            _context.SaveChanges();

            _sender.Send(new SendEmailDto
            {
                Message = "Successfull registration!",
                SendTo = request.Email,
                Subject = "Registration"
            });
        }
    }
}
