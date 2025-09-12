using System;
using System.Linq;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using System.Security;
using System.Net.Security;
using System.Net;
using System.Web;
using System.IO;
using RestSharp;

namespace AGENCY
{
    public class Sms 
    {

        RestClient client = new RestClient("https://5.189.167.52:4001");
        public String Telephone = null;
        public String Text = null;
        public string Results;

        public Sms Send(Sms sms)
        {
            ServicePointManager.ServerCertificateValidationCallback = (object obj, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) => (true);

            var request = new RestRequest("/api/sendsms", Method.Post);
            request.AddHeader("Content-Type", "application/json");

            BulkSm bulk = new BulkSm()
            {
                Source_Id = (DateTime.Now.Millisecond * 10000).ToString(),
                Phone = "254" + sms.Telephone.Substring(sms.Telephone.Length - 9),
                Message = sms.Text,
                Client = "10000"
            };
            request.AddJsonBody(bulk);

            var response = client.Execute<Results<BulkSm>>(request);


            //string r = ss.Sendsms(s.Entry_No.ToString(), s.Telephone_No, s.SMS_Message.Replace(@"\n", Environment.NewLine), sss.client);



            //string[] res = r.Split(new char[] { '|' });
            if (response.StatusCode == HttpStatusCode.OK)
            {
                var res = response.Data;
                if (res.Code == 0)
                {
                    
                }
            } 

           //         Smsservice.Service1 send = new Smsservice.Service1();
           // Smsservice.sms s = new Smsservice.sms();
           // s.client = "10000";
           // s.phone = "254" + sms.Telephone.Substring(sms.Telephone.Length - 9);
           // s.text = sms.Text;
           // s.Sourceid = (DateTime.Now.Millisecond * 10000).ToString();
           //s= send.Sendsms(s);
            
           // CUtilities.LogEntryOnFile(s.results.code.ToString());
           // CUtilities.LogEntryOnFile(s.results.Description);
            return sms;
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
    public partial class Results
    {
        public int Code { set; get; } = 0;
        public string Desc { set; get; } = "Successful";
        public object content { set; get; } = null;
    }

    public partial class Results<T>
    {
        /// <inheritdoc/>
        /// <summary>
        /// O = successfull
        /// -1 = Unsucessful
        /// </summary>
        public int Code { set; get; } = 0;

        /// <inheritdoc/>
        /// <summary>
        /// Error Description if code is -1
        /// </summary>
        public string Desc { set; get; } = "Successful";
        public T Contents { get; set; }
    }
}
