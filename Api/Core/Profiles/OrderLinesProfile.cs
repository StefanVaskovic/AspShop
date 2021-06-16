using Application.DataTransfer.Order;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class OrderLinesProfile : Profile
    {
        public OrderLinesProfile()
        {
            CreateMap<OrderLine, OrderLinesDto>()
                .ForMember(x => x.CoverImage, opt => opt.MapFrom(ol => ol.Product.Cover))
                .ForMember(x => x.Color, opt => opt.MapFrom(ol => ol.Color.Name))
                .ForMember(x => x.Size, opt => opt.MapFrom(ol => ol.Size.Name));
        }
    }
}
