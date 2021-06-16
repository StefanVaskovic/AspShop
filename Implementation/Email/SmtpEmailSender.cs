using Application.DataTransfer.Email;
using Application.Email;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Implementation.Email
{
    public class SmtpEmailSender : IEmailSender
    {
        public void Send(SendEmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("testiranjesajta2000@gmail.com", "Testiranjesajta2000!")
            };

            var message = new MailMessage("testiranjesajta2000@gmail.com", dto.SendTo);
            message.Subject = dto.Subject;
            message.Body = dto.Message;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
