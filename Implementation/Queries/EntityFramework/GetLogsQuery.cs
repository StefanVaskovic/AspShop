using Application;
using Application.DataTransfer.Logs;
using Application.Searches;
using AutoMapper;
using EfDataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries
{
    public class GetLogsQuery : UseCaseBase, IGetLogsQuery
    {
        private readonly IMapper _mapper;
        public GetLogsQuery(ShopContext context, IMapper mapper)
            : base(context)
        {
            _mapper = mapper;
        }
        public int Id => 14;

        public string Name => "Get logs using EF";

        public ICollection<LogsDto> Execute(SearchLogsDto request)
        {
            var query = _context.AuditLogs.Include(al => al.User).AsQueryable();

            if(!string.IsNullOrEmpty(request.Keyword))
            {
                var keyword = request.Keyword.ToLower();

                query = query.Where(x =>
                    x.User.Email.ToLower().Contains(keyword)
                );
            }

            if(request.DateFrom.HasValue)
            {
                query = query.Where(x => x.ExecutedAt >= request.DateFrom);
            }

            if (request.DateTo.HasValue)
            {
                query = query.Where(x => x.ExecutedAt <= request.DateTo);
            }

            return query.Select(x => _mapper.Map<LogsDto>(x)).ToList();
        }
    }
}
