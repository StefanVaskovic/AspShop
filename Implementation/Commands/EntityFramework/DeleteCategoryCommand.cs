using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteCategoryCommand : UseCaseBase, IDeleteCategoryCommand
    {
        public DeleteCategoryCommand(ShopContext context)
            :base(context)
        {
        }
        public int Id => 18;

        public string Name => "Delete category using EF";

        public void Execute(int request)
        {
            var cat = _context.Categories.Find(request);

            if (cat == null)
                throw new EntityNotFoundException(request, typeof(Category));

            cat.DeletedAt = DateTime.UtcNow;
            cat.IsActive = false;
            cat.IsDeleted = true;

            _context.SaveChanges();

        }
    }
}
