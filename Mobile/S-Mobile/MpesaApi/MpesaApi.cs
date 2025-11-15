using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;


namespace MpesaApi
{
    public class MpesaApi
    {
 public Auth author;
        Cust c;
        
      public MpesaApi(Cust cc)
   {
    author = auth(cc);
        }

        public Auth auth(Cust c)
        {
            Auth a = null;
            try
            {
                ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                string app_key = c.customer_key;// "trPzD8glbWrSYxUGZd0E60e6m7C5uAaj";
                string app_secret = c.customer_secret;// "aQpCLuQxsofx87YZ";
                string appKeySecret = string.Format("{0}:{1}", app_key, app_secret);
                var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(appKeySecret);
                String auth = System.Convert.ToBase64String(plainTextBytes);
                HttpWebRequest client = (HttpWebRequest)System.Net.WebRequest.Create("https://api.safaricom.co.ke/oauth/v2/generate?grant_type=client_credentials");
                client.KeepAlive = false;
                client.UserAgent = null;
                client.Headers.Add(HttpRequestHeader.Authorization, "Basic " + auth);
                client.Headers.Add(HttpRequestHeader.CacheControl, "no-cache");
                // client.ClientCertificates.Add(cert);
                client.Method = "GET";
                client.ContentType = "application/json";

                HttpWebResponse response = (HttpWebResponse)client.GetResponse();

                Stream stream = response.GetResponseStream();
                string html = string.Empty;
                using (StreamReader reader = new StreamReader(stream))
                {
                    html = reader.ReadToEnd();
                }
                a = JsonConvert.DeserializeObject<Auth>(html);
            }
            catch (WebException ex)
            {
                throw ex;
                using (WebResponse response = ex.Response)
                {
                    HttpWebResponse httpResponse = (HttpWebResponse)response;

                    using (Stream data = response.GetResponseStream())
                    {
                        string text = new StreamReader(data).ReadToEnd();
                        Httperror e = JsonConvert.DeserializeObject<Httperror>(text);

                    }
                }

            }
            return a;
        }
        public async Task<string> Register(string shortcode)
        {
            // Validate the shortcode parameter
            if (string.IsNullOrWhiteSpace(shortcode))
            {
                throw new ArgumentException("Shortcode cannot be null or empty.", nameof(shortcode));
            }

            var confirmationUrl = "https://trimline.co.ke:4001/api/confirm";
            var validationUrl = "https://trimline.co.ke:4001/api/validate";

            // Create the request body
            var body = $@"
                        {{
                            ""ShortCode"": ""{shortcode}"",
                            ""ResponseType"": ""Completed"",
                            ""ConfirmationURL"": ""{confirmationUrl}"",
                            ""ValidationURL"": ""{validationUrl}""
                        }}";

            // Create the HttpWebRequest
            var request = (HttpWebRequest)WebRequest.Create("https://api.safaricom.co.ke/mpesa/c2b/v2/registerurl");
            request.Method = "POST";
            request.ContentType = "application/json";
            request.Headers["Authorization"] = $"Bearer {author.access_token}"; // Ensure author.access_token is valid

            // Write the request body
            using (var streamWriter = new StreamWriter(await request.GetRequestStreamAsync()))
            {
                await streamWriter.WriteAsync(body);
                await streamWriter.FlushAsync();
            }

            try
            {
                // Get the response
                using (var response = (HttpWebResponse)await request.GetResponseAsync())
                {
                    using (var streamReader = new StreamReader(response.GetResponseStream()))
                    {
                        var result = await streamReader.ReadToEndAsync();
                        // Log success
                        Console.WriteLine($"Successfully registered shortcode: {shortcode}");
                        return result; // Return the response content
                    }
                }
            }
            catch (WebException ex)
            {
                // Handle web exceptions
                using (var streamReader = new StreamReader(ex.Response.GetResponseStream()))
                {
                    var errorResponse = await streamReader.ReadToEndAsync();
                    // Log error details
                    Console.WriteLine($"Error registering shortcode: {ex.Status} - {errorResponse}");
                    throw; // Rethrow the exception after logging
                }
            }
            catch (Exception ex)
            {
                // Handle other exceptions
                Console.WriteLine($"Exception occurred: {ex.Message}");
                throw; // Rethrow the exception after logging
            }
        }
        public async Task<RestResponse> Registers(string shortcode)
        {
          
            var client = new RestClient();
            var request = new RestRequest("https://api.safaricom.co.ke/mpesa/c2b/v2/registerurl", Method.Post);
            request.AddHeader("Authorization", string.Format("Bearer {0}", author.access_token));//"Bearer ZE8nAQ5Puy9sKSNqh4pwC0cgkKFT");
            request.AddHeader("Content-Type", "application/json");
            var shortCode = shortcode;
            var confirmationUrl = "https://trimline.co.ke:4001/api/confirm";
            var validationUrl = "https://trimline.co.ke:4001/api/validate";
            var body = $@"
            {{
                ""ShortCode"": ""{shortCode}"",
                ""ResponseType"": ""Completed"",
                ""ConfirmationURL"": ""{confirmationUrl}"",
                ""ValidationURL"": ""{validationUrl}""
            }}
            ";
            request.AddStringBody(body, DataFormat.Json);
            RestResponse response =  client.Execute(request);
            return response;
        }

