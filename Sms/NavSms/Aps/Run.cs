using Aps.Loanschedule;
using Aps.Memberlist;
using Aps.MobileTransactions;
using Aps.smstemplates;
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
using System.Text.RegularExpressions;
using System.Threading;


namespace Aps
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public smstemplates.SmsTemplates_Service tempservice = new smstemplates.SmsTemplates_Service();
            public Mbranch.RunThem mbranch = new Mbranch.RunThem();
            public Loans.Loans_Service loans_Service = new Loans.Loans_Service();
            public Memberslist_Service Members_Service = new Memberslist_Service();
           
            public  MobileTransactions.MobileTransactions_Service Transactions_Service = new    MobileTransactions.MobileTransactions_Service  ();
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
           // while (true) ;
        }
       
        private void loadsettings(settings.NAV ss,ref nav nav)
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

            nav.Members_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Memberslist", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Members_Service.PreAuthenticate = true;
            nav.Members_Service.Credentials = (ICredentials)nav.cd;


            nav.Transactions_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/MobileTransactions", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Transactions_Service.PreAuthenticate = true;
            nav.Transactions_Service.Credentials = (ICredentials)nav.cd;

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
                       
                        logs.LogEntryOnFile(String.Format("{0}:Start", DateTime.Now));
                        Sendwithdrawal(logs, ss, ref nav);

                        sendsms(logs, ss, ref nav);
                        if ((DateTime.Now > new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 07, 0, 0))
                            &&
                               (DateTime.Now < new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day, 8, 0, 0)))
                        {
                            logs.LogEntryOnFile("Notifications");
                            //notificationsmbaraka(logs, ss, ref nav);
                            notifications(logs, ss, ref nav);
                        }
                        nav.mbranch.Post();
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
        private void notificationsmbaraka(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            try {
                var loans = nav.loans_Service.ReadMultiple(new Loans.Loans_Filter[] { 
                    new Loans.Loans_Filter { Criteria = $"<>{DateTime.Now.Date.ToString("MM/dd/yyyy")}", Field = Loans.Loans_Fields.Last_run_date } ,
                    new Loans.Loans_Filter { Criteria = "M-BARAKA", Field = Loans.Loans_Fields.Loan_Product_Type } 
                }, null, 50);
               if (loans != null ) 
                    logs.LogEntryOnFile($" Mbaraka loans {loans.Length}");
                foreach (var l in loans)
                {
                    try 
                    {
                        logs.LogEntryOnFile(l.Loan_No);
                        nav.mbranch.Loannotifications(l.Loan_No.ToString());
                    }
                    catch(Exception ex)
                    {
                        logs.ReportError(ex);
                    }
                }
            
            }
            catch(Exception ex) 

            {
                logs.ReportError(ex);
            }

        }
        private void notifications(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            try
            {
                DateTime dd = DateTime.Today;//new DateTime(2024, 12, 03); //

                //while (dd < DateTime.Today) { 

                List<SmsTemplates_Filter> filter1 = new List<SmsTemplates_Filter>();
                filter1.Add(new SmsTemplates_Filter { Criteria = "Yes", Field = SmsTemplates_Fields.Active });
                filter1.Add(new SmsTemplates_Filter { Criteria = $"<>{dd.ToString("MM/dd/yyyy")}", Field = SmsTemplates_Fields.Last_Run_Date });
                //filter1.Add(new SmsTemplates_Filter { Criteria = "Yes", Field = SmsTemplates_Fields.Penalty });

               
                var temp = new SmsTemplates_Service(sss).ReadMultiple(filter1.ToArray(), null, 0);
                logs.LogEntryOnFile($" Notifications {temp.Length}");
                foreach (var tem in temp)//.Where(o => o.Loan_Type == "BOOSTER"))
                {
                    smstemplates.SmsTemplates t = tem;
                    try
                    {
                        var d = dd.AddDays(-t.Day).ToString("MM/dd/yyyy");
                             List<Loans.Loans_Filter> filter = new List<Loans.Loans_Filter>();
                            filter.Add(new Loans.Loans_Filter { Criteria = t.Loan_Type, Field = Loans.Loans_Fields.Loan_Product_Type });
                            filter.Add(new Loans.Loans_Filter { Criteria = ">0", Field = Loans.Loans_Fields.Outstanding_Balance });
                            filter.Add(new Loans.Loans_Filter { Field = Loans.Loans_Fields.Application_Date, Criteria = dd.AddDays(-t.Day).ToString("MM/dd/yyyy") });
                            filter.Add(new Loans.Loans_Filter { Criteria = $"<>{dd.ToString("MM/dd/yyyy")}", Field = Loans.Loans_Fields.Last_run_date });

                            if (!string.IsNullOrEmpty(t.Application_Amount) ) 
                            filter.Add(new Loans.Loans_Filter { Criteria = t.Application_Amount, Field = Loans.Loans_Fields.Approved_Amount });

                            var loans = nav.loans_Service.ReadMultiple(filter.ToArray(), null, 0);
                        if (loans != null)
                            logs.LogEntryOnFile($" No Of Loans {loans.Length}");
                        foreach (var loan in loans)
                        {
                            Loans.Loans l = loan;
                            try
                            {
                                double interest = 0;
                                try
                                {
                                    if (l.Total_Schedule_Repayment == 0)
                                    {
                                        nav.mbranch.Generateschedule(l.Loan_No);
                                        l = nav.loans_Service.Read(l.Loan_No);
                                    }
                                }
                                catch (Exception ex) { }
                                if (t.Accrue_Interest)
                                {
                                    if (nav.mbranch.Interestposted(l.Loan_No, dd) == false)
                                    {
                                        logs.LogEntryOnFile($"Posting interest {l.Loan_No}");
                                        interest = (double)nav.mbranch.AccrueInterest(l.Loan_No, dd, "Monthly Interest");
                                }
                            }
                                if (t.Penalty)
                                {
                                    if (nav.mbranch.Interestposted(l.Loan_No, dd) == false)
                                    {
                                        logs.LogEntryOnFile($"Posting Penalty {l.Loan_No}");
                                        interest = (double)nav.mbranch.AccrueInterest(l.Loan_No, dd, "Penalty");
                                    }
                                }

                                var s = new Loanschedule_Service(sss).ReadMultiple(new Loanschedule_Filter[] { new Loanschedule_Filter { Criteria = l.Loan_No, Field = Loanschedule_Fields.Loan_No } }, null, 0).OrderBy(o => o.Instalment_No);
                                var nextr = s.Where(o => o.Repayment_Date >= dd).FirstOrDefault();
                                if (nextr == null)
                                    nextr = s.FirstOrDefault();
                                var sms = string.Format(string.Concat(t.Message_Template, t.Message_Templae_2),
                                    l.Application_Date.ToString("dd/MMM/yyyy") //application date
                                    , l.Client_Code                             //Member No
                                    , l.Client_Name                             //Member Name
                                    , Math.Ceiling((l.Outstanding_Balance + l.Oustanding_Interest)).ToString("N2") //Balance(Principal  + interest) 
                                    , Math.Ceiling(l.Outstanding_Balance).ToString("N2")//Principal
                                    , l.Oustanding_Interest.ToString("N2")//Interest
                                    , l.Loan_Disbursement_Date.ToString("dd/MMM/yyyy")//Disbursement Date
                                    , l.Expected_Date_of_Completion.ToString("dd/MMM/yyyy")// l.Loan_Disbursement_Date.AddMonths(l.Installments).ToString("dd/MMM/yyyy")//Completion Date
                                    , nextr.Repayment_Date.ToString("dd/MMM/yyyy")//Next Repayment Date
                                    , ((l.Outstanding_Balance + l.Oustanding_Interest) < nextr.Monthly_Repayment ? (l.Outstanding_Balance + l.Oustanding_Interest) : Math.Ceiling(nextr.Monthly_Repayment)).ToString("N2")//Installment Amount
                                    , l.Loan_Product_Type
                                    , l.Product_Name
                                    , Math.Ceiling(l.Daily_interest).ToString("N2")
                                    , Math.Ceiling(l.Outstanding_Penalty).ToString("N2")

                                    , Math.Ceiling(l.Outstanding_Balance + l.Oustanding_Interest + l.Daily_interest).ToString("N2")
                                    , Math.Ceiling(l.Outstanding_Balance + l.Daily_interest).ToString("N2")
                                    , Math.Ceiling(interest).ToString("N2")
                                    , Math.Ceiling(nextr.Principal_Repayment).ToString("N2")
                                    , Math.Ceiling(nextr.Monthly_Interest).ToString("N2")
                                    ); ;// ;

                                l.Last_run_date = dd;

                                l.Last_run_dateSpecified = true;
                                nav.loans_Service.Update(ref l);
                                nav.mbranch.SendSms(l.Loan_No, "", sms, false, l.Client_Code);
                            }
                            catch (Exception ex)
                            {
                                logs.ReportError(ex);
                                l.Remarks = ex.Message.Substring(0, 49);
                                nav.loans_Service.Update(ref l);
                            }


                        }
                        t.Last_Run_Date = dd;
                        t.Last_Run_DateSpecified = true;
                        t.Comments = "";
                    }
                    catch (Exception ex)
                    {
                        logs.ReportError(ex);
                        t.Comments = ex.Message;
                    }
                    new SmsTemplates_Service(sss).Update(ref t);
                }
               //dd=     dd.AddDays(1);
            //}
            }
            catch (Exception ex)

            {
                logs.ReportError(ex);
            }

        }
        public void Sendmpesa(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            try
            {
                MpesaApi.Cust c = new MpesaApi.Cust();
                c.initiator = "Mobile";
                c.customer_key = "DHH3x1XHTvUKmR2uGv72B5uXhcZ1FH8N";
                c.customer_secret = "p6tGttfG1Gq56ZmD";

                MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);
                
                var members = nav.Members_Service.ReadMultiple(new Memberslist_Filter []{ new Memberslist_Filter { Criteria = ">0",Field = Memberslist_Fields.Mobile_Money },new Memberslist_Filter { Criteria = "No",Field=  Memberslist_Fields.Sending_Mpesa } }, null, 0);

                if (members != null ) 
                logs.LogEntryOnFile($" No Of disbursements {members.Length}");
                foreach (var mm in members)
                {
                    try
                    {
                        var m = mm;
                        MpesaApi.b2c   r = new MpesaApi.b2c ();
                        r.InitiatorName = c.initiator;
                        r.SecurityCredential = "ZOT1H7EXmjqkuXA0BhGzacQgfrZkzcIVQSvOXtNZ2Tpk44XbZeFzdOOFelQZUPa8aX6BCLdnZsi4XYFpfN2Hu90c1MxXO89xx+pkY3ZnSyz2GmpdtK8BFcijZa9miyvWbvQr9D1fTBHWLZ6HAY/QzT3cwCQdX494UiV6/LntxeoAdBh+05ocjWHH0JphjhsU4qVZnifphsQaWK8C3Ii0a8nbPLFfdpvwtYmT/bI8XPOhGb7iDvPPTNOXApnPjEgo1WxiDeHMcaEuLlNtSmatsh2U10QOYrmJARf2CfIrXG6Hc+30Xtr++VvMObQgX/4Ky4l+zGwS03tYoeRZHYoB0Q==";
                        r.CommandID = "BusinessPayment";
                        r.Amount =(double) m.Mobile_Money;
                        r.PartyA = "598394";
                        var phone = m.MPESA_Mobile_No.Replace(" ", "");
                        r.PartyB = string.Format("254{0}", phone.Substring(phone.Length -9));
                        r.Remarks = "Successfull";
                        r.QueueTimeOutURL = "https://197.248.158.54:4000/Deposit.svc/QueueTimeOut";
                        r.ResultURL = "https://197.248.158.54:4000/Deposit.svc/Results";
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
                        tr.Mobile_No = m.MPESA_Mobile_No;
                        tr.Description = "Mobile Money";
                        tr.Source = MobileTransactions.Source.Mbaraka;
                        tr.SourceSpecified = true;
                        tr.Document_No = DateTime.Now.Ticks.ToString();
                        tr.Amount = m.Mobile_Money;
                        tr.Name = m.Name;
                        tr.Transaction_Type = 30;
                        tr.Transaction_TypeSpecified = true;
                        tr.AmountSpecified = true;
                        tr.Status = MobileTransactions.Status.Pending_Posting;
                        tr.StatusSpecified = false;

                        nav.Transactions_Service.Create(ref tr);

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
                            
                            m.Comment1 = (mp.ResponseDescription.Length > 50 ? mp.ResponseDescription.Substring(0, 50):mp.ResponseDescription) ;
                            m.Sending_Mpesa = false;
                            m.Sending_MpesaSpecified = true;

                            var ccc = (MpesaApi.b2cresponse)mp.Content;
                          
                            logs.LogEntryOnFile(ccc.errorMessage);
                            tr.Comments = ccc.errorMessage;
                            tr.Status = MobileTransactions.Status.Failed;
                            tr.StatusSpecified = true;
                        }
                 
                        nav.Members_Service.Update( ref m);
                        nav.Transactions_Service.Update(ref tr);
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
        public void Sendwithdrawal(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            ServicePointManager.Expect100Continue = true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            try
            {
                MpesaApi.Cust c = new MpesaApi.Cust();
                c.initiator = "Mobile";
                c.customer_key = "DHH3x1XHTvUKmR2uGv72B5uXhcZ1FH8N";
                c.customer_secret = "p6tGttfG1Gq56ZmD";

                MpesaApi.MpesaApi mpesa = new MpesaApi.MpesaApi(c);

                var trans = nav.Transactions_Service.ReadMultiple(new MobileTransactions_Filter[] { new MobileTransactions_Filter { Criteria = "1", Field = MobileTransactions_Fields.Transaction_Type }, new MobileTransactions_Filter { Criteria = "No", Field = MobileTransactions_Fields.Posted } , new MobileTransactions_Filter { Criteria = "Pending Posting", Field = MobileTransactions_Fields.Status }}, null, 0);

                if (trans != null)
                    logs.LogEntryOnFile($" No Of disbursements {trans.Length}");
                foreach (var mmm in trans)
                {
                    try
                    {var m = mmm;
                        var member = nav.Members_Service.ReadMultiple(new Memberslist_Filter[] { new Memberslist_Filter { Criteria = m.Account_No, Field = Memberslist_Fields.No }, new Memberslist_Filter { Criteria = "No", Field = Memberslist_Fields.Sending_Mpesa } }, null, 0).FirstOrDefault();
                        if (member != null)
                        {
                            if (member.Mobile_Money >= (m.Amount + m.Charge))
                            {
                                MpesaApi.b2c r = new MpesaApi.b2c();
                                r.InitiatorName = c.initiator;
                                r.SecurityCredential = "ZOT1H7EXmjqkuXA0BhGzacQgfrZkzcIVQSvOXtNZ2Tpk44XbZeFzdOOFelQZUPa8aX6BCLdnZsi4XYFpfN2Hu90c1MxXO89xx+pkY3ZnSyz2GmpdtK8BFcijZa9miyvWbvQr9D1fTBHWLZ6HAY/QzT3cwCQdX494UiV6/LntxeoAdBh+05ocjWHH0JphjhsU4qVZnifphsQaWK8C3Ii0a8nbPLFfdpvwtYmT/bI8XPOhGb7iDvPPTNOXApnPjEgo1WxiDeHMcaEuLlNtSmatsh2U10QOYrmJARf2CfIrXG6Hc+30Xtr++VvMObQgX/4Ky4l+zGwS03tYoeRZHYoB0Q==";
                                r.CommandID = "BusinessPayment";
                                r.Amount = (double)m.Amount;
                                r.PartyA = "598394";
                                var phone = m.Mobile_No.Replace(" ", "");
                                r.PartyB = string.Format("254{0}", phone.Substring(phone.Length - 9));
                                r.Remarks = "Successfull";
                                r.QueueTimeOutURL = "https://197.248.158.54:4000/Deposit.svc/QueueTimeOut";
                                r.ResultURL = "https://197.248.158.54:4000/Deposit.svc/Results";
                                r.Occasion = m.Name;

                                string output = JsonConvert.SerializeObject(r);
                                logs.LogEntryOnFile(output);
                                member.Sending_Mpesa = true;
                                member.Sending_MpesaSpecified = true;
                                nav.Members_Service.Update(ref member);

                                var mp = mpesa.b2c(r);

                                logs.LogEntryOnFile(mp.ResponseStatus.ToString());
                                if (mp.ResponseStatus == HttpStatusCode.OK)
                                {
                                    var mpr = (MpesaApi.b2cresponse)mp.Content;
                                    m.Account_No_2 = mpr.ConversationID;
                                    m.Status = MobileTransactions.Status.Sending_Money;
                                    m.StatusSpecified = true;
                                }
                                else
                                {
                                    member.Comment1 = (mp.ResponseDescription.Length > 50 ? mp.ResponseDescription.Substring(0, 50) : mp.ResponseDescription);
                                    member.Sending_Mpesa = false;
                                    member.Sending_MpesaSpecified = true;

                                    var ccc = (MpesaApi.b2cresponse)mp.Content;

                                    logs.LogEntryOnFile(ccc.errorMessage);
                                    m.Comments = ccc.errorMessage;
                                    m.Status = MobileTransactions.Status.Failed;
                                    m.StatusSpecified = true;
                                }
  }
                            else {
                              
                                member.Sending_Mpesa = false;
                                member.Sending_MpesaSpecified = true;


                                logs.LogEntryOnFile("Insufficient funds");
                                m.Comments = "Insufficient funds";
                                m.Status = MobileTransactions.Status.Failed;
                                m.StatusSpecified = true;
                            }
                                nav.Members_Service.Update(ref member);
                                nav.Transactions_Service.Update(ref m);
                          
                        }
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

        private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav )
        {
            var client = new RestClient("https://trimline.co.ke:4001");
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
            try
            {
                Sendsms.Sms ss = new Sendsms.Sms();
               
                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 1000);
                if (sms != null) 
                logs.LogEntryOnFile($" No Of Sms {sms.Length}");
                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        var request = new RestRequest("/api/sendsms", Method.Post);
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
                           
                            if (response.StatusCode == HttpStatusCode.OK)
                            {
                                var res = response.Data;
                                if (res.Code == 0)
                                {
                                    s.Sent_To_Server = Sms.Sent_To_Server.Yes;
                                    s.Sent_To_ServerSpecified = true;
                                    s.Date_Sent_to_Server = DateTime.Now.Date;
                                    s.Date_Sent_to_ServerSpecified = true;
                                    s.Time_Sent_To_Server = DateTime.Now;
                                    s.Time_Sent_To_ServerSpecified = true;
                                    s.Bulk_SMS_Balance = (decimal)res.Contents.Balance;// Convert.ToDecimal(res[1]);
                                }
                                else
                                {
                                    s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                                    s.Sent_To_ServerSpecified = true;
                                    s.Date_Sent_to_Server = DateTime.Now.Date;
                                    s.Date_Sent_to_ServerSpecified = true;
                                    s.Time_Sent_To_Server = DateTime.Now;
                                    s.Time_Sent_To_ServerSpecified = true;
                                    s.Comments = res.Desc;// (res[1]);
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
