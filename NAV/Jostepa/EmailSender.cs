using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

public class EmailSender
{
    private string _fromEmail;
    private string _appPassword;
    private string _smtpHost;
    private int _smtpPort;

    public EmailSender(string fromEmail, string appPassword, string smtpHost = "smtp.gmail.com", int smtpPort = 587)
    {
        _fromEmail = fromEmail;
        _appPassword = appPassword;
        _smtpHost = smtpHost;
        _smtpPort = smtpPort;
    }

    public void SendEmail(string toEmail, string subject, string body, List<string> attachments = null)
    {
        try
        {
            // Create a new MailMessage object
            MailMessage mail = new MailMessage();
            mail.From = new MailAddress(_fromEmail);
            mail.To.Add(toEmail);
            mail.Subject = subject;
            mail.Body = body;

            // Attach files if any
            if (attachments != null)
            {
                foreach (var filePath in attachments)
                {
                    if (System.IO.File.Exists(filePath))  // Check if the file exists
                    {
                        mail.Attachments.Add(new Attachment(filePath));
                    }
                    else
                    {
                        Console.WriteLine($"Warning: Attachment file not found: {filePath}");
                    }
                }
            }

            // Configure the SMTP client
            SmtpClient smtpClient = new SmtpClient(_smtpHost, _smtpPort);
            smtpClient.Credentials = new NetworkCredential(_fromEmail, _appPassword);
            smtpClient.EnableSsl = true;

            // Send the email
            smtpClient.Send(mail);

            Console.WriteLine("Email sent successfully!");
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Failed to send email: {ex.Message}");throw(ex) ;
        }
    }
}
