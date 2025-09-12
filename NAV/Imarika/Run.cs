using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Ports;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Xml;
using System.Xml.Linq;

namespace RunCodunit
{
    class RunThem
    {
        public class nav
        {
            public Sms.Sms_Service Sservice = new Sms.Sms_Service();
            public mbranch.MBranch mbranch = new mbranch.MBranch();
            public Transactions.Transactions_Service Transactions = new Transactions.Transactions_Service();
            public  System.Net.NetworkCredential cd;
            public Iprs.Iprs_Service Iprs_Service = new Iprs.Iprs_Service();
            public Iprs_Endpoint.ServiceIPRSClient IPRSClient = new Iprs_Endpoint.ServiceIPRSClient();
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

            nav.Transactions.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transactions", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Transactions.PreAuthenticate = true;
            nav.Transactions.Credentials = (ICredentials)nav.cd;
            
            nav.Iprs_Service.Url = Uri.EscapeUriString(String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Iprs", ss.Serverip, ss.Companyname,
            ss.Instance, ss.Port));
            nav.Iprs_Service.PreAuthenticate = true;
            nav.Iprs_Service.Credentials = (ICredentials)nav.cd;
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
                        iprs(logs, ss, ref nav);
                        // sendsms(logs,ss, ref nav);
                        //nav.mbranch.Post();
                        //copydocs(logs,ss,ref nav);
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
                sms_Inforbip.sms smses = new sms_Inforbip.sms();
                
                smses.apikey = "7bc91240600e8c6574dae6f75e84e25d-17cd33df-b26b-4402-9cb2-aaa1d59c8356";
               sms_Inforbip.sms.m mm = new sms_Inforbip.sms.m(); 
                
                var sms = nav.Sservice.ReadMultiple(new Sms.Sms_Filter[] { new Sms.Sms_Filter { Criteria = "No", Field = Sms.Sms_Fields.Sent } }, null, 1000);
              
