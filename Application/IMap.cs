using Application.DataTransfer;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IMap<TMapTo, TMapFrom>
    {
        TMapTo Map(TMapFrom dto);
    }
}
