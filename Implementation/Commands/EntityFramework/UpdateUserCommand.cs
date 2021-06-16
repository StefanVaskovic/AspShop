using Application.Commands;
using Application.DataTransfer.User;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.Data.SqlClient;

namespace Implementation.Commands.EntityFramework
{
    public class UpdateUserCommand : UseCaseBase, IUpdateUserCommand
    {
        public UpdateUserCommand(ShopContext context) : base(context)
        {
        }

        public int Id => 32;

        public string Name => "Update user using EF";

        public void Execute(UserDto request)
        {
            var user = _context.Users.Include(u => u.UserUseCases).FirstOrDefault(x => x.Id ==  request.Id);

            if (user == null)
                throw new EntityNotFoundException(request.Id.Value, typeof(User));

            user.FirstName = request.FirstName;
            user.LastName = request.LastName;
            user.Email = request.Email;

            user.UserUseCases.Clear();

            foreach (var item in request.UseCaseIds)
            {
                user.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = item
                });
            }
            _context.SaveChanges();
        }
    }
}
