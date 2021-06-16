using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteColorCommand : UseCaseBase, IDeleteColorCommand
    {
        public DeleteColorCommand(ShopContext context)
            : base(context)
        {
        }
        public int Id => 23;

        public string Name => "Deleting color using EF";

        public void Execute(int id)
        {
            var color = _context.Colors.Find(id);

            if (color == null)
                throw new EntityNotFoundException(id, typeof(Color));

            color.DeletedAt = DateTime.UtcNow;
            color.IsActive = false;
            color.IsDeleted = true;

            _context.SaveChanges();
        }
    }
}
