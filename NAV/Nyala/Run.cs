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

        private void loadsettings(settings.NAV ss,ref nav nav)
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
        private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav )
        {
            var client = new RestClient("https://5.189.167.52:4001");
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
            try
            {              

                logs.LogEntryOnFile(nav.Sservice.Url);

                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 10000);

                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        var request = new RestRequest("/api/sendsms", Method.POST);
                        request.AddHeader("Content-Type", "application/json");
                        if (!string.IsNullOrEmpty(s.Telephone_No))
                        {
                            logs.LogEntryOnFile(string.Format("{0}", s.Entry_No));
                            
                            BulkSm bulk = new BulkSm()
                            {
                                Source_Id = s.Entry_No.ToString(),
                                Phone = s.Telephone_No,
                                Message = s.SMS_Message.Replace(@"\n", Environment.NewLine),
                                Client = sss.client
                            };
                            request.AddJsonBody(bulk);

                            var response = client.Execute<Logging.Results<BulkSm>>(request);


                            //string r = ss.Sendsms(s.Entry_No.ToString(), s.Telephone_No, s.SMS_Message.Replace(@"\n", Environment.NewLine), sss.client);

                            //string[] res = r.Split(new char[] { '|' });
                            logs.LogEntryOnFile(Newtonsoft.Json.JsonConvert.SerializeObject( response));

                            if (response.StatusCode == HttpStatusCode.OK)
                            {

                                var res =Newtonsoft.Json.JsonConvert.DeserializeObject < Logging.Results < BulkSm >>( response.Content);
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
