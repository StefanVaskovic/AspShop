using Application.DataTransfer.Categories;
using Application.Exceptions;
using Application.Queries;
using Domain;
using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class GetCategoryQuery : UseCaseBase, IGetCategoryQuery
    {

        public GetCategoryQuery(ShopContext context)
            :base(context)
        {
        }
        public int Id => 16;

        public string Name => "Get category using EF";

        public CategoryDto Execute(int id)
        {
            var c = _context.Categories.Find(id);

            if (c == null)
                throw new EntityNotFoundException(id, typeof(Category));
            
            return new CategoryDto
            {
                Id = c.Id,
                Name = c.Name
            };;
        }
    }
}
