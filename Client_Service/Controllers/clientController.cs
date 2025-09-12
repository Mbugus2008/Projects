using Client_Service.Loan_Eligibility;
using Client_Service.Loans;
using Client_Service.Members;
using Client_Service.Memberslist;
using Client_Service.Transactions;
using Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;

namespace Client_Service.Controllers
{

    public class clientController : ApiController
    {

        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();

        public static Members_Service Members_Service = new Members_Service();
        public static Memberslist_Service Memberslist_Service = new Memberslist_Service();
        public static Loans_Service loans_Service = new Loans_Service();
        public static Keywords.Keywords_Service Keywords_Service = new Keywords.Keywords_Service();
        MobileTransactions_Service Transactions_Service = new MobileTransactions_Service();
        public static Applications.MobileApplications_Service Applications_Service = new Applications.MobileApplications_Service();
        public static Loan_Products.Loan_Products_Service Loan_Products = new Loan_Products.Loan_Products_Service();
        public static Loan_Eligibility.Loan_Eligibility_Service Loan_Eligibility = new Client_Service.Loan_Eligibility.Loan_Eligibility_Service();
        Alternate.Alternate alternate = new Alternate.Alternate();

        public clientController()
        {
            try
            {
                string path = System.Web.Hosting.HostingEnvironment.MapPath("~/bin/Settings.config");
                s = s.loadsettings(path);
                cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
                Keywords_Service = new Keywords.Keywords_Service { Url = misc.geturl(s, Keywords_Service.Url), Credentials = cd, PreAuthenticate = true };
                Members_Service = new Members_Service { Url = misc.geturl(s, Members_Service.Url), Credentials = cd, PreAuthenticate = true };
                Memberslist_Service = new Memberslist_Service { Url = misc.geturl(s, Memberslist_Service.Url), Credentials = cd, PreAuthenticate = true };
                loans_Service = new Loans_Service { Url = misc.geturl(s, loans_Service.Url), Credentials = cd, PreAuthenticate = true };
                Transactions_Service = new Transactions.MobileTransactions_Service { Url = misc.geturl(s, Transactions_Service.Url), Credentials = cd, PreAuthenticate = true };
                Applications_Service = new Applications.MobileApplications_Service { Url = misc.geturl(s, Applications_Service.Url), Credentials = cd, PreAuthenticate = true };
                Loan_Products = new Loan_Products.Loan_Products_Service { Url = misc.geturl(s, Loan_Products.Url), Credentials = cd, PreAuthenticate = true };
                Loan_Eligibility = new Loan_Eligibility.Loan_Eligibility_Service { Url = misc.geturl(s, Loan_Eligibility.Url), Credentials = cd, PreAuthenticate = true };

                alternate = new Alternate.Alternate { Url = misc.geturl(s, alternate.Url), Credentials = cd, PreAuthenticate = true };

            }
            catch (Exception ex
             )
            {

                Logging.Logging.ReportError(ex);
            }
        }

        [HttpPost]
        [Route("api/member")]
        public Results member(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results r = new Results();
            try
            {

                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));

                r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(r.content));

