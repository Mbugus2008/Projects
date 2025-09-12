using Collection.Items;
using Collection.Transtypes;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;

namespace Collection
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Collect : System.Web.Services.WebService
    {
        private System.Net.NetworkCredential cd;
        public Users.Users_Service Aservice = new Users.Users_Service();
        public Transactions.Transactions_Service Tservice = new Transactions.Transactions_Service();
        public Reversals.Reversals_Service Rservice = new Reversals.Reversals_Service();
       // public Transaction1 .Transactions1_Service Tservice1 = new Transaction1.Transactions1_Service();
        public Members.Members_Service Mservice = new Members.Members_Service();
        public Members2.Members2_Service Mservice2 = new Members2.Members2_Service();
        public Transtypes_Service TTservice = new Transtypes_Service();
        public Mbranch.MBranch mbranch = new Mbranch.MBranch();
        public Vehicles.Vehicles_Service vservice = new Collection.Vehicles.Vehicles_Service();
        public Parcel.Parcel_Service Parcel_Service = new Parcel.Parcel_Service();
        public Credits.Credits_Service cservice = new Credits.Credits_Service();
        public SalesHeader.SalesHeader_Service SalesHeader_Service = new SalesHeader.SalesHeader_Service();
        public SalesLines.SalesLines_Service SalesLines_Service = new SalesLines.SalesLines_Service();
        public Items.Items_Service Items_Service = new Items.Items_Service();
        public Loans.Loans_Service Loans = new Loans.Loans_Service();
        public static Vehicles.Vehicles[] vehicles = null;
        public Daily_Transactions.Daily_Transactions_Service daily_Transactions = new Daily_Transactions.Daily_Transactions_Service();
        public Member_statistics.Member_statistics_Service member_Statistics = new Member_statistics.Member_statistics_Service();
        JsonSerializerSettings dateformat = new JsonSerializerSettings { DateFormatString = "dd/MM/yyyy" };
        JsonSerializerSettings dateformat2 = new JsonSerializerSettings { DateFormatString = "dd-MM-yyyy" };

        public AgentTypes.Agent_Types_Service Agent_Types_Service = new AgentTypes.Agent_Types_Service();
        public Collect()
        {
            string path = Server.MapPath("~/Settings.txt");
            ServerSetting.getsettings(path);
            Logging.Logging.logpath = ServerSetting.logpath;
            cd = new System.Net.NetworkCredential(ServerSetting.user, ServerSetting.pass, ServerSetting.domain);
            Aservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Users",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Aservice.Credentials = cd;
            Aservice.PreAuthenticate = true;

            Tservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transactions",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Tservice.Credentials = cd;
            Tservice.PreAuthenticate = true;
            
            Rservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Reversals",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Rservice.Credentials = cd;
            Rservice.PreAuthenticate = true;

            Mservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Members",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Mservice.Credentials = cd;
            Mservice.PreAuthenticate = true;

            Mservice2.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Members2",
                      ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Mservice2.Credentials = cd;
            Mservice2.PreAuthenticate = true;

            mbranch.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/MBranch",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            mbranch.Credentials = cd;
            mbranch.PreAuthenticate = true;

            TTservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transtypes",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            TTservice.Credentials = cd;
            TTservice.PreAuthenticate = true;

            vservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Vehicles",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            vservice.Credentials = cd;
            vservice.PreAuthenticate = true;

            cservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Credits",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            cservice.Credentials = cd;
            cservice.PreAuthenticate = true; 
            
            SalesHeader_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/SalesHeader",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            SalesHeader_Service.Credentials = cd;
            SalesHeader_Service.PreAuthenticate = true;
            
            SalesLines_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/SalesLines",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            SalesLines_Service.Credentials = cd;
            SalesLines_Service.PreAuthenticate = true;
            
            Items_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Items",
                          ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Items_Service.Credentials = cd;
            Items_Service.PreAuthenticate = true;

            Parcel_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Parcel",
                         ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Parcel_Service.Credentials = cd;
            Parcel_Service.PreAuthenticate = true;


            Agent_Types_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Agent_Types",
                         ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Agent_Types_Service.Credentials = cd;
            Agent_Types_Service.PreAuthenticate = true; 
            
            member_Statistics.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Member_statistics",
                         ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            member_Statistics.Credentials = cd;
            member_Statistics.PreAuthenticate = true;
            
            Loans.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans",
                         ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            Loans.Credentials = cd;
            Loans.PreAuthenticate = true;

            daily_Transactions.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Daily_Transactions",
                                     ServerSetting.server, ServerSetting.Companyname, ServerSetting.Instance, ServerSetting.Port);
            daily_Transactions.Credentials = cd;
            daily_Transactions.PreAuthenticate = true;

        }

        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
      
        String Response = "";
        private void SafeExecutor(Action action)
        {
            SafeExecutor(() => { action(); return 0; });
        }

        private T SafeExecutor<T>(Func<T> action)
        {
            try
            {
                return action();
            }

            catch (Exception ex)
            {
                Response = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            finally
            {
                Context.Response.Output.Write(Response);
            }

            return default(T);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void items(string data)
        {
            SafeExecutor(() =>
            {   
              Response = JsonConvert.SerializeObject(Items_Service.ReadMultiple(new Items_Filter[] { }, null, 0), dateformat);
            });
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Parcels(string data)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Parcel_Service.ReadMultiple(new Parcel.Parcel_Filter[] { }, null, 0), dateformat);
            });
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Transtypes()
        {
            var response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(TTservice.ReadMultiple(new Transtypes_Filter[] { }, null, 10000).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void agenttypes()
        {
            var response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(Agent_Types_Service.ReadMultiple(new  AgentTypes.Agent_Types_Filter[] { }, null, 10000).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void loans()
        {
            var response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(cservice.ReadMultiple(new Credits.Credits_Filter[] { }, null, 10000).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void balances()
        {
            var response = "";
            try
            {
                List<Sms> r = new List<Sms>();
                using (var db = new MobileEntities())
                {
                   r = db.Database.SqlQuery<Sms>("update Incoming set Client = (Select [Client Code] from Clients where [Incoming sms code] = Incoming.[To]) where Incoming.[Client] is null; select b.client as client, case when (select [Charge incoming sms] from Clients where [Client Code] = b.Client)=0 then sum(b.value) else sum(value) - isnull((select count(id) from Incoming i where i.Client = b.client), 0)    end as balance, case when(select[Charge incoming sms] from Clients where [Client Code] = b.Client) = 0 then Abs(isnull((select sum(Value) from BulkSms where CONVERT(VARCHAR(10),Datetime,111) = CONVERT(VARCHAR(10), Getdate(), 111) and Client = b.Client and Value<0 ),0))  else Abs(isnull((select sum(Value) from BulkSms where CONVERT(VARCHAR(10), Datetime, 111) = CONVERT(VARCHAR(10), Getdate(), 111) and Client = b.Client and Value < 0), 0)) +Abs(isnull((select count(Id) from Incoming where CONVERT(VARCHAR(10), Datetime, 111) = CONVERT(VARCHAR(10), Getdate(), 111) and Client = b.Client), 0)) end as SentToday from BulkSms b  group by Client order by Client").ToList();

                    Sms t = new Sms();
                    t.client = "TOTAL";
                    t.balance = r.Sum(o => o.balance);
                    t.SentToday = r.Sum(o => o.SentToday);

                    r.Add(t);
                    //                  r = db.BulkSms
                    //.GroupBy(m => m.Client)
                    //.Select(m => new Sms { client = m.Key, balance = (double)m.Sum(v => v.Value) })
                    //.OrderByDescending(m => m.client).ToList();

                    //                  foreach (var item in r)
                    //                  {
                    //                      var fg = db.BulkSms.Where(o => o.Client == item.client).ToArray();
                    //                      var rr = fg.Where(o => o.Datetime.Value.Date == DateTime.Now.Date && o.Value < 0).Select(l => l.Value)
                    //                          .DefaultIfEmpty(0)
                    //                          .Sum();
                    //                      item.SentToday = (double)(rr * -1);

                    //                  }
                }
                response = new JavaScriptSerializer().Serialize(r);
            }
            catch (Exception ex)
            {
                response = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void addclient(string data)
        {
            results r = new results();
            var response = "";
            try
            {
                Sms c = JsonConvert.DeserializeObject<Sms>(data);
                using (var db = new MobileEntities())
                {
                    var cc = db.Clients.FirstOrDefault(o => o.Client_Code == c.client);
                    if (cc == null)
                    {
                        Client cl = new Client();
                        cl.Client_Code = c.client;
                        cl.Client_Name = c.client;
                        cl.Active = true;
                        db.Clients.Add(cl);

                        db.SaveChanges();
                        BulkSm b = new BulkSm
                        {
                            Source_Id = string.Concat(c.client, DateTime.Now.Ticks.ToString()),
                            Client = c.client,
                            Value = (int)c.balance,
                            Phone = c.client,
                            Datetime = DateTime.Now,
                            Status = 1
                        };
                        db.BulkSms.Add(b);
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                response = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            response = new JavaScriptSerializer().Serialize(r);
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void addsms(string data)
        { results r = new results();
            var response = "";
            try
            {
               Sms c = JsonConvert.DeserializeObject<Sms>(data);
                using (var db = new MobileEntities())
                {
                    BulkSm b = new BulkSm { 
                    Source_Id=string.Concat(c.client, DateTime.Now.Ticks.ToString()),
                    Client = c.client,
                    Value =(int) c.balance,
                    Phone = c.client,
                    Datetime = DateTime.Now,
                    Status =1
                    };
                    db.BulkSms.Add(b);
                    db.SaveChanges();
                    response = "Sms Updated";
                }
            }
            catch (Exception ex)
            {
                response = ex.Message;
                Logging.Logging.ReportError(ex);
            } 
            //response = new JavaScriptSerializer().Serialize(r);
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Vehicles()
        {
            Logging.Logging.LogEntryOnFile(vservice.Url);
            var response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { }, null, 0).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Vehiclesdetails( string vehicleno)
        {
            Logging.Logging.LogEntryOnFile(vservice.Url);
            var response = string.Empty;
            try
            {
                response = JsonConvert.SerializeObject(vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { new Vehicles.Vehicles_Filter {Criteria=vehicleno,Field = Collection.Vehicles.Vehicles_Fields.Vehicle_Number } }, null, 0).FirstOrDefault(),dateformat);
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void member_Vehicles( string memberno)
        {
            Logging.Logging.LogEntryOnFile(vservice.Url);
            var response = string.Empty;
            try
            {
                response = JsonConvert.SerializeObject(vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { new Vehicles.Vehicles_Filter {Criteria= memberno, Field = Collection.Vehicles.Vehicles_Fields.Code } }, null, 0).ToList(),dateformat);
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void members()
        {
            var response = string.Empty;
            try
            {
                vehicles = vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { }, null, 0);

                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
               
                response = JsonConvert.SerializeObject(Mservice.ReadMultiple(new Members.Members_Filter[] { }, null, 0).ToList(), dateformat);
       

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }[WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getmember(string No)
        {
            var response = string.Empty;
            try
            {
                //vservice.Timeout = 60000;
                //Mservice.Timeout = 60000;
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles"));
                //vehicles = vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { }, null, 0);
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles 2"));

                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
                var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
                response = JsonConvert.SerializeObject(Mservice.Read(No), dateTimeConverter);
                            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void TransactionDate()
        {
            Context.Response.Output.Write(DateTime.Now.Date);

        }
            [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void keymembers(string key)
        {
            var response = string.Empty;
            try
            {
                //vservice.Timeout = 60000;
                //Mservice.Timeout = 60000;
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles"));
                //vehicles = vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { }, null, 0);
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles 2"));

                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
                var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
                response = JsonConvert.SerializeObject(Mservice.ReadMultiple(new Members.Members_Filter[] { }, key, 50).ToList(), dateTimeConverter);
                            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getmember2(string No)
        {
            var response = string.Empty;
            try
            {
                No = No.PadLeft(5, '0');
                Members.Members m = Mservice.Read(No);
                if (m != null)
                {
                    m.statistics = member_Statistics.Read(m.No);
                    m.loans = Loans.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = m.No, Field = Collection.Loans.Loans_Fields.Client_Code } }, null, 0);
                    m.Total_loans = m.loans.Count();
                   // m.Todays_Total =(double) m.vehicles.Sum(o => o.Todays_Collection);
                    m.loans_Todays_Total = (double)m.loans.Sum(o=> o.Paid_Today);
                    m.Total_vehicles = m.vehicles.Count();

                }


                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
                var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
                response = JsonConvert.SerializeObject(m , dateTimeConverter);


            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getdailytrans(string No)
        {
            var response = string.Empty;
            List<Daily_Transactions.Daily_Transactions> dl = new List<Daily_Transactions.Daily_Transactions>();
            try
            {
                No = No.PadLeft(5, '0');
                dl = daily_Transactions.ReadMultiple(new Collection.Daily_Transactions.Daily_Transactions_Filter[] { new Daily_Transactions.Daily_Transactions_Filter {Criteria = No,Field = Collection.Daily_Transactions.Daily_Transactions_Fields.Account } },null,10).ToList();
            
                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
                var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
                response = JsonConvert.SerializeObject(dl, dateTimeConverter);


            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Querymember(string No)
        {
            //var response = string.Empty;
            //Logging.Results results = new Logging.Results();
            //try
            //{
            //    No = No.PadLeft(5, '0');
            //    Members.Members m = Mservice.Read(No);

            //    if (m != null)
            //    {
            //        if (string.IsNullOrEmpty(m.Password))

            //        {
            //            if (string.IsNullOrEmpty(m.Phone_No))
            //            {
            //                results.Code = -1;
            //                results.Desc = "Your phone no is not set in the specified account";

            //            }
            //            else
            //            {
            //                var p = new Random().Next(1000, 9999).ToString();
            //                m.Password = p;
            //                results.content = m;
            //                mbranch.Sendsms("App", m.Phone_No, "Your App start pin is " + p, m.No);
            //                results.Code = 0;
            //                results.Desc = "A start pin has been sent to you Phone, kindly use it to change your password";

            //            }
            //        }
            //        else
            //        {
            //            m.statistics = member_Statistics.Read(m.No);
            //            m.loans = Loans.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = m.No, Field = Collection.Loans.Loans_Fields.Client_Code } }, null, 0);
            //            m.Total_loans = m.loans.Count();
            //            m.Todays_Total = (double)m.vehicles.Sum(o => o.Todays_Collection);
            //            m.loans_Todays_Total = (double)m.loans.Sum(o => o.Paid_Today);
            //            m.Total_vehicles = m.vehicles.Count();
            //        }
            //    }
            //    results.content = m;

            //}
            //catch (Exception ex)
            //{
            //    Logging.Logging.ReportError(ex);

            //}
            //finally
            //{
            //    JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
            //    var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
            //    response = JsonConvert.SerializeObject(results, dateTimeConverter);
            //}
            //Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void changepass(string No)
        {
            //var response = string.Empty;
            //Members.Members m = null;
            //Logging.Results results = new Logging.Results();
            //try
            //{
            //    var format = "dd/MM/yyyy"; // your datetime format
            //    var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = format };

            //    m = JsonConvert.DeserializeObject<Members.Members>(No, dateTimeConverter);

            //    //var mm = Mservice.Read(m.No);
            //    mbranch.Changpass(m.No, m.Password);
            //    // if (mm != null)
            //    //{
            //    //    mm.Password = m.Password;
            //    //    mm.Password_Changed = true;
            //    //    mm.Password_ChangedSpecified = true;
            //    //    Mservice.Update(ref mm);
            //    //    m = mm;
            //    //}
            //}
            //catch (Exception ex)
            //{
            //    Logging.Logging.ReportError(ex);
            //    results.Code = -1;
            //    results.Desc = ex.Message;
            //}
            //finally
            //{
            //    JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
            //    var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
            //    response = JsonConvert.SerializeObject(results, dateTimeConverter);
            //}
            //Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void forgotpass(string No)
        {
            //var response = string.Empty;
          
            //Logging.Results results = new Logging.Results();
            //try
            //{
            //    No = No.PadLeft(5, '0');
            //    Members.Members m = Mservice.Read(No);
            //   if (m!=null)
            //    {
            //        if (string.IsNullOrEmpty(m.Phone_No))
            //        {
            //            results.Code = -1;
            //            results.Desc = "Your phone no is not set in the specified account";

            //        }
            //        else
            //        {
            //            var p = new Random().Next(1000, 9999).ToString();
            //            m.Password = p;
            //            results.content = m;
            //            mbranch.Sendsms("App", m.Phone_No, "Your App start pin is " + p, m.No);
            //            results.Code = 0;
            //            results.Desc = "A start pin has been sent to you Phone, kindly use it to change your password";

            //        }
            //    }
              
            //}
            //catch (Exception ex)
            //{
            //    Logging.Logging.ReportError(ex);
            //    results.Code = -1;
            //    results.Desc = ex.Message;
            //}
            //finally
            //{
            //    JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
            //    var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
            //    response = JsonConvert.SerializeObject(results, dateTimeConverter);
            //}
            //Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Getmembers(string key)
        {
            var response = string.Empty;
            try
            {
                //vservice.Timeout = 60000;
                Mservice2.Timeout = 60000;
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles"));
                //vehicles = vservice.ReadMultiple(new Collection.Vehicles.Vehicles_Filter[] { }, null, 0);
                //Logging.Logging.LogEntryOnFile(string.Format("Getting vehicles 2"));

                JavaScriptSerializer jsSerializer = new JavaScriptSerializer() { MaxJsonLength = Int32.MaxValue };
                var dateTimeConverter = new IsoDateTimeConverter { DateTimeFormat = "dd/MM/yyyy" };
                response = JsonConvert.SerializeObject(Mservice2.ReadMultiple(new Members2.Members2_Filter[] { }, key, 100).ToList(), dateTimeConverter);


            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void loginsdevice(string deviceid)
        {
            string response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(Aservice.ReadMultiple(new Users.Users_Filter[] { }, null, 10000).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void logins()
        {
            string response = string.Empty;
            try
            {
                response = new JavaScriptSerializer().Serialize(Aservice.ReadMultiple(new Users.Users_Filter[] { }, null, 10000).ToList());
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void updatemembers(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            Members.Members member;
            try
            {
                member = JsonConvert.DeserializeObject<Members.Members>(data);
                var m = Mservice.Read(member.No);
                if (m != null)
                {
                    m.Phone_No = member.Phone_No;
                    m.ID_No = member.ID_No;
                    Mservice.Update(ref m);
                }
                response = new JavaScriptSerializer().Serialize(m);
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Collections(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            Logging.Logging.LogEntryOnFile(Tservice.Url);
            String response = string.Empty;
            Transactions.Transactions collection;
            try
            {
                collection = JsonConvert.DeserializeObject<Transactions.Transactions>(data);
                collection.AmountSpecified = true;
                collection.Transaction_TypeSpecified = true;
                try
                {
                    string[] date = collection.Date.Split(new char[] { '-' });
                    DateTime d = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]));
                    collection.Transaction_Date = d;
                    collection.Transaction_DateSpecified = true;
                    string[] time = collection.Time.Split(new char[] { ':' });
                    DateTime t = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]), int.Parse(time[0]), int.Parse(time[1]), int.Parse(time[2]));
                    collection.Transaction_Time = t;
                    collection.Transaction_TimeSpecified = true;
                    collection.Creation_time = t;
                    collection.Creation_timeSpecified = true;
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                var c = Tservice.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = collection.Document_No, Field = Transactions.Transactions_Fields.Document_No } }, null, 1);
                if (c.Count() == 0)
                    Tservice.Create(ref collection);
                else
                    Logging.Logging.LogEntryOnFile("Transaction exists: " + collection.Document_No);
                response = new JavaScriptSerializer().Serialize(collection);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            Context.Response.Output.Write(response);
        }

        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public void Collections1(string data)
        //{
        //    Logging.Logging.LogEntryOnFile(data);
        //    Logging.Logging.LogEntryOnFile(Tservice.Url);
        //    String response = string.Empty;
        //    Transaction1.Transactions1 collection;
        //    try
        //    {
        //        collection = JsonConvert.DeserializeObject<Transaction1.Transactions1>(data);
        //        collection.AmountSpecified = true;
        //        collection.Transaction_TypeSpecified = true;
        //        try
        //        {
        //            string[] date = collection.Date.Split(new char[] { '-' });
        //            DateTime d = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]));
        //            collection.Transaction_Date = d;
        //            collection.Transaction_DateSpecified = true;

        //            string[] time = collection.Time.Split(new char[] { ':' });
        //            DateTime t = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]), int.Parse(time[0]), int.Parse(time[1]), int.Parse(time[2]));
        //            collection.Transaction_Time = t;
        //            collection.Transaction_TimeSpecified = true;

        //            collection.Creation_time = t;
        //            collection.Creation_timeSpecified = true;
        //        }
        //        catch (Exception ex)
        //        {
        //            Logging.Logging.ReportError(ex);
        //        }
        //        var c = Tservice1.ReadMultiple(new Transaction1.Transactions1_Filter[] { new Transaction1.Transactions1_Filter { Criteria = collection.Document_No, Field = Transaction1 .Transactions1_Fields.Document_No } }, null, 1);
        //        if (c.Count() == 0)
        //            Tservice1.Create(ref collection);
        //        else
        //            Logging.Logging.LogEntryOnFile("Transaction exists: " + collection.Document_No);
        //        response = new JavaScriptSerializer().Serialize(collection);
        //    }
        //    catch (Exception ex)
        //    {
        //        Logging.Logging.ReportError(ex);
        //    }
        //    Context.Response.Output.Write(response);
        //}



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCollections(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            string response = string.Empty;
            getdata v = null;
            try
            {
                v = JsonConvert.DeserializeObject<getdata>(data);
                string[] date = v.firstdate.Split(new char[] { '-' });
                DateTime d = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]));
                //string[] date2 = v.LastDate.Split(new char[] { '-' });
                //DateTime d2 = new DateTime(int.Parse(date2[2]), int.Parse(date2[1]), int.Parse(date2[0]));
                var c = Tservice.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = v.user, Field = Transactions.Transactions_Fields.Loan_No }, new Transactions.Transactions_Filter { Criteria = d.Date.ToShortDateString(), Field = Transactions.Transactions_Fields.Transaction_Date } }, null, 0).ToList();
                if (!c.Any())
                    c = Tservice.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = v.user, Field = Transactions.Transactions_Fields.Account_No }, new Transactions.Transactions_Filter { Criteria = d.Date.ToShortDateString(), Field = Transactions.Transactions_Fields.Transaction_Date } }, null, 0).ToList();
                foreach (var cc in c)
                {
                    if (string.IsNullOrEmpty(cc.Date))
                    {
                        cc.Date = cc.Transaction_Date.ToString("dd-MM-yyyy");
                        cc.Time = cc.Creation_time.ToString("HH:mm:ss");
                    }
                }
                response = new JavaScriptSerializer().Serialize(c);
            }
            catch (Exception ex)
            {
                Logging.Logging.LogEntryOnFile(ex.Message);
                Logging.Logging.LogEntryOnFile(ex.Source);
                Logging.Logging.LogEntryOnFile(ex.StackTrace);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetallCollections(string data)
        {
            try
            {
                Logging.Logging.LogEntryOnFile($"Request data: {data}");

                // Deserialize input
                var request = JsonConvert.DeserializeObject<getdata>(data);
                if (request == null)
                {
                    throw new ArgumentException("Invalid request data");
                }

                // Parse date safely
                var transactionDate = ParseDate(request.firstdate);

                // Build filters
                var filters = new List<Transactions.Transactions_Filter>
        {
       
            new Transactions.Transactions_Filter
            {
                Field = Transactions.Transactions_Fields.Transaction_Date,
                Criteria = request.firstdate
            }
        };

                // Query transactions
                var transactions = Tservice.ReadMultiple(filters.ToArray(), null, 0).ToList();

              

                // Format transaction dates
                FormatTransactionDates(transactions);

                // Return response
                var response = JsonConvert.SerializeObject(transactions);
                Context.Response.ContentType = "application/json";
                Context.Response.Output.Write(response);
            }
            catch (Exception ex)
            {
                LogError(ex);
                Context.Response.StatusCode = 500;
                Context.Response.Output.Write(JsonConvert.SerializeObject(new { error = ex.Message }));
            }
        }

        private DateTime ParseDate(string dateString)
        {
            try
            {
                var parts = dateString.Split('-');
                if (parts.Length != 3)
                    throw new FormatException("Date must be in dd-MM-yyyy format");

                return new DateTime(
                    int.Parse(parts[2]), // year
                    int.Parse(parts[0]), // month
                    int.Parse(parts[1])  // day
                );
            }
            catch (Exception ex)
            {
                throw new FormatException("Invalid date format. Expected dd-MM-yyyy", ex);
            }
        }

        private void FormatTransactionDates(List<Transactions.Transactions> transactions)
        {
            foreach (var t in transactions)
            {
                if (string.IsNullOrEmpty(t.Date))
                {
                    t.Date = t.Transaction_Date.ToString("dd-MM-yyyy");
                    t.Time = t.Creation_time.ToString("HH:mm:ss");
                }
            }
        }

        private void LogError(Exception ex)
        {
            Logging.Logging.LogEntryOnFile($"Error: {ex.Message}");
            Logging.Logging.LogEntryOnFile($"Source: {ex.Source}");
            Logging.Logging.LogEntryOnFile($"Stack Trace: {ex.StackTrace}");

            if (ex.InnerException != null)
            {
                Logging.Logging.LogEntryOnFile($"Inner Exception: {ex.InnerException.Message}");
            }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetuserCollections(string bookmark,int size)
        {
           
            string response = string.Empty;
            getdata v = null;
            try
            {
             
            }
            catch (Exception ex)
            {
                Logging.Logging.LogEntryOnFile(ex.Message);
                Logging.Logging.LogEntryOnFile(ex.Source);
                Logging.Logging.LogEntryOnFile(ex.StackTrace);
            }
            Context.Response.Output.Write(response);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCollections_byDates(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            string response = string.Empty;
            getdata v = null;
            try
            { DateTime d =   DateTime.Today;
                DateTime d2 = DateTime.Today;
                v = JsonConvert.DeserializeObject<getdata>(data,dateformat2);
                if (String.IsNullOrEmpty(v.firstdate))
                {
                    string[] date = v.firstdate.Split(new char[] { '-' });
                   d = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]));
                }
                if (string.IsNullOrEmpty(v.LastDate))
                {
                    string[] date2 = v.LastDate.Split(new char[] { '-' });
                    d2 = new DateTime(int.Parse(date2[2]), int.Parse(date2[1]), int.Parse(date2[0]));
                }


                var c = Tservice.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = v.user, Field = Transactions.Transactions_Fields.Loan_No }, new Transactions.Transactions_Filter { Criteria = string.Format("{0}..{1}",d.ToShortDateString(),d2.ToShortDateString()), Field = Transactions.Transactions_Fields.Transaction_Date } }, null, 0).ToList();
                foreach (var cc in c)
                {
                    if (string.IsNullOrEmpty(cc.Date))
                    {
                        cc.Date = cc.Transaction_Date.ToString("dd-MM-yyyy");
                        cc.Time = cc.Creation_time.ToString("HH:mm:ss");
                    }
                }
                response = new JavaScriptSerializer().Serialize(c);
            }
            catch (Exception ex)

            {

                Logging.Logging.LogEntryOnFile(ex.Message);
                Logging.Logging.LogEntryOnFile(ex.Source);
                Logging.Logging.LogEntryOnFile(ex.StackTrace);

            }
            Context.Response.Output.Write(response);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetCollection_member(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            string response = string.Empty;
            getdata v = null;
            try
            {
                v = JsonConvert.DeserializeObject<getdata>(data);
                string[] date = v.firstdate.Split(new char[] { '-' });
                DateTime d = new DateTime(int.Parse(date[2]), int.Parse(date[1]), int.Parse(date[0]));
                //string[] date2 = v.LastDate.Split(new char[] { '-' });
                //DateTime d2 = new DateTime(int.Parse(date2[2]), int.Parse(date2[1]), int.Parse(date2[0]));
                var c = Tservice.ReadMultiple(new Transactions.Transactions_Filter[] { new Transactions.Transactions_Filter { Criteria = v.user, Field = Transactions.Transactions_Fields.Account_No }, new Transactions.Transactions_Filter { Criteria = d.Date.ToShortDateString(), Field = Transactions.Transactions_Fields.Transaction_Date } }, null, 0).ToList();
                foreach (var cc in c)
                {
                    if (string.IsNullOrEmpty(cc.Date))
                    {
                        cc.Date = cc.Transaction_Date.ToString("dd-MM-yyyy");
                        cc.Time = cc.Creation_time.ToString("HH:mm:ss");
                    }
                }
                response = new JavaScriptSerializer().Serialize(c);
            }
            catch (Exception ex)

            {

                Logging.Logging.LogEntryOnFile(ex.Message);
                Logging.Logging.LogEntryOnFile(ex.Source);
                Logging.Logging.LogEntryOnFile(ex.StackTrace);

            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Getreversals(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            string response = string.Empty;
            getdata v = null;
            try
            {
                v = JsonConvert.DeserializeObject<getdata>(data);
               
                var c = Rservice.ReadMultiple(new Reversals.Reversals_Filter[] { new Reversals.Reversals_Filter { Criteria = v.user, Field = Reversals.Reversals_Fields.Agent_Code } }, null, 1000) .ToList();
                foreach (var cc in c)
                {
                    if (string.IsNullOrEmpty(cc.Date))
                    {
                        cc.Date = cc.Transaction_Date.ToString("dd-MM-yyyy");
                        cc.Time = cc.Creation_time.ToString("HH:mm:ss");
                    }
                }
                response = new JavaScriptSerializer().Serialize(c);
            }
            catch (Exception ex)

            {

                Logging.Logging.LogEntryOnFile(ex.Message);
                Logging.Logging.LogEntryOnFile(ex.Source);
                Logging.Logging.LogEntryOnFile(ex.StackTrace);

            }
            Context.Response.Output.Write(response);
        }
        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public void sendsms(string phone, string text, string Client)
        //{
        //    Sendsms.Sms s = new Sendsms.Sms();
        // var r =   s.Sendsms(DateTime.Now.Ticks.ToString(), phone, text, Client);

        //    Context.Response.Output.Write(r);
        //}
    }
    public class getdata
    {
        public string firstdate;
        public string LastDate;
        public string user;

    }
}
namespace Collection.Transactions
{
}

namespace Collection.Members
{
    public partial class Members
    {
        public Member_statistics.Member_statistics statistics

        { get            ;
            set;

        }
          public  Loans.Loans[] loans

        { get            ;
            set;

        }
        public double Todays_Total { get; set; }
        public double loans_Todays_Total { get; set; }
         public int Total_vehicles { get; set; }
         public int Total_loans { get; set; }
    }
}
//namespace Collection.Members2
//{
//    public partial class Members2
//    {
//        public Vehicles.Vehicles[] vehicles
//        {
//            get
//            {
//                return Collect.vehicles.Where(o => o.Code == No).ToArray();
//            }

//        }

//    }
//}