                foreach (var ssave in sms)
                {
                    var s = ssave;
                    try
                    {
                        if (!string.IsNullOrEmpty(s.Telephone_No))
                        {
                                List<sms_Inforbip.sms.Message> ms = new List<sms_Inforbip.sms.Message>();
                                sms_Inforbip.sms.Message m = new sms_Inforbip.sms.Message();
                                m.from = "KimisituINF";// "KIMISITU";
                                m.text = s.SMS_Message; 
                                List<sms_Inforbip.sms.Destination> destinations = new List<sms_Inforbip.sms.Destination>();
                                sms_Inforbip.sms.Destination destination = new sms_Inforbip.sms.Destination();
                                destination.to = "254" + s.Telephone_No.Substring(s.Telephone_No.Length - 9);// "254710563359";
                                destinations.Add(destination);
                           
                                m.destinations = destinations;
                                ms.Add(m);
                                mm.messages = ms;
                                smses.messages = mm;
                                var r = smses.sendsms(smses);

                            if (r.messages != null)
                            {
                                s.Sent =Sms.Sent.Yes;
                                s.SentSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                               
                                
                                
                                //s.Bulk_SMS_Balance = Convert.ToDecimal(res[1]);
                            }
                            else
                            {
                                s.Sent = Sms.Sent.Failed;
                                s.SentSpecified = true;
                                s.Date_Sent_to_Server = DateTime.Now.Date;
                                s.Date_Sent_to_ServerSpecified = true;
                              
                                s.Comments = r.requestError.serviceException.text;
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
        private void iprs(Logging.logs logs, settings.NAV sss, ref nav nav)
        {

            try
            {
                nav.IPRSClient.Endpoint.Address = new EndpointAddress(sss.iprs_url);
                var iprs = nav.Iprs_Service.ReadMultiple(new Iprs.Iprs_Filter[] { new Iprs.Iprs_Filter { Criteria = "No", Field = Iprs.Iprs_Fields.Processed } }, null, 1000);

                foreach (var ssave in iprs)
                {
                    var s = ssave;
                    try
                    {
                        if (!string.IsNullOrEmpty(s.ID_Number))
                        {
                            var idinfo = nav.IPRSClient.GetDataByIdCard(sss.iprs_username, sss.iprs_password, s.ID_Number, "");

                            if (idinfo.ErrorOcurred == false)
                            {

                                s.Citizenship = idinfo.Citizenship;
                                s.Clan = idinfo.Clan;
                                s.Date_of_Birth = idinfo.Date_of_Birth;
                                s.Date_of_Death = idinfo.Date_of_Death;
                                s.Ethnic_Group = idinfo.Ethnic_Group;
                                s.Family = idinfo.Family;

                                s.First_Name = idinfo.First_Name;
                                s.Gender = idinfo.Gender;
                              
                                s.Occupation = idinfo.Occupation;
                                s.Other_Name = idinfo.Other_Name;

                                s.Pin = idinfo.Pin;
                                s.Place_of_Birth = idinfo.Place_of_Birth;
                                s.Place_of_Death = idinfo.Place_of_Death;
                                s.Place_of_Live = idinfo.Place_of_Live;

                                s.Surname = idinfo.Surname;

                                s.Processed = true;
                                s.ProcessedSpecified = true;
                                s.Comments = "";





                            }
                            else
                            {
                                s.Processed = true;
                                s.ProcessedSpecified = true;
                                s.Comments = idinfo.ErrorMessage;

                            }
                        }
                        else
                        {
                            s.Comments = "Id missing";
                            s.Processed = true;
                            s.ProcessedSpecified = true;
                        }
                        nav.Iprs_Service.Update(ref s);
                    }
                    catch (Exception ex)
                    {
                        try
                        {
                            logs.ReportError(ex);
                            s.Comments = ex.Message.Substring(0, (ex.Message.Length > 200 ? 200 : ex.Message.Length));
                            nav.Iprs_Service.Update(ref s);

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
 private void copydocs(Logging.logs logs, settings.NAV sss, ref nav nav)
        {
            if (System.IO.Directory.Exists(sss.dms_source_path))
            {
                string[] files = System.IO.Directory.GetFiles(sss.dms_source_path);
                string fileName = "";

                if (sss.dms_destination_path == string.Empty || System.IO.Directory.Exists(sss.dms_destination_path) == false)
                {
                    logs.LogEntryOnFile("Invalid file Destination");
                    return;
                }

                // Use Path class to manipulate file and directory paths.

               
                // Copy the files and overwrite destination files if they already exist.
                foreach (string s in files)
                {
                    try
                    {
                        // Use static Path methods to extract only the file name from the path.
                        fileName = System.IO.Path.GetFileName(s);
                        string[] names = fileName.Split(new char[] { '-' });
                        string[] doctype = names[1].Split(new char[] { '.' });
                        var trns = nav.Transactions.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = names[0], Field = Transactions.Transactions_Fields.Document_No } }, null, 0).FirstOrDefault();
                        if (trns != null)
                        {
                            if (trns.Loan_application_No >0)
                            {
                              

                                XDocument doc = new XDocument(new XElement("root",
        new XElement("document",
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "ID NUMBER"), new XAttribute("value", trns.Id_No)),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "MEMBER NAME"), new XAttribute("value", trns.Account_Name)),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "MOBILE NUMBER"), new XAttribute("value", trns.Telephone_Number)),
        new XElement("field", new XAttribute("level", "document"), new XAttribute("name", "DOCUMENT_TYPE"), new XAttribute("value", "Loan Application Form")),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "LOAN TYPE"), new XAttribute("value", trns.Loan_Type.ToString())),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "LOAN AMOUNT"), new XAttribute("value", trns.Amount)),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "EMAIL"), new XAttribute("value", "")),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "MEMBER NUMBER"), new XAttribute("value", trns.Member_No ?? "")),
        new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "LOAN NUMBER"), new XAttribute("value", trns.Loan_No ?? ""))
                                                          )));
                             
                                var destfilename = System.IO.Path.Combine(sss.dms_destination_path, String.Join("", trns.Member_No, "_", trns.Loan_application_No, "_", doctype[0], ".xml"));
                                logs.LogEntryOnFile(destfilename);
                                doc.Save(destfilename);

                              

                                var destfilenamedoc = System.IO.Path.Combine(sss.dms_destination_path, String.Join("", trns.Member_No, "_", trns.Loan_application_No,"_",names[1]));
                                logs.LogEntryOnFile(destfilenamedoc);
                                System.IO.File.Move(s, destfilenamedoc); 
                                nav.mbranch.AttachDocuments(trns.Loan_application_No.ToString(), destfilenamedoc, doctype[1], trns.Description);
                            }
                        }
                        else
                            logs.LogEntryOnFile(String.Join(" ", "Loan Request Not Found", names[0]));
                    }
                    catch (Exception ex) { 
                    logs.ReportError(ex);
                    }
                    }
            }
            else
            {
                logs.LogEntryOnFile("Source path does not exist!");
            }

        }
    }
}
