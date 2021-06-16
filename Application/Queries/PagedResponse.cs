using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public class PagedResponse<T>
        where T : class
    {
        public int TotalCount { get; set; }
        public int PerPage { get; set; }
        public int Page { get; set; }
        public int PagesCount => (int)Math.Ceiling((float)TotalCount / PerPage);
        public IEnumerable<T> Items { get; set; }
    }
}