        public stkresponse Stkpush(stkpush push)
        {
            stkresponse a = new stkresponse();
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            HttpWebRequest client = (HttpWebRequest)System.Net.WebRequest.Create("https://api.safaricom.co.ke/mpesa/stkpush/v1/processrequest");

            try
            {
                client.Headers.Add(HttpRequestHeader.Authorization, "Bearer " + author.access_token);
                client.Headers.Add(HttpRequestHeader.CacheControl, "no-cache");
                client.Method = "POST";
                client.ContentType = "application/json;charset=utf-8";

                string timestamp = DateTime.Now.ToString("yyyyMMddHHmmss");
                string passkey = push.passkey;

                push.TransactionType = "CustomerPayBillOnline";
                string p = string.Format("{0}{1}{2}", push.BusinessShortCode, passkey, timestamp);
                var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(p);
                push.Password = System.Convert.ToBase64String(plainTextBytes);
                push.Timestamp = timestamp;

                string rowadata = new JavaScriptSerializer().Serialize(push);
                var encoder = new UTF8Encoding();
                var data = System.Text.UTF8Encoding.UTF8.GetBytes(rowadata);

                client.ContentLength = data.Length;
              
                using (var st = client.GetRequestStream())
                {
                    st.Write(data, 0, data.Length);
                }

                HttpWebResponse response = (HttpWebResponse)client.GetResponse();
                Stream stream = response.GetResponseStream();
                string html = string.Empty;

                using (StreamReader reader = new StreamReader(stream))
                {
                    html = reader.ReadToEnd();
                }

                a = JsonConvert.DeserializeObject<stkresponse>(html);
                a.success = true;

                // Log to database
               // LogStkPushToDatabase(push, a, null);
            }
            catch (WebException ex)
            {
                a.success = false;
                using (WebResponse response = ex.Response)
                {
                    HttpWebResponse httpResponse = (HttpWebResponse)response;
                    Console.WriteLine("Error code: {0}", httpResponse.StatusCode);
                    using (Stream data = response.GetResponseStream())
                    {
                        string text = new StreamReader(data).ReadToEnd();
                        Httperror e = JsonConvert.DeserializeObject<Httperror>(text);
                        a.httperror = e;
                    }
                }

                // Log error to database
               // LogStkPushToDatabase(push, a, ex);
            }

            return a;
        }

    
        public Response b2c(b2c B2c)
        {
            Response a = new Response();
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
           // HttpWebRequest client = (HttpWebRequest)System.Net.WebRequest.Create("https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest");
            try
            {
                var client = new RestClient("https://api.safaricom.co.ke");
                var request = new RestRequest("mpesa/b2c/v1/paymentrequest", Method.Post);

                request.RequestFormat = DataFormat.Json;
                request.AddParameter("Authorization", "Bearer " + author.access_token, ParameterType.HttpHeader);
                request.AddParameter("CacheControl", "no-cache", ParameterType.HttpHeader);

                string rowadata = new JavaScriptSerializer().Serialize(B2c);
                request.AddJsonBody(rowadata);

                RestResponse response = client.Execute(request);

                a.ResponseStatus = response.StatusCode;
                a.ResponseDescription = response.StatusDescription;
                a.Content = JsonConvert.DeserializeObject<b2cresponse>(response.Content);
                
            }
            catch (Exception ex)
            {
                a.ResponseStatus = HttpStatusCode.InternalServerError;
                a.ResponseDescription = ex.Message;

            }
            return a;

        } 
        public Response Tstatus(Status st)
        {
            Response a = new Response();
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
           // HttpWebRequest client = (HttpWebRequest)System.Net.WebRequest.Create("https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest");
            try
            {
                var client = new RestClient("https://api.safaricom.co.ke");
                var request = new RestRequest("mpesa/transactionstatus/v1/query", Method.Post);

                request.RequestFormat = DataFormat.Json;
                request.AddParameter("Authorization", "Bearer " + author.access_token, ParameterType.HttpHeader);
                request.AddParameter("CacheControl", "no-cache", ParameterType.HttpHeader);

                string rowadata = new JavaScriptSerializer().Serialize(st);
                request.AddJsonBody(rowadata);

                RestResponse response = client.Execute(request);

                a.ResponseStatus = response.StatusCode;
                a.ResponseDescription = response.StatusDescription;
                a.Content = JsonConvert.DeserializeObject<b2cresponse>(response.Content);
                
            }
            catch (Exception ex)
            {
                a.ResponseStatus = HttpStatusCode.InternalServerError;
                a.ResponseDescription = ex.Message;

            }
            return a;

        }
    }
    public class Auth
    {
        public string access_token = string.Empty;
        public int expires_in = 0;
    }
    public class Httperror
    {
        public string requestId { get; set; }
        public string errorCode { get; set; }
        public string errorMessage { get; set; }
    }
    public class Cust
    {
        public string customer_key { get; set; }
        public string customer_secret { get; set; }
        public string ShortCode { get; set; }
        public string confirmurl { get; set; }
        public string validateurl { get; set; }
        public string initiator { get; set; }
        public string password { get; set; }
    }
    public class stkpush
    {
        public string BusinessShortCode;
        public string Password;
        public string Timestamp;
        public string TransactionType;
        public double Amount;
        public string PartyA;
        public string PartyB;
        public string PhoneNumber;
        public string CallBackURL;
        public string AccountReference;
        public string TransactionDesc;
        public string passkey;

    }
    public class stkresponse
    {
        public string MerchantRequestID { get; set; }
        public string CheckoutRequestID { get; set; }
        public string ResponseCode { get; set; }
        public string ResponseDescription { get; set; }
        public string CustomerMessage { get; set; }
        public Httperror httperror { get; set; }
        public bool success;
    }

