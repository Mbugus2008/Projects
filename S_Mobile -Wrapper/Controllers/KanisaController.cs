using Kanisa;
using Kanisa.MemberGroups;
using Kanisa.PaymentDetails;
using Kanisa.Payments;
using Logging;
using Microsoft.Ajax.Utilities;
using MpesaApi;

using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using S_Mobile.Dimensions;
using S_Mobile.Models;
using S_Mobile.Mpesa_Transactions;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core.Mapping;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace S_Mobile.Controllers
{
    public class KanisaController : ApiController
    {
        private readonly string pageId = "433247476725745";
        private readonly string accessToken = "EAAKa3ENPUdQBPBc27rBmurSfskZCRZBU7btWxqgzZBYNAbKM5iYalZCi8cIn33IAG0P4ZCe09H5t9ao1pcvIZAlTKGgps2RaQ5KxjyvvNf1ZCIv25sCnsb1tdDY9f8KbnYIZCZBNcv5P7AkW7E1tv7lEj8TSOsbGFvh14dwbIXp08WPAZAhZAzSgokA8FGDeDxyM05GyaOWadKiFMqSEn0yCagdwsa4uj7G1FCxMp6ZC2ZCSzGeDEMPjlMcwc";

        private Iclient _iclient;
        private Logs.Logger _logger;

        Kanisa.Data data;
        Models.Customer_Mobile_Setup mobile_Setup;

        public KanisaController()
        {
            _logger = Logs.Logger.ForController("Kanisa");
        
            InstanceCreator<Iclient> creator = new InstanceCreator<Iclient>();
            _iclient = creator.CreateInstance(string.Format("S_Mobile.Controllers.Clients.{0}", WebApiApplication.client));
            data = new Kanisa.Data(WebApiApplication.currentclient);
            using (var mobile = new MobileEntities())
            { mobile_Setup = mobile.Customer_Mobile_Setups.FirstOrDefault(o => o.Customer == WebApiApplication.client); }
        }

        [HttpGet]
        [Route("api/facebookphotos")]
        public async Task<IHttpActionResult> GetPhotos()
        {
            try
            {
                _logger.LogInfo("Fetching Facebook photos");

                using (var client = new HttpClient())
                {
                    var url = $"https://graph.facebook.com/v23.0/{pageId}/photos?type=uploaded&fields=images&access_token={accessToken}";
                    var response = await client.GetStringAsync(url);

                    var json = JObject.Parse($"{{\"data\":{response}}}");
                    var photos = new List<string>();

                    foreach (var photo in json["data"])
                    {
                        var firstImageUrl = photo["images"][0]["source"].ToString();
                        photos.Add(firstImageUrl);
                    }

                    _logger.LogInfo($"Successfully fetched {photos.Count} photos");
                    return Ok(photos);
                }
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching Facebook photos", ex);
                throw;
            }
        }


        [HttpPost]
        [Route("api/customer")]
        public Results<Kanisa.Members.Customers> member(string phoneNo)
        {
            try
            {
                _logger.LogInfo($"Fetching member by phone: {phoneNo}");

                string pn = phoneNo.Substring(phoneNo.Length - 9);

                Kanisa.Members.Customers mb = data.member_service.ReadMultiple(new Kanisa.Members.Customers_Filter[] { new Kanisa.Members.Customers_Filter { Criteria = $"*{pn}*", Field = Kanisa.Members.Customers_Fields.Phone_No } }, null, 0).FirstOrDefault();
                mb.MembersGroups = mb.Get_Groups(data);

                _logger.LogInfo($"Member found: {mb?.No}");
                return new Results<Kanisa.Members.Customers>() { Contents = mb };
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error fetching member by phone: {phoneNo}", ex);
                throw;
            }
        }

        [HttpPost]
        [Route("api/register-customer")]
        public Results<Kanisa.Members.Customers> register_member(Kanisa.Members.Customers cust)
        {
            try
            {
                _logger.LogInfo($"Registering customer: {cust.Name}");

                Member_Groups[] groups = cust.MembersGroups;
                cust.GenderSpecified = true;
                cust.Date_of_BirthSpecified = true;
                cust.Baptism_DateSpecified = true;
                cust.ConfirmedSpecified = true;
                string pn = cust.Phone_No.Substring(cust.Phone_No.Length - 9);
                var c = data.member_service.ReadMultiple(new Kanisa.Members.Customers_Filter[] { new Kanisa.Members.Customers_Filter { Criteria = $"*{pn}*", Field = Kanisa.Members.Customers_Fields.Phone_No } }, null, 0).FirstOrDefault();

                if (c == null)
                {
                    cust.Phone_No = $"254{cust.Phone_No.Substring(cust.Phone_No.Length - 9)}";
                    data.member_service.Create(ref cust);
                    _logger.LogInfo($"Customer created: {cust.No}");
                }
                else
                {
                    cust.Key = c.Key;
                    data.member_service.Update(ref cust);
                    _logger.LogInfo($"Customer updated: {cust.No}");
                }

                var gps = data.member_group_service.ReadMultiple(new Kanisa.MemberGroups.Member_Groups_Filter[] { new Kanisa.MemberGroups.Member_Groups_Filter { Criteria = $"{cust.No}", Field = Kanisa.MemberGroups.Member_Groups_Fields.Customer } }, null, 0);
                if (gps != null)
                {
                    foreach (var g in gps)
                    {
                        data.member_group_service.Delete(g.Key);
                    }
                }

                if (groups != null)
                {
                    foreach (var gg in groups)
                    {
                        Kanisa.MemberGroups.Member_Groups g = gg;
                        var mg = data.member_group_service.ReadMultiple(new Kanisa.MemberGroups.Member_Groups_Filter[] { new Kanisa.MemberGroups.Member_Groups_Filter { Criteria = $"{cust.No}", Field = Kanisa.MemberGroups.Member_Groups_Fields.Customer }, new Kanisa.MemberGroups.Member_Groups_Filter { Criteria = $"{g.Global_Dimension_2_Code}", Field = Kanisa.MemberGroups.Member_Groups_Fields.Global_Dimension_2_Code } }, null, 0).FirstOrDefault();
                        if (mg == null)
                        {
                            g.Customer = cust.No;
                            data.member_group_service.Create(ref g);
                        }
                        else
                        {
                            g.Key = mg.Key;
                            g.Customer = mg.Customer;
                            data.member_group_service.Update(ref g);
                        }
                    }

                    cust.MembersGroups = groups;
                }

                return new Results<Kanisa.Members.Customers>() { Contents = cust };
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error registering customer: {cust?.Name}", ex);
                return new Results<Kanisa.Members.Customers>() { Code = -1, Desc = ex.Message };
            }
        }

        [HttpPost]
        [Route("api/events")]
        public Results<Kanisa.AllEvents.Events[]> events()
        {
            try
            {
                _logger.LogInfo("Fetching events");
                var result = data.event_service.ReadMultiple(new Kanisa.AllEvents.Events_Filter[] { }, null, 0);
                _logger.LogInfo($"Fetched {result?.Length ?? 0} events");
                return new Results<Kanisa.AllEvents.Events[]>() { Contents = result };
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching events", ex);
                throw;
            }
        }

        [HttpGet]
        [Route("api/voteheads")]
        public Results<Kanisa.VoteHeads.Vote_Heads[]> voteheads()
        {
            try
            {
                _logger.LogInfo("Fetching vote heads");
                var result = data.vote_head_service.ReadMultiple(new Kanisa.VoteHeads.Vote_Heads_Filter[] { }, null, 0);
                _logger.LogInfo($"Fetched {result?.Length ?? 0} vote heads");
                return new Results<Kanisa.VoteHeads.Vote_Heads[]>() { Contents = result };
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching vote heads", ex);
                throw;
            }
        }

        [HttpGet]
        [Route("api/stkstatus")]
        public Results<stkstatus> stkstatus(string checkoutRequestID)
        {
            stkstatus stkresponse = new stkstatus();
            try
            {
                _logger.LogInfo($"Checking STK status for CheckoutRequestID: {checkoutRequestID}");
                using (var db = new MobileEntities())
                {
                    var existingTransaction = db.StkPushTransactions.FirstOrDefault(t => t.CheckoutRequestID == checkoutRequestID);
                    if (existingTransaction != null && existingTransaction.ResponseCode == "0")
                    {
                        _logger.LogInfo($"STK status already successful in database for CheckoutRequestID: {checkoutRequestID}");
                      
                        stkresponse = new stkstatus();
                        if (existingTransaction.ResponseCode == null)
                        {
                            stkresponse.Status = "Pending";
                        }
                        else
                        {
                            switch (existingTransaction.ResponseCode)
                            {
                                case "0":
                                    stkresponse.Status = "Success";
                                    break;
                                case "1":
                                    stkresponse.Status = "Cancelled";
                                    break;
                                default:
                                    stkresponse.Status = "Failed";
                                    break;
                            }
                        }
                       
                        stkresponse.MpesaReceiptNumber = existingTransaction.Mpesacode;
                        stkresponse.PaymentDate = existingTransaction.CreatedAt.HasValue ? existingTransaction.CreatedAt.Value : DateTime.Now;
                        stkresponse.Amount = (double)existingTransaction.Amount;
                        stkresponse.MpesaTransactionId = existingTransaction.Mpesacode;
                        stkresponse.Reference = existingTransaction.AccountReference;
                        stkresponse.PhoneNumber = existingTransaction.PhoneNumber;
                        stkresponse.Description = existingTransaction.TransactionDesc;
                        

                        return new Results<stkstatus>() { Contents = stkresponse };
                    }
                }
               
                _logger.LogInfo($"STK status retrieved. MerchantRequestID: {checkoutRequestID}");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error checking STK status for CheckoutRequestID: {checkoutRequestID}", ex);
                return new Results<stkstatus>() { Code = -1, Desc = ex.Message };
            }
            return new Results<stkstatus>() { Contents = stkresponse };
        }

        [HttpPost]
        [Route("api/pushstk")]
        public Results<stkresponse> pushstk(stk stkpush)
        {
            stkresponse stkresponse = new stkresponse();
            try
            {
                _logger.LogInfo($"Initiating STK push for {stkpush.Mobile}, Amount: {stkpush.Amount}");

                MpesaApi.Cust c = new MpesaApi.Cust();
                c.customer_key = mobile_Setup.customer_key;
                c.customer_secret = mobile_Setup.customer_secret;
                c.ShortCode = mobile_Setup.ShortCode;
                MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                string ok = "";
                MpesaApi.stkpush r = new MpesaApi.stkpush();
                r.passkey = mobile_Setup.passkey;
                r.BusinessShortCode = mobile_Setup.ShortCode;
                r.TransactionType = "CustomerPayBillOnline";
                r.Amount = stkpush.Amount;
                r.PartyA = string.Format("254{0}", stkpush.Mobile.Substring(stkpush.Mobile.Length - 9));
                r.PartyB = r.BusinessShortCode;
                r.PhoneNumber = r.PartyA;
                r.CallBackURL = "https://trimline.co.ke:4001/api/stkpush";
                r.AccountReference = stkpush.Document_No;
                r.TransactionDesc = stkpush.Description;

                stkresponse = m.Stkpush(r);
                LogStkPushToDatabase(r, stkresponse, null);

                _logger.LogInfo($"STK push successful. MerchantRequestID: {stkresponse.MerchantRequestID}");
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error in STK push for {stkpush.Mobile}", ex);
                return new Results<stkresponse>() { Code = -1, Desc = ex.Message };
            }
            return new Results<stkresponse>() { Contents = stkresponse };
        }

        private void LogStkPushToDatabase(MpesaApi.stkpush request, MpesaApi.stkresponse response, Exception ex)
        {
            try
            {
                using (var db = new MobileEntities())
                {
                    var transaction = new StkPushTransaction
                    {
                        // Request fields
                        BusinessShortCode = request.BusinessShortCode,
                        Password = request.Password,
                        Timestamp = request.Timestamp,
                        TransactionType = request.TransactionType,
                        Amount = (decimal)request.Amount,
                        PartyA = request.PartyA,
                        PartyB = request.PartyB,
                        PhoneNumber = request.PhoneNumber,
                        CallBackURL = request.CallBackURL,
                        AccountReference = request.AccountReference,
                        TransactionDesc = request.TransactionDesc,
                        Passkey = request.passkey,


                        // Response fields
                        MerchantRequestID = response.MerchantRequestID ?? string.Empty,
                        CheckoutRequestID = response.CheckoutRequestID ?? string.Empty,
                        ResponseCode = response.ResponseCode,
                        ResponseDescription = response.ResponseDescription,
                        CustomerMessage = response.CustomerMessage,
                        HttpError = response.httperror != null ? response.httperror.errorMessage : (ex != null ? ex.Message : null),
                        Success = response.success,

                        // Audit
                        CreatedAt = DateTime.Now
                    };

                    db.StkPushTransactions.Add(transaction);
                    db.SaveChanges();
                    _logger.LogInfo($"STK push transaction logged to database. MerchantRequestID: {response.MerchantRequestID}");
                }
            }
            catch (Exception dbEx)
            {
                _logger.LogError("Error logging STK push to database", dbEx);
                Console.WriteLine($"Error logging to database: {dbEx.Message}");
            }
        }

        [HttpPost]
        [Route("api/sermons")]
        public Results<Kanisa.Sermon.Sermons[]> sermons()
        {
            try
            {
                _logger.LogInfo("Fetching sermons");
                var result = data.sermon_service.ReadMultiple(new Kanisa.Sermon.Sermons_Filter[] { }, null, 0);
                _logger.LogInfo($"Fetched {result?.Length ?? 0} sermons");
                return new Results<Kanisa.Sermon.Sermons[]>() { Contents = result };
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching sermons", ex);
                throw;
            }
        }


        [HttpPost]
        [Route("api/cheques")]
        public Results<Vouchers.Vouchers[]> cheques()
        {
            try
            {
                _logger.LogInfo("Fetching cheques");
                var result = new Vouchers.Vouchers_Service(WebApiApplication.s).ReadMultiple(new Vouchers.Vouchers_Filter[] { new Vouchers.Vouchers_Filter { Criteria = "No", Field = Vouchers.Vouchers_Fields.Posted } }, null, 0).Where(o => o.Amount_Spent < o.Payment_Amount).OrderByDescending(o => o.Cheque_No).ToArray();
                _logger.LogInfo($"Fetched {result?.Length ?? 0} cheques");
                return new Results<Vouchers.Vouchers[]>() { Contents = result };
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching cheques", ex);
                throw;
            }
        }

        [HttpPost]
        [Route("api/dimensions")]
        public Results<Dimensions.Dimensions[]> Dimensions()
        {
            try
            {
                _logger.LogInfo("Fetching dimensions");
                var result = new Dimensions_Service(WebApiApplication.s).ReadMultiple(new Dimensions_Filter[] { }, null, 0).ToArray();
                _logger.LogInfo($"Fetched {result?.Length ?? 0} dimensions");
                return new Results<Dimensions.Dimensions[]>() { Contents = result };
            }
            catch (Exception ex)
            {
                _logger.LogError("Error fetching dimensions", ex);
                throw;
            }
        }

        [HttpPost]
        [Route("api/mpesa")]
        public Results<Mpesa_Transactions.Mpesa_Transactions> Mpesa(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            try
            {
                _logger.LogInfo($"Processing M-Pesa transaction. Receipt: {mpesa.Receipt_No}");
                var result = _iclient.Mpesa(mpesa);
                _logger.LogInfo($"M-Pesa transaction processed successfully. Receipt: {mpesa.Receipt_No}");
                return result;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error processing M-Pesa transaction. Receipt: {mpesa?.Receipt_No}", ex);
                throw;
            }
        }

        [HttpPost]
        [Route("api/payments")]
        public Results<Mpesa_Transactions.Mpesa_Transactions> payments(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            Results<Mpesa_Transactions.Mpesa_Transactions> r = new Results<Mpesa_Transactions.Mpesa_Transactions>();
            try
            {
                _logger.LogInfo($"Processing payment. Receipt: {mpesa.Receipt_No}");
                Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());
                mpesa.Transaction_DateSpecified = true;
                mpesa.Paid_InSpecified = true;
                mpesa.TranstypeSpecified = true;
                mpesa.Completion_TimeSpecified = true;
                mpesa.ChargeSpecified = true;

                var mp = new Mpesa_Transactions_Service(WebApiApplication.currentclient).Read(mpesa.Receipt_No);
                if (mp == null)
                {
                    new Mpesa_Transactions_Service(WebApiApplication.currentclient).Create(ref mpesa);
                    _logger.LogInfo($"Payment created. Receipt: {mpesa.Receipt_No}");
                }
                else
                {
                    mpesa.Key = mp.Key;
                    new Mpesa_Transactions_Service(WebApiApplication.currentclient).Update(ref mpesa);
                    _logger.LogInfo($"Payment updated. Receipt: {mpesa.Receipt_No}");
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Kanisa");
                Logging.Logging.ReportError(ex);
                _logger.LogError($"Error processing payment. Receipt: {mpesa?.Receipt_No}", ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            finally
            {
                r.Contents = mpesa;
            }
            return r;
        }

        [HttpPost]
        [Route("api/paymentsall")]
        public Results<Mpesa_Transactions.Mpesa_Transactions[]> paymentsall(Mpesa_Transactions.Mpesa_Transactions[] mpesas)
        {
            Results<Mpesa_Transactions.Mpesa_Transactions[]> r = new Results<Mpesa_Transactions.Mpesa_Transactions[]>();

            _logger.LogInfo($"Processing {mpesas?.Length ?? 0} payments in bulk");

            foreach (var m in mpesas)
            {
                var mpesa = m;
                try
                {
                    Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());

                    var mp = new Mpesa_Transactions_Service(WebApiApplication.currentclient).Read(mpesa.Receipt_No);
                    if (mp == null)
                    {
                        new Mpesa_Transactions_Service(WebApiApplication.currentclient).Create(ref mpesa);
                    }
                    else
                    {
                        mpesa.Key = mp.Key;
                        new Mpesa_Transactions_Service(WebApiApplication.currentclient).Update(ref mpesa);
                    }
                }
                catch (Exception ex)
                {
                    Log.Error(ex, "Kanisa");
                    Logging.Logging.ReportError(ex);
                    _logger.LogError($"Error processing payment in bulk. Receipt: {mpesa?.Receipt_No}", ex);
                    r.Code = -1;
                    r.Desc = ex.Message;
                }
            }

            _logger.LogInfo("Bulk payment processing completed");
            return r;
        }


        [HttpPost]
        [Route("api/addpayment")]
        public Results<Kanisa.Payments.Payments> addpayment(Payments cust) { 
        
            Results<Kanisa.Payments.Payments> r = new Results<Kanisa.Payments.Payments>();
            try
            {
                _logger.LogInfo($"Adding payment for customer: {cust.Document_No}");
                _logger.LogInfo($"Payment object: {JsonConvert.SerializeObject(cust)}");
               Kanisa.PaymentDetails.Payment_Details[] pdt = cust.Payment_Details_List;
                cust.DateSpecified = true;
                cust.AmountSpecified = true;

          
                cust.TimeSpecified = true;
                var p = data.payment_service.ReadMultiple(new Kanisa.Payments.Payments_Filter[] { new Kanisa.Payments.Payments_Filter { Criteria = $"{cust.Document_No}", Field = Kanisa.Payments.Payments_Fields.Document_No },  }, null, 0).FirstOrDefault();
                if (p == null)
                {
                    data.payment_service.Create(ref cust);
                    if (pdt != null)
                    {
                        foreach (Kanisa.PaymentDetails.Payment_Details pd in pdt)
                        {
                            Kanisa.PaymentDetails.Payment_Details pdCopy = pd; // Fix: create a local copy to use as ref
                            pdCopy.Document_No = cust.Document_No;
                            pdCopy.AmountSpecified = true;

                            data.payment_details_service.Create(ref pdCopy);
                        }
                        cust.Payment_Details_List = pdt;
                    }
                }
                
                _logger.LogInfo($"Payment added successfully for customer: {cust.Document_No}");
                r.Contents = cust;
            }
            catch (Exception ex)
            {
                _logger.LogError($"Error adding payment for customer: {cust?.Document_No}", ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;


        }



    }
    public class stkstatus
    {
        public string Id { get; set; }
        public string CustomerNo { get; set; }
        public string CustomerName { get; set; }
        public string VoteHeadCode { get; set; }
        public string VoteHeadName { get; set; }
        public double Amount { get; set; }
        public string Status { get; set; }
        public string PaymentMethod { get; set; }
        public string MpesaReceiptNumber { get; set; }
        public string MpesaTransactionId { get; set; }
        public string PhoneNumber { get; set; }
        public DateTime PaymentDate { get; set; }
        public DateTime CreatedAt { get; set; }
        public string Description { get; set; }
        public string Reference { get; set; }
    }
    public class stk
    {
        public string Mobile { get; set; }
        public string Document_No { get; set; }
        public double Amount { get; set; }
        public string Description { get;  set; }
    }

    public class DateTimeTicksConverter : DateTimeConverterBase
    {
        public override void WriteJson(JsonWriter writer, object value, JsonSerializer serializer)
        {
            if (value is DateTime dateTime)
            {
                writer.WriteValue(dateTime.Ticks);
            }
            else
            {
                throw new JsonSerializationException("Expected DateTime object.");
            }
        }

        public override object ReadJson(JsonReader reader, Type objectType, object existingValue, JsonSerializer serializer)
        {
            if (reader.TokenType == JsonToken.Integer)
            {
                long ticks = (long)reader.Value;
                return new DateTime(ticks);
            }
            else
            {
                throw new JsonSerializationException("Unexpected token type. Expected Integer.");
            }
        }
    }
}

namespace S_Mobile.Mpesa_Transactions
{
    public partial class Mpesa_Transactions_Service
    {
        public Mpesa_Transactions_Service(nav s)
        {
            this.Url = new Logging.settings().geturl(global::S_Mobile.Properties.Settings.Default.S_Mobile_Mpesa_Transactions_Mpesa_Transactions_Service, ref s);

            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
}

namespace S_Mobile.Vouchers
{
    public partial class Vouchers_Service
    {
        public Vouchers_Service(settings s)
        {
            this.Url = s.geturl(global::S_Mobile.Properties.Settings.Default.S_Mobile_Vouchers_Vouchers_Service, s.kanisa);
            Logging.Logging.LogEntryOnFile(this.Url);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
}

namespace S_Mobile.Dimensions
{
    public partial class Dimensions_Service
    {
        public Dimensions_Service(settings s)
        {
            this.Url = s.geturl(global::S_Mobile.Properties.Settings.Default.S_Mobile_Dimensions_Dimensions_Service, s.kanisa);
            Logging.Logging.LogEntryOnFile(this.Url);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
}

namespace S_Mobile.Districts
{
    public partial class Districts_Service
    {
        public Districts_Service(settings s)
        {
            this.Url = s.geturl(global::S_Mobile.Properties.Settings.Default.S_Mobile_Districts_Districts_Service, s.kanisa);
            Logging.Logging.LogEntryOnFile(this.Url);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
}

namespace S_Mobile.Purpose
{
    public partial class Purpose_Service
    {
        public Purpose_Service(settings s)
        {
            this.Url = s.geturl(global::S_Mobile.Properties.Settings.Default.S_Mobile_Purpose_Purpose_Service, s.kanisa);
            Logging.Logging.LogEntryOnFile(this.Url);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
}
