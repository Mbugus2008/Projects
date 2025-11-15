using Logging;
using S_Mobile.Models;
using S_Mobile.Models.sms;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Http;

namespace S_Mobile.Models
{

    public partial class MobileEntities
    {
        public MobileEntities(string Connectionstring)
            : base(Connectionstring)
        {
        }
    }
    
}


namespace S_Mobile.Controllers
{
    public class SmsController : ApiController
    {
        private IRepository repository;
        private Ismsrepository smsclient;
        public static string ConnectionString()
        {
            // Specify the provider name, server and database.
            string providerName = "System.Data.SqlClient";
            //string serverName = "Server\\sql2008";
            //string databaseName = client.Db;
            // Initialize the connection string builder for the
            // underlying provider.
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            // Set the properties for the data source.
            sqlBuilder.DataSource = "5.189.167.52";// string.Concat(settings.s.Serverip, @"\", settings.s.Instance);
            sqlBuilder.InitialCatalog = "Mobile";// settings.s.database;
            sqlBuilder.IntegratedSecurity = false;// settings.s.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;

            //if (client.IntegratedSecurity == false)
            //{
            sqlBuilder.UserID = "Paul";// settings.s.Username;
            sqlBuilder.Password = "Mbanking12345*";// settings.s.pass;
            //}

            // Build the SqlConnection connection string.
            string providerString = sqlBuilder.ToString();
            // Initialize the EntityConnectionStringBuilder.
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            //Set the provider name.
            entityBuilder.Provider = providerName;

            // Set the provider-specific connection string.
            entityBuilder.ProviderConnectionString = providerString;
            // Set the Metadata location.
            entityBuilder.Metadata = "res://*/";
            return entityBuilder.ToString();

        }
        [HttpPost]
        [Route("api/sendsms")]
        public Logging.Results<BulkSm> sendsms(BulkSm sms)
        {
            MobileEntities context = new MobileEntities(ConnectionString());
            repository = new Localdb(context);

            Logging.Results<BulkSm> results = new Logging.Results<BulkSm>();
            try
            {
                if (sms.Phone.Replace(" ", "").Length < 9)
                {
                    return new Logging.Results<BulkSm>() { Code = -1, Desc = "Invalid Phone Number" };
                }

                string[] phones = sms.Phone.Replace(" ", "").Split(new char[] { ',' });

                for (int i = 0; i < phones.Length; i++)
                {
                    phones[i] = $"+254{phones[i].Substring(phones[i].Length - 9)}";
                    ;
                }

                Client cc = repository.getclient(sms.Client); // c.FirstOrDefault(o=> o.Client_Code == sms.Client);

                if (cc == null)
                {
                    return new Logging.Results<BulkSm>() { Code = -1, Desc = "Client not Found" };
                }

                if (cc.Active == false)
                {
                    return new Logging.Results<BulkSm>() { Code = -1, Desc = "Client not active" };
                }
                //sms.Message = Regex.Replace(sms.Message, @"\s+", " ");

                sms.Message = Regex.Replace(sms.Message, @"[^\S\r\n]+", " ");

                var chopped = choppedtext(sms.Message, 160);

                var bal = repository.Getsmsbalance(sms.Client);

                if (bal < (chopped.Count() * phones.Length))
                {
                    return new Logging.Results<BulkSm>() { Code = -1, Desc = "Insufficient Balance" };
                }

                var smsexist = repository.smsexist(sms);
                if (smsexist != null)
                {
                    return new Logging.Results<BulkSm>() { Code = 0, Desc = "Sms sent", Contents = smsexist };
                }

                sms.Datetime = DateTime.Now;
                sms.Status = 0;

                sms.Value = (chopped.Count() * phones.Length) * -1;

                if (sms.Scheduled_Time == null)
                    sms.Scheduled_Time = DateTime.Now;

                sms.Balance = (int)bal - (chopped.Count() * phones.Length);
                sms.Message_to_send = sms.Message;

                if (sms.Message.Length > 500)
                {
                    sms.Message_2 = sms.Message.Substring(500);
                    sms.Message = sms.Message.Substring(0, 500);
                }

                foreach (var phone in phones)
                {
                    sms.Phone = phone;
                    repository.Add(sms);

                    repository.SaveChanges();

                    if (sms.Scheduled == false || sms.Scheduled == null)
                    {
                        switch (cc.Sms_clientvalue)
                        {
                            case Sms_client.Africastalking:
                                smsclient = new Africas();
                                break;

                            case Sms_client.zettatel:
                                smsclient = new zetta();
                                break;

                            case Sms_client.Blanks:
                                smsclient = new Blank();
                                break;
                        }

                        var r = smsclient.sendsms(ref sms);
                        results.Code = r.Code;results.Desc = r.Desc;
                    }
                }

                repository.SaveChanges();
                results.Contents = sms;
            }
            catch (Exception ex)
            {
                Log.Error("An error occurred: {ErrorMessage}", ex.Message);

                Logging.Logging.ReportError(ex);
            }

            return results;
        }

