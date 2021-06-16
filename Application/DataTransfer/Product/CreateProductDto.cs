using Domain.Enums;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class CreateProductDto : ProductDto
    {
        //public List<int> ColorIds { get; set; } = new List<int>();
        public ICollection<SizeColorsQuantitiesDto> SizesColorsQuantities { get; set; } = new List<SizeColorsQuantitiesDto>();
    }
}