                if (r.content == null)
                    r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        } [HttpPost]
        [Route("api/findmember")]
        public Results findmember(Request request)
        {
            Results r = new Results();
            try
            {
                r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = request.Account, Field = Members_Fields.No } }, null, 0).FirstOrDefault();
                if (r.content == null)
                    r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = request.Account, Field = Members_Fields.ID_No } }, null, 0).FirstOrDefault();
                if (request.Account.Length >= 9)
                    request.Account = string.Format("+254{0}", request.Account.Substring(request.Account.Length - 9));
                if (r.content == null)
                    r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = request.Account, Field = Members_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                if (r.content == null)
                    r.content = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = request.Account, Field = Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        public List<Members.Members> getmemberbyPhone(string phone)
        {
            List<Members.Members> m = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.MPESA_Mobile_No } }, null, 0).ToList();


            if (m == null)
                m = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.Phone_No } }, null, 0).ToList();
            return m;
        }

        [HttpPost]
        [Route("api/member2")]
        public Results member2(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results r = new Results();
            try
            {
                Memberslist.Memberslist m = null;

                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));

                m = Memberslist_Service.ReadMultiple(new Memberslist_Filter[] { new Memberslist_Filter { Criteria = phone, Field = Memberslist_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(r.content));

                if (m == null)
                    m = Memberslist_Service.ReadMultiple(new Memberslist_Filter[] { new Memberslist_Filter { Criteria = phone, Field = Memberslist_Fields.Phone_No } }, null, 0).FirstOrDefault();
                if (m != null)
                {
                    depositaccounts(ref m);

                }
                r.content = m;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        private void depositaccounts(ref Memberslist.Memberslist m)
        {
            List<Depositaccounts> acc = new List<Depositaccounts>();
            try
            {
                //Controllers.clientController c = new Controllers.clientController();
                var keywords = Keywords_Service.ReadMultiple(new Keywords.Keywords_Filter[] { }, null, 0);
 Depositaccounts a = new Depositaccounts();
                a.Account = "Mobile";
                a.Name = "Mobile Money";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Mobile_Money;

              

                acc.Add(a);
                 a = new Depositaccounts();
                a.Account = "Deposit";
                a.Name = "Deposit";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Current_Shares;

                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Deposit_Contribution);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }

                acc.Add(a);

                a = new Depositaccounts();
                a.Account = "Toto";
                a.Name = "Toto";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Toto_savings;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Toto_Savings);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);

                a = new Depositaccounts();
                a.Account = "ShareCapital";
                a.Name = "Share capital";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Shares_Capital;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Shares_Capital);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);

                a = new Depositaccounts();
                a.Account = "Xmas";
                a.Name = "Christmas savings";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (double)m.Chrismas_Contribution;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Chrismas_savings);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);

                a = new Depositaccounts();
                a.Account = "Plaza";
                a.Name = "Plaza contribution";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Plaza_Savings;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Plaza_Contribution);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);
                a = new Depositaccounts();
                a.Account = "SavingDrive";
                a.Name = "Dabo Dabo";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Deposit_Drive;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Savings_Drive);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);

                a = new Depositaccounts();
                a.Account = "BBF";
                a.Name = "Burial Benovolent Fund";
                a.Type = Depositaccounts.status.savings;
                a.Balance = (Double)m.Benevolent_Fund;
                if (keywords.Count() > 0)
                {
                    var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.BBF);
                    if (k != null)
                        a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                }
                acc.Add(a);
                var loans = loans_Service.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = m.No, Field = Loans_Fields.Client_Code } }, null, 0);
                m.Loans = loans.ToArray();
                if (loans != null)
                    foreach (var loan in loans)
                    {
                        a = new Depositaccounts();
                        a.Account = loan.Loan_No;
                        a.Name = loan.Loan_Product_Type;
                        a.Type = Depositaccounts.status.loans;
                        a.Balance = (double)(loan.Total_Balance);
                        if (keywords.Count() > 0)
                        {
                            var k = keywords.FirstOrDefault(o => o.Destination_Type == Keywords.Destination_Type.Loan_Repayment && o.Loan_Code == loan.Loan_Product_Type);
                            if (k != null)
                                a.keyword = string.Format("{0}{1}", m.ID_No, k.Keyword);
                        }
                        acc.Add(a);

                    }
                m.DepositAccount = acc.ToArray();
            }

            catch (Exception ex) { Logging.Logging.ReportError(ex); }
        }


        [HttpPost]
        [Route("api/applications")]
        public Results applications(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results r = new Results();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));
                r.content = Applications_Service.ReadMultiple(new Applications.MobileApplications_Filter[] { new Applications.MobileApplications_Filter { Criteria = phone, Field = Applications.MobileApplications_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpGet]
        [Route("api/loanproducts")]
        public Results loanProducts()
        {
            Results r = new Results();
            try
            {
                r.content = Loan_Products.ReadMultiple(new Loan_Products.Loan_Products_Filter[] { new Loan_Products.Loan_Products_Filter { Criteria = "Yes", Field = Client_Service.Loan_Products.Loan_Products_Fields.Available_on_Mobile } }, null, 0);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpGet]
        [Route("api/Tcharges")]
        public Results Tcharges()
        {
            Results r = new Results();
            try
            {

                r.content = 0;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpGet]
        [Route("api/loanproducts2")]
        public Results<List<Loan_Products.Loan_Products>> loanProducts2()
        {
            Results<List<Loan_Products.Loan_Products>> r = new Results<List<Loan_Products.Loan_Products>>();
            try
            {
                r.Contents = Loan_Products.ReadMultiple(new Loan_Products.Loan_Products_Filter[] { new Loan_Products.Loan_Products_Filter { Criteria = "Yes", Field = Client_Service.Loan_Products.Loan_Products_Fields.Available_on_Mobile } }, null, 0).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/balances")]
        public Results balances(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results r = new Results();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));

                var m = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                StringBuilder s = new StringBuilder();

                s.AppendLine(string.Format("Deposits: {0}", m.Current_Shares));
                s.AppendLine(string.Format("Dabo Dabo: {0}", m.Deposit_Drive));
                s.AppendLine(string.Format("Share Capital: {0}", m.Shares_Capital));
                s.AppendLine(string.Format("Toto: {0}", m.Toto_savings));
                s.AppendLine(string.Format("Xmas: {0}", m.Chrismas_Contribution));
                s.AppendLine(string.Format("Wallet: {0}", m.Wallet));
                s.AppendLine(string.Format("Mobile Money: {0}", m.Mobile_Money));

                r.content = s.ToString();

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/eligibility")]
        public Results eligibility(EligibilityRequest request)
        {
            var phone = request.body.phone;
            Results r = new Results();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));

                var m = alternate.Eligibility2(phone, request.body.loantype);

                r.content = m;

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/eligibilitys")]
        public Results<List<Loan_Products.Loan_Products>> eligibilitys(EligibilityRequest request)
        {
            var phone = request.body.phone;
            Results<List<Loan_Products.Loan_Products>> r = new Results<List<Loan_Products.Loan_Products>>();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));
                var lp = loanProducts2();
                foreach (var p in lp.Contents)
                {
                    try
                    {

                        var m = alternate.Eligibility2(phone, p.Code);
                        p.Eligible = true;
                        p.Amount = (double)m;

                    }
                    catch (Exception ex)
                    {
                        p.Eligible = false;
                        p.Comments = ex.Message;
                    }
                }

                r.Contents = lp.Contents; ;





            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/eligibilitywithtopup")]
        public Results<Loan_Eligibility.Loan_Eligibility> eligibilitywithtopup(EligibilityRequest request)
        {
            var phone = request.body.phone;
            Results<Loan_Eligibility.Loan_Eligibility> r = new Results<Loan_Eligibility.Loan_Eligibility>();
            Client_Service.Loan_Eligibility.Loan_Eligibility le = new Client_Service.Loan_Eligibility.Loan_Eligibility();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));
                var m = getmemberbyPhone(phone).FirstOrDefault();

                le = Loan_Eligibility.Read(DateTime.Today, request.body.Code, m.No);
                if (le == null)
                {
                    le = new Client_Service.Loan_Eligibility.Loan_Eligibility();
                    le.Date = DateTime.Today;
                    le.DateSpecified = true;
                    le.Code = request.body.Code;
                    le.Member = m.No;
                    le.Loan_Type = request.body.loantype;

                    le.Phone = phone;
                    le.Eligibility_Status = Client_Service.Loan_Eligibility.Eligibility_Status.Pending;
                    le.Eligibility_StatusSpecified = true;
                    Loan_Eligibility.Create(ref le);
                }

                if (le.Loan_Balance > 0)
                {
                    if (le.Topup_Paid < le.Topup_Installment)
                    {
                        le.Comments = "Top up Loan should atleast be Paid for 1 installment";
                        r.Code = -1;
                        r.Desc = le.Comments;
                        Loan_Eligibility.Update(ref le);
                    }
                }



                r.Contents = le;
            }
            catch (Exception ex)
            {
                le.Eligibility_Status = Client_Service.Loan_Eligibility.Eligibility_Status.Failed;
                le.Eligibility_StatusSpecified = true;
                le.Comments = ex.Message;
                try
                {
                    Loan_Eligibility.Create(ref le);
                }
                catch (Exception ex2)
                {
                    Logging.Logging.ReportError(ex);
                }
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/loanbalances")]
        public Results loanbalances(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results r = new Results();
            try
            {
                phone = phone.Replace(" ", "");
                phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));
                var m = Members_Service.ReadMultiple(new Members_Filter[] { new Members_Filter { Criteria = phone, Field = Members_Fields.MPESA_Mobile_No } }, null, 0).FirstOrDefault();
                StringBuilder s = new StringBuilder();
                foreach (var loan in m.Loans.Where(o => o.Outstanding_Balance + o.Oustanding_Interest > 10))
                {
                    s.AppendLine(string.Format("{0}: {1} \n", loan.Loan_Product_Type, string.Format("{0:0}", loan.Total_Balance)));
                }
                r.content = s.ToString();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/loanlist")]
        public Results<List<Loans.Loans>> loanbalanceslist(ClientRequest request)
        {
            var acc = request.body.ToString();
            Results<List<Loans.Loans>> r = new Results<List<Loans.Loans>>();
            try
            {                
                var m = loans_Service.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = acc, Field = Loans_Fields.Client_Code },new Loans_Filter { Criteria = ">0", Field = Loans_Fields.Outstanding_Balance } }, null, 0).ToList();
              
                r.Contents = m;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        /// <summary>
        /// Deletes an individual Product.
        /// </summary>
        /// <param request="id">The Product id.</param>
        /// <returns></returns>
        [HttpPost]
        [Route("api/sendsms")]

        public Results sendsms(ClientRequest request)
        {
            Alternate.sms s = JsonConvert.DeserializeObject<Alternate.sms>(request.body.ToString()); ;
            Results r = new Results();
            try
            {
                alternate.SendSms("Mobile", s.phone, s.text, false, s.Account);
                r.content = s;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/transactions")]
        public Results transaction(ClientRequest request)
        {
            Transactions.MobileTransactions trans = JsonConvert.DeserializeObject<MobileTransactions>(request.body.ToString());
            Results r = new Results();
            try
            {
                var t = Transactions_Service.Read(trans.Document_No, trans.Transaction_Type);

                if (t == null)
                {

                    trans.AmountSpecified = true;
                    trans.StatusSpecified = true;
                    trans.Status = Status.Pending_Posting;
                    trans.Transaction_DateSpecified = true;
                    trans.Transaction_TypeSpecified = true;
                    trans.Transaction_TimeSpecified = true;

                    Transactions_Service.Create(ref trans);

                    r.content = trans;



                }

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/Gettransactions")]
        public Results<MobileTransactions> gettransaction(Request request)
        {

            Results<MobileTransactions> r = new Results<MobileTransactions>();
            try
            {
                r.Contents = Transactions_Service.ReadMultiple(new MobileTransactions_Filter[] { new MobileTransactions_Filter { Criteria = request.Account, Field = MobileTransactions_Fields.Account_No }, new MobileTransactions_Filter { Criteria = request.Transaction_Type.ToString(), Field = MobileTransactions_Fields.Transaction_Type }, new MobileTransactions_Filter { Criteria = "Pending Posting|Sending Money", Field = MobileTransactions_Fields.Status } }, null, 0).FirstOrDefault();


            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
    }
}
namespace Client_Service.Memberslist
{

    public partial class Memberslist
    {
        public Depositaccounts[] DepositAccount
        {
            get; set;
        }

        public Loans.Loans[] Loans
        {
            get; set;
        }

    }
}


namespace Client_Service.Members
{
    public class Depositaccounts
    {


        public string Account { get; set; }
        public string Name { get; set; }
        public string keyword { get; set; }
        public status Type { get; set; }
        public double Balance { get; set; }

        public enum status
        {

            savings,
            loans
        }

    }
    public partial class Members
    {
        public Depositaccounts[] DepositAccount
        {
            get
            {
                List<Depositaccounts> acc = new List<Depositaccounts>();
                try
                {
                    //Controllers.clientController c = new Controllers.clientController();
                    var keywords = Loan_Keywords;
                    Depositaccounts a = new Depositaccounts();
                    a.Account = "Mobile";
                    a.Name = "Mobile Money";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Mobile_Money;
                    acc.Add(a);
                    
                    a = new Depositaccounts();
                    a.Account = "Wallet";
                    a.Name = "Wallet";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Wallet;
                    acc.Add(a);

                    a = new Depositaccounts();
                    a.Account = "Deposit";
                    a.Name = "Deposit";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Current_Shares;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Deposit_Contribution);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }

                    acc.Add(a);

                    a = new Depositaccounts();
                    a.Account = "Toto";
                    a.Name = "Toto";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Toto_savings;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Toto_Savings);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }
                    acc.Add(a);

                    a = new Depositaccounts();
                    a.Account = "ShareCapital";
                    a.Name = "Share capital";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Shares_Capital;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Shares_Capital);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }
                    acc.Add(a);

                    a = new Depositaccounts();
                    a.Account = "Xmas";
                    a.Name = "Christmas savings";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (double)Chrismas_Contribution;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Chrismas_savings);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }
                    acc.Add(a);

                    a = new Depositaccounts();
                    a.Account = "Plaza";
                    a.Name = "Plaza contribution";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Plaza_Savings;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Plaza_Contribution);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }
                    acc.Add(a);

 a = new Depositaccounts();
                    a.Account = "BBF";
                    a.Name = "Burial Benovolent Fund";
                    a.Type = Depositaccounts.status.savings;
                    a.Balance = (Double)Benevolent_Fund;
                    if (keywords.Count() > 0)
                    {
                        var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.BBF);
                        if (k != null)
                            a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                    }
                    acc.Add(a);

                    if (Loans != null)
                        foreach (var loan in Loans)
                        {
                            a = new Depositaccounts();
                            a.Account = loan.Loan_No;
                            a.Name = loan.Loan_Product_Type;
                            a.Type = Depositaccounts.status.loans;
                            a.Balance = (double)(loan.Total_Balance);
                            if (keywords.Count() > 0)
                            {
                                var k = keywords.FirstOrDefault(o => o.Destination_Type == Destination_Type.Loan_Repayment && o.Loan_Code == loan.Loan_Product_Type);
                                if (k != null)
                                    a.keyword = string.Format("{0}{1}", ID_No, k.Keyword);
                            }
                            acc.Add(a);

                        }

                }
                catch (Exception ex) { Logging.Logging.ReportError(ex); }
                return acc.ToArray();
            }
        }

    }


}
namespace Client_Service.Alternate
{

    public class sms
    {

        public string phone { get; set; }
        public string text { get; set; }
        public string Account { get; set; }
    }

}
namespace Logging
{
    public class Request : ClientRequest
    {
        public string Account { get; set; }
        public int Transaction_Type { get; set; }
    }
}
namespace Client_Service.Loan_Products
{
    public partial class Loan_Products
    {
        public double Amount { get; set; }
        public double Outstanding_Amount { get; set; }

        public bool Eligible { get; set; }
        public string Comments { get; set; }


    }
}