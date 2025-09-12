using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace CRB
{
    public class CRB
    {
        RestClient client;
        public string Public_key { get; set; }
        public string Private_key { get; set; }
       
        
        public CRB(string port,string version,string public_key,string private_key)
        {
            Public_key = public_key;
            Private_key = private_key;
          client = new RestClient(string.Format("https://api.metropol.co.ke:{0}/{1}",port,version));
        }

        public Identity_Verification get_identity(identity id)
        {
            Identity_Verification iv = null;

            var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmssfff");

            var request = new RestRequest("identity/verify", Method.POST);

            var b = JsonConvert.SerializeObject(id);

            string hash = string.Format("{0}{1}{2}{3}",Private_key, b,Public_key, timestamp);


            request.AddHeader("X-METROPOL-REST-API-KEY", Public_key);
            request.AddHeader("X-METROPOL-REST-API-TIMESTAMP", timestamp);
            request.AddHeader("X-METROPOL-REST-API-HASH", ComputeSha256Hash(hash));
            request.AddJsonBody(id);

            IRestResponse response = client.Execute(request);
            iv = JsonConvert.DeserializeObject<Identity_Verification>(response.Content);
            //if (response.StatusCode == HttpStatusCode.OK)
            //{ }

            return iv;
        }   
        public Delinquency_Status get_Delinquency(delinquency id)
        {
            Delinquency_Status iv = null;
            var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmssfff");
            var request = new RestRequest("delinquency/status", Method.POST);
            var b = JsonConvert.SerializeObject(id);
            string hash = string.Format("{0}{1}{2}{3}",Private_key, b,Public_key, timestamp);
            request.AddHeader("X-METROPOL-REST-API-KEY", Public_key);
            request.AddHeader("X-METROPOL-REST-API-TIMESTAMP", timestamp);
            request.AddHeader("X-METROPOL-REST-API-HASH", ComputeSha256Hash(hash));
            request.AddJsonBody(id);

            IRestResponse response = client.Execute(request);
            iv = JsonConvert.DeserializeObject<Delinquency_Status>(response.Content);
            //if (response.StatusCode == HttpStatusCode.OK)
            //{ }

            return iv;
        }
        public Delinquency_Status get_jsonreport(delinquency id)
        {
            Delinquency_Status iv = null;

            var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmssfff");

            var request = new RestRequest("delinquency/status", Method.POST);

            var b = JsonConvert.SerializeObject(id);

            string hash = string.Format("{0}{1}{2}{3}",Private_key, b,Public_key, timestamp);


            request.AddHeader("X-METROPOL-REST-API-KEY", Public_key);
            request.AddHeader("X-METROPOL-REST-API-TIMESTAMP", timestamp);
            request.AddHeader("X-METROPOL-REST-API-HASH", ComputeSha256Hash(hash));

            request.AddJsonBody(id);

            IRestResponse response = client.Execute(request);
            iv = JsonConvert.DeserializeObject<Delinquency_Status>(response.Content);
            //if (response.StatusCode == HttpStatusCode.OK)
            //{ }

            return iv;
        }
        public Metro_score get_metroscore(identity id)
        {
            Metro_score iv = null;

            var timestamp = DateTime.UtcNow.ToString("yyyyMMddHHmmssfff");

            var request = new RestRequest("score/consumer", Method.POST);

            var b = JsonConvert.SerializeObject(id);

            string hash = string.Format("{0}{1}{2}{3}", Private_key, b, Public_key, timestamp);


            request.AddHeader("X-METROPOL-REST-API-KEY", Public_key);
            request.AddHeader("X-METROPOL-REST-API-TIMESTAMP", timestamp);
            request.AddHeader("X-METROPOL-REST-API-HASH", ComputeSha256Hash(hash));

            request.AddJsonBody(id);

            IRestResponse response = client.Execute(request);
            iv = JsonConvert.DeserializeObject<Metro_score>(response.Content);
            iv.res = response.Content;

            return iv;
        }
        static string ComputeSha256Hash(string rawData)
        {
            // Create a SHA256   
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(rawData));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
    public class identity
    {
        public int report_type { get; set; }
        
        public string identity_number { get; set; }
        public string identity_type { get; set; }

    } 
    public class delinquency
    {
        public int report_type { get; set; }
        public int loan_amount { get; set; }
        public string identity_number { get; set; }
        public string identity_type { get; set; }

    }
public class JSON_Report
    {
        public int report_type { get; set; }
        public int loan_amount { get; set; }
        public string identity_number { get; set; }
        public string identity_type { get; set; }

    }
    public class response
    {
  public string api_code { get; set; }
        public string api_code_description { get; set; }
public bool has_error { get; set; }

    }
    public class Identity_Verification:response
    {
      
        public string citizenship { get; set; }
        public string clan { get; set; }
        public string date_of_birth { get; set; }
        public string date_of_death { get; set; }
        public string date_of_issue { get; set; }
        public string dob { get; set; }
        public string error { get; set; }
        public string error_message { get; set; }
        public string ethnic_group { get; set; }
        public string family { get; set; }
        public string fingerprint { get; set; }
        public string first_name { get; set; }
        public string gender { get; set; }
        
        public string id_number { get; set; }
        public string identity_number { get; set; }
        public string identity_type { get; set; }
        public int identity_type_id { get; set; }
        public string ipaddress { get; set; }
        public string last_name { get; set; }
        public string occupation { get; set; }
        public string other_name { get; set; }
        public string photo { get; set; }
        public string pin { get; set; }
        public string place_of_birth { get; set; }
        public string place_of_death { get; set; }
        public string place_of_live { get; set; }
        public string regoffice { get; set; }
        public string serial_number { get; set; }
        public string signature { get; set; }
        public bool success { get; set; }
        public string surname { get; set; }
        public string trx_id { get; set; }

    }
    public class Delinquency_Status:response
    {
       
        public string delinquency_code { get; set; }
        public string delinquency_summary { get; set; }
       
        public string identity_number { get; set; }
        public string identity_type { get; set; }
        public int loan_amount { get; set; }
        public string trx_id { get; set; }

    }

    public class Metro_score:response
    {
        public string identity_number { get; set; }
        public string identity_type { get; set; }
        public double credit_score { get; set; }
        public string as_at { get; set; }
        public string res { get; set; }

    }
}
