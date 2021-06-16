using Domain.Enums;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public abstract class ProductDto : Dto
    {
        public int Id { get; set; }
        public IFormFile CoverImage { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Gender? Gender { get; set; }
        public int? DiscountRate { get; set; }
        public decimal? CurrentPrice { get; set; }
        public int? CategoryId { get; set; }
    }
}
