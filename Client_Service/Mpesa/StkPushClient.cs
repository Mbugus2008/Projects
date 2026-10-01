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
    /// Request payload accepted by POST api/stkpush (mobile app "Pay Now").
    /// </summary>
    public class StkPushRequest
    {
        public string Account_No { get; set; }
        public string Phone { get; set; }
        public string Member_No { get; set; }
        public string Loan_No { get; set; }
        public string Description { get; set; }
        public double Amount { get; set; }
        public int Transaction_Type { get; set; }
    }

    /// <summary>
    /// Result of an STK push attempt.
    /// </summary>
    public class StkPushResult
    {
        public bool Success { get; set; }
        public string Stage { get; set; }
        public string MerchantRequestID { get; set; }
        public string CheckoutRequestID { get; set; }
        public string ResponseCode { get; set; }
        public string ResponseDescription { get; set; }
        public string CustomerMessage { get; set; }
        public string ErrorCode { get; set; }
        public string ErrorMessage { get; set; }
    }

    /// <summary>
    /// Minimal Safaricom M-Pesa STK Push (Lipa na M-Pesa Online / CustomerPayBillOnline) client.
    /// Uses the same production integration and credentials as the S_Ussd service
    /// (Baraka Yetu SACCO, paybill 910310). Values can be overridden per environment via
    /// Web.config appSettings: MpesaConsumerKey, MpesaConsumerSecret, MpesaShortCode,
    /// MpesaPasskey, MpesaCallbackUrl.
    /// </summary>
    public static class StkPushClient
    {
        private const string AuthUrl = "https://api.safaricom.co.ke/oauth/v2/generate?grant_type=client_credentials";
        private const string StkUrl = "https://api.safaricom.co.ke/mpesa/stkpush/v1/processrequest";

        private static readonly object TokenLock = new object();
        private static string _token;
        private static DateTime _tokenExpiry = DateTime.MinValue;

        private static string ConsumerKey
        {
            get { return AppSetting("MpesaConsumerKey", "IAk8eFksFd1BdGTizoqXI3M7CrYrsQGt"); }
        }

        private static string ConsumerSecret
        {
            get { return AppSetting("MpesaConsumerSecret", "JZbWLAySK1RNXYM0"); }
        }

        private static string ShortCode
        {
            get { return AppSetting("MpesaShortCode", "910310"); }
        }

        private static string Passkey
        {
            get { return AppSetting("MpesaPasskey", "40487a2090d70bebf9092dd7ba1714e6fce6984b515f9ebf0d8931e6829085bd"); }
        }

        private static string CallbackUrl
        {
            get { return AppSetting("MpesaCallbackUrl", "http://197.248.158.54:4001/Deposit.svc/stkpush"); }
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

        /// <summary>
        /// Safaricom expects EAT (UTC+3) timestamps. Servers may run in any timezone (OVH = UTC).
        /// </summary>
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

                try
                {
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
                catch (WebException wex)
                {
                    var detail = wex.Message;
                    if (wex.Response != null)
                    {
                        try
                        {
                            using (var reader = new StreamReader(wex.Response.GetResponseStream()))
                            {
                                var body = reader.ReadToEnd();
                                if (!string.IsNullOrWhiteSpace(body))
                                    detail += " — " + Truncate(body, 300);
                            }
                        }
                        catch { }
                    }
                    throw new Exception(detail, wex);
                }
            }
        }

        /// <summary>
        /// Sends an STK push (customer pays to the paybill). Returns a result object; check Success.
        /// </summary>
        /// <param name="amount">Amount in KES (whole shillings).</param>
        /// <param name="phone254">Phone in 2547XXXXXXXX format.</param>
        /// <param name="accountReference">Reference shown on the prompt / statement (max 12 chars).</param>
        /// <param name="transactionDesc">Description shown on the prompt (max 13 chars).</param>
        public static StkPushResult Push(double amount, string phone254, string accountReference, string transactionDesc)
        {
            var result = new StkPushResult();
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
                    result.ErrorMessage = Describe(authEx);
                    return result;
                }

                ServicePointManager.SecurityProtocol |= SecurityProtocolType.Tls12;

                var shortCode = ShortCode;
                var timestamp = EastAfricaNow().ToString("yyyyMMddHHmmss");
                var password = Convert.ToBase64String(Encoding.UTF8.GetBytes(shortCode + Passkey + timestamp));

                var payload = new JObject
                {
                    ["BusinessShortCode"] = shortCode,
                    ["Password"] = password,
                    ["Timestamp"] = timestamp,
                    ["TransactionType"] = "CustomerPayBillOnline",
                    ["Amount"] = Math.Round(amount),
                    ["PartyA"] = phone254,
                    ["PartyB"] = shortCode,
                    ["PhoneNumber"] = phone254,
                    ["CallBackURL"] = CallbackUrl,
                    ["AccountReference"] = Truncate(accountReference, 12),
                    ["TransactionDesc"] = Truncate(transactionDesc, 13)
                };

                var body = Encoding.UTF8.GetBytes(payload.ToString(Formatting.None));
                var req = (HttpWebRequest)WebRequest.Create(StkUrl);
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
                    result.Stage = "stk";
                    if (wex.Response == null)
                    {
                        result.Success = false;
                        result.ErrorMessage = Describe(wex);
                        return result;
                    }

                    using (var reader = new StreamReader(wex.Response.GetResponseStream()))
                    {
                        responseText = reader.ReadToEnd();
                    }

                    var err = TryParse(responseText);
                    result.Success = false;
                    result.ErrorCode = (string)err["errorCode"];
                    result.ErrorMessage = (string)err["errorMessage"];
                    result.ResponseDescription = (string)err["ResponseDescription"];
                    if (string.IsNullOrWhiteSpace(result.ErrorMessage))
                        result.ErrorMessage = result.ResponseDescription ?? "STK push was rejected by Safaricom.";
                    return result;
                }

                var jo = JObject.Parse(responseText);
                result.MerchantRequestID = (string)jo["MerchantRequestID"];
                result.CheckoutRequestID = (string)jo["CheckoutRequestID"];
                result.ResponseCode = (string)jo["ResponseCode"];
                result.ResponseDescription = (string)jo["ResponseDescription"];
                result.CustomerMessage = (string)jo["CustomerMessage"];
                result.Success = result.ResponseCode == "0";
                if (!result.Success && string.IsNullOrWhiteSpace(result.ErrorMessage))
                    result.ErrorMessage = result.ResponseDescription;
                return result;
            }
            catch (Exception ex)
            {
                result.Success = false;
                if (string.IsNullOrEmpty(result.Stage))
                    result.Stage = "stk";
                result.ErrorMessage = Describe(ex);
                return result;
            }
        }

        private static string Describe(Exception ex)
        {
            var wex = ex as WebException;
            var msg = wex != null
                ? string.Format("WebException({0}): {1}", wex.Status, wex.Message)
                : string.Format("{0}: {1}", ex.GetType().Name, ex.Message);
            if (ex.InnerException != null && !string.IsNullOrWhiteSpace(ex.InnerException.Message) && !msg.Contains(ex.InnerException.Message))
                msg += " — " + ex.InnerException.Message;
            return msg;
        }

        private static JObject TryParse(string text)
        {
            try
            {
                return string.IsNullOrWhiteSpace(text) ? new JObject() : JObject.Parse(text);
            }
            catch
            {
                return new JObject();
            }
        }

        private static string Truncate(string value, int max)
        {
            if (string.IsNullOrEmpty(value))
                return value;
            return value.Length <= max ? value : value.Substring(0, max);
        }
    }
}
