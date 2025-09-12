using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.EnterpriseServices.Internal;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Net;
using System.Net.NetworkInformation;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;


namespace Openvalley
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public mbranch.MBranch mbranch = new mbranch.MBranch();
            public Loans.Loans_Service loans_Service = new Loans.Loans_Service();
            public Mpesa.Mpesa_Service mpesa_Service = new Mpesa.Mpesa_Service();
            public  System.Net.NetworkCredential cd;
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
            try
            {
                Logging.logs logs = new Logging.logs();
                nav nav = new nav();
                loadsettings(ss, ref nav);
                logs.logpath = ss.logpath;
                while (stop == false)
                {
                    try
                    {
                        logs.LogEntryOnFile(String.Format("{0}:Start - {1}", DateTime.Now, nav.Sservice.Url));
                        Sendmpesa(logs, ss, ref nav);
                        //sendsms(logs,ss, ref nav);
                        //Tstatus(logs, ss, ref nav);
                        //nav.mbranch.Post();
                        logs.LogEntryOnFile(String.Format("{0}:End", DateTime.Now));
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
        public void Sendmpesa(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            try
            {
                MpesaApi.Cust c = new MpesaApi.Cust();
                c.initiator = "Openvalley";
                c.customer_key = "9S3slwMuOmwq9p8DZJhFnwF5iZrzYomM";
                c.customer_secret = "83EmDaDIrzaMSw8y";

                MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);
 
                //var Loans = nav.loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = "Appraisal", Field = Openvalley.Loans.Loans_Fields.Loan_Status }, new Loans.Loans_Filter { Criteria = "No", Field = Openvalley.Loans.Loans_Fields.Posted } }, null, 0);
                var Loans = nav.loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = "Approved", Field = Openvalley.Loans.Loans_Fields.Loan_Status }, new Loans.Loans_Filter { Criteria = "No", Field = Openvalley.Loans.Loans_Fields.Posted } }, null, 0);
                foreach (var ln in Loans.ToList())
                {
                    try
                    { 
                        var l = ln;
                        l.Loan_Status = Openvalley.Loans.Loan_Status.Sending_Money;
                        l.Loan_StatusSpecified = true;
                       
                        nav.loans_Service.Update(ref l);

                        MpesaApi.b2c   r = new MpesaApi.b2c ();
                        r.InitiatorName = c.initiator;
                        r.SecurityCredential = "DGxbJQiGxMmwUqkm7+dTlHcDjdL6cxNlkxm0aKuruwGIKLkrKeFUHl9cUvsZicgfAuLO4Ic4MJo6OPuT6hWJVjuYc32iY6tBeenkaOTs6/Fv/9jKERiUQNFomATMHO2l3m9aLZmhrK+bKnZ1BhBufgY0uO6H0li1Z3JVAAm/zjz0Rb6uHmHjV/KJKJSPxQTgokv7URorfXKA89hQnq7FnE979LLirktJ7sDwfUIBi824UmMU2l5CzkYZS4aAchdwgN7eQpp+LwAMJtjr8OTnELq5EUf+65SizVeOK2iXNRoCyruVmIwlPxezLztkHAHKb//kGGqpCaiPHh4RXGQcbQ==";
                        r.CommandID = "BusinessPayment";
                        r.Amount =(double) l.Approved_Amount;
                        r.PartyA = "3012507";
                        var phone = l.Mobile.Replace(" ", "");
                        r.PartyB = string.Format("254{0}", phone.Substring(phone.Length -9));
                        r.Remarks = "Successfull";
                        r.QueueTimeOutURL = "https://167.86.120.230:855/Deposit.svc/QueueTimeOut";
                        r.ResultURL = "https://167.86.120.230:855/Deposit.svc/Results";
                        r.Occasion = l.Loan_No;

                        string output = JsonConvert.SerializeObject(r);
                        logs.LogEntryOnFile(output);



                        var mp = mpesa.b2c(r);
                        logs.LogEntryOnFile(mp.ResponseStatus.ToString());
                        if (mp.ResponseStatus == HttpStatusCode.OK)
                        {
                            var mpr = (MpesaApi.b2cresponse)mp.Content;
                            l.Mpesa_Reference = mpr.ConversationID;
                            l.Loan_Status = Openvalley.Loans.Loan_Status.Sending_Money;
                            l.Loan_StatusSpecified = true;
                        }
                        else
                        {
                            
                            l.Comments = mp.ResponseDescription;
                            var ccc = (MpesaApi.b2cresponse)mp.Content;
                            l.Comments = ccc.errorMessage;
                            logs.LogEntryOnFile(ccc.errorMessage);
                        }
                    
                        nav.loans_Service.Update( ref l);
                    }
                    catch (Exception e)
                    {
                        logs.ReportError(e);
                        ln.Loan_Status = Openvalley.Loans.Loan_Status.Failed;
                        ln.Loan_StatusSpecified = true;
                        ln.Comments = (e.Message.Length>250?e.Message.Substring(0,249):e.Message);
                        var l = ln;
                        nav.loans_Service.Update( ref l);

                    }
                }
            }
            catch (Exception ex)
            { logs.ReportError(ex); }
        }
        public void Tstatus(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            try
            {
                logs.LogEntryOnFile("Status");
                MpesaApi.Cust c = new MpesaApi.Cust();
                c.initiator = "Openvalley";
                c.customer_key = "9S3slwMuOmwq9p8DZJhFnwF5iZrzYomM";
                c.customer_secret = "83EmDaDIrzaMSw8y";

                MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);

              
                var mps = nav.mpesa_Service.ReadMultiple(new  Mpesa.Mpesa_Filter[] { new Mpesa.Mpesa_Filter { Criteria = "B2C", Field =  Mpesa.Mpesa_Fields.Transaction_Type }, new  Mpesa.Mpesa_Filter { Criteria = "No", Field =  Mpesa.Mpesa_Fields.Processed } }, null, 0);
                foreach (var ln in mps.ToList())
                {
                    try
                    {
                        logs.LogEntryOnFile(ln.Receipt_No);
                        var l = ln;
                        var Loans = nav.loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = l.Receipt_No, Field = Openvalley.Loans.Loans_Fields.Mpesa_Reference }}, null, 0);
                        if (Loans.Count() == 0)
                        {
                            MpesaApi.Status r = new MpesaApi.Status();
                            r.Initiator = c.initiator;
                            r.SecurityCredential = "DGxbJQiGxMmwUqkm7+dTlHcDjdL6cxNlkxm0aKuruwGIKLkrKeFUHl9cUvsZicgfAuLO4Ic4MJo6OPuT6hWJVjuYc32iY6tBeenkaOTs6/Fv/9jKERiUQNFomATMHO2l3m9aLZmhrK+bKnZ1BhBufgY0uO6H0li1Z3JVAAm/zjz0Rb6uHmHjV/KJKJSPxQTgokv7URorfXKA89hQnq7FnE979LLirktJ7sDwfUIBi824UmMU2l5CzkYZS4aAchdwgN7eQpp+LwAMJtjr8OTnELq5EUf+65SizVeOK2iXNRoCyruVmIwlPxezLztkHAHKb//kGGqpCaiPHh4RXGQcbQ==";
                            r.CommandID = "TransactionStatusQuery";
                            r.IdentifierType = "4";
                            r.PartyA = "3012507";
                            r.TransactionID = l.Receipt_No;
                            r.Remarks = "Successfull";
                            r.QueueTimeOutURL = "https://167.86.120.230:855/Deposit.svc/QueueTimeOut";
                            r.ResultURL = "https://167.86.120.230:855/Deposit.svc/Results";
                            r.Occasion = l.Receipt_No;

                            string output = JsonConvert.SerializeObject(r);
                            logs.LogEntryOnFile(output);



                            var mp = mpesa.Tstatus(r);
                            logs.LogEntryOnFile(mp.ResponseStatus.ToString());
                            if (mp.ResponseStatus == HttpStatusCode.OK)
                            {
                                var mpr = (MpesaApi.b2cresponse)mp.Content;
                                l.Processed = true;
                                l.ProcessedSpecified = true;

                            }
                            else
                            {

                                l.Comments = mp.ResponseDescription;
                                var ccc = (MpesaApi.b2cresponse)mp.Content;
                                l.Comments = ccc.errorMessage;
                                logs.LogEntryOnFile(ccc.errorMessage);
                            }
                        }
                        else {
                            l.Processed = true;
                            l.ProcessedSpecified = true;
                        }


                        nav.mpesa_Service.Update(ref l);
                    }
                    catch (Exception e)
                    {
                        logs.ReportError(e);
                      
                        ln.Comments = (e.Message.Length > 250 ? e.Message.Substring(0, 249) : e.Message);
                        var l = ln;
                        nav.mpesa_Service.Update(ref l);

                    }
                }
            }
            catch (Exception ex)
            { logs.ReportError(ex); }
        }
        private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav )
        {
            var client = new RestClient("https://5.189.167.52:4001");
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
            try
            {
                Sendsms.Sms ss = new Sendsms.Sms();
                logs.LogEntryOnFile(nav.Sservice.Url);
                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 1000);
         
                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        var request = new RestRequest("/api/sendsms", Method.POST);
                        request.AddHeader("Content-Type", "application/json");
                        if (!string.IsNullOrEmpty(s.Telephone_No))
                        {


                            BulkSm bulk = new BulkSm()
                            {
                                Source_Id = s.Entry_No.ToString(),
                                Phone = s.Telephone_No,
                                Message = s.SMS_Message.Replace(@"\n", Environment.NewLine),
                                Client = sss.client
                            };
                            request.AddJsonBody(bulk);

                            var response = client.Execute<Logging.Results<BulkSm>>(request);
                            logs.LogEntryOnFile(string.Format("{0} {1}", s.Entry_No, response.StatusDescription));

                            //string r = ss.Sendsms(s.Entry_No.ToString(), s.Telephone_No, s.SMS_Message.Replace(@"\n", Environment.NewLine), sss.client);



                            //string[] res = r.Split(new char[] { '|' });
                            if (response.StatusCode == HttpStatusCode.OK)
                            {
                                var res = response.Data;
                                if (res.Code == 0)
                                {
                                    BulkSm resdata = (BulkSm)res.Contents;
                                    s.Sent_To_Server = Sms.Sent_To_Server.Yes;
                                    s.Sent_To_ServerSpecified = true;
                                    s.Date_Sent_to_Server = DateTime.Now.Date;
                                    s.Date_Sent_to_ServerSpecified = true;
                                    s.Time_Sent_To_Server = DateTime.Now;
                                    s.Time_Sent_To_ServerSpecified = true;
                                    s.Bulk_SMS_Balance = (decimal)res.Contents.Balance;// resdata.Balance;
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
                            s.Comments = ex.Message.Substring(0, (ex.Message.Length > 200 ? 200 : ex.Message.Length));
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

        public string Source_Id { get; set; }
        public string Phone { get; set; }

        public string Message { get; set; }
        public Nullable<System.DateTime> Datetime { get; set; }
        public string Client { get; set; }
        public Nullable<int> Balance { get; set; }
        public Nullable<int> Type { get; set; }
        public string Destination_Id { get; set; }
        public Nullable<int> Status { get; set; }
        public string Trace { get; set; }
        public Nullable<decimal> SMSCost { get; set; }
        public Nullable<bool> SMSCharged { get; set; }
        public byte[] Time_stamp { get; set; }
        public Nullable<bool> Scheduled { get; set; }
        public Nullable<System.DateTime> Scheduled_Time { get; set; }
        public string Comments { get; set; }
    }
}
