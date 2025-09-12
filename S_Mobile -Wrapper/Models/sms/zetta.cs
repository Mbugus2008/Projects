using Newtonsoft.Json;
using RestSharp;
using S_Mobile.Models.sms;
using System;
using System.Net;

namespace S_Mobile.Models
{
    public class zetta : Ismsrepository
    {
        private RestClient client;

        public Logging.Results sendsms(ref BulkSm s)
        {
            ServicePointManager.ServerCertificateValidationCallback = (sender, certificate, chain, errors) => true;
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;

            Logging.Results results = new Logging.Results();
            var options = new RestClientOptions("https://portal.zettatel.com")
            {
                MaxTimeout = -1,
            };
            client = new RestClient(options);
            var request = new RestRequest("/SMSApi/send", Method.Post);

            request.AlwaysMultipartFormData = true;
            request.AddParameter("userid", "Paul");
            request.AddParameter("password", "FS0fcs6v");
            request.AddParameter("mobile", s.Phone);
            request.AddParameter("senderid", s.Client);
            request.AddParameter("msg", s.Message_to_send);
            request.AddParameter("sendMethod", "quick");
            request.AddParameter("msgType", "text");
            request.AddParameter("output", "json");
            request.AddParameter("duplicatecheck", "false");

            var response = client.Execute(request);
            //var response = client.Execute<zettaresponse>(request);

            Logging.Logging.LogEntryOnFile(response.Content.ToString());
            //Logging.Logging.LogEntryOnFile(response.Data.ToString());

            if (response.StatusCode == HttpStatusCode.OK)
            {
                var content = response.Content;
                var res = JsonConvert.DeserializeObject<zettaresponse>(content);

                // Logging.Logging.LogEntryOnFile(res.ToString());
                //{"status":"success","mobile":"254720905798","invalidMobile":"","transactionId":"6509661746837016106","statusCode":"200","reason":"success","msgId":""}

                if (res.statusCode == 200)
                {
                    s.Status = 1;
                    s.Trace = res.statusCode.ToString();
                    s.Destination_Id = res.transactionId;
                    s.Datetime_Sent = DateTime.Now;
                }
                else
                {
                    s.Comments = res.reason;
                    s.Trace = res.statusCode.ToString();
                }
                // process the new customer
            }
            else
            {
                s.Comments = response.ErrorException.Message;
                Logging.Logging.ReportError(response.ErrorException);
            }

            return results;
        }
    }
}