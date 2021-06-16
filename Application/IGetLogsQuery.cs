using Application.DataTransfer.Logs;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application
{
    public interface IGetLogsQuery : IQuery<SearchLogsDto, ICollection<LogsDto>>
    {
    }
}
