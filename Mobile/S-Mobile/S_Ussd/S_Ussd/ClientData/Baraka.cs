using Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace S_Ussd
{
    namespace ClientData
    {
        public class Baraka : Iservice
        {
            private RestClient restClient = new RestClient("https://mobile.apsbarakasacco.co.ke:2100/api/");
            public S_mobileClient.Client smobile = new S_mobileClient.Client();
            Client client;
            public bool Allow_withdrawal_to_other_Phone { get { return true; } }
            public string pinmessage => "You new M-Baraka Pin is ";
            public bool confirm_ID => false;
            public bool twostepbalancemenu => true;
            public Baraka()
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                //Logging.Logging.LogEntryOnFile(restClient.BaseUrl.AbsoluteUri);
            }
            public Baraka(Client c)
            {
                client = c;
                restClient = new RestClient(c.Url);
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                //Logging.Logging.LogEntryOnFile(restClient.BaseUrl.AbsoluteUri);
            }
            public Baraka(string url)
            {
                restClient = new RestClient(url);
            }
            public bool PendingTrans(string acc, int transtype)
            {
                MTransactions m = null;
                Results<MTransactions> r = new Results<MTransactions>();
                try
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };

                    try
                    {
                        Logging.Header header = new Logging.Header();
                        Logging.Request request = new Logging.Request();
                        request.header = header;
                        request.Account = acc;
                        request.Transaction_Type = transtype;
                        RestRequest rr = new RestRequest("Gettransactions", Method.POST);
                        rr.AddJsonBody(request);
                        IRestResponse<Logging.Results<MTransactions>> response = restClient.Execute<Logging.Results<MTransactions>>(rr);
                        Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            var d = JsonConvert.DeserializeObject<Logging.Results<MTransactions>>(response.Content);
                            if (d.Code == 0)
                            {
                                m = d.Contents;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m != null;

            }
            public List<account> Accounts(string tel)
            {
                List<account> Account = new List<account>();
                try
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                    Members m = null;
                    try
                    {
                        Logging.Header header = new Logging.Header();
                        Logging.ClientRequest request = new Logging.ClientRequest();
                        request.header = header;
                        request.body = tel;
                        RestRequest rr = new RestRequest("member", Method.POST);
                        rr.AddJsonBody(request);
                        IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                        Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                            if (d.Code == 0)
                            {
                                if (d.content != null)
                                    m = JsonConvert.DeserializeObject<Members>(d.content.ToString());
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                    Account.Add(new account() { No = m.No, Name = m.Name, Balance = (double)m.Mobile_Money, memberno = m.No });
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public account findmember(string acc)
            {
                account Account = new account();
                try
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                   Members m = null;
                    try
                    {
                        Logging.Header header = new Logging.Header();
                        Logging.Request request = new Logging.Request();
                        request.header = header;
                        request.Account = acc;
                        RestRequest rr = new RestRequest("findmember", Method.POST);
                        rr.AddJsonBody(request);
                        IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                        Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                            if (d.Code == 0)
                            {
                                if (d.content != null)
                                    m = JsonConvert.DeserializeObject<Members>(d.content.ToString());
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                    Account = new account() { No = m.No, Name = m.Name, Balance = 0, memberno = m.No };
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public List<account> Withdrawable_Accounts(string tel)
            {
                List<account> Account = new List<account>();
                try
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                    Members m = null;
                    try
                    {
                        Logging.Header header = new Logging.Header();
                        Logging.ClientRequest request = new Logging.ClientRequest();
                        request.header = header;
                        request.body = tel;
                        RestRequest rr = new RestRequest("member", Method.POST);
                        rr.AddJsonBody(request);
                        IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                        Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                            if (d.Code == 0)
                            {
                                if (d.content != null)
                                    m = JsonConvert.DeserializeObject<Members>(d.content.ToString());
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                    Account.Add(new account() { No = m.No, Name = "Mobile Money", Balance = (double)m.Mobile_Money, memberno = m.No });
                    Account.Add(new account() { No = m.No, Name = "Mobile Money", Balance = (double)m.Mobile_Money, memberno = m.No });
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public account Account(string acc)
            {
                account Account = null;
                try
                {
                    var a = smobile.Account(acc);
                    Account = new account(a.noField, a.nameField, (account.Stat)a.account_StatusField, (double)a.balanceField, a.member_NoField);

                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public double Tcharges(double amount, int type)
            {
                double bal = 0;
                return bal;
            }
            public Logging.Results Trans(Request t)
            {
                MTransactions trans = new MTransactions();
                Logging.Results res = null;
                try
                {
                    trans.Account_No = t.transaction.Account_No;
                    trans.Name = t.transaction.Account_Name;
                    trans.Document_No = t.transaction.Document_No;
                    trans.Transaction_Date = (DateTime)t.transaction.Transaction_Date;
                    trans.Transaction_Time = (DateTime)t.transaction.Transaction_Time;
                    trans.Transaction_Type = (int)t.transaction.Transaction_Type;
                    trans.Account_No_2 = t.transaction.Account_2;
                    trans.Charge = (decimal)(t.transaction.Charge ?? 0);
                    trans.Amount = (decimal)(t.transaction.Amount ?? 0);
                    trans.Mobile_No = t.transaction.MSISDN;
                    trans.Transaction_TypeSpecified = true;
                    trans.Transaction_TimeSpecified = true;
                    trans.ChargeSpecified = true;
                    trans.AmountSpecified = true;
                   
                    trans.Description = t.transaction.Description;
                    trans.Transaction_DateSpecified = true;
                    trans.Loan_No = t.transaction.Loan;
                    //trans.Reference = t.transaction.Reference??"";
                    //trans.Source = Source.Mbaraka;
                    trans.SourceSpecified = true;
                    trans.Tranfer_To = (t.transaction.Transfer_To == null ? Tranfer_To.Self : (Tranfer_To)t.transaction.Transfer_To);
                    if (t.transaction.Deposit_type == "loans")
                        trans.Tranfer_To = Tranfer_To.Loan;
                    trans.Tranfer_ToSpecified = true;
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = trans;

                    RestRequest rr = new RestRequest("transactions", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);

                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        res = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (res.Code == 0)
                        {
                            if (res.content != null)
                            {
                                trans = JsonConvert.DeserializeObject<MTransactions>(res.content.ToString());
                                t.transaction.Status = 1;
                            }
                        }
                        else
                        {
                            t.transaction.Status = 2;
                            t.transaction.Comments = res.Desc;
                        }
                    }
                }
                catch (Exception ex) { Logging.Logging.ReportError(ex); }
                return res;
            }
            public List<account> Transfer_to(string tel)
            {
                List<account> Account = new List<account>();
                try
                {
                    System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                   Members m = null;
                    try
                    {
                        Logging.Header header = new Logging.Header();
                        Logging.ClientRequest request = new Logging.ClientRequest();
                        request.header = header;
                        request.body = tel;
                        RestRequest rr = new RestRequest("member", Method.POST);
                        rr.AddJsonBody(request);
                        IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                        Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                        // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                        {
                            var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                            if (d.Code == 0)
                            {
                                if (d.content != null)
                                    m = JsonConvert.DeserializeObject<Members>(d.content.ToString());
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                    foreach (var item in m.DepositAccount)
                    {

                        if (item.Account != "Mobile")
                            Account.Add(new account() { No = item.Account, Name = item.Name, Balance = (double)item.Balance, memberno = m.No, Type = (account.status)item.Type });
                    }

                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public account Application(string tel)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                Applications m = null;
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = tel;

                    RestRequest rr = new RestRequest("applications", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                                m = JsonConvert.DeserializeObject<Applications>(d.content.ToString());
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                account account = null;
                if (m != null)
                {
                    account = new account() { No = m.No, Name = m.Customer_Name };
                }
                return account;
            }
            public Logging.settings Navtosettings()
            {
                throw new NotImplementedException();
            }
            public void sendsms(Request r, string Message)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                String m = "";
                try
                {
                    sms s = new sms();
                    s.phone = r.MSISDN;
                    s.text = Message;
                    s.Account = r.MSISDN;

                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = s;

                    RestRequest rr = new RestRequest("sendsms", Method.POST);
                    rr.AddJsonBody(request);

                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);


                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                                m = d.content.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                
            }
            public string Balances(string tel)
            {

                String m = "";
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = tel;

                    RestRequest rr = new RestRequest("balances", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                                m = d.content.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public string LoanBalances(string tel)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                String m = "";
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = tel;

                    RestRequest rr = new RestRequest("loanbalances", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                                m = d.content.ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public List<Client_Loans> Loanlist(string acc)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                List<Client_Loans> m = new List<Client_Loans>();
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = acc;

                    RestRequest rr = new RestRequest("loanlist", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results<List<Client_Loans>>>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.Contents != null)
                                m = d.Contents;
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public string ministatement(Request r)
            {
                return "";
            }
            public Members member(string tel)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                Members m = null;
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.ClientRequest request = new Logging.ClientRequest();
                    request.header = header;
                    request.body = tel;

                    RestRequest rr = new RestRequest("member", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    Logging.Logging.LogEntryOnFile("Response " + response.StatusCode.ToString());
                    // Logging.Logging.LogEntryOnFile("Response " + response.StatusDescription.ToString());
                    // Logging.Logging.LogEntryOnFile("Response " + response.Content.ToString());

                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                                m = JsonConvert.DeserializeObject<Members>(d.content.ToString());
                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public LoanProducts[] loanproducts(Request r)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                LoanProducts[] m = null;
                try
                {
                    RestRequest rr = new RestRequest("loanproducts", Method.GET);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        var d = JsonConvert.DeserializeObject<Logging.Results>(response.Content);
                        if (d.Code == 0)
                        {
                            if (d.content != null)
                            {
                                m = JsonConvert.DeserializeObject<LoanProducts[]>(d.content.ToString());
                                foreach (var item in m)
                                {
                                    var ln = r.customer.Loans.Where(o => o.Loan_Product == item.Code && (o.Credit_Balance > 0 || o.Interest_Balance > 0)).ToList();

                                    double sum = (double)ln.Sum(o => o.Credit_Balance) + (double)ln.Sum(o => o.Interest_Balance);
                                    if (ln.Any())
                                    {
                                       
                                        if (item.Code == "M-BARAKA")
                                        {
                                            item.Product_Description = item.Product_Description + $" TOPUP (Bal:{sum:N2} )";
                                        } else item.Product_Description = item.Product_Description + $" (Bal:{sum:N2} )";
                                    }
                                }
                            }

                        }
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public Logging.Results eligibility(string tel, string loantype)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                Logging.Results m = null;
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.EligibilityRequest request = new Logging.EligibilityRequest();
                    request.header = header;

                    Logging.Body body = new Logging.Body();
                    body.phone = tel;
                    body.loantype = loantype;
                    request.body = body;

                    RestRequest rr = new RestRequest("eligibility", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        m = JsonConvert.DeserializeObject<Logging.Results>(response.Content);


                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public Logging.Results<LoanEligibility> eligibilitywithtopup(string tel, string loantype, string session)
            {
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                Logging.Results<LoanEligibility> m = null;
                try
                {
                    Logging.Header header = new Logging.Header();
                    Logging.EligibilityRequest request = new Logging.EligibilityRequest();
                    request.header = header;

                    Logging.Body body = new Logging.Body();
                    body.phone = tel;
                    body.loantype = loantype;
                    body.Code = session;
                    request.body = body;


                    RestRequest rr = new RestRequest("eligibilitywithtopup", Method.POST);
                    rr.AddJsonBody(request);
                    IRestResponse<Logging.Results> response = restClient.Execute<Logging.Results>(rr);
                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                    {
                        m = JsonConvert.DeserializeObject<Logging.Results<LoanEligibility>>(response.Content);
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }

            public account getmember(string id, string phone)
            {
                throw new NotImplementedException();
            }
        }

   }
    public partial class Members
    {
        public double Mobile_Money { get; set; }
        public Depositaccounts[] DepositAccount
        { get; set;}
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

    }
    public partial class MTransactions
    {
        public string Key { get; set; }
        public string Document_No { get; set; }
        public System.DateTime Transaction_Date { get; set; }
        public bool Transaction_DateSpecified { get; set; }

        public string Description { get; set; }
        public decimal Amount { get; set; }
        public bool AmountSpecified { get; set; }
        public bool Posted { get; set; }
        public bool PostedSpecified { get; set; }
        public T_Status Status { get; set; }
        public bool StatusSpecified { get; set; }
        public string Reference { get; set; }
        public int Transaction_Type { get; set; }
        public bool Transaction_TypeSpecified { get; set; }
        public System.DateTime Transaction_Time { get; set; }
        public bool Transaction_TimeSpecified { get; set; }
        public string Comments { get; set; }
        public System.DateTime Date_Posted { get; set; }
        public bool Date_PostedSpecified { get; set; }
        public System.DateTime Time_Posted { get; set; }
        public bool Time_PostedSpecified { get; set; }
        public int Entry_No { get; set; }
        public bool Entry_NoSpecified { get; set; }
        public decimal Charge { get; set; }
        public bool ChargeSpecified { get; set; }
        public string Name { get; set; }
        public string Account_No_2 { get; set; }
        public string Keyword { get; set; }
        public string ID_No { get; set; }
        public string Mobile_No { get; set; }
        public Source Source { get; set; }
        public bool SourceSpecified { get; set; }
        public string Type { get; set; }
        public string Loan_No { get; set; }
        public Tranfer_To Tranfer_To { get; set; }
        public bool Tranfer_ToSpecified { get; set; }
    }
    public partial class LoanEligibility
    {
        public string Total_charges
        {
            get
            {
                if (use_percentage)
                    return string.Format("{0} %", Charges);
                else
                    return string.Format("Kes. {0}", Charges);
            }
        }
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