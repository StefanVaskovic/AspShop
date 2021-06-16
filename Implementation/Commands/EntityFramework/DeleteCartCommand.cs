using Application.Commands;
using Application.Exceptions;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.EntityFramework
{
    public class DeleteCartCommand : UseCaseBase, IDeleteCartCommand
    {

        public DeleteCartCommand(ShopContext context)
            :base(context)
        {
        }
        public int Id => 8;

        public string Name => "Deleting cart using EF";

        public void Execute(int request)
        {

            var cart = _context.Carts.Find(request);

            if (cart == null)
                throw new EntityNotFoundException(request, typeof(Cart));

            _context.Remove(cart);

            //cart.IsDeleted = true;
            //cart.IsActive = false;
            //cart.DeletedAt = DateTime.UtcNow;

            _context.SaveChanges();
        }
    }
}
