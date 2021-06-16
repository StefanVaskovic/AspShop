using Application.DataTransfer.Color;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetColorsQuery : IQuery<SearchColorsDto, ICollection<ColorDto>>
    {
    }
}
