﻿using Application.DataTransfer.Size;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetSizeQuery : IQuery<int, SizeDto>
    {
    }
}
