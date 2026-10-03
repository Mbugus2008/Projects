using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;

namespace Client_Service.Mpesa
{
    /// <summary>
    /// Request payload accepted by POST api/billpay (mobile app "Bill Payments").
    /// Funds are debited from the member's wallet (Account_No) and the bill is
    /// disbursed through the SACCO channel (B2C once fully configured).
    /// </summary>
    public class BillPayRequest
    {
        public string Member_No { get; set; }
        public string Account_No { get; set; }
        public string Biller_Code { get; set; }
        public string Biller_Name { get; set; }
        public string Bill_Account { get; set; }
        public string Phone { get; set; }
        public string Description { get; set; }
        public double Amount { get; set; }
        public int Transaction_Type { get; set; }
    }

    /// <summary>
    /// Result of a B2C disbursement attempt.
    /// </summary>
    public class B2cResult
    {
        public bool Success { get; set; }
        public string Stage { get; set; }
        public string ConversationID { get; set; }
        public string OriginatorConversationID { get; set; }
        public string ResponseCode { get; set; }
        public string ResponseDescription { get; set; }
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
    }

    /// <summary>
    /// Minimal Safaricom M-Pesa B2C (BusinessPayment) client used to disburse money from
    /// the SACCO shortcode (e.g. bill payments). Stays disabled until fully configured via
    /// Web.config appSettings:
    ///   MpesaB2cInitiatorName, MpesaB2cSecurityCredential, MpesaB2cShortCode,
    ///   MpesaB2cPartyB (recipient/channel), MpesaB2cResultUrl, MpesaB2cTimeoutUrl.
    /// Uses the same consumer key/secret as StkPushClient.
    /// </summary>
    public static class B2cClient
    {
        private const string AuthUrl = "https://api.safaricom.co.ke/oauth/v2/generate?grant_type=client_credentials";
        private const string B2cUrl = "https://api.safaricom.co.ke/mpesa/b2c/v1/paymentrequest";

        private static readonly object TokenLock = new object();
        private static string _token;
        private static DateTime _tokenExpiry = DateTime.MinValue;

        private static string ConsumerKey { get { return AppSetting("MpesaConsumerKey", "IAk8eFksFd1BdGTizoqXI3M7CrYrsQGt"); } }
        private static string ConsumerSecret { get { return AppSetting("MpesaConsumerSecret", "JZbWLAySK1RNXYM0"); } }
        private static string ShortCode { get { return AppSetting("MpesaB2cShortCode", ""); } }
        private static string InitiatorName { get { return AppSetting("MpesaB2cInitiatorName", ""); } }
        private static string SecurityCredential { get { return AppSetting("MpesaB2cSecurityCredential", ""); } }
        private static string PartyB { get { return AppSetting("MpesaB2cPartyB", ""); } }
        private static string ResultUrl { get { return AppSetting("MpesaB2cResultUrl", ""); } }
        private static string TimeoutUrl { get { return AppSetting("MpesaB2cTimeoutUrl", ""); } }
        private static string CommandId { get { return AppSetting("MpesaB2cCommandId", "BusinessPayment"); } }

        /// <summary>True when every setting required for a B2C call is present.</summary>
        public static bool IsConfigured
        {
            get
            {
                return !string.IsNullOrWhiteSpace(ShortCode)
                    && !string.IsNullOrWhiteSpace(InitiatorName)
                    && !string.IsNullOrWhiteSpace(SecurityCredential)
                    && !string.IsNullOrWhiteSpace(PartyB)
                    && !string.IsNullOrWhiteSpace(ResultUrl)
                    && !string.IsNullOrWhiteSpace(TimeoutUrl);
            }
        }

        private static string AppSetting(string key, string fallback)
        {
            try
            {
                var v = ConfigurationManager.AppSettings[key];
                return string.IsNullOrWhiteSpace(v) ? fallback : v;
            }
            catch
            {
                return fallback;
            }
        }

        /// <summary>Safaricom expects EAT (UTC+3) timestamps on some calls; kept for parity.</summary>
        private static DateTime EastAfricaNow()
        {
            try
            {
                return TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, TimeZoneInfo.FindSystemTimeZoneById("E. Africa Standard Time"));
            }
            catch
            {
                return DateTime.UtcNow.AddHours(3);
            }
        }

