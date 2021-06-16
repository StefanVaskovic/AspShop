using Domain.Enums;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Product
{
    public class RequestCreateProductDto : ProductDto
    {
        //public List<int> ColorIds { get; set; } = new List<int>();
        public List<string> SizesColorsQuantities { get; set; } = new List<string>();
    }
}
