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
                        
                        sendsmsafs(logs,ss, ref nav);
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
      
        private void sendsmsafs(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
            try
            {

                Africanstalking.sms afs = new Africanstalking.sms();
                afs.from = "MAGEREZA";
                afs.username = "MAGEREZAMOBILE";
                afs.apiKey = "a0643aad84614c70f05a985444e948aa1e9f427ef6f0f601830f20ee5fd56c58";


                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent } }, null, 1000);

                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        if (!string.IsNullOrEmpty(s.Telephone_No) && (s.Telephone_No.Length >= 9))
                        {
                            afs.recipients = "+254" + s.Telephone_No.Substring(s.Telephone_No.Length - 9); //"+254710563359";
                            afs.message = s.SMS_Message;

                            afs = afs.send(afs);
                            if (afs.status == "Success")
                            {
                                s.Sent = Sms.Sent.Yes;
                                s.SentSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Bulk_SMS_Balance = (decimal)afs.cost;
                                s.Bulk_SMS_BalanceSpecified = true;


                            }
                            else
                            {
                                s.Sent = Sms.Sent.Failed;
                                s.SentSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                                s.Comments = afs.status;
                            }
                        }
                        else
                        {
                            s.Sent = Sms.Sent.Failed;
                            s.SentSpecified = true;
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
        //private void sendsms(Logging.logs logs, settings.NAV sss, ref nav nav )
        //{
        //    ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);
        //    try
        //    {
        //        sms_Inforbip.sms smses = new sms_Inforbip.sms();
                
        //        smses.apikey = "7bc91240600e8c6574dae6f75e84e25d-17cd33df-b26b-4402-9cb2-aaa1d59c8356";
        //       sms_Inforbip.sms.m mm = new sms_Inforbip.sms.m(); 
                
        //        var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent } }, null, 1000);
              
        //        foreach (var ssave in sms)
        //        {
        //            var s = ssave;
        //            try
        //            {
        //                if (!string.IsNullOrEmpty(s.Telephone_No))
        //                {
        //                        List<sms_Inforbip.sms.Message> ms = new List<sms_Inforbip.sms.Message>();
        //                        sms_Inforbip.sms.Message m = new sms_Inforbip.sms.Message();
        //                        m.from = "KimisituINF";// "KIMISITU";
        //                        m.text = s.SMS_Message; 
        //                        List<sms_Inforbip.sms.Destination> destinations = new List<sms_Inforbip.sms.Destination>();
        //                        sms_Inforbip.sms.Destination destination = new sms_Inforbip.sms.Destination();
        //                        destination.to = "254" + s.Telephone_No.Substring(s.Telephone_No.Length - 9);// "254710563359";
        //                        destinations.Add(destination);
                           
        //                        m.destinations = destinations;
        //                        ms.Add(m);
        //                        mm.messages = ms;
        //                        smses.messages = mm;
        //                        var r = smses.sendsms(smses);

        //                    if (r.messages != null)
        //                    {
        //                        s.Sent =Sms.Sent.Yes;
        //                        s.SentSpecified = true;
        //                        s.Date_Sent_to_Server = DateTime.Now.Date;
        //                        s.Date_Sent_to_ServerSpecified = true;
                               
                                
                                
        //                        //s.Bulk_SMS_Balance = Convert.ToDecimal(res[1]);
        //                    }
        //                    else
        //                    {
        //                        s.Sent = Sms.Sent.Failed;
        //                        s.SentSpecified = true;
        //                        s.Date_Sent_to_Server = DateTime.Now.Date;
        //                        s.Date_Sent_to_ServerSpecified = true;
                              
        //                        s.Comments = r.requestError.serviceException.text;
        //                    }
        //                }
        //                else
        //                {
        //                    s.Sent = Sms.Sent.Failed;
        //                    s.SentSpecified = true;
        //                    s.Date_Sent_to_Server = DateTime.Now.Date;
        //                    s.Date_Sent_to_ServerSpecified = true;
                          
        //                    s.Comments = "Invalid telephone";
        //                }
        //                nav.Sservice.Update(ref s);
        //            }
        //            catch (Exception ex)
        //            {
        //                try
        //                {
        //                    logs.ReportError(ex);
        //                    s.Comments = ex.Message.Substring(0, (ex.Message.Length > 200 ? 200 : ex.Message.Length));
        //                    nav.Sservice.Update(ref s);

        //                }
        //                catch (Exception e)
        //                { }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        logs.ReportError(ex);

        //    }


        //}

    }
}
