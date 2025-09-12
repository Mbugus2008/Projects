using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;

using Newtonsoft.Json;
using Logging;

using System.Xml.Serialization;
using System.IO;
using System.Net;

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
        public Members.Members_Service Members_Service = new Members.Members_Service();
        public TransHeader.Trans_Header_Service Trans_Header_Service = new TransHeader.Trans_Header_Service();
        public TransLine.Trans_Line_Service Trans_Line_Service = new TransLine.Trans_Line_Service();
        public Groups.Groups_Service Groups_Service = new Groups.Groups_Service();
        public Mobile.Mobile mobile = new Mobile.Mobile();
        public Mpesa.Mpesa_Service mpesa_Service = new Mpesa.Mpesa_Service();
        public Logins.Logins_Service login_service = new Logins.Logins_Service();
        public Loans.Loans_Service Loans_Service = new Loans.Loans_Service();
        public Repayment.Repayment_Service Repayment_Service = new Repayment.Repayment_Service();
        public Transactions.PW_Transactions_Service PW_Transactions_Service = new Transactions.PW_Transactions_Service();
        public Advance_issue.Advance_issue_Service advance_Issue_Service = new Advance_issue.Advance_issue_Service();
        public Non_Cash.Non_Cash_Service Non_Cash_Service = new  Non_Cash.Non_Cash_Service();
        public Group_Loan.Group_Loan_Service Group_Loan_Service = new  Group_Loan.Group_Loan_Service();
        public Loan_Products.Loan_Products_Service Loan_Products_Service = new  Loan_Products.Loan_Products_Service();
        public Devices.Devices_Service Devices_Service = new Devices.Devices_Service();
        Loan_Request.Loan_Request_Service Loan_Request_Service = new Loan_Request.Loan_Request_Service();
        Loan_Req_Guarantors.Loan_Req_Guarantors_Service Loan_Req_Guarantors_Service = new Loan_Req_Guarantors.Loan_Req_Guarantors_Service();

         Allocation_Header.Allocation_Header_Service Allocation_Header_Service = new Allocation_Header.Allocation_Header_Service();
         Allocation_line.Allocation_line_Service allocation_Line_Service = new Allocation_line.Allocation_line_Service();
         Bank_Entries.Bank_Entries_Service Bank_Entries_Service = new Bank_Entries.Bank_Entries_Service();
     
        Sectors.Sectors_Service Sectors_Service = new  Sectors.Sectors_Service ();
        Receipts.Receipts_Service Receipts_Service = new Receipts.Receipts_Service();
        Receipt_Lines.Receipt_Lines_Service Receipt_Lines_Service = new Receipt_Lines.Receipt_Lines_Service();
        Banks.Banks_Service Banks_Service = new Banks.Banks_Service();
        Accounts.Accounts_Service Accounts_Service = new Accounts.Accounts_Service ();



        private string Response = string.Empty;
     
        JsonSerializerSettings dateformat = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };
        public Logging.settings s = new Logging.settings();
        public Collect()
        {
           // createxml();
            string path = Server.MapPath("~/Settings.xml");
            s=s.loadsettings(path);

            System.Security.SecureString accesskey = new System.Security.SecureString();
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);

            System.Net.CredentialCache myCredentials = new System.Net.CredentialCache();
            NetworkCredential netCred = new NetworkCredential(s.navsettings.Username,s.navsettings.pass,s.navsettings.domain);
           
            Members_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Members",
                          s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Members_Service.Credentials = cd;
            Members_Service.PreAuthenticate = true;
            
            Trans_Header_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Trans_Header",
                          s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Trans_Header_Service.Credentials = cd;
            Trans_Header_Service.PreAuthenticate = true;

            Trans_Line_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Trans_Line",
                          s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Trans_Line_Service.Credentials = cd;
            Trans_Line_Service.PreAuthenticate = true;

            Groups_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Groups",
                                      s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Groups_Service.Credentials = cd;
            Groups_Service.PreAuthenticate = true;

            Loans_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans",
                                      s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Loans_Service.Credentials = cd;
            Loans_Service.PreAuthenticate = true;

            PW_Transactions_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/PW_Transactions",
                                      s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            PW_Transactions_Service.Credentials = cd;
            PW_Transactions_Service.PreAuthenticate = true;

            Repayment_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Repayment",
                                      s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            Repayment_Service.Credentials = cd;
            Repayment_Service.PreAuthenticate = true;

            advance_Issue_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Advance_issue",
                                      s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            advance_Issue_Service.Credentials = cd;
            advance_Issue_Service.PreAuthenticate = true;


            login_service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Logins",
                          s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);

            //myCredentials.Add(new Uri(login_service.Url), "Basic", netCred);
            //login_service.Credentials = myCredentials;

            login_service.Credentials = cd;
            login_service.PreAuthenticate = true;

            mobile.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/Mobile",
                                     s.navsettings.Server, s.navsettings.Companyname, s.navsettings.Instance, s.navsettings.Port);
            mobile.Credentials = cd;
            mobile.PreAuthenticate = true;


            Non_Cash_Service = new Non_Cash.Non_Cash_Service() { Url = geturl(s, Non_Cash_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loan_Products_Service = new  Loan_Products.Loan_Products_Service() { Url = geturl(s, Loan_Products_Service.Url), Credentials = cd, PreAuthenticate = true };
            Group_Loan_Service = new  Group_Loan.Group_Loan_Service() { Url = geturl(s, Group_Loan_Service.Url), Credentials = cd, PreAuthenticate = true };
            Devices_Service = new  Devices.Devices_Service() { Url = geturl(s, Devices_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loan_Request_Service = new Loan_Request.Loan_Request_Service { Url = geturl(s, Loan_Request_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loan_Req_Guarantors_Service = new   Loan_Req_Guarantors.Loan_Req_Guarantors_Service { Url = geturl(s, Loan_Req_Guarantors_Service.Url), Credentials = cd, PreAuthenticate = true };
            Sectors_Service = new   Sectors.Sectors_Service { Url = geturl(s, Sectors_Service.Url), Credentials = cd, PreAuthenticate = true };
            Receipts_Service = new  Receipts.Receipts_Service { Url = geturl(s, Receipts_Service.Url), Credentials = cd, PreAuthenticate = true };
            Receipt_Lines_Service = new Receipt_Lines.Receipt_Lines_Service { Url = geturl(s, Receipt_Lines_Service.Url), Credentials = cd, PreAuthenticate = true };
            Banks_Service = new Banks.Banks_Service { Url = geturl(s, Banks_Service.Url), Credentials = cd, PreAuthenticate = true };
            Accounts_Service = new Accounts.Accounts_Service { Url = geturl(s, Accounts_Service.Url), Credentials = cd, PreAuthenticate = true };
            Allocation_Header_Service = new Allocation_Header.Allocation_Header_Service { Url = geturl(s, Allocation_Header_Service.Url), Credentials = cd, PreAuthenticate = true };
            allocation_Line_Service = new  Allocation_line.Allocation_line_Service{ Url = geturl(s, allocation_Line_Service.Url), Credentials = cd, PreAuthenticate = true };
            Bank_Entries_Service = new Bank_Entries.Bank_Entries_Service{ Url = geturl(s, Bank_Entries_Service.Url), Credentials = cd, PreAuthenticate = true };
           

        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
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
        public void loanguarantors(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                List< Loan_Req_Guarantors.Loan_Req_Guarantors> _Req_Guarantors = JsonConvert.DeserializeObject<List< Loan_Req_Guarantors.Loan_Req_Guarantors>>(data,dateformat);
                List<Loan_Req_Guarantors.Loan_Req_Guarantors> result = new List<Loan_Req_Guarantors.Loan_Req_Guarantors>();
                foreach (var lg in _Req_Guarantors)
                {
                    var gg = lg;
                    var g = Loan_Req_Guarantors_Service.Read(lg.Loan_No, lg.Member_No);
                    if (g != null)
                    {
                        gg.Key = g.Key;
                        Loan_Req_Guarantors_Service.Update(ref gg);
                    }
                    else
                        Loan_Req_Guarantors_Service.Create(ref gg);

                    result.Add(gg);

                 
                }

                Response = JsonConvert.SerializeObject(result, dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void allocations(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Allocation_Header.Allocation_Header allocation_Headers = JsonConvert.DeserializeObject< Allocation_Header.Allocation_Header>(data,dateformat);

               var al =  Allocation_Header_Service.Read(allocation_Headers.No);

                if (al == null)
                {

                    allocation_Headers.Allocation_DateSpecified = true;
                    allocation_Headers.AmountSpecified = true;
                    allocation_Headers.CategorySpecified = true;
                    allocation_Headers.StatusSpecified = true;

                    Allocation_Header_Service.Create(ref allocation_Headers);

                }
                else
                    allocation_Headers = al;

                Response = JsonConvert.SerializeObject(allocation_Headers, dateformat);
                Logging.Logging.LogEntryOnFile(Response);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void allocationlines(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);

                List<Allocation_line.Allocation_line> result = new List<Allocation_line.Allocation_line>();

                List<Allocation_line.Allocation_line> allocation_Lines = JsonConvert.DeserializeObject<List< Allocation_line.Allocation_line>>(data, dateformat);

                foreach (Allocation_line.Allocation_line allline in allocation_Lines)
                {  Allocation_line.Allocation_line all = allline;
                    List<Allocation_line.Allocation_line_Filter> bff = new List<Allocation_line.Allocation_line_Filter>();
                    Allocation_line.Allocation_line_Filter bf = new Allocation_line.Allocation_line_Filter();
                    
                    bf.Criteria = all.No;
                    bf.Field = Allocation_line.Allocation_line_Fields.No;
                    bff.Add(bf);
                  
                    bf = new Allocation_line.Allocation_line_Filter();
                    bf.Criteria = all.Account_No;
                    bf.Field = Allocation_line.Allocation_line_Fields.Account_No;
                    bff.Add(bf);

                    bf = new Allocation_line.Allocation_line_Filter();
                    bf.Criteria = all.Transaction_Type.ToString();
                    bf.Field = Allocation_line.Allocation_line_Fields.Transaction_Type;
                    bff.Add(bf);

                    if (!String.IsNullOrEmpty(all.Loan_No))
                    { 
                        bf = new Allocation_line.Allocation_line_Filter();
                    bf.Criteria = all.Loan_No;
                    bf.Field = Allocation_line.Allocation_line_Fields.Loan_No;
                    bff.Add(bf);
                    }

                    var al = allocation_Line_Service.ReadMultiple(bff.ToArray(), null, 0).FirstOrDefault();

                    if (al == null)
                    {
                        
                        all.Account_TypeSpecified = true;
                        all.AmountSpecified = true;
                        all.Transaction_TypeSpecified = true;
                        if (String.IsNullOrEmpty(all.Loan_No))
                            all.Loan_No = " ";
                        allocation_Line_Service.Create(ref all);
                        result.Add(all);
                    }
                    else {
                        all.Key = al.Key;
                        all.Account_TypeSpecified = true;
                        all.AmountSpecified = true;
                        all.Transaction_TypeSpecified = true;
                        if (String.IsNullOrEmpty(all.Loan_No))
                            all.Loan_No = " ";

                        allocation_Line_Service.Update(ref all);

                        result.Add(all); 
                    
                    }
                }

                mobile.Postallocation(allocation_Lines[0].No);

                 Response = JsonConvert.SerializeObject(result, dateformat);
                Logging.Logging.LogEntryOnFile(Response);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void loanrequest(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                List<Loan_Request.Loan_Request> _Req_Guarantors = JsonConvert.DeserializeObject<List<Loan_Request.Loan_Request>>(data,dateformat);
                List<Loan_Request.Loan_Request> result = new List<Loan_Request.Loan_Request>();
                foreach (var lg in _Req_Guarantors)
                {
                    lg.Amount_AppliedSpecified = true;
                    var gg = lg;
                    var g = Loan_Request_Service.Read(lg.Request_No, lg.Member_Code,lg.Member_Name);
                    if (g != null)
                    {
                        gg.Key = g.Key;
                        Loan_Request_Service.Update(ref gg);
                    }
                    else
                        Loan_Request_Service.Create(ref gg);

                    result.Add(gg);


                }

                Response = JsonConvert.SerializeObject(result, dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void loanadd(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Loans.Loans  loans = JsonConvert.DeserializeObject<Loans.Loans>(data, dateformat);
                  loans.Amount_AppliedSpecified= true;
                  loans.Application_DateSpecified= true;
                  loans.Amount_approvedSpecified= true;
                    var g = Loans_Service.Read(loans.Loan_No);
                    if (g != null)
                    {
                        loans.Key = g.Key;
                    Loans_Service.Update(ref loans);
                    }
                    else
                    Loans_Service.Create(ref loans);


                Response = JsonConvert.SerializeObject(loans, dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Receipts(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
               List< Receipts.Receipts> receipts = JsonConvert.DeserializeObject<List<Receipts.Receipts>>(data,dateformat);
                List<Receipts.Receipts> result = new List<Receipts.Receipts>();
                foreach (var rc in receipts)
                {
                    rc.AmountSpecified = true;
                    rc.Receipt_ModeSpecified = true;
                    rc.Receipt_DateSpecified = true;
                    var rcc = rc;
                    var r = Receipts_Service.Read(rc.No);
                    if (r == null)
                        Receipts_Service.Create(ref rcc);
                    else
                    {
                        rcc.Key = r.Key;
                        Receipts_Service.Update(ref rcc);
                    }
                    result.Add(rcc);
                  
                }
  Response = JsonConvert.SerializeObject(result, dateformat);

            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Receiptslines(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                List<Receipt_Lines.Receipt_Lines> receipt_Lines = JsonConvert.DeserializeObject<List<Receipt_Lines.Receipt_Lines>>(data);
                List<Receipt_Lines.Receipt_Lines> result = new List<Receipt_Lines.Receipt_Lines>();
                foreach (var rc in receipt_Lines)
                {
                    rc.Account_TypeSpecified = true;
                    rc.AmountSpecified = true;
                    rc.Transaction_TypeSpecified = true;
                    var rcc = rc;
                    var r = Receipt_Lines_Service.ReadMultiple( new Receipt_Lines.Receipt_Lines_Filter[] { new Receipt_Lines.Receipt_Lines_Filter { Criteria = rc.No, Field = Receipt_Lines.Receipt_Lines_Fields.No },new Receipt_Lines.Receipt_Lines_Filter {Criteria = rc.Transaction_Type.ToString(),Field= Receipt_Lines.Receipt_Lines_Fields.Transaction_Type }, new Receipt_Lines.Receipt_Lines_Filter { Criteria = rc.Account_No,Field = Receipt_Lines.Receipt_Lines_Fields.Account_No} },null,0);
                    if (r.Count() ==0)

                        Receipt_Lines_Service.Create(ref rcc);
                    else
                    {
                       rcc.Key = r[0].Key; 
                        Receipt_Lines_Service.Update(ref rcc);
                    }

                    result.Add(rcc);
                }
                Response = JsonConvert.SerializeObject(result, dateformat);
            });

        }
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void statement(string memberno)
        {
            SafeExecutor(() =>
            {
                string path = Server.MapPath(String.Format("~/Statements/{0}.pdf",memberno.Replace(@"/","_")));
                mobile.AccountStatement(memberno, path);
                Response = memberno.Replace(@"/", "_");
            });

        }  
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void groupperfomance(string data)
        {
            SafeExecutor(() =>
            {
                Pr pr = JsonConvert.DeserializeObject<Pr>(data);

                string path = Server.MapPath(String.Format("~/Statements/{0}.pdf",pr.Group.Replace(@"/","_")));

                mobile.Performancereport(pr.Group,pr.fromdate,pr.todate, path);
                Response = pr.Group.Replace(@"/", "_");
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Loanproducts()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Loan_Products_Service.ReadMultiple(new Loan_Products.Loan_Products_Filter[] { }, null, 0).ToList());
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Bankentries()
        {
            SafeExecutor(() => {
                //new Bank_Entries.Bank_Entries_Filter {Criteria = "Yes",Field= Bank_Entries.Bank_Entries_Fields.Posted },
                Response = JsonConvert.SerializeObject(Bank_Entries_Service.ReadMultiple(new Bank_Entries.Bank_Entries_Filter [] {  new Bank_Entries.Bank_Entries_Filter {Criteria = "CREDIT", Field= Bank_Entries.Bank_Entries_Fields.Event_Type }, new Bank_Entries.Bank_Entries_Filter {Criteria = "No", Field= Bank_Entries.Bank_Entries_Fields.Distributed }}, null, 5000).ToList(),dateformat);
            });

        }
        //[WebMethod]
        //[ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        //public void Loanguarantors()
        //{
        //    SafeExecutor(() => {
        //        Response = new JavaScriptSerializer().Serialize(Loan_Guarantors_Service.ReadMultiple(new Loan_Guarantors.Loan_Guarantors_Filter [] { }, null, 0).ToList());
        //    });

        //}
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void banks()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Banks_Service.ReadMultiple(new Banks.Banks_Filter[] { }, null, 0).ToList());
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void accounts()
        {
            SafeExecutor(() => {
                Response = new JavaScriptSerializer().Serialize(Accounts_Service.ReadMultiple(new  Accounts.Accounts_Filter[] { }, null, 0).ToList());
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Devices()
        {
            SafeExecutor(() =>
            {
                Response = new JavaScriptSerializer().Serialize(Devices_Service.ReadMultiple(new Collection.Devices.Devices_Filter[] { }, null, 0).ToList());
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Sectors()
        {
            SafeExecutor(() =>
            {
                Response = new JavaScriptSerializer().Serialize(Sectors_Service.ReadMultiple(new Collection.Sectors.Sectors_Filter[] { }, null, 0).ToList());
            });

        }
        void createxml()
        {
            Logging.settings d = new Logging.settings();
            Logging.nav ff = new nav();
            ff.Companyname = "kk";
            d.navsettings = ff;
            XmlSerializer xs = new XmlSerializer(typeof(Logging.settings));

            TextWriter txtWriter = new StreamWriter(@"C:\Serialization.xml");

            xs.Serialize(txtWriter, d);

            txtWriter.Close();

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void allmembers(string bookmarkkey)
        {
            var response = string.Empty;
            try
            {
               
                response = JsonConvert.SerializeObject(Members_Service.ReadMultiple(new Members.Members_Filter[] { },(string.IsNullOrEmpty(bookmarkkey.Trim())? null:bookmarkkey), 1000).ToList(),dateformat);
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
        public void newmembers(string data)
        {
            var response = string.Empty;
            try
            {
             Members.Members members = JsonConvert.DeserializeObject<Members.Members>(data);
                members.No = mobile.MemberNo();
                Members_Service.Create(ref members);
                response = JsonConvert.SerializeObject(members,dateformat);
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
        public void allgroups(string bookmarkkey)
        {
            var response = string.Empty;
            try
            {
                Groups_Service.Timeout = 30000;
                response = JsonConvert.SerializeObject(Groups_Service.ReadMultiple(new Groups.Groups_Filter[] { }, (string.IsNullOrEmpty(bookmarkkey) ? null : bookmarkkey), 100).ToList(),dateformat);
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
        public void loans(string bookmarkkey)
        {
            var response = string.Empty;
            try
            {             
                response = JsonConvert.SerializeObject(Loans_Service.ReadMultiple(new Loans.Loans_Filter[] { }, (string.IsNullOrEmpty(bookmarkkey) ? null : bookmarkkey), 500).ToList(),dateformat);
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
        public void Memberloansloans(string member)
        {
            var response = string.Empty;
            try
            {
                response = JsonConvert.SerializeObject(Loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = member, Field = Loans.Loans_Fields.Member_No} }, null, 0).ToList(), dateformat);
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
        public void logins()
        {
            string response = string.Empty;
           try
            {
                response = new JavaScriptSerializer().Serialize(login_service.ReadMultiple(new Logins.Logins_Filter[] { }, null, 0).ToList());

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
            String response = string.Empty;
            TransHeader.Trans_Header collection;
            try
            {
                collection = JsonConvert.DeserializeObject<TransHeader.Trans_Header>(data);
                collection.Credit_Officer_TotalsSpecified = true;
                collection.Hall_PaidSpecified = true;
                //dd/MM/yy
                var dates = collection.StringDate.Split(new char[] { '/' }, StringSplitOptions.None);
                dates[2] = "20" + dates[0];
                DateTime date = new DateTime(DateTime.Now.Year, Convert.ToInt32(dates[1]), Convert.ToInt32(dates[0]));
                collection.Date = date;
                collection.DateSpecified = true;
                var c = Trans_Header_Service.ReadMultiple(new TransHeader.Trans_Header_Filter [] { new TransHeader.Trans_Header_Filter { Criteria = collection.Transaction_No, Field = TransHeader.Trans_Header_Fields.Transaction_No } }, null, 1);
                if (c.Count() == 0)
                    Trans_Header_Service.Create(ref collection);

                else
                {
                    collection.Key = c[0].Key;
                    Trans_Header_Service.Update(ref collection);
                }
                response = new JavaScriptSerializer().Serialize(collection);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void tlines(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
           TransLine.Trans_Line[] collection=null;
           List<TransLine.Trans_Line> result= new List<TransLine.Trans_Line>();
            try
            {
                collection = JsonConvert.DeserializeObject<TransLine.Trans_Line[]>(data);
                foreach (TransLine.Trans_Line t in collection.ToList())
                {
                    var tt = t;
                    tt.Key = null;
                    tt.FinesSpecified = true;
                    tt.HallSpecified = true;
                    tt.Interest_PaidSpecified = true;
                    tt.Monthly_SavingsSpecified = true;
                    tt.Penalty_ChargedSpecified = true;
                    tt.Principle_PaidSpecified = true;
                    tt.Total_PaidSpecified = true;
                    tt.Expected_PrincipalSpecified = true;
                    tt.Interest_Balance_C_FSpecified = true;
                    tt.Loan_Balance_C_FSpecified = true;
                    tt.Savings__Shares_C_FSpecified = true;
                    tt.Savings_B_FSpecified = true;
                    if (tt.Member_Name == null)
                        tt.Member_Name = " ";
                   
                    var tline = Trans_Line_Service.ReadMultiple(new TransLine.Trans_Line_Filter[] { 
                        new TransLine.Trans_Line_Filter {Criteria = tt.PAWDEP_No,Field = TransLine.Trans_Line_Fields.PAWDEP_No },
                        new TransLine.Trans_Line_Filter {Criteria = tt.Transaction_No,Field = TransLine.Trans_Line_Fields.Transaction_No },
                    
                    } ,null,0);

                    if (tline != null && tline.Count()>0)
                    {
                        tt.Key = tline[0].Key;
                        Trans_Line_Service.Update(ref tt);
                    }
                    else
                        Trans_Line_Service.Create(ref tt);
                    result.Add(tt);
                }

                //Trans_Line_Service.CreateMultiple(ref collection);



                //               foreach (TransLine.Trans_Line t  in collection)
                //               {
                //                   try
                //                   {
                //                       t.saved = true;
                //                       var c = Trans_Line_Service.ReadMultiple(new TransLine.Trans_Line_Filter[] { new TransLine.Trans_Line_Filter { Criteria = t.No.ToString(), Field = TransLine.Trans_Line_Fields.No }, new TransLine.Trans_Line_Filter { Criteria = t.Transaction_No, Field = TransLine.Trans_Line_Fields.Transaction_No } }, null, 1);
                //                       if (c.Count() == 0)
                //                       {
                //                           t.Principle_PaidSpecified = true;
                //                           t.Interest_PaidSpecified = true;
                //                           t.Penalty_ChargedSpecified = true;
                //                           t.Total_PaidSpecified = true;
                //                           t.Monthly_SavingsSpecified = true;
                //                           t.FinesSpecified = true;
                //                           t.HallSpecified = true;
                //                           var d = t;
                //                           Trans_Line_Service.Create(ref d);
                //                       }
                //                   }catch(Exception ex) {

                //                       Logging.Logging.ReportError(ex);
                //                       t.saved = false;
                //                       t.Error = ex.Message;
                //                   }
                //}
                response = new JavaScriptSerializer().Serialize(collection);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            finally { }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void repayment(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            List<Repayment.Repayment> collection;
            List<Repayment.Repayment> results = new List<Repayment.Repayment>();
            try
            {
                collection = JsonConvert.DeserializeObject<List<Repayment.Repayment>>(data);
                foreach (Repayment.Repayment t in collection.ToList())
                {
                    try
                    {
                        t.PenaltySpecified = true;
                        t.Principle_PaidSpecified = true;
                        t.Interest_PaidSpecified = true;
                        t.NoSpecified = true;
                            var d = t;

                        var c = Repayment_Service.Read(t.Transaction_No,t.Group_Code,t.No,t.Member_No,t.Branch_Code,t.Pawdep_No);
                        try
                        {
                            if (c == null)
                                Repayment_Service.Create(ref d);
                            else
                            {
                                d.Key = c.Key;
                                Repayment_Service.Update(ref d);
                            }
                        }
                        catch(Exception ex) { Logging.Logging.ReportError(ex); }
                        results.Add(d);
                    }
                    catch (Exception ex)
                    {

                        Logging.Logging.ReportError(ex);
                     
                    }
                }
                response = new JavaScriptSerializer().Serialize(results);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void grouploan(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            List<Group_Loan.Group_Loan> collection;
            List<Group_Loan.Group_Loan> results = new List<Group_Loan.Group_Loan>();
            try
            {
                collection = JsonConvert.DeserializeObject<List<Group_Loan.Group_Loan>>(data);
                foreach (Group_Loan.Group_Loan t in collection.ToList())
                {
                    try
                    {
                        t.Amount_AppliedSpecified = true;
                        t.Amount_ApprovedSpecified = true;
                        t.Disbursed_AmountSpecified = true;
                        t.NoSpecified = true;
                            var d = t;

                        var c = Group_Loan_Service.Read(t.Transaction_No,t.Group_Code,t.Pawdep_No,t.Loan_No);
                        try
                        {
                            if (c == null)


                                Group_Loan_Service.Create(ref d);


                            else
                            {
                                d.Key = c.Key;
                                Group_Loan_Service.Update(ref d);
                            }
                        }
                        catch(Exception ex) { Logging.Logging.ReportError(ex); }
                        results.Add(d);
                    }
                    catch (Exception ex)
                    {

                        Logging.Logging.ReportError(ex);
                     
                    }
                }
                response = new JavaScriptSerializer().Serialize(results);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void noncash(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            List<Non_Cash.Non_Cash> collection;
            List<Non_Cash.Non_Cash> results = new List<Non_Cash.Non_Cash>();
            try
            {
                collection = JsonConvert.DeserializeObject<List<Non_Cash.Non_Cash>>(data);
                foreach (Non_Cash.Non_Cash t in collection.ToList())
                {
                    try
                    {
                        if (String.IsNullOrEmpty( t.Loan_No))
                            t.Loan_No = " ";
                        t.AmountSpecified = true;
                        t.AutoSpecified = true;
                        t.Transaction_TypeSpecified = true;
                       var d = t;
                      
                        var c = Non_Cash_Service.ReadMultiple(
                            new Non_Cash.Non_Cash_Filter[]
                            {
                                new Non_Cash.Non_Cash_Filter{Criteria = t.Transaction_Code,Field = Non_Cash.Non_Cash_Fields.Transaction_Code},
                                new Non_Cash.Non_Cash_Filter{Criteria = t.Transaction_Type.ToString(),Field = Non_Cash.Non_Cash_Fields.Transaction_Type},
                               
                                new Non_Cash.Non_Cash_Filter{Criteria = t.Pawdep_No,Field = Non_Cash.Non_Cash_Fields.Pawdep_No },  new Non_Cash.Non_Cash_Filter{Criteria = t.Loan_No,Field = Non_Cash.Non_Cash_Fields.Loan_No}
                            },null,0);
                        try
                        {
                            if (c.Count()==0)
                                Non_Cash_Service.Create(ref d);
                            else
                            {
                                d.Key = c[0].Key;
                                Non_Cash_Service.Update(ref d);
                            }
                        }
                        catch(Exception ex) { Logging.Logging.ReportError(ex); }
                        results.Add(d);
                    }
                    catch (Exception ex)
                    {

                        Logging.Logging.ReportError(ex);
                     
                    }
                }
                response = new JavaScriptSerializer().Serialize(results);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void advancesissue(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            List<Advance_issue.Advance_issue> collection;
            List<Advance_issue.Advance_issue> results = new List<Advance_issue.Advance_issue>(); ;
            try
            {
                collection = JsonConvert.DeserializeObject<List<Advance_issue.Advance_issue>>(data);

                foreach (Advance_issue.Advance_issue t in collection.ToList())
                {
                    try
                    {
                     t.AmountSpecified = true;
                            t.Advance_FeesSpecified = true;
                            t.InstalmentsSpecified = true;
                            var d = t;
                        Logging.Logging.LogEntryOnFile(t.Pawdep_No);
                        var c = advance_Issue_Service.ReadMultiple(new Advance_issue.Advance_issue_Filter[] {
                            new Advance_issue.Advance_issue_Filter { Criteria = t.Transaction_No, Field = Advance_issue.Advance_issue_Fields.Transaction_No},
 new Advance_issue.Advance_issue_Filter { Criteria = t.Group_Code, Field = Advance_issue.Advance_issue_Fields.Group_Code},
 new Advance_issue.Advance_issue_Filter { Criteria = t.Pawdep_No, Field = Advance_issue.Advance_issue_Fields.Pawdep_No},
new Advance_issue.Advance_issue_Filter { Criteria = t.Adv_Loan_No, Field = Advance_issue.Advance_issue_Fields.Adv_Loan_No}
                        } ,null,0);
                        if (c.Count() ==0)

                            advance_Issue_Service.Create(ref d);
                        else
                        {

                            d.Key = c[0].Key;
                        
                            advance_Issue_Service.Update(ref d);}
                        results.Add(d);
                    }
                    catch (Exception ex)
                    {

                        Logging.Logging.ReportError(ex);
                     
                    }
                }
                response = new JavaScriptSerializer().Serialize(results);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            Context.Response.Output.Write(response);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Pwtransactions(string data)
        {
            Logging.Logging.LogEntryOnFile(data);
            String response = string.Empty;
            List<Transactions.PW_Transactions> collection;
            List<Transactions.PW_Transactions> results = new List<Transactions.PW_Transactions>();
            try
            {
                collection = JsonConvert.DeserializeObject<List<Transactions.PW_Transactions>>(data);
                foreach (Transactions.PW_Transactions t in collection.ToList())
                {
                    try
                    {
                        t.AmountSpecified = true;
                        t.Transaction_TypeSpecified = true;
                        var d = t;
                        try
                        {
                            var c = PW_Transactions_Service.ReadMultiple(
                             new Transactions.PW_Transactions_Filter[]
                             {
                                new Transactions.PW_Transactions_Filter{Criteria = t.Transaction_No ,Field = Transactions.PW_Transactions_Fields.Transaction_No},
                                new Transactions.PW_Transactions_Filter{Criteria = t.Group_Code ,Field = Transactions.PW_Transactions_Fields.Group_Code},
                                new Transactions.PW_Transactions_Filter{Criteria = t.Transaction_Type.ToString() ,Field = Transactions.PW_Transactions_Fields.Transaction_Type},
                                new Transactions.PW_Transactions_Filter{Criteria = t.Pawdep_No ,Field = Transactions.PW_Transactions_Fields.Pawdep_No}
                             }
                            , null, 0);
                            if (c.Count() == 0)
                                 PW_Transactions_Service.Create(ref d);
                            else
                            {
                                d.Key = c[0].Key;
                                PW_Transactions_Service.Update(ref d);
                            }
                        }
                        catch (Exception ex)
                        {
                            Logging.Logging.ReportError(ex);
                        }
                        results.Add(d);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                }
                response = new JavaScriptSerializer().Serialize(results);
            }
            catch (Exception exx)
            {
                Logging.Logging.ReportError(exx);
            }
            Context.Response.Output.Write(response);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetPaybill()
        {
            string response = string.Empty;
            List<mpesa> m = new List<mpesa>();
            try
            {
                var c = mpesa_Service.ReadMultiple(new Mpesa.Mpesa_Filter[] { }, null, 0);
                if (c.Count() > 0)
                {
                    foreach (var mm in c)
                    {
                        mpesa mp = new mpesa();
                        mp.acc = mm.A_C_No;
                        mp.phone = mm.Phone;
                        mp.Code = mm.Receipt_No;
                        mp.amount = (double)mm.Paid_In;
                        mp.utilized = (double)mm.Amount_utilized;
                        m.Add(mp);
                    }

                }
                response = new JavaScriptSerializer().Serialize(m);

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            Context.Response.Output.Write(response);
        }

        public class mpesa
        {
            public string Code;
            public double amount;
            public string phone;
            public string acc;
            public double utilized;
        }
        public class Results
        {
            public int code = 0;
            public string error_Desc;
        }
    }
    public class Pr
    {
        public DateTime fromdate { get; set; }
        public DateTime todate { get; set; }
        public string Group { get; set; }
    }
}

namespace Collection.TransLine
{

    //public partial class Trans_Line
    //{
    //    public bool saved { get; set; }
    //    public string Error { get; set; }

    //}
}
namespace Collection.Advance {

 public partial class Advance
    {
    //    public bool saved { get; set; }
    //    public string Error { get; set; }

    }
}