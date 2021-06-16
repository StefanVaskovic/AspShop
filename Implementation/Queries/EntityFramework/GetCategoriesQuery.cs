using Application.DataTransfer.Categories;
using Application.Queries;
using Application.Searches;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetCategoriesQuery : UseCaseBase, IGetCategoriesQuery
    {

        public GetCategoriesQuery(ShopContext context)
            :base(context)
        {
        }
        public int Id => 15;

        public string Name => "Get categories using EF";

        public ICollection<CategoryDto> Execute(SearchCategoriesDto request)
        {
            return _context.Categories.Select(c => new CategoryDto
            {
                Id = c.Id,
                Name = c.Name
            }).ToList();
        }
    }
}
