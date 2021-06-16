using Application.DataTransfer.Logs;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Api.Core.Profiles
{
    public class LogProfile : Profile
    {
        public LogProfile()
        {
            CreateMap<AuditLog, LogsDto>()
                .ForMember(x => x.UserIdentity, opt => opt.MapFrom(x => x.User.Email))
                .ForMember(x => x.Date, opt => opt.MapFrom(x => x.ExecutedAt));
        }
    }
}
