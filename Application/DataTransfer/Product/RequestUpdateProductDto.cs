using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class RequestUpdateProductDto : ProductDto
    {
        public ICollection<string> ProductColorSizes { get; set; } = new List<string>();
    }
}
