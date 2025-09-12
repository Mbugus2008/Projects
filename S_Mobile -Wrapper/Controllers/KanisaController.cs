using Kanisa;
using Kanisa.MemberGroups;
using Logging;
using Microsoft.Ajax.Utilities;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using S_Mobile.Dimensions;
using S_Mobile.Mpesa_Transactions;
using Serilog;
using System;
using System.Collections.Generic;
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
        Kanisa.Data data;
        public KanisaController()
        {
            InstanceCreator<Iclient> creator = new InstanceCreator<Iclient>();
            _iclient = creator.CreateInstance(string.Format("S_Mobile.Controllers.Clients.{0}", WebApiApplication.client));
            data = new Kanisa.Data(WebApiApplication.currentclient);
        }
        [HttpGet]
        [Route("api/facebookphotos")]
        public async Task<IHttpActionResult> GetPhotos()
        {
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

                return Ok(photos);
            }
        }

        public KanisaController(Iclient client)
        {
            _iclient = client;
        }
        [HttpPost]
        [Route("api/customer")]
        public Results<Kanisa.Members.Customers> member(string phoneNo)
        {
            string pn = phoneNo.Substring(phoneNo.Length - 9);

            Kanisa.Members.Customers mb = data.member_service.ReadMultiple(new Kanisa.Members.Customers_Filter[] { new Kanisa.Members.Customers_Filter { Criteria = $"*{pn}*", Field = Kanisa.Members.Customers_Fields.Phone_No } }, null, 0).FirstOrDefault();
         mb.MembersGroups=   mb.Get_Groups(data);
            return new Results<Kanisa.Members.Customers>() { Contents = mb };
        }
        [HttpPost]
        [Route("api/register-customer")]
        public Results<Kanisa.Members.Customers> register_member(Kanisa.Members.Customers cust)
        {
            try
            {
                Member_Groups[] groups = cust.MembersGroups;
            cust.GenderSpecified =  true; 
                cust.Date_of_BirthSpecified= true;
                cust.Baptism_DateSpecified   = true;
                cust.ConfirmedSpecified = true; 
                string pn = cust.Phone_No.Substring(cust.Phone_No.Length - 9);
                var c = data.member_service.ReadMultiple(new Kanisa.Members.Customers_Filter[] { new Kanisa.Members.Customers_Filter { Criteria = $"*{pn}*", Field = Kanisa.Members.Customers_Fields.Phone_No } }, null, 0).FirstOrDefault();

                if (c == null)
                {
                    cust.Phone_No = $"254{cust.Phone_No.Substring(cust.Phone_No.Length - 9)}";
                    data.member_service.Create(ref cust);
                }
                else
                {
                    cust.Key = c.Key;
                    data.member_service.Update(ref cust);
                }
                var gps = data.member_group_service.ReadMultiple(new Kanisa.MemberGroups.Member_Groups_Filter[] { new Kanisa.MemberGroups.Member_Groups_Filter { Criteria = $"{cust.No}", Field = Kanisa.MemberGroups.Member_Groups_Fields.Customer } }, null, 0);
                if (gps != null)
                {
                    foreach (var g in gps)
                    {
                        data.member_group_service.Delete(g.Key);
                    }
                }
                if (groups !=null)
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
               
            }
            catch (Exception ex) {
            return new Results<Kanisa.Members.Customers>() { Code =-1,Desc =  ex.Message };
            }

                return new Results<Kanisa.Members.Customers>() { Contents = cust };
           
            
            }
        [HttpPost]
        [Route("api/events")]
        public Results<Kanisa.AllEvents.Events[] > events()
        {
            return new Results< Kanisa.AllEvents.Events []>() { Contents = data.event_service.ReadMultiple( new Kanisa.AllEvents.Events_Filter [] { },null,0) };
        }
        [HttpPost]
        [Route("api/sermons")]
        public Results<Kanisa.Sermon.Sermons[]> sermons()
        {
            return new Results<Kanisa.Sermon.Sermons[]>() { Contents = data.sermon_service.ReadMultiple(new Kanisa.Sermon.Sermons_Filter[] { }, null, 0) };
        }


        [HttpPost]
        [Route("api/cheques")]
        public Results<Vouchers.Vouchers[]> cheques()
        {
            return new Results<Vouchers.Vouchers[]>() { Contents = new Vouchers.Vouchers_Service(WebApiApplication.s).ReadMultiple(new Vouchers.Vouchers_Filter[] { new Vouchers.Vouchers_Filter { Criteria = "No", Field = Vouchers.Vouchers_Fields.Posted } }, null, 0).Where(o => o.Amount_Spent < o.Payment_Amount).OrderByDescending(o => o.Cheque_No).ToArray() };
        }

        [HttpPost]
        [Route("api/dimensions")]
        public Results<Dimensions.Dimensions[]> Dimensions()
        {
            return new Results<Dimensions.Dimensions[]>() { Contents = new Dimensions_Service(WebApiApplication.s).ReadMultiple(new Dimensions_Filter[] { }, null, 0).ToArray() };
        }

        [HttpPost]
        [Route("api/mpesa")]
        public Results<Mpesa_Transactions.Mpesa_Transactions> Mpesa(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            return _iclient.Mpesa(mpesa);

            //Results<Mpesa_Transactions.Mpesa_Transactions> r = new Results<Mpesa_Transactions.Mpesa_Transactions>();
            //try
            //{
            //    Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());
            //    mpesa.Transaction_DateSpecified = true;
            //    mpesa.Paid_InSpecified = true;
            //    mpesa.TranstypeSpecified = true;
            //    mpesa.Completion_TimeSpecified = true;
            //    mpesa.ChargeSpecified = true;
            //    // 1767371#Jerusalem-O
            //    var mp = new Mpesa_Transactions_Service(WebApiApplication.s).Read(mpesa.Receipt_No);
            //    if (mp == null)
            //    {
            //        new Mpesa_Transactions_Service(WebApiApplication.s).Create(ref mpesa);
            //        //}
            //        //else
            //        //    mpesa.Key = mp.Key;

            //        char[] delimiter = { '#' };
            //        string[] acc = mpesa.A_C_No.Split(delimiter, StringSplitOptions.RemoveEmptyEntries);
            //        switch (acc.Length)
            //        {
            //            case 1:
            //                mpesa.Purpose = "UNDEFINED";
            //                break;
            //            case 2:
            //                char[] del = { '/', '-', '_', ' ' };
            //                string[] dis = acc[1].Split(del, StringSplitOptions.RemoveEmptyEntries);
            //                var districts = new Districts_Service(WebApiApplication.s).ReadMultiple(new Districts_Filter[] { }, null, 0);
            //                if (dis[0].Length > 1)
            //                {
            //                    var dist = districts.Where(o => o.Possible_entry_values.ToLower().Contains(dis[0].ToLower().Trim())).FirstOrDefault();
            //                    if (dist != null)
            //                    {
            //                        mpesa.District = dist.Code;
            //                    }
            //                    else
            //                        mpesa.District = "UNDEFINED";
            //                }
            //                else
            //                {
            //                    mpesa.District = "UNDEFINED";
            //                    var pp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
            //                    var pup = pp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(dis[1])).FirstOrDefault();
            //                    ;//Where(o => o.Possible_entry_values.ToLower().Contains(dis[0].ToLower().Trim())).FirstOrDefault();
            //                    if (pup != null)
            //                    {
            //                        mpesa.Purpose = pup.Code;
            //                    }
            //                    else
            //                        mpesa.Purpose = "UNDEFINED";
            //                }
            //                switch (dis.Length)
            //                {
            //                    case 2:
            //                        var pp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
            //                        var pup = pp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(dis[1])).FirstOrDefault();

            //                        //var ddd =pp.Where(o => o.Possible_entry_values.ToLower().Contains(dis[1].ToLower().Trim())).FirstOrDefault();
            //                        if (pup != null)
            //                        {
            //                            mpesa.Purpose = pup.Code;
            //                        }
            //                        else
            //                            mpesa.Purpose = "UNDEFINED";
            //                        break;
            //                }
            //                break;

            //            default:
            //                districts = new Districts_Service(WebApiApplication.s).ReadMultiple(new Districts_Filter[] { }, null, 0);
            //                var distt = districts.Where(o => o.Possible_entry_values.ToLower().Contains(acc[1].ToLower().Trim())).FirstOrDefault();
            //                if (distt != null)
            //                {
            //                    mpesa.District = distt.Code;
            //                }
            //                else
            //                    mpesa.District = "UNDEFINED";

            //                var ppp = new Purpose_Service(WebApiApplication.s).ReadMultiple(new Purpose_Filter[] { }, null, 0);
            //                var puup = ppp.Where(person => person.Possible_entry_values.Split(',').Select(name => name.Trim()).Contains(acc[2])).FirstOrDefault();

            //                //var ddd =pp.Where(o => o.Possible_entry_values.ToLower().Contains(dis[1].ToLower().Trim())).FirstOrDefault();
            //                if (puup != null) { mpesa.Purpose = puup.Code; }
            //                else
            //                    mpesa.Purpose = "UNDEFINED";
            //                break;
            //        }
            //        //"Paybill - ${tr!.Name} - Ref:${tr!.Receipt_No} - ${tr!.Purpose}";
            //        mpesa.Detaills = String.Format("Paybill - {0} - {1} Ref. {2} -{3} ", mpesa.Purpose, mpesa.Name, mpesa.Receipt_No, mpesa.District);
            //        // new Mpesa_Transactions_Service(WebApiApplication.s).Create(ref mpesa);
            //    }
            //}
            //catch (Exception ex)
            //{
            //    Log.Error(ex, "Kanisa");
            //    Logging.Logging.ReportError(ex);
            //    r.Code = -1;
            //    r.Desc = ex.Message;

            //}
            //finally
            //{
            //    new Mpesa_Transactions_Service(WebApiApplication.s).Create(ref mpesa);
            //    r.Contents = mpesa;

            //}
            //return r;
        }

        [HttpPost]
        [Route("api/payments")]
        public Results<Mpesa_Transactions.Mpesa_Transactions> payments(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            Results<Mpesa_Transactions.Mpesa_Transactions> r = new Results<Mpesa_Transactions.Mpesa_Transactions>();
            try
            {
                Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());
                mpesa.Transaction_DateSpecified = true;
                mpesa.Paid_InSpecified = true;
                mpesa.TranstypeSpecified = true;
                mpesa.Completion_TimeSpecified = true;
                mpesa.ChargeSpecified = true;
                // 1767371#Jerusalem-O
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

            foreach (var m in mpesas)
            {
                var mpesa = m;
                try
                {
                    Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());
                    //mpesa.Transaction_DateSpecified = true;
                    //mpesa.Paid_InSpecified = true;
                    //mpesa.TranstypeSpecified = true;
                    //mpesa.Completion_TimeSpecified = true;
                    //mpesa.ChargeSpecified = true;
                    // 1767371#Jerusalem-O
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
                    r.Code = -1;
                    r.Desc = ex.Message;
                }
            }
            return r;
        }
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
