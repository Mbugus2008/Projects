using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace NavEmail
{
    public class Email
    {
        MailMessage mail = new MailMessage();
        SmtpClient SmtpServer ;

       
        public  String From { get; set; }
        public  String To_Address { get; set; }
        public  String cc_Address { get; set; }
        public  String Subject { get; set; }
        public  String Body { get; set; }
       
        public  String attachmentPath { get; set; }

        public Email(Hosts e) {
            SmtpServer = new SmtpClient(e.host);
            SmtpServer.Port = e.Port;
            SmtpServer.Credentials = new System.Net.NetworkCredential(e.username, e.password);
            SmtpServer.EnableSsl = e.secure;
         
            Logging.Logging.logpath = e.logpath;
            
        }

        public Logging.Results send(Email e) {
             Logging.Results results = new Logging.Results();
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
            try
            {
                mail.From = new MailAddress(e.From);
                mail.To.Add(e.To_Address);
                if (e.cc_Address != null) 
                mail.CC.Add(e.cc_Address);
                mail.Subject = e.Subject;
                mail.Body = e.Body;
                mail.Priority = MailPriority.High;
                if (e.attachmentPath != null)
                {
                    System.Net.Mail.Attachment attachment;
                    attachment = new System.Net.Mail.Attachment(e.attachmentPath);
                    mail.Attachments.Add(attachment);
                }

                SmtpServer.Send(mail);
                
            }
            catch (Exception ex) {
                Logging.Logging.ReportError(ex);
                results.Code = -1;
                results.Desc = ex.Message;
            }
            return results;
        }
    }
    public class Hosts {
        public String host { get; set; }
        public int Port { get; set; }
        public String username { get; set; }
        public String password { get; set; }
        public String logpath { get; set; }
        public Boolean secure { get; set; }
        public string datetotext(DateTime d)
        {

            return d.ToString().Replace("/", "").Replace(":", "");
        }
    }
}
