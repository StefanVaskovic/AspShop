using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteUserCommand : UseCaseBase, IDeleteUserCommand
    {
        public DeleteUserCommand(ShopContext context) : base(context)
        {
        }

        public int Id => 31;

        public string Name => "Delete user command using EF";

        public void Execute(int id)
        {
            var user = _context.Users.Find(id);

            if (user == null)
                throw new EntityNotFoundException(id, typeof(User));

            user.IsDeleted = true;
            user.IsActive = false;
            user.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
