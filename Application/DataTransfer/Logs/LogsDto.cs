using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Logs
{
    public class LogsDto : Dto
    {
        public string UserIdentity { get; set; }
        public int UseCaseId { get; set; }
        public DateTime Date { get; set; }
        public string Data { get; set; }
    }
}
