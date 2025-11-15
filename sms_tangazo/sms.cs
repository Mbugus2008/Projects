using RestSharp;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Authentication;
using System.Text;
using System.Threading.Tasks;

namespace sms_tangazo
{

    public class sms:Logging.Results
    {
        public string User_ID { get; set; }
        public string passkey { get; set; }
        public string service { get; set; }
        public string Phone { get; set; }
        public string Sender { get; set; }
        public string Message { get; set; }
        public string Type { get; set; }
        private static RestClient restClient = new RestClient("https://api.prsp.tangazoletu.com");


        public sms(string logpath) {
                System.Net.ServicePointManager.ServerCertificateValidationCallback +=
(se, cert, chain, sslerror) =>
{
return true;
};
            Logging.Logging.logpath = logpath;
        }
        public sms send (sms s)
        {
            try
            {
                ServicePointManager.Expect100Continue = true;
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;


                //ServicePointManager.Expect100Continue = true;
                //ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                restClient = new RestClient("https://api.prsp.tangazoletu.com")
                {
                    RemoteCertificateValidationCallback = (sender, certificate, chain, sslPolicyErrors) => true
                };
                RestRequest rr = new RestRequest( Method.GET);
                //https://api.prsp.tangazoletu.com/?User_ID=1359&passkey=391ELT5DWW&service=1&sender=IMARIKA
                //&dest=254724367745&msg=Imarika bulk sms api test message&type=Notification

                rr.AddParameter("User_ID", s.User_ID);
                rr.AddParameter("passkey", s.passkey);
                rr.AddParameter("service", s.service);
                rr.AddParameter("sender", s.Sender);
                rr.AddParameter("dest", s.Phone);
                rr.AddParameter("msg", s.Message);
                rr.AddParameter("type", s.Type);

                Logging.Logging.LogEntryOnFile("Sending message");
                Logging.Logging.LogEntryOnFile(s.Phone);
                IRestResponse response = restClient.Execute(rr);
  Logging.Logging.LogEntryOnFile(response.ToString());
               
                if (response.IsSuccessful)
                {
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        Logging.Logging.LogEntryOnFile(response.Content.ToString());
                        String[] d = response.Content.ToString().Split(new char[] { '|' });
                        if (d[1].Equals("Success"))
                        {
                            s.Code = 0;
                        }
                        else
                        {
                            s.Code = -1;
                            s.Desc = "Unable to send sms";
                        }
                    }
                }
                else
                {
                    Logging.Logging.LogEntryOnFile(response.Content.ToString());
                    s.Code = -1;
                    s.Desc = response.ErrorMessage;
                }
            }
            catch ( Exception ex)
            {
                s.Code = -1;
                s.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
                
            }
            return s;
        }
    }
}
