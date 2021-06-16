using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    
    public class SizeColorsQuantitiesDto : Dto
    {
        public int? SizeId { get; set; }
        public List<ColorsQuantitiesDto> ColorsQuantities { get; set; } = new List<ColorsQuantitiesDto>();
    }
}
