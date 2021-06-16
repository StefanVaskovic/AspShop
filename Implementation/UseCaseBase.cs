using EfDataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation
{
    public abstract class UseCaseBase
    {
        protected readonly ShopContext _context;

        protected UseCaseBase(ShopContext context)
        {
            _context = context;
        }
    }
}