        [HttpPost]
        [Route("api/resendsms")]
        public Logging.Results<BulkSm> resendsms(BulkSm sms)
        {
            MobileEntities context = new MobileEntities();
            repository = new Localdb(context);

            Logging.Results<BulkSm> results = new Logging.Results<BulkSm>();
            try
            {
                Client cc = repository.getclient(sms.Client); // c.FirstOrDefault(o=> o.Client_Code == sms.Client);

                var smsexist = repository.smsexist(sms);
                if (smsexist == null)
                {
                    return new Logging.Results<BulkSm>() { Code = -1, Desc = "sms not found", Contents = smsexist };
                }

                sms.Message_to_send = string.Format("{0}{1}", sms.Message, sms.Message_2);

                switch (cc.Sms_clientvalue)
                {
                    case Sms_client.Africastalking:
                        smsclient = new Africas();
                        break;

                    case Sms_client.zettatel:
                        smsclient = new zetta();
                        break;
                }

                smsclient.sendsms(ref sms);
                results.Contents = sms;
            }
            catch (Exception ex)

            {
                Log.Error("An error occurred: {ErrorMessage}", ex.Message);
                Logging.Logging.ReportError(ex);
            }

            return results;
        }

        [HttpPost]
        [Route("api/smsstatus")]
        public Logging.Results<SmsStatus> smsstatus(SmsStatus sms)
        {
            //MobileNumber=254727555538&DeliveredTime=1685698160924&ErrorCode=0&ReceivedTime=1685698152937&TransactionID=3220410396017576576&Messageid=2ZulEXP4fmn4N7L
            MobileEntities context = new MobileEntities();
            repository = new Localdb(context);
            try
            {
                var smss = repository.where<BulkSm>(d => d.Destination_Id == sms.TransactionID).FirstOrDefault();

                if (smss != null)

                {
                    if (sms.ErrorCode == 0)
                        smss.Status = 2;
                    else
                    {
                        smss.Status = sms.ErrorCode;
                    }
                }

                return new Logging.Results<SmsStatus>();
            }
            catch (Exception ex)

            {
                Log.Error("Sms status", ex);
                return new Results<SmsStatus>() { Code = -1, Desc = ex.Message };
            }
        }

        public static IEnumerable<string> choppedtext(string str, int chunkSize)
        {
            for (int i = 0; i < str.Length; i += chunkSize)
                yield return str.Substring(i, Math.Min(chunkSize, str.Length - i));
            //    return Enumerable.Range(0, str.Length / chunkSize)
            //   .Select(i => str.Substring(i * chunkSize, chunkSize));
        }

        [HttpGet]
        [Route("api/sendsms_get")]
        public HttpResponseMessage sendsms_get(string Phone, string Message, string Client)
        {
            HttpResponseMessage response = new HttpResponseMessage();

            BulkSm sms = new BulkSm();
            ;
            sms.Source_Id = DateTime.Now.Ticks.ToString();
            sms.Phone = Phone;
            sms.Message = Message;
            sms.Client = Client;
            var r = sendsms(sms);

            if (r.Code == 0)
                response.Content = new StringContent("0", Encoding.UTF8, "text/plain");
            else
                response.Content = new StringContent(r.Desc, Encoding.UTF8, "text/plain");

            return response;
        }
    }
}

namespace S_Mobile.Models
{
    public partial class BulkSm
    {
        public string Message_to_send { get; set; }
    }

    public partial class SmsStatus
    {
        public string TransactionID { get; set; }
        public string Messageid { get; set; }
        public int ErrorCode { get; set; }
        public string MobileNumber { get; set; }
        public DateTime ReceivedTime { get; set; }
        public DateTime DeliveredTime { get; set; }
    }
}