using Application.DataTransfer.Cart;
using Application.DataTransfer.Color;
using Application.DataTransfer.Size;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class CartProfile : Profile
    {
        public CartProfile()
        {
            CreateMap<Cart, GetCartDto>()
                .ForMember(x => x.ProductId, opt => opt.MapFrom(c => c.ProductColorSize.ProductColor.Product.Id))
                .ForMember(x => x.CoverImage, opt => opt.MapFrom(c => c.ProductColorSize.ProductColor.Product.Cover))
                .ForMember(x => x.ProductName, opt => opt.MapFrom(c => c.ProductColorSize.ProductColor.Product.Name))
                .ForMember(x => x.Price, opt => opt.MapFrom(c => c.ProductColorSize.ProductColor.Product.CurrentPrice))
                .ForMember(x => x.SumPrice, opt => opt.MapFrom(c => c.ProductColorSize.ProductColor.Product.CurrentPrice * c.Quantity))
                .ForMember(x => x.Color, opt => opt.MapFrom(c => new ColorDto
                {
                    Id = c.ProductColorSize.ProductColor.Color.Id,
                    Name = c.ProductColorSize.ProductColor.Color.Name
                }))
                .ForMember(x => x.Size, opt => opt.MapFrom(c => new SizeDto
                {
                    Id = c.ProductColorSize.Size.Id,
                    Name = c.ProductColorSize.Size.Name
                }));
        }
    }
}
