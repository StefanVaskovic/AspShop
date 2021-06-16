using Application.DataTransfer.Color;
using Application.Queries;
using Application.Searches;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetColorsQuery : UseCaseBase, IGetColorsQuery
    {
        public GetColorsQuery(ShopContext context) : base(context)
        {
        }

        public int Id => 18;

        public string Name => "Get colors using EF";

        public ICollection<ColorDto> Execute(SearchColorsDto request)
        {
            return _context.Colors.Select(c => new ColorDto
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
        }
    }
}
