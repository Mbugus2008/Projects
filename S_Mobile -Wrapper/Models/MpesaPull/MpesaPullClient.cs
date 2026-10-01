using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;

namespace S_Mobile.Models.MpesaPull
{
    /// <summary>
    /// Safaricom Daraja Pull Transactions API client (production).
    /// "Register" is a one-time call per shortcode; "Query" retrieves C2B transactions
    /// for a period (last 48 hours) so missed transactions can be recovered/reconciled.
    /// </summary>
    public class MpesaPullClient
    {
        private const string BaseUrl = "https://api.safaricom.co.ke";
        private string accessToken;

        public MpesaPullClient(string consumerKey, string consumerSecret)
        {
            ConsumerKey = consumerKey;
            ConsumerSecret = consumerSecret;
        }

        /// <summary>Consumer key from the Daraja app that owns the shortcode.</summary>
        public string ConsumerKey { get; private set; }

        /// <summary>Consumer secret from the Daraja app that owns the shortcode.</summary>
        public string ConsumerSecret { get; private set; }

        /// <summary>Gets an OAuth access token (valid ~1 hour).</summary>
        public Logging.Results<string> Auth()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            var results = new Logging.Results<string>();
            try
            {
                var client = new RestClient(new RestClientOptions(BaseUrl) { MaxTimeout = 60000 });
                var request = new RestRequest("/oauth/v1/generate", Method.Get);
                request.AddQueryParameter("grant_type", "client_credentials");
                request.AddHeader("Authorization", "Basic " + Convert.ToBase64String(System.Text.Encoding.UTF8.GetBytes(ConsumerKey + ":" + ConsumerSecret)));

                var response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    var auth = JsonConvert.DeserializeObject<OAuthResponse>(response.Content);
                    if (auth != null && !string.IsNullOrEmpty(auth.access_token))
                    {
                        accessToken = auth.access_token;
                        results.Contents = accessToken;
                    }
                    else
                    {
                        results.Code = -1;
                        results.Desc = "OAuth response did not contain an access token.";
                    }
                }
                else
                {
                    results.Code = -1;
                    results.Desc = string.Format("OAuth failed (HTTP {0}). Check the consumer key/secret - they are case sensitive.", (int)response.StatusCode);
                    Logging.Logging.LogEntryOnFile("MpesaPull Auth failed: " + response.Content);
                }
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }

        /// <summary>One-time registration of a shortcode for pulling transactions.</summary>
        public Logging.Results<PullRegisterResponse> Register(string shortCode, string nominatedNumber, string callbackUrl)
        {
            var results = new Logging.Results<PullRegisterResponse>();
            try
            {
                if (string.IsNullOrEmpty(accessToken))
                {
                    var auth = Auth();
                    if (auth.Code != 0)
                    {
                        results.Code = -1;
                        results.Desc = auth.Desc;
                        return results;
                    }
                }

                var client = new RestClient(new RestClientOptions(BaseUrl) { MaxTimeout = 60000 });
                var request = new RestRequest("/pulltransactions/v1/register", Method.Post);
                request.AddHeader("Authorization", "Bearer " + accessToken);
                request.AddHeader("Content-Type", "application/json");
                request.AddJsonBody(new
                {
                    ShortCode = shortCode,
                    RequestType = "Pull",
                    NominatedNumber = nominatedNumber,
                    CallBackURL = callbackUrl
                });

                var response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    results.Contents = JsonConvert.DeserializeObject<PullRegisterResponse>(response.Content);
                }
                else
                {
                    results.Code = -1;
                    results.Desc = string.Format("Register failed (HTTP {0}): {1}", (int)response.StatusCode, response.Content);
                }
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }

        /// <summary>Queries C2B transactions for a shortcode between two timestamps (window: last 48 hours).</summary>
        public Logging.Results<PullQueryResponse> Query(string shortCode, DateTime startDate, DateTime endDate, string offset = "0")
        {
            var results = new Logging.Results<PullQueryResponse>();
            try
            {
                if (string.IsNullOrEmpty(accessToken))
                {
                    var auth = Auth();
                    if (auth.Code != 0)
                    {
                        results.Code = -1;
                        results.Desc = auth.Desc;
                        return results;
                    }
                }

                var client = new RestClient(new RestClientOptions(BaseUrl) { MaxTimeout = 60000 });
                var request = new RestRequest("/pulltransactions/v1/query", Method.Post);
                request.AddHeader("Authorization", "Bearer " + accessToken);
                request.AddHeader("Content-Type", "application/json");
                request.AddJsonBody(new
                {
                    ShortCode = shortCode,
                    StartDate = startDate.ToString("yyyy-MM-dd HH:mm:ss"),
                    EndDate = endDate.ToString("yyyy-MM-dd HH:mm:ss"),
                    OffSetValue = offset
                });

                var response = client.Execute(request);
                if (response.StatusCode == HttpStatusCode.OK)
                {
                    results.Contents = JsonConvert.DeserializeObject<PullQueryResponse>(response.Content);
                    if (results.Contents == null)
                    {
                        results.Code = -1;
                        results.Desc = "Empty query response.";
                    }
                }
                else
                {
                    if (response.StatusCode == HttpStatusCode.Unauthorized)
                    {
                        accessToken = null; // token expired - next call re-authenticates
                    }
                    results.Code = -1;
                    results.Desc = string.Format("Query failed (HTTP {0}): {1}", (int)response.StatusCode, response.Content);
                }
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return results;
        }
    }

    public class OAuthResponse
    {
        public string access_token { get; set; }
        public string expires_in { get; set; }
    }

    public class PullRegisterResponse
    {
        [JsonProperty("ResponseRefID")]
        public string ResponseRefId { get; set; }

        [JsonProperty("Response Status")]
        public string ResponseStatus { get; set; }

        [JsonProperty("ShortCode")]
        public string ShortCode { get; set; }

        [JsonProperty("Response Description")]
        public string ResponseDescription { get; set; }
    }

    public class PullQueryResponse
    {
        [JsonProperty("RequestID")]
        public string RequestId { get; set; }

        [JsonProperty("ResponseCode")]
        public string ResponseCode { get; set; }

        [JsonProperty("ResponseMessage")]
        public string ResponseMessage { get; set; }

        [JsonProperty("Response")]
        public List<List<PullTransaction>> Response { get; set; }

        /// <summary>Flattened list of transactions (the API returns an array of arrays).</summary>
        [JsonIgnore]
        public List<PullTransaction> Transactions
        {
            get
            {
                if (Response == null)
                {
                    return new List<PullTransaction>();
                }
                return Response.Where(r => r != null).SelectMany(r => r).ToList();
            }
        }
    }

    public class PullTransaction
    {
        public string transactionId { get; set; }
        public string trxDate { get; set; }
        public string msisdn { get; set; }
        public string sender { get; set; }
        public string transactiontype { get; set; }
        public string billreference { get; set; }
        public string amount { get; set; }
        public string organizationname { get; set; }
    }
}