        private static string GetToken()
        {
            lock (TokenLock)
            {
                if (!string.IsNullOrEmpty(_token) && DateTime.UtcNow < _tokenExpiry)
                    return _token;

                ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls12;
                var basic = Convert.ToBase64String(Encoding.UTF8.GetBytes(ConsumerKey + ":" + ConsumerSecret));
                var req = (HttpWebRequest)WebRequest.Create(AuthUrl);
                req.KeepAlive = false;
                req.Method = "GET";
                req.Proxy = null; // never route through any auto-detected proxy
                req.Headers.Add(HttpRequestHeader.Authorization, "Basic " + basic);
                req.Headers.Add(HttpRequestHeader.CacheControl, "no-cache");

                using (var resp = (HttpWebResponse)req.GetResponse())
                using (var reader = new StreamReader(resp.GetResponseStream()))
                {
                    var jo = JObject.Parse(reader.ReadToEnd());
                    _token = (string)jo["access_token"];
                    var expires = (int?)jo["expires_in"] ?? 3599;
                    _tokenExpiry = DateTime.UtcNow.AddSeconds(Math.Max(60, expires - 60));
                    return _token;
                }
            }
        }

        /// <summary>
        /// Sends a B2C BusinessPayment of <paramref name="amount"/> KES to the configured
        /// recipient (MpesaB2cPartyB). Returns a result object; check Success.
        /// </summary>
        public static B2cResult Push(double amount, string remarks, string occasion)
        {
            var result = new B2cResult();
            if (!IsConfigured)
            {
                result.Success = false;
                result.Stage = "config";
                result.ErrorMessage = "B2C channel is not configured (set Web.config appSettings MpesaB2c*).";
                return result;
            }

            try
            {
                string token;
                try
                {
                    token = GetToken();
                }
                catch (Exception authEx)
                {
                    result.Success = false;
                    result.Stage = "auth";
                    result.ErrorMessage = authEx.Message;
                    return result;
                }

                ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls12;
                var payload = new JObject
                {
                    ["InitiatorName"] = InitiatorName,
                    ["SecurityCredential"] = SecurityCredential,
                    ["CommandID"] = CommandId,
                    ["Amount"] = Math.Round(amount),
                    ["PartyA"] = ShortCode,
                    ["PartyB"] = PartyB,
                    ["Remarks"] = Truncate(remarks, 100),
                    ["QueueTimeOutURL"] = TimeoutUrl,
                    ["ResultURL"] = ResultUrl,
                    ["Occasion"] = Truncate(occasion ?? "", 100)
                };

                var body = Encoding.UTF8.GetBytes(payload.ToString(Formatting.None));
                var req = (HttpWebRequest)WebRequest.Create(B2cUrl);
                req.Method = "POST";
                req.ContentType = "application/json;charset=utf-8";
                req.Proxy = null; // never route through any auto-detected proxy
                req.Headers.Add(HttpRequestHeader.Authorization, "Bearer " + token);
                req.Headers.Add(HttpRequestHeader.CacheControl, "no-cache");
                req.ContentLength = body.Length;
                using (var st = req.GetRequestStream())
                {
                    st.Write(body, 0, body.Length);
                }

                string responseText;
                try
                {
                    using (var resp = (HttpWebResponse)req.GetResponse())
                    using (var reader = new StreamReader(resp.GetResponseStream()))
                    {
                        responseText = reader.ReadToEnd();
                    }
                }
                catch (WebException wex)
                {
                    result.Stage = "b2c";
                    if (wex.Response == null)
                    {
                        result.Success = false;
                        result.ErrorMessage = wex.Message;
                        return result;
                    }
                    using (var reader = new StreamReader(wex.Response.GetResponseStream()))
                    {
                        responseText = reader.ReadToEnd();
                    }
                    var err = TryParse(responseText);
                    result.Success = false;
                    result.ErrorCode = (string)(err["errorCode"] ?? err["ResponseCode"]);
                    result.ErrorMessage = (string)(err["errorMessage"] ?? err["ResponseDescription"]) ?? Truncate(responseText, 300);
                    return result;
                }

                var jo = TryParse(responseText);
                result.ResponseCode = (string)jo["ResponseCode"];
                result.ResponseDescription = (string)jo["ResponseDescription"];
                result.ConversationID = (string)jo["ConversationID"];
                result.OriginatorConversationID = (string)jo["OriginatorConversationID"];
                result.Success = result.ResponseCode == "0";
                return result;
            }
            catch (Exception ex)
            {
                result.Success = false;
                result.Stage = result.Stage ?? "b2c";
                result.ErrorMessage = ex.Message;
                return result;
            }
        }

        private static JObject TryParse(string text)
        {
            try { return JObject.Parse(text); } catch { return new JObject(); }
        }

        private static string Truncate(string v, int len)
        {
            if (string.IsNullOrEmpty(v)) return v;
            return v.Length <= len ? v : v.Substring(0, len);
        }
    }
}
