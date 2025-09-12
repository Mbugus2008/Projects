using Newtonsoft.Json;
using PData.Member;
using RestSharp;
using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading;


namespace RunCodunit
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public mbranch.MBranch mbranch = new mbranch.MBranch();
            public MobileTransactions.MobileTransactions_Service mservice ;
            public Members.Members_Service Members_Service ;
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

            nav.mbranch.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/MBranch", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.mbranch.PreAuthenticate = true;
            nav.mbranch.Credentials = (ICredentials)nav.cd;
            
            nav.mservice.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/MobileTransactions", ss.Serverip, ss.Companyname,
                  ss.Instance, ss.Port));
            nav.mservice.PreAuthenticate = true;
            nav.mservice.Credentials = (ICredentials)nav.cd;

            nav.Members_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Members", ss.Serverip, ss.Companyname,
                            ss.Instance, ss.Port));
            nav.Members_Service.PreAuthenticate = true;
            nav.Members_Service.Credentials = (ICredentials)nav.cd;
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
                        
                        sendsms(logs,ss, ref nav);
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
        private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav)
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

                var members = nav.Members_Service.ReadMultiple(new  Members.Members_Filter[] { new Members.Members_Filter { Criteria = ">0", Field =  Members.Members_Fields.Mobile_Money }, new Members.Members_Filter { Criteria = "No", Field = Members.Members_Fields.Sending_Mpesa } }, null, 0);

                if (members != null)
                    logs.LogEntryOnFile($" No Of disbursements {members.Length}");
                foreach (var mm in members)
                {
                    try
                    {
                        var m = mm;
                        MpesaApi.b2c r = new MpesaApi.b2c();
                        r.InitiatorName = c.initiator;
                        r.SecurityCredential = "ZOT1H7EXmjqkuXA0BhGzacQgfrZkzcIVQSvOXtNZ2Tpk44XbZeFzdOOFelQZUPa8aX6BCLdnZsi4XYFpfN2Hu90c1MxXO89xx+pkY3ZnSyz2GmpdtK8BFcijZa9miyvWbvQr9D1fTBHWLZ6HAY/QzT3cwCQdX494UiV6/LntxeoAdBh+05ocjWHH0JphjhsU4qVZnifphsQaWK8C3Ii0a8nbPLFfdpvwtYmT/bI8XPOhGb7iDvPPTNOXApnPjEgo1WxiDeHMcaEuLlNtSmatsh2U10QOYrmJARf2CfIrXG6Hc+30Xtr++VvMObQgX/4Ky4l+zGwS03tYoeRZHYoB0Q==";
                        r.CommandID = "BusinessPayment";
                        r.Amount = (double)m.Mobile_Money;
                        r.PartyA = "598394";
                        var phone = m.Mobile_Phone_No.Replace(" ", "");
                        r.PartyB = string.Format("254{0}", phone.Substring(phone.Length - 9));
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
                        tr.Mobile_No = m.Mobile_Phone_No;
                        tr.Description = "Mobile Money";
                        tr.Source = MobileTransactions.Source.Mbaraka;
                        tr.SourceSpecified = true;
                        tr.Document_No = DateTime.Now.Ticks.ToString();
                        tr.Amount = m.Mobile_Money;
                        tr.Name = m.Name;
                        tr.Transaction_Type = "Withdrawal";
                      
                        tr.AmountSpecified = true;
                        tr.Status = MobileTransactions.Status.Pending_Posting;
                        tr.StatusSpecified = false;

                        nav.mservice.Create(ref tr);

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

                            m.Comment1 = (mp.ResponseDescription.Length > 50 ? mp.ResponseDescription.Substring(0, 50) : mp.ResponseDescription);
                            m.Sending_Mpesa = false;
                            m.Sending_MpesaSpecified = true;

                            var ccc = (MpesaApi.b2cresponse)mp.Content;

                            logs.LogEntryOnFile(ccc.errorMessage);
                            tr.Comments = ccc.errorMessage;
                            tr.Status = MobileTransactions.Status.Failed;
                            tr.StatusSpecified = true;
                        }

                        nav.Members_Service.Update(ref m);
                        nav.mservice.Update(ref tr);
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
