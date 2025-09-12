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
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
            try
            {
                
                Africanstalking.sms afs = new Africanstalking.sms();
                afs.from = sss.sms_from;// "mwiruafcs";
                afs.username = sss.sms_username;// "mwiruasms";
                afs.apiKey = sss.sms_apikey;// "f48d70203a953178e7b7da9a6f3f48f4f402f19af5dead034f919082763bdf66";
             

                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent_To_Server } }, null, 1000);
              
                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        if (!string.IsNullOrEmpty(s.Telephone_No) && (s.Telephone_No.Length>=9))
                        {
                            afs.recipients = "+254"+ s.Telephone_No.Substring(s.Telephone_No.Length - 9); //"+254710563359";
                            afs.message = s.SMS_Message;

                            afs = afs.send(afs);
                            if (afs.status == "Success")
                            {
                                s.Sent_To_Server = Sms.Sent_To_Server.Yes;
                                s.Sent_To_ServerSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Bulk_SMS_Balance =(decimal) afs.cost;
                                s.Bulk_SMS_BalanceSpecified = true;
                                s.Comments = "";

                            }
    else if (afs.status == "InsufficientBalance")
                            {
                               // s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                              //  s.Sent_To_ServerSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Comments = afs.status;
                            }
                            else
                            {
                                s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                                s.Sent_To_ServerSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Comments = afs.status;
                            }
                        }
                        else
                        {
                            s.Sent_To_Server = Sms.Sent_To_Server.Failed;
                            s.Sent_To_ServerSpecified = true;
                            s.Date_Sent_to_Server = DateTime.Now.Date;
                            s.Date_Sent_to_ServerSpecified = true;
                          
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
}
