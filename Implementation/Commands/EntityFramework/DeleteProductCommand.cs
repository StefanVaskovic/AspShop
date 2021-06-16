using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteProductCommand : UseCaseBase, IDeleteProductCommand
    {

        public DeleteProductCommand(ShopContext context)
            :base(context)
        {
        }

        public int Id => 2;

        public string Name => "Delete product using EF";

        public void Execute(int request)
        {
            var product = _context.Products.Find(request);

            if (product == null)
                throw new EntityNotFoundException(request, typeof(Product));

            product.IsDeleted = true;
            product.IsActive = false;
            product.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
