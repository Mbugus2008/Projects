

using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

namespace sms_Inforbip
{
    public class sms
    {
        public class m
        {
            public List<Message> messages { get; set; }
        }
       
        public string apikey { get; set; }
      public m messages { get; set; }
        public Res sendsms(sms s)
        {

        

            var client = new RestClient("https://46y86.api.infobip.com/sms/2/text/advanced");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("Authorization", "App " + s.apikey);
            request.AddHeader("Content-Type", "application/json");
            request.AddHeader("Accept", "application/json");
            string rowadata = new JavaScriptSerializer().Serialize(s.messages);
                        
            request.AddJsonBody(rowadata);
          
            IRestResponse response = client.Execute(request);
            Res r = new JavaScriptSerializer().Deserialize<Res>(response.Content);

            return r;
        }

     
        public class Destination
        {
            public string to { get; set; }
        }

        public class Message
        {
            public string from { get; set; }
            public List<Destination> destinations { get; set; }
            public string text { get; set; }
        }

       

    }
}
