using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NavWrapper
{
    using Users;
    using Loans;
    using Members;
    using Receipt_Line;
    using Receipts;
    using Logging;
    using System.Web.Script.Services;
    using System.Web.Script.Serialization;
    using System.Threading;
    using System.Diagnostics;
    using Mobile_Types;
    using Newtonsoft.Json;
    using NavWrapper.Payment_Modes;
    using System.Xml.Serialization;
    using System.Net;

    /// <summary>
    /// Summary description for Wrapper
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class Wrapper : System.Web.Services.WebService
    {
        settings s = new settings();
        private Users_Service Users_Service = new Users_Service();
        public static Loans_Service Loans_Service = new Loans_Service();
        public static Loans.Loans[] loans;
        [XmlElement(Namespace = "Members")]
        private Members_Service Members_Service = new Members_Service();
        public Member_APP.Member_APP_Service Member_APP_Service = new Member_APP.Member_APP_Service();
        private Receipts_Service Receipts_Service = new Receipts_Service();
        private Receipt_Line_Service Receipt_Line_Service = new Receipt_Line_Service();
        private Mobile_Types_Service Mobile_Types_Service = new Mobile_Types_Service();
        private Payment_Modes.Payment_Modes_Service Payment_Modes_Service = new Payment_Modes.Payment_Modes_Service();

        private string Response = string.Empty;
        JsonSerializerSettings dateformat = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd HH:mm:ss" };
        public Wrapper()
        {
          
        
            
            string path = Server.MapPath("~/Settings.xml");
           s= s.loadsettings(path);
            var ss = s.navsettings;
            System.Net.NetworkCredential cd = new System.Net.NetworkCredential(ss.Username, ss.pass, ss.domain);
            Users_Service = new Users_Service() { Url = geturl(s, Users_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loans_Service = new Loans_Service() { Url = geturl(s, Loans_Service.Url), Credentials = cd, PreAuthenticate = true };
            loans = Loans_Service.ReadMultiple(new Loans_Filter[] { }, null, 0);
            Members_Service = new Members_Service() { Url = geturl(s, Members_Service.Url), Credentials = cd, PreAuthenticate = true };
            Member_APP_Service = new Member_APP.Member_APP_Service() { Url = geturl(s, Member_APP_Service.Url), Credentials = cd, PreAuthenticate = true };
            Receipts_Service = new Receipts_Service() { Url = geturl(s, Receipts_Service.Url), Credentials = cd, PreAuthenticate = true };
            Receipt_Line_Service = new Receipt_Line_Service() { Url = geturl(s, Receipt_Line_Service.Url), Credentials = cd, PreAuthenticate = true };
            Mobile_Types_Service = new Mobile_Types_Service() { Url = geturl(s, Mobile_Types_Service.Url), Credentials = cd, PreAuthenticate = true };
            Payment_Modes_Service = new Payment_Modes_Service() { Url = geturl(s, Payment_Modes_Service.Url), Credentials = cd, PreAuthenticate = true };

            //Logging.LogEntryOnFile(String.Format("Source {0}",Context.Request.ServerVariables.Get("REMOTE_HOST")));
            //Logging.LogEntryOnFile(String.Format("Source Name{0}", DetermineCompName(Context.Request.UserHostAddress)));
           
            
        }
        public static string DetermineCompName(string IP)
        {
            IPAddress myIP = IPAddress.Parse(IP);
            IPHostEntry GetIPHost = Dns.GetHostEntry(myIP);
            List<string> compName = GetIPHost.HostName.ToString().Split('.').ToList();
            return compName.First();
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length -1]);
        }
        private string geturl(settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }



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
                Logging.ReportError(ex);
            }
            finally
            {
                Context.Response.Output.Write(Response);
            }

            return default(T);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Users()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Users_Service.ReadMultiple(new Users_Filter[] { }, null, 10000).ToList());
            });
            
        }
         [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AllMembers()
        {
            SafeExecutor(() => {
                
                Response = JsonConvert.SerializeObject(Members_Service.ReadMultiple(new Members_Filter[] { }, null, 10000).ToList(),dateformat);
            });
            
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Members(string key)
        {
            SafeExecutor(() =>
            {

                Response =  JsonConvert.SerializeObject(Members_Service.ReadMultiple(new Members_Filter[] { }, key, 100).ToList(),dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void newmember(string data)
        {
            SafeExecutor(() =>
            {
                Logging.LogEntryOnFile(data);
                
                Members.Members member = JsonConvert.DeserializeObject<Members.Members>(data, dateformat);
                if (member.No==null)
                {
                    var mem = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = member.ID_No, Field = Members_Fields.ID_No } }, null, 0).FirstOrDefault();
                    if (mem == null)
                    {
                        Members.Members mm = new Members.Members();
                        Members_Service.Create(ref mm);
                        member.Key = mm.Key;
                        member.No = mm.No;
                        member.Registration_Date = DateTime.Today;
                        member.Registration_DateSpecified = true;
                        member.Name = member.Name.ToUpper();
                        member.Current_SavingsSpecified = false;
                        member.Current_SharesSpecified = false;
                        member.Shares_RetainedSpecified = false;
                                                Members_Service.Update(ref member);
                    }
                    else member = mem;
                }

                Response = JsonConvert.SerializeObject(member, dateformat);

            });
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void receipts(string data)
        {
            SafeExecutor(() =>
            {
                Logging.LogEntryOnFile(data);
                Receipts.Receipts receipts = JsonConvert.DeserializeObject<Receipts.Receipts> (data, dateformat);
                receipts.Responsibility_Center = "CREDIT";
                var r = Receipts_Service.Read(receipts.No);
                if (r == null)
                    Receipts_Service.Create(ref receipts);
                else
                    receipts = r;
                Response = JsonConvert.SerializeObject(receipts, dateformat) ;

            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void receipts_line(string data)
        {
            SafeExecutor(() =>
            {
                Logging.LogEntryOnFile(string.Format("Request: {0}", data));
                Receipt_Line.Receipt_Line receipt_Line = JsonConvert.DeserializeObject<Receipt_Line.Receipt_Line>(data, dateformat);
                var mt = Mobile_Types_Service.Read(receipt_Line.transtype);
                receipt_Line.AmountSpecified = true;
                if (mt != null)
                {
                    receipt_Line.Account_Type = (Account_Type)mt.Account_type;
                    receipt_Line.Account_TypeSpecified = true;
                    receipt_Line.Transaction_Type = (Receipt_Line.Transaction_Type)mt.Transaction_Type;
                    receipt_Line.Transaction_TypeSpecified = true;
                    if (mt.Account_type == Mobile_Types.Account_type.G_L_Account)
                    {
                        receipt_Line.Remarks = receipt_Line.Account_No;
                        receipt_Line.Account_No = mt.Account;
                    }
                }

                var rl = Receipt_Line_Service.ReadMultiple(new Receipt_Line_Filter[] { new Receipt_Line_Filter { Criteria = receipt_Line.Account_No, Field = Receipt_Line_Fields.Account_No }, new Receipt_Line_Filter { Criteria = receipt_Line.No, Field = Receipt_Line_Fields.No }, new Receipt_Line_Filter { Criteria = receipt_Line.transtype, Field = Receipt_Line_Fields.transtype } }, null, 0);

                if (rl.Count() == 0)
                    Receipt_Line_Service.Create(ref receipt_Line);
                else
                    receipt_Line = rl[0];
                Response = JsonConvert.SerializeObject(receipt_Line, dateformat);
                Logging.LogEntryOnFile(string.Format( "Response: {0}", Response));
            });
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void receipts_lines(string data)
        {
            SafeExecutor(() =>
            {
                Logging.LogEntryOnFile(data);
                List <Receipt_Line.Receipt_Line> receipt_Lines = JsonConvert.DeserializeObject<List<Receipt_Line.Receipt_Line>>(data, dateformat);
                foreach (var receipt_ in receipt_Lines)
                {
                    Receipt_Line.Receipt_Line receipt_Line = receipt_;


                receipt_Line.Account_Type = Account_Type.Member;
                receipt_Line.Account_TypeSpecified = true;
                receipt_Line.AmountSpecified = true;

                var rl = Receipt_Line_Service.ReadMultiple(new Receipt_Line_Filter[] { new Receipt_Line_Filter { Criteria = receipt_Line.Account_No, Field = Receipt_Line_Fields.Account_No }, new Receipt_Line_Filter { Criteria = receipt_Line.No, Field = Receipt_Line_Fields.No }, new Receipt_Line_Filter { Criteria = receipt_Line.transtype, Field = Receipt_Line_Fields.transtype } }, null, 0);

                if (rl.Count() == 0)
                        try
                        {
  Receipt_Line_Service.Create(ref receipt_Line);
                        }
                        catch (Exception)
                        {

                           
                        }
                  
                else
                    receipt_Line = rl[0];
   }


                Response = JsonConvert.SerializeObject(receipt_Lines, dateformat);

            });
        }



        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Transtypes()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Mobile_Types_Service.ReadMultiple(new Mobile_Types_Filter[] { }, null, 0).ToList());
            });
            
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void PaymentModes()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Payment_Modes_Service.ReadMultiple(new Payment_Modes_Filter[] { }, null, 0).ToList());
            });
            
        }
       
    }
}
namespace NavWrapper.Members
{
    public partial class Members
    {
        public Loans.Loans[] loans
        {
            get
            {
                           return Wrapper.loans.Where(o => o.Client_Code == No && o.Balance > 0).ToArray(); 
            }


        }

    }
}