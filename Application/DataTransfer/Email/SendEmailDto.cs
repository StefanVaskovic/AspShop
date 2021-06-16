using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DataTransfer.Email
{
    public class SendEmailDto
    {
        public string Subject { get; set; }
        public string Message { get; set; }
        public string SendTo { get; set; }
    }
}
