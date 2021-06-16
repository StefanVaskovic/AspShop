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

            foreach (var useCaseId in request.UseCaseIds)
            {
                const string sqlText = @"insert into UserUseCase(UseCaseId, UserId, CreatedAt, IsDeleted, IsActive) values (@useCaseId,@userId,@createdAt,@isDeleted,@isActive);";
                var parameters = new object[]
                {
                new SqlParameter("@useCaseId", useCaseId),
                new SqlParameter("@userId", user.Id),
                new SqlParameter("@createdAt", DateTime.UtcNow),
                new SqlParameter("@isDeleted", false),
                new SqlParameter("@isActive", true)
                };
                _context.Database.ExecuteSqlRaw(sqlText, parameters);
            }
            _context.SaveChanges();
        }
    }
}
