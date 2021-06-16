using Application.DataTransfer.Size;
using Application.Exceptions;
using Application.Queries;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetSizeQuery : UseCaseBase, IGetSizeQuery
    {
        public GetSizeQuery(ShopContext context) : base(context)
        {
        }

        public int Id => 25;

        public string Name => "Get size using EF";

        public SizeDto Execute(int id)
        {
            var s = _context.Sizes.Find(id);

            if (s == null)
                throw new EntityNotFoundException(id, typeof(Size));

            return new SizeDto
            {
                Id = s.Id,
                Name = s.Name
            }; ;
        }
    }
}
