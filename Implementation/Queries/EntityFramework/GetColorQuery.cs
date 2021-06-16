using Application.DataTransfer.Color;
using Application.Exceptions;
using Application.Queries;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetColorQuery : UseCaseBase, IGetColorQuery
    {
        public GetColorQuery(ShopContext context) : base(context)
        {
        }

        public int Id => 20;

        public string Name => "Get color using EF";

        public ColorDto Execute(int id)
        {
            var c = _context.Colors.Find(id);

            if (c == null)
                throw new EntityNotFoundException(id, typeof(Color));

            return new ColorDto
            {
                Id = c.Id,
                Name = c.Name
            };
        }
    }
}
