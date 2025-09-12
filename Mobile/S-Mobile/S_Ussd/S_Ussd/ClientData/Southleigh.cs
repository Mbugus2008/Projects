
using Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace S_Ussd.ClientData
{
    public class Southleigh : Iservice
    {

        public S_mobileClient.Client smobile { get; set; } = new S_mobileClient.Client();
        Client client;
        Matatu_Members.Members_Service members = new Matatu_Members.Members_Service();
        Smses.Smses_Service sms = new Smses.Smses_Service();
        Loan_Products.Loan_Products_Service Loan_Products_Service;
        MobileTransactions.MobileTransactions_Service MobileTransactions = new MobileTransactions.MobileTransactions_Service();

        Logging.settings settings1 = new Logging.settings();
        public string pinmessage => "You new Mobile Pin is";
        public bool Allow_withdrawal_to_other_Phone { get { return true; } }
        public bool confirm_ID => true;
        public bool twostepbalancemenu => false;
        public Logging.settings Navtosettings()
        {
            Logging.nav nav = new nav()
            {
                Companyname = client.Company,
                Instance = client.Instance,
                Server = client.IPAddress,
                Port = (int)client.Port,
                Username = client.UserName,
                pass = client.Password,
                domain = client.IPAddress
            };
            Logging.settings settings = new Logging.settings() { navsettings = nav };
            return settings;
        }
        public Southleigh(Client c)
        {
            client = c;
            settings1 = Navtosettings();
            members = new Matatu_Members.Members_Service(settings1);
            sms = new Smses.Smses_Service(settings1);
            Loan_Products_Service = new Loan_Products.Loan_Products_Service(settings1);
            MobileTransactions = new MobileTransactions.MobileTransactions_Service(settings1);
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };

        }

        Matatu_Members.Members Get_member(string tel)
        {
            tel = tel.Replace(" ", "");
            tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
            return members.ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = tel, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
        }
        public account Application(string tel)
        {
            account Account = null;
            try
            {
                tel = tel.Replace(" ", "");
                tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));

                var m = members.ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = tel, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
                if (m != null)
                { return new account() { No = m.No, Name = m.Name, memberno = m.No }; }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                Logging.Logging.ReportError(ex);
            }
            return Account;
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

                try
                {
                    tel = tel.Replace(" ", "");
                    tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
                    var m = members.ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = tel, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
                    if (m != null)
                    { Account.Add(new account() { No = m.No, Name = m.Name, Balance = (double)m.Deposit, memberno = m.No }); }
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
        public account getmember(string acc,string phone)
        {
            account Account = null;
            try
            {

                var m = new Matatu_Members.Members_Service(Navtosettings()).ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = acc, Field = Matatu_Members.Members_Fields.ID_No } }, null, 0).FirstOrDefault();
                if (m != null)
                {
                    return new account() { No = m.No, Name = m.Name, memberno = m.No };
                }
                else
                {
                    acc = acc.Replace(" ", "");
                    acc = string.Format("+254{0}", acc.Substring(acc.Length - 9));
                    m = new Matatu_Members.Members_Service(Navtosettings()).ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = acc, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
                }
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
        public double Tcharges(double amount, int type)
        {
            double bal = 0;
            return bal;
        }
        public Logging.Results Trans(Request t)
        {
            MobileTransactions.MobileTransactions trans = new S_Ussd.MobileTransactions.MobileTransactions();
            Logging.Results res = null;
            try
            {
                trans.Account_No = t.transaction.Account_No;
                trans.Account_Name = t.transaction.Account_Name;
                trans.Document_No = t.transaction.Document_No;
                trans.Document_Date = (DateTime)t.transaction.Transaction_Date;
                trans.Transaction_Time = (DateTime)t.transaction.Transaction_Time;
                trans.Transaction_Type = t.transaction.Transaction_Type.ToString();
                trans.Account_2 = t.transaction.Account_2;
                trans.Charge = (decimal)(t.transaction.Charge ?? 0);
                trans.Amount = (decimal)(t.transaction.Amount ?? 0);
                trans.Telephone_Number = t.transaction.MSISDN;

                trans.Transaction_TimeSpecified = true;
                trans.ChargeSpecified = true;
                trans.AmountSpecified = true;
                trans.Description = t.transaction.Description;
                trans.Document_DateSpecified = true;
                trans.Loan_No = t.transaction.Loan;
                //trans.Reference = t.transaction.Reference??"";
                trans.Source = S_Ussd.MobileTransactions.Source.Fosa;
                trans.SourceSpecified = true;


                MobileTransactions.Create(ref trans);

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
        public string Balances(string tel)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            StringBuilder m = new StringBuilder();
            try
            {
                tel = tel.Replace(" ", "");
                tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
                var ms = members.ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = tel, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0);

                if (ms != null)
                {
                    m.AppendLine(string.Format("Deposits: {0:F2}", ms.Sum(o => o.Deposit)));
                    //m.AppendLine(string.Format("Share Capital: {0:F2}", ms.Sum(o => o.c)));
                    //m.AppendLine(string.Format("Loans: {0:F2}", ms.Sum(o => o.Outstanding_Balance)));


                }

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m.ToString();

        }
        public string LoanBalances(string tel)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            String m = "";
            try
            {
                tel = tel.Replace(" ", "");
                tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
                var ms = members.ReadMultiple(new Matatu_Members.Members_Filter[] { new Matatu_Members.Members_Filter { Criteria = tel, Field = Matatu_Members.Members_Fields.Phone_No } }, null, 0);
                StringBuilder b = new StringBuilder();
                if (ms == null)
                {
                    //b.AppendLine(string.Format("Loans: {0:F2}", ms.Sum(o => o.Outstanding_Balance)));



                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }
        public string sendsms(Request r, string Message)
        {
            Smses.Smses s = new Smses.Smses();
            s.Telephone_No = r.MSISDN;
            s.SMS_Message = Message; s.Account_No = r.transaction.Account_No;
            sms.Create(ref s);
            return s.ToString();
        }
        public string ministatement(Request r)
        {

            return "";
        }

        public Members member(string tel)
        {
            throw new NotImplementedException();
        }
        public List<Client_Loans> Loanlist(string acc)
        {
            System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
            List<Client_Loans> m = new List<Client_Loans>();
            try
            {
               
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }
        public LoanProducts[] loanproducts(Request r)
        {
            return Loan_Products_Service.ReadMultiple(new Loan_Products.Loan_Products_Filter[] { new Loan_Products.Loan_Products_Filter { Criteria = "Yes", Field = Loan_Products.Loan_Products_Fields.Available_on_Mobile } }, null, 0).ToArray();
        }

        public Results eligibility(string tel, string loantype)
        {
            int elig = 0;
            return new Results() { Code = 0, content = elig };
        }

        public Results<LoanEligibility> eligibilitywithtopup(string tel, string loantype, string session)
        {
            return new Results<LoanEligibility>() { };
        }

        void Iservice.sendsms(Request r, string Message)
        {
            throw new NotImplementedException();
        }

        public account findmember(string id)
        {
            throw new NotImplementedException();
        }

    }
}
