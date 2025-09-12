using System;
using System.Collections.Generic;
using System.Text;
using static S_Ussd.enums;
namespace S_Ussd
{

    using Newtonsoft.Json;
    using RestSharp;
    using System;
    using System.Collections.Generic;
    using System.Net;

    public class client
    {
        private static RestClient restClient = new RestClient("https://mobile.apsbarakasacco.co.ke:2100/api/");
        public static S_mobileClient.Client smobile = new S_mobileClient.Client();
        public client()
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            //Logging.Logging.LogEntryOnFile(restClient.BaseUrl.AbsoluteUri);
        }
        public client(string url)
        {
            restClient = new RestClient(url);
        }
        public static List<account> Accounts(string tel)
        {
            List<account> Account = new List<account>();
            try
            {

                var a = smobile.Accounts(tel);
                foreach (S_mobileClient.Accounts ac in a)
                {
                    Account.Add(new account(ac.noField, ac.nameField, (account.Stat)ac.account_StatusField, (double)ac.balanceField, ac.noField));
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return Account;
        }
        public static account Account(string acc)
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

        public static List<loan> Loans(string tel)
        {
            List<loan> Account = new List<loan>();
            try
            {
                var a = smobile.CustomerLoans(tel);
                foreach (S_mobileClient.Loans ac in a)
                {
                    Account.Add(new loan(ac.loan_NoField, ac.loan_Product_TypeField, (loan.Stat)ac.loan_StatusField, (double)ac.outstanding_BalanceField, (double)ac.oustanding_InterestField));
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return Account;
        }

        public IRestResponse<Logging.Results> getdata(string method, object body)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
           Members m = null;
            try
            {
                Logging.Header header = new Logging.Header();
                Logging.ClientRequest request = new Logging.ClientRequest();
                //request.header = header;
                //request. = body;

                RestRequest rr = new RestRequest(method, Method.POST);
                rr.AddJsonBody(JsonConvert.SerializeObject(body));
                return restClient.Execute<Logging.Results>(rr);


                //if (response.StatusCode == System.Net.HttpStatusCode.OK)
                //{
                //    var d = JsonConvert.DeserializeObject<Mobileloans_Rest.Results>(response.Content);
                //    if (d.Code == 0)
                //    {
                //        if (d.content != null)
                //            m = JsonConvert.DeserializeObject<Client_Service.Members.Members>(d.content.ToString());
                //    }
                //}
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return null;
        }
        public  Members member(string tel)
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
        public static Applications application(string tel)
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
            return m;
        }
        public static List<account> MemberAccounts(string memberno)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            List<account> Account = new List<account>();
            try
            {
                var a = smobile.Memberaccounts(memberno);
                foreach (S_mobileClient.Accounts ac in a)
                {
                    Account.Add(new account(ac.noField, ac.nameField, (account.Stat)ac.account_StatusField, (double)ac.balanceField, ac.member_NoField));
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return Account;
        }
        public static string Balances(string tel)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
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
        public static Logging.Results eligibility(string tel,string loantype)
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
        public static Logging.Results<LoanEligibility> eligibilitywithtopup(string tel,string loantype,string session)
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
        public static string LoanBalances(string tel)
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
        public static LoanProducts[] loanproducts()
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
                            m = JsonConvert.DeserializeObject<LoanProducts[]>(d.content.ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }
        public static string sendsms(Request r, string Message)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            String m = "";
            try
            {
               sms s = new sms();
                s.phone = r.MSISDN;
                s.text = Message;
                s.Account = r.transaction.Account_No;

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
            return m;
        }
        public static double Balance(ref Request r)
        {
            double bal = 0;
            try
            {
                var t = Trans(ref r);

                bal = (double)smobile.Account(r.transaction.Account_No).balanceField;
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return bal;
        }
        public static double Tcharges(double amount, Transtype type)
        {
            double bal = 0;
            return bal;
        }
        public static string ministatement(ref Request r)
        {
            StringBuilder mini = new StringBuilder();
            try
            {
                r.transaction.Min_size = 5;
                var t = Trans(ref r);
                // if (t.Code == 0)
                //if (t.Mini != null)
                //       foreach (S_mobileClient.Ministatement min in t.Mini)
                //       {
                //           mini.AppendLine(string.Format("{0}:{1}:{2}:{3}", min.posting_Date.ToShortDateString(), (min.amount > 0 ? "CR" : "DR"), min.amount, min.desc));
                //       }
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            return mini.ToString();
        }
        public static Logging.Results Trans(ref Request t)
        {
           MTransactions trans = new MTransactions();
            Logging.Results res = null;
            try
            {
                trans.Account_No = t.transaction.Account_No;
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
                trans.Reference = t.transaction.Reference;
                trans.Source = Source.Fosa ;
                trans.SourceSpecified = true;
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
    }
}
