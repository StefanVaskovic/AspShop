using Application.DataTransfer.Order;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, GetOrdersDto>()
                .ForMember(x => x.Order, opt => opt.MapFrom(o => "#" + o.Id))
                .ForMember(x => x.Date, opt => opt.MapFrom(o => o.CreatedAt));


        }
    }
}
