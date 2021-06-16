using Application.DataTransfer.Categories;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetCategoriesQuery : IQuery<SearchCategoriesDto, ICollection<CategoryDto>>
    {
    }
}
