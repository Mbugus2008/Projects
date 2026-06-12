using Logging;
using Newtonsoft.Json;
using RestSharp;
using RunCodunit.Clients;
using RunCodunit.Emails;
using RunCodunit.Smtp;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Threading;

namespace RunCodunit
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public mbranch.MBranch mbranch = new mbranch.MBranch();
            public NetworkCredential cd;
            public Transactions.Transactions_Service Transactions_Service = new Transactions.Transactions_Service();
            public MobileTransactions.MobileTransactions_Service mobileTransactions = new MobileTransactions.MobileTransactions_Service();
            public Members.Members_Service Members_Service = new Members.Members_Service();
            public Emails_Service emails = new Emails_Service();
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
                //start(s);
                _thread = new Thread(() => start(s));
                _thread.IsBackground = false; // true;
                _thread.Priority = ThreadPriority.Normal;
                _thread.SetApartmentState(ApartmentState.STA);
                _thread.Start();


                //   Iclient iclient = client(s.client) ;

                // iclient.start(s);
            }


        }
        Iclient client(string cl)
        {
            switch (cl)
            {
                case "EMBASSAVA": return new Embassava();
                default: return null;
            }
        }
        private void loadsettings(settings.NAV ss, ref nav nav)
        {
            NetworkCredential networkCredential = new NetworkCredential(ss.Username, ss.pass);
            CredentialCache credentialCaches = new CredentialCache();
            nav.cd = new NetworkCredential(ss.Username, ss.pass, ss.domain);

            nav.Sservice.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Sms", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            //nav.Sservice.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/advantasms", ss.Serverip, ss.Companyname,
            //  ss.Instance, ss.Port));
            nav.Sservice.PreAuthenticate = true;
            nav.Sservice.Credentials = nav.cd;

            nav.mbranch.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/MBranch", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.mbranch.PreAuthenticate = true;
            nav.mbranch.Credentials = nav.cd;


            nav.Members_Service.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Members", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Members_Service.PreAuthenticate = true;
            nav.Members_Service.Credentials = nav.cd;

            nav.Transactions_Service.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transactions", ss.Serverip, ss.Companyname,
                       ss.Instance, ss.Port));
            nav.Transactions_Service.PreAuthenticate = true;
            nav.Transactions_Service.Credentials = nav.cd;

            nav.mobileTransactions.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/MobileTransactions", ss.Serverip, ss.Companyname,
                       ss.Instance, ss.Port));
            nav.mobileTransactions.PreAuthenticate = true;
            nav.mobileTransactions.Credentials = nav.cd;
       nav.emails.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Emails", ss.Serverip, ss.Companyname,
                       ss.Instance, ss.Port));      nav.emails.PreAuthenticate = true;
            nav.emails.Credentials = nav.cd; nav.Smtp_Service.Url = Uri.EscapeUriString(string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Smtp", ss.Serverip, ss.Companyname,
                       ss.Instance, ss.Port));
            nav.Smtp_Service.PreAuthenticate = true;
            nav.Smtp_Service.Credentials = nav.cd;
        }
        public void start(settings.NAV ss)
        {
            try
            {
                logs logs = new logs();

                nav nav = new nav();
                loadsettings(ss, ref nav);
                logs.logpath = ss.logpath;
                while (stop == false)
                {
                    try
                    {
                        logs.LogEntryOnFile(string.Format("{0}:Start - {1}", DateTime.Now, nav.Sservice.Url));
                        sendsms(logs, ss, ref nav);
                       if (ss.emails) sendemails(logs, ss, ref nav);  nav.mbranch.Post();
                        if (ss.hasmpesa)
                            Sendmpesa(logs, ss, ref nav);
                        if (ss.external_sync)
                            sync(logs, ss, ref nav); 
                       
                        logs.LogEntryOnFile(string.Format("{0}:End", DateTime.Now));
                    }
                    catch (Exception ex)
                    {
                        logs.ReportError(ex);
                    }

                    Thread.Sleep(ss.PostIntervalinsec * 1000);
                }
            }
            catch (Exception)
            {


            }
        }

        public void Sendmpesa(logs logs, settings.NAV sss, ref nav nav)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            try
            {
                MpesaApi.Cust c = new MpesaApi.Cust();
                c.initiator = "Mobile";
                c.customer_key = "VjyGOECYr2dla1Vwc7xlfkTqXAcJFiPO3Xc8inQD0TxNVlI6";
                c.customer_secret = "AHBb3fSAsOqqMNf52EPEtQeQfTJkpDcygGY1Whz7AohGaA4WoZ1uA9ka2dvZGYk9";

                MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);

                var members = nav.Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = ">0", Field = Members.Members_Fields.Mobile_Money }, new Members.Members_Filter { Criteria = "No", Field = Members.Members_Fields.Sending_Mpesa } }, null, 0);

                if (members != null)
                    logs.LogEntryOnFile($" No Of disbursements {members.Length}");
                foreach (var mm in members)
                {
                    try
                    {
                        var m = mm;
                        MpesaApi.b2c r = new MpesaApi.b2c();
                        r.InitiatorName = c.initiator;
                        r.SecurityCredential = "EUFVcxxmO87JJgFKodKjicubAsPw6oF8w6AXQByw53xwWJR0VIdHvgq7WH0hwQl/1H++sqej2I46dLIuP6l3hRdwSjhrdxKR+H7yIciGPoclIkwsYJuaNphagZjOD7Cet+FE6dnAFf2e5uvHi30ANl+T8r+Rja6rCAQmWJXA+iQkpokhagzWwKZMNl31ZzQooJ4abx48ecuyfdqU4XOxTfiqRYEvSE9Qe1YTfmtYCl76ugrO5TZ3EYVZkAjbcPhVjbpsnVf2vMdyRYKxh+bNsvh+GelZJ3bieyWbknGX9OTDTskWCYuDm12Z2fOnSenWyoAAamMiIqx8MRXvQzur1Q==";
                        r.CommandID = "BusinessPayment";
                        r.Amount = (double)m.Mobile_Money;
                        r.PartyA = "3039047";
                        var phone = m.Phone_No.Replace(" ", "");
                        r.PartyB = string.Format("254{0}", phone.Substring(phone.Length - 9));
                        r.Remarks = "Successfull";
                        //r.QueueTimeOutURL = "https://197.248.158.54:4000/Deposit.svc/QueueTimeOut";
                        r.QueueTimeOutURL = "https://5.189.167.52:4001/api/QueueTimeOut";
                        // r.ResultURL = "https://197.248.158.54:4000/Deposit.svc/Results";
                        r.ResultURL = "https://5.189.167.52:4001/api/results";
                        r.Occasion = m.Name;

                        string output = JsonConvert.SerializeObject(r);
                        logs.LogEntryOnFile(output);
                        m.Sending_Mpesa = true;
                        m.Sending_MpesaSpecified = true;
                        nav.Members_Service.Update(ref m);

                        MobileTransactions.MobileTransactions tr = new MobileTransactions.MobileTransactions();
                        tr.Account_No = m.No;
                        tr.Transaction_Date = DateTime.Now;
                        tr.Transaction_DateSpecified = true;
                        tr.Mobile_No = m.Phone_No;
                        tr.Description = "Mobile Money";
                        tr.Source = MobileTransactions.Source.Mobile;
                        tr.SourceSpecified = true;
                        tr.Document_No = DateTime.Now.Ticks.ToString();
                        tr.Amount = m.Mobile_Money;
                        tr.Name = m.Name;
                        tr.Transaction_Type = 30;
                        tr.Transaction_TypeSpecified = true;
                        tr.AmountSpecified = true;
                        tr.Status = MobileTransactions.Status.Pending_Posting;
                        tr.StatusSpecified = false;

                        nav.mobileTransactions.Create(ref tr);

                        var mp = mpesa.b2c(r);

                        logs.LogEntryOnFile(mp.ResponseStatus.ToString());
                        if (mp.ResponseStatus == HttpStatusCode.OK)
                        {
                            var mpr = (MpesaApi.b2cresponse)mp.Content;
                            tr.Account_No_2 = mpr.ConversationID;
                            tr.Status = MobileTransactions.Status.Sending_Money;
                            tr.StatusSpecified = true;
                        }
                        else
                        {

                            m.Comment1 = mp.ResponseDescription.Length > 50 ? mp.ResponseDescription.Substring(0, 50) : mp.ResponseDescription;
                            m.Sending_Mpesa = false;
                            m.Sending_MpesaSpecified = true;

                            var ccc = (MpesaApi.b2cresponse)mp.Content;

                            logs.LogEntryOnFile(ccc.errorMessage);
                            tr.Comments = ccc.errorMessage;
                            tr.Status = MobileTransactions.Status.Failed;
                            tr.StatusSpecified = true;
                        }

                        nav.Members_Service.Update(ref m);
                        nav.mobileTransactions.Update(ref tr);
                    }
                    catch (Exception e)
                    {
                        logs.ReportError(e);

                    }
                }
            }
            catch (Exception ex)
            { logs.ReportError(ex); }
        }
        private void sendsms(logs logs, settings.NAV sss, ref nav nav)
        {
            //var client = new RestClient("https://5.189.167.52:4001");

            ServicePointManager.ServerCertificateValidationCallback = (obj, certificate, chain, errors) => true;
            try
            {
                Sendsms.Sms ss = new Sendsms.Sms();
                //logs.LogEntryOnFile(nav.Sservice.Url);
                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 1000);

                foreach (var ssave in sms.Where(o=> o.SMS_Message !=null))
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
                                Phone = s.Telephone_No,//"254710563359",//
                                Message = s.SMS_Message.Replace(@"\n", Environment.NewLine),
                                Client = sss.client,
                                Apikey = sss.Apikey,
                                partnerID = sss.partnerID
                            };
                            // request.AddJsonBody(bulk);
                            Ismsrepository sender;
                            if (sss.sms_dest == settings.Sms_Dest.Advanta)
                                sender = new Advantasms();
                            else
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
                            s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                            s.Sent_To_ServerSpecified = true;
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
        private  void sendemails(logs logs, settings.NAV sss, ref nav nav)
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
        public void sync(logs logs, settings.NAV sss, ref nav nav)
        {
            try
            {
                string apiUrl = "https://mtrans.gopay.ke/api/admin/micro_dynamics";

                // Create a RestClient instance
                RestClient client = new RestClient(apiUrl);
                var tr = nav.Transactions_Service.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = "<>MTWENDE", Field = Transactions.Transactions_Fields.Agent_Code }, new Transactions.Transactions_Filter { Criteria = "No", Field = Transactions.Transactions_Fields.Sync }, new Transactions.Transactions_Filter { Criteria = "Yes", Field = Transactions.Transactions_Fields.Posted } }, null, 10);
                if (tr != null)
                {
                    foreach (var item in tr)
                    {
                        try
                        {


                            Transactions.trans t = new Transactions.trans
                               ()
                            {
                                Document_No = item.Document_No,
                                Transaction_Date = item.Transaction_Date,
                                Account_No = item.Account_No,
                                Amount = item.Amount,
                                Description = item.Description ?? item.Type,
                                Transaction_Time = item.Transaction_Time,
                                OTTN = item.OTTN,
                                Agent_Code = item.Agent_Code,
                                Loan_No = item.Loan_No,
                                Type = item.Type,
                                fleetNO = item.Fleet_No,
                            };
                            string json = System.Text.Json.JsonSerializer.Serialize(t);


                            RestRequest request = new RestRequest();
                            request.AddHeader("Accept", "application/json");
                            // Add the object as JSON to the request body
                            request.AddHeader("Content-Type", "application/json");
                            request.AddParameter("application/json", json, ParameterType.RequestBody);
                            // Execute the request and get the response

                            var response = client.Post<Transactions.Response>(request);
                            if (response.success)
                            {
                                item.Sync = true;
                                item.SyncSpecified = true;
                                item.Messages = "";
                            }
                            else
                            {
                                item.Messages = response.message;
                                item.Sync = true;
                                item.SyncSpecified = true;
                            }
                            var it = item;
                            nav.Transactions_Service.Update(ref it);
                        }
                        catch (Exception ex)
                        {
                            logs.ReportError(ex);
                            item.Messages = ex.Message;
                            item.Sync = true;
                            item.SyncSpecified = true; var it = item; nav.Transactions_Service.Update(ref it);
                        }
                    }
                }
            }
            catch (Exception ex)
            { logs.ReportError(ex); }
        }



    }
}
