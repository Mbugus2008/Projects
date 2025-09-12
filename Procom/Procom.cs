using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Procom
{
    public class Procom
    {
        public string Basicurl { get; set; }
        public string email { get; set; }
        public string password { get; set; }
      
        public Procom(string _email, string _password) {

            this.email = _email;
            this.password = _password;
        
        }
        public Token auth()
        {
            IRestResponse response;
            Token t = new Token();
            try
            {
                var client = new RestClient("https://sms.procom.co.ke/sms/v1/get/access/token");
                var request = new RestRequest(Method.POST);
                request.AddHeader("Content-Type", "application/json");
                request.AddJsonBody(new { consumer_key = email, consumer_password = password });
                response = client.Execute(request);

                t = JsonConvert.DeserializeObject<Token>(response.Content);
            }
            catch (Exception ex)
            {

            }
            return t;
        }
        public Response sendsms(smss sms )
        {
            var a = auth();
           
            var client = new RestClient("https://sms.procom.co.ke/sms/v1/send/simple/sms");
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "Token  " + a.token);
            request.AddHeader("Content-Type", "application/json");
            request.AddParameter("undefined",  JsonConvert.SerializeObject(sms), ParameterType.RequestBody);
            IRestResponse response = client.Execute(request);
            return JsonConvert.DeserializeObject<Response>(response.Content);
        }

        public class Token
        {
            public string token_type;
            public string expires_in;
            public string token;

        }
        public class smss
        {
            public string sender_name { get; set; }
            public string phone_number { get; set; }
            public string message { get; set; }
            public string unique_identifier { get; set; }
            public string track_code { get; set; }
            public string text_message { get; set; }

        }
        public class
           Response
        {
            public string response { get; set; }
            public string response_message { get; set; }
            public string message_id { get; set; }
            public double credit_balance { get; set; }
            public smss text_message { get; set; }
            



        }
    }
}
