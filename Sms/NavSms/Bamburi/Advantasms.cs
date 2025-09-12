using Logging;
using RestSharp;
using RestSharp.Serializers.NewtonsoftJson;
using System;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace RunCodunit
{
    public class Advantasms : Ismsrepository
    {

        public Results<BulkSm> sendsms(ref BulkSm sms)
        {

            var client = new RestClient(
    configureSerialization: s => s.UseNewtonsoftJson());

            ServicePointManager.ServerCertificateValidationCallback = (obj, certificate, chain, errors) => true;

            var request = new RestRequest("https://quicksms.advantasms.com/api/services/sendsms", Method.Post);

            request.AddHeader("Content-Type", "application/json");

            advanta advanta = new advanta() { apikey = sms.Apikey, message = sms.Message, mobile = sms.Phone, partnerID = sms.partnerID, shortcode = sms.Client };

            request.AddJsonBody(advanta);

            var response = client.Execute<Advanta_Response>(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                if (response.Data.responses[0].resposecode == 200)
                    return new Results<BulkSm>() { Code = 0 };
                else return new Results<BulkSm>() { Code = -1, Desc = response.Data.responses[0].responsedescription };
            }
            else
                return new Results<BulkSm>() { Code = -1, Desc = response.StatusDescription };
        }
    }
}
