using Application.DataTransfer.Size;
using Application.Queries;
using Application.Searches;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetSizesQuery : UseCaseBase, IGetSizesQuery
    {
        public GetSizesQuery(ShopContext context) : base(context)
        {
        }
        public int Id => 24;

        public string Name => "Get sizes using EF";

        public ICollection<SizeDto> Execute(SearchSizesDto request)
        {
            return _context.Sizes.Select(c => new SizeDto
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
        }
    }
}
