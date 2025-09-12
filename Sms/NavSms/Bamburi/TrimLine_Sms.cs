using RestSharp;
using System;
using System.Linq;
using System.Net;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;

namespace RunCodunit
{
    public class TrimLine_Sms : Ismsrepository
    {

        public Logging.Results<BulkSm> sendsms(ref BulkSm sms)
        {
            var client = new RestClient("https://5.189.167.52:4001");
            ServicePointManager.ServerCertificateValidationCallback = (obj, certificate, chain, errors) => true;
            var request = new RestRequest("/api/sendsms", Method.Post);
            request.AddHeader("Content-Type", "application/json");
            request.AddJsonBody(sms);

            var response = client.Execute<Logging.Results<BulkSm>>(request);
            if (response.StatusCode == HttpStatusCode.OK)
            {
                return response.Data;
            }
            else
                return new Logging.Results<BulkSm>() { Code = -1, Desc = response.StatusDescription };
        }
    }
}
