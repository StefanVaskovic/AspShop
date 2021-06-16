using Application.DataTransfer.Product;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class ProductColorSizeProfile : Profile
    {
        public ProductColorSizeProfile()
        {
            CreateMap<ProductColorSize, ProductColorSizesDto>();
            CreateMap<ProductColorSizesDto, ProductColorSize>();
        }
    }
}
