using Application.DataTransfer.Product;
using AutoMapper;
using Domain;
using Domain.Enums;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class ProductProfile : Profile
    {
        public ProductProfile()
        {
            //var productColorsSizes = context.ProductColorSizes.Include(pcs => pcs.ProductColor).ThenInclude(pc => pc.Product).ToList();


            CreateMap<RequestCreateProductDto, CreateProductDto>()
                .ForMember(x => x.SizesColorsQuantities, opt => opt.Ignore());

            CreateMap<RequestUpdateProductDto, UpdateProductDto>()
                .ForMember(x => x.ProductColorSizes, opt => opt.Ignore());

            CreateMap<UpdateProductDto, Product>()
                .ForMember(x => x.CurrentPrice, opt => opt.MapFrom(x => x.CurrentPrice.Value - (x.CurrentPrice.Value * x.DiscountRate.Value / 100)))
                .ForMember(x => x.OldPrice, opt => opt.MapFrom(x => x.CurrentPrice.Value))
                .ForMember(x => x.CategoryId, opt => opt.MapFrom(x => x.CategoryId.Value))
                .ForMember(x => x.Gender, opt => opt.MapFrom(x => x.Gender.Value))
                .ForMember(x => x.Cover, opt => opt.Ignore());

            

            CreateMap<Product, BaseGetProductDto>()
                .IncludeAllDerived()
                .ForMember(x => x.Gender, opt => opt.MapFrom(x => x.Gender.ToString()))
                .ForMember(x => x.SizeColorsQuantities, opt => opt.Ignore());
            CreateMap<Product, GetProductDto>();
            CreateMap<Product, GetProductsDto>();

        }
    }
}
