using Application.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Searches
{
    public class SearchProductsDto : PagedSearch
    {
        public List<int> CategoryIds { get; set; } = new List<int>();
        public List<int> SizeIds { get; set; } = new List<int>();
        public List<int> ColorIds { get; set; } = new List<int>();
        public string Keyword { get; set; }
        public decimal? PriceMin { get; set; }
        public decimal? PriceMax { get; set; }
    }
}
