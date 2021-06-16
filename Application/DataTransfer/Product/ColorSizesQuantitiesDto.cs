using Application.DataTransfer.Color;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class ColorSizesQuantitiesDto : Dto
    {
        public ColorDto Color { get; set; }
        public List<SizesQuantitiesDto> SizesQuantities { get; set; } = new List<SizesQuantitiesDto>();
    }
}
