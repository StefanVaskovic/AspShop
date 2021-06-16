using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteSizeCommand : UseCaseBase, IDeleteSizeCommand
    {
        public DeleteSizeCommand(ShopContext context) : base(context)
        {
        }

        public int Id => 28;

        public string Name => "Delete size using EF";

        public void Execute(int id)
        {
            var size = _context.Sizes.Find(id);

            if (size == null)
                throw new EntityNotFoundException(id, typeof(Size));

            size.DeletedAt = DateTime.UtcNow;
            size.IsActive = false;
            size.IsDeleted = true;

            _context.SaveChanges();
        }
    }
}
