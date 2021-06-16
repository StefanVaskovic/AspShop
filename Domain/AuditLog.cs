using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
    public class AuditLog
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int UseCaseId { get; set; }
        public string Data { get; set; }
        public DateTime ExecutedAt { get; set; }

        public User User { get; set; }
    }
}
