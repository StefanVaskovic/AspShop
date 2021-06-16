using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class UpdateProductDto : ProductDto
    {
        public ICollection<ProductColorSizesDto> ProductColorSizes { get; set; } = new List<ProductColorSizesDto>();
    }
}
