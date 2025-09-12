using Logging;
using Newtonsoft.Json;
using RestSharp;using Openvalley.Smtp;using Openvalley.Emails;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Threading;


namespace Openvalley
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public mbranch.Mobile mbranch = new mbranch.Mobile();
            public Loans.Loans_Service loans_Service = new Loans.Loans_Service();
            public Mpesa.Mpesa_Service mpesa_Service = new Mpesa.Mpesa_Service();
            public System.Net.NetworkCredential cd;
            public Emails.Emails_Service emails = new Emails.Emails_Service();
            public Smtp_Service Smtp_Service = new Smtp_Service();
        }
        private Thread _thread;
        public static bool stop = false;

        private settings ss = new settings();
        public void onstart()
        {
            string path = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\Settings.xml";
            ss = ss.loadsettings(path);
            foreach (settings.NAV s in ss.nav)
            {

                _thread = new Thread(() => start(s));
                _thread.IsBackground = false; // true;
                _thread.Priority = ThreadPriority.Normal;
                _thread.SetApartmentState(ApartmentState.STA);
                _thread.Start();
            }
        }

        private void loadsettings(settings.NAV ss, ref nav nav)
        {
            NetworkCredential networkCredential = new NetworkCredential(ss.Username, ss.pass);
            CredentialCache credentialCaches = new CredentialCache();
            nav.cd = new System.Net.NetworkCredential(ss.Username, ss.pass, ss.domain);

            nav.Sservice.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Sms", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Sservice.PreAuthenticate = true;
            nav.Sservice.Credentials = (ICredentials)nav.cd;

            nav.loans_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans", ss.Serverip, ss.Companyname,
                      ss.Instance, ss.Port));
            nav.loans_Service.PreAuthenticate = true;
            nav.loans_Service.Credentials = (ICredentials)nav.cd;

            nav.mpesa_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Mpesa", ss.Serverip, ss.Companyname,
                      ss.Instance, ss.Port));
            nav.mpesa_Service.PreAuthenticate = true;
            nav.mpesa_Service.Credentials = (ICredentials)nav.cd;

            nav.mbranch.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/RunThem", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.mbranch.PreAuthenticate = true;
            nav.mbranch.Credentials = (ICredentials)nav.cd;

            nav.emails.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Emails", ss.Serverip, ss.Companyname,
                      ss.Instance, ss.Port)); 
          nav.emails.PreAuthenticate = true;  nav.emails.Credentials = nav.cd; nav.Smtp_Service.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Smtp", ss.Serverip, ss.Companyname,
                       ss.Instance, ss.Port));
            nav.Smtp_Service.PreAuthenticate = true;
            nav.Smtp_Service.Credentials = nav.cd;
        }
        public void teststart()
        {
            string path = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\Settings.xml";
            ss = ss.loadsettings(path);
            foreach (settings.NAV s in ss.nav)
            {
                start(s);
            }
        }
        public void start(settings.NAV ss)
        {
            Logging.logs logs = new Logging.logs();
            try
            {


                nav nav = new nav();
                logs.logpath = ss.logpath;
                logs.LogEntryOnFile(String.Join("|", ss.Companyname, ss.Instance, ss.Serverip, ss.Username));
                loadsettings(ss, ref nav);


                while (stop == false)
                {
                    try
                    {
                        logs.LogEntryOnFile(String.Format("{0}:Start - {1}", DateTime.Now, nav.mbranch.Url));
                    
                        sendsms(logs,ss, ref nav);
                        sendemails(logs, ss, ref nav);
                        //Tstatus(logs, ss, ref nav);
                        try { nav.mbranch.Post(); } catch (Exception e) { logs.ReportError(e); }
                        //try { nav.mbranch.Post2(); } catch (Exception e) { logs.ReportError(e); }
                        logs.LogEntryOnFile(String.Format("{0}:End", DateTime.Now));
                    }
                    catch (Exception ex)
                    {
                        logs.ReportError(ex);
                    }

                    Thread.Sleep(ss.PostIntervalinsec * 1000);
                }
            }
            catch (Exception e)
            {
                logs.ReportError(e);

            }
        }
        private void sendemails(logs logs, settings.NAV sss, ref nav nav)
        {

            try
            {
                // Assuming you have a method to get the SMTP settings
                Smtp.Smtp smtpSettings = nav.Smtp_Service.ReadMultiple(new Smtp_Filter[] { }, null, 0).FirstOrDefault();

                string fromEmail = smtpSettings.User_ID;// "metrosaccostatement@gmail.com";
                string appPassword = smtpSettings.Password;// "wxcl xrsx evrf fayh";  // App-specific password

                // Create an instance of EmailSender
                EmailSender emailSender = new EmailSender(fromEmail, appPassword);

                List<Emails.Emails> emails = nav.emails.ReadMultiple(new Emails_Filter[] { new Emails_Filter { Criteria = "Pending", Field = Emails_Fields.Status } }, null, 10).ToList();

                foreach (var email in emails)
                {
                    var emailToUpdate = email;
                    try
                    {
                        if (!string.IsNullOrEmpty(emailToUpdate.Email)) {
                        // Example email details
                        string toEmail = email.Email;
                        string subject = email.Subject;
                        string body = email.Body;

                        // Example attachment paths
                        List<string> attachmentPaths = new List<string>
                    {
                        email.Attachement
                    };

                        emailToUpdate.Status = Status.Sending;
                        emailToUpdate.StatusSpecified = true;
                        nav.emails.Update(ref emailToUpdate);
                        emailSender.SendEmail(toEmail, subject, body, attachmentPaths);
                        emailToUpdate.Status = Status.Sent;
                        emailToUpdate.StatusSpecified = true;
                        nav.emails.Update(ref emailToUpdate);


                        // Log success
                        logs.LogEntryOnFile("Email sent successfully.");
                        }
                        else
                        {
                            emailToUpdate.Status = Status.Failed;
                            emailToUpdate.StatusSpecified = true;emailToUpdate.Comments = "Invalid email";
                            nav.emails.Update(ref emailToUpdate);
                        }
                    }
                    catch (Exception ex)
                    {
                        logs.ReportError(ex);
                        emailToUpdate.Status = Status.Failed;
                        emailToUpdate.StatusSpecified = true; emailToUpdate.Comments = ex.Message;
                        nav.emails.Update(ref emailToUpdate);
                    }
                }


            }
            catch (Exception ex)
            {
                logs.ReportError(ex);

            }


        }
        private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            //var client = new RestClient("https://5.189.167.52:4001");

            ServicePointManager.ServerCertificateValidationCallback = (obj, certificate, chain, errors) => true;
            try
            {
                Sendsms.Sms ss = new Sendsms.Sms();
                //logs.LogEntryOnFile(nav.Sservice.Url);
                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 1000);

                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        //var request = new RestRequest("/api/sendsms", Method.Post);
                        //request.AddHeader("Content-Type", "application/json");
                        if (!string.IsNullOrEmpty(s.Telephone_No))
                        {

                            BulkSm bulk = new BulkSm()
                            {
                                Source_Id = s.Entry_No.ToString(),
                                Phone = s.Telephone_No,//"254727728602",//
                                Message = s.SMS_Message.Replace(@"\n", Environment.NewLine),
                                Client = sss.client,
                                //Apikey = sss.Apikey,
                                //partnerID = sss.partnerID
                            };
                            // request.AddJsonBody(bulk);
                            Ismsrepository sender;
                         
                                sender = new TrimLine_Sms();

                            var res = sender.sendsms(ref bulk);
                            // var response = client.Execute<Logging.Results<BulkSm>>(request);
                            // logs.LogEntryOnFile(string.Format("{0} {1}", s.Entry_No,response.StatusDescription));

                            //string r = ss.Sendsms(s.Entry_No.ToString(), s.Telephone_No, s.SMS_Message.Replace(@"\n", Environment.NewLine), sss.client);
                            //string[] res = r.Split(new char[] { '|' });
                            if (res.Code == 0)
                            {
                                BulkSm resdata = res.Contents;
                                s.Sent_To_Server = Sms.Sent_To_Server.Yes;
                                s.Sent_To_ServerSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Time_Sent_To_Server = DateTime.Now;
                                s.Time_Sent_To_ServerSpecified = true;
                                s.Bulk_SMS_Balance = res.Contents != null ? (decimal)res.Contents.Balance : 0;// resdata.Balance;
                            }
                            else
                            {
                                s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                                s.Sent_To_ServerSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Time_Sent_To_Server = DateTime.Now;
                                s.Time_Sent_To_ServerSpecified = true;
                                s.Comments = res.Desc;
                            }

                        }
                        else
                        {
                            s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                            s.Sent_To_ServerSpecified = true;
                            s.Date_Sent_to_Server = DateTime.Now.Date;
                            s.Date_Sent_to_ServerSpecified = true;
                            s.Time_Sent_To_Server = DateTime.Now;
                            s.Time_Sent_To_ServerSpecified = true;
                            s.Comments = "Invalid telephone";
                        }
                        nav.Sservice.Update(ref s);
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            logs.ReportError(ex);
                            s.Comments = ex.Message.Substring(0, ex.Message.Length > 200 ? 200 : ex.Message.Length);
                            nav.Sservice.Update(ref s);

                        }
                        catch (Exception e)
                        { }
                    }
                }
            }
            catch (Exception ex)
            {
                logs.ReportError(ex);

            }


        }

    }
    public partial class BulkSm
    {
        public string partnerID { get; set; }
        public string Apikey { get; set; }
        public string Source_Id { get; set; }
        public string Phone { get; set; }

        public string Message { get; set; }
        public DateTime? Datetime { get; set; }
        public string Client { get; set; }
        public int? Balance { get; set; }
        public int? Type { get; set; }
        public string Destination_Id { get; set; }
        public int? Status { get; set; }
        public string Trace { get; set; }
        public decimal? SMSCost { get; set; }
        public bool? SMSCharged { get; set; }
        public byte[] Time_stamp { get; set; }
        public bool? Scheduled { get; set; }
        public DateTime? Scheduled_Time { get; set; }
        public string Comments { get; set; }
    }
    public interface Ismsrepository
    {
        Logging.Results<BulkSm> sendsms(ref BulkSm sms);


    }
    public class TrimLine_Sms : Ismsrepository
    {

        public Logging.Results<BulkSm> sendsms(ref BulkSm sms)
        {
            var client = new RestClient("https://trimline.co.ke:4001");
            ServicePointManager.ServerCertificateValidationCallback = (obj, certificate, chain, errors) => true;
            var request = new RestRequest("/api/sendsms", Method.POST);
            request.AddHeader("Content-Type", "application/json");
            request.AddJsonBody(sms);

            var response = client.Execute<Logging.Results<BulkSm>>(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                return JsonConvert.DeserializeObject<Logging.Results<BulkSm>>(response.Content); 
            }
            else
                return new Logging.Results<BulkSm>() { Code = -1, Desc = response.StatusDescription };
        }
    }
}
