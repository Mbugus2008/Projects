using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Kps_Sms
{
    public class sms
    {
        private string url;
        [JsonProperty(PropertyName = "field2")]
        public string phone { set; get; }
        [JsonProperty(PropertyName = "field3")]
        public string Text { set; get; }
        [JsonProperty(PropertyName = "field32")]
        public string source { set; get; }
        [JsonProperty(PropertyName = "field37")]
        public string reference { set; get; }
        [JsonProperty(PropertyName = "field39")]
        public string code { set; get; }
        [JsonProperty(PropertyName = "field48")]
        public string desc { set; get; }
        [JsonProperty(PropertyName = "field54")]
        public string Trace { set; get; }

        public string logfolderpath { set; get; }


        public sms(string url)
        {
            this.url = url;


        }
        public sms send(sms sms)
        {

            var client = new RestClient();
            var request = new RestRequest(this.url, Method.POST);
            request.RequestFormat = DataFormat.Json;
            {

                request.AddJsonBody(
                     new
                     {
                         field2 =string.Format("+254{0}", sms.phone.Substring(sms.phone.Length-9)),
                         field3 = sms.Text,
                         field32 = sms.source,
                         field37 = sms.reference

                     });
                var body = request.Parameters.FirstOrDefault(p => p.Type == ParameterType.RequestBody);
                if (body != null)
                {
                    if (!string.IsNullOrEmpty(sms.logfolderpath))
                    {
                        Logging.Logging.logpath = sms.logfolderpath;
                        Logging.Logging.LogEntryOnFile(body.Value.ToString());
                    }
                }

                IRestResponse response = client.Execute(request);
                if (!string.IsNullOrEmpty(sms.logfolderpath))
                {
                    Logging.Logging.logpath = sms.logfolderpath;
                    Logging.Logging.LogEntryOnFile(response.Content.ToString());
                }
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    return JsonConvert.DeserializeObject<sms>(response.Content);
                }
                else
                {
                    sms.code = response.StatusCode.ToString();
                    sms.desc = response.ErrorMessage;
                    sms.Trace = response.ErrorMessage;
                    return sms;
                }

            }

        }
    }
}