    public class b2c
    {
        public string InitiatorName { get; set; }
        public string SecurityCredential { get; set; }
        public string CommandID { get; set; }
        public double Amount { get; set; }
        public string PartyA { get; set; }
        public string PartyB { get; set; }
        public string Remarks { get; set; }
        public string QueueTimeOutURL { get; set; }
        public string ResultURL { get; set; }
        public string Occasion { get; set; }
    }
    public class Status
    {
        public string Initiator { get; set; }
        public string SecurityCredential { get; set; }
        public string CommandID { get; set; }
        public string TransactionID { get; set; }
        public string PartyA { get; set; }
        public string IdentifierType { get; set; }
        public string Remarks { get; set; }
        public string QueueTimeOutURL { get; set; }
        public string ResultURL { get; set; }
        public string Occasion { get; set; }
    }
    public class b2cresponse
    {
        public string ConversationID { get; set; }
        public string OriginatorConversationID { get; set; }
        public string ResponseCode { get; set; }
        public string ResponseDescription { get; set; }

        public string requestId { get; set; }
        public string errorCode { get; set; }
        public string errorMessage { get; set; }

    }
    public class Response { 
    public HttpStatusCode ResponseStatus { get; set; }
    public string ResponseDescription { get; set; }
    public string Stacktrace { get; set; }
    public object Content { get; set; }
    }

    public class StkResponse
    {
        public string ResultCode = "0";
        public string ResultDesc = "Validation Service request accepted succesfully";
    }
}
