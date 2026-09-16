using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace S_Mobile.Sms_and_Email
{
    public class Email
    {
        public string subject { get; set; }
        public string body { get; set; }
        public string To_address { get; set; }
        public string CC { get; set; }
        public void send(Email e)
        {
            var fromAddress = new MailAddress("info@trimline.co.ke", "");
            var toAddress = new MailAddress(e.To_address);
            string fromPassword = "Rahabgathoni1";
            string subject = e.subject;
            string body = e.body;

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
            };
            using (var message = new MailMessage())
            {
                message.From = fromAddress;
                if (e.CC!= null) { 
                message.CC.Add(e.CC);}
                message.To.Add(toAddress);
                message.Subject = subject;
                message.Body = body;

                smtp.Send(message);
            }


        }
    }
}
