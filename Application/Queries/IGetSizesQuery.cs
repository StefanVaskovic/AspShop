using Application.DataTransfer.Size;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetSizesQuery : IQuery<SearchSizesDto, ICollection<SizeDto>>
    {
    }
}
