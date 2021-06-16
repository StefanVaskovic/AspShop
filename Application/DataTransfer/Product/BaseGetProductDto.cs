using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public abstract class BaseGetProductDto : Dto
    {
        public int Id { get; set; }
        public string Cover { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public int? DiscountRate { get; set; }
        public decimal CurrentPrice { get; set; }
        public decimal? OldPrice { get; set; }
        public int CategoryId { get; set; }
        //public List<ColorSizesQuantitiesDto> ColorSizesQuantities { get; set; } = new List<ColorSizesQuantitiesDto>();
        public List<SizeColorsQuantitiesDto> SizeColorsQuantities { get; set; } = new List<SizeColorsQuantitiesDto>();
    }
}
