
using Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.ComponentModel.Design.Serialization;
using System.Linq;
using System.Text;
using System.Web;

namespace S_Ussd
{
    namespace ClientData
    {
        public class Metrocrew : Iservice
        {
            Client client;
            Sacco_Memberlist.Members2_Service members = new Sacco_Memberlist.Members2_Service();
            Smses.Smses_Service sms = new Smses.Smses_Service();
            Loan_Products.Loan_Products_Service Loan_Products_Service = new Loan_Products.Loan_Products_Service();
            public string pinmessage => "You new Mobile Pin is ";
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
            public Metrocrew(Client c)
            {
                client  = c;
                members = new Sacco_Memberlist.Members2_Service(Navtosettings());
                sms = new Smses.Smses_Service(Navtosettings());
                Loan_Products_Service = new Loan_Products.Loan_Products_Service(Navtosettings());
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                //Logging.Logging.LogEntryOnFile(restClient.BaseUrl.AbsoluteUri);
            }

            Sacco_Memberlist.Members2 Get_member(string tel)
            {
                tel = tel.Replace(" ", "");
                tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
                return members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0).FirstOrDefault();
            }
            public account Application(string tel)
            {
                account Account = null;
                try
                {
                    tel = tel.Replace(" ", "");
                    tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));

                    var m = members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0).FirstOrDefault();
                    if (m != null)
                    { return new account() { No = m.No, Name = m.Name, memberno = m.No }; }
                }
                catch (Exception ex)
                {

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
                    //Pending Posting,Completed,Failed,Sending Money
                    try
                    {
                        var dd = new Sacco_MobileTransactions.MobileTransactions_Service(Navtosettings()).ReadMultiple(new Sacco_MobileTransactions.MobileTransactions_Filter[] { new Sacco_MobileTransactions.MobileTransactions_Filter { Criteria = acc,Field= Sacco_MobileTransactions.MobileTransactions_Fields.Account_No},new Sacco_MobileTransactions.MobileTransactions_Filter { Criteria = transtype.ToString(),Field= Sacco_MobileTransactions.MobileTransactions_Fields.Transaction_Type},new Sacco_MobileTransactions.MobileTransactions_Filter { Criteria = "Pending Posting|Sending Money", Field= Sacco_MobileTransactions.MobileTransactions_Fields.Status} },null,0).FirstOrDefault();
                        return dd != null;
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
                        var m = members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0).FirstOrDefault();
                        if (m != null)
                        { Account.Add(new account() { No = m.No, Name = m.Name, Balance = (double)m.Current_Savings, memberno = m.No }); }
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
                    // = new MobileTransactions.MobileTransactions_Service(Navtosettings());
                    var a = members.Read(acc);
                    Account = new account(a.No, a.Name, (account.Stat)a.Status, (double)a.Current_Shares, a.No);

                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return Account;
            }
            public account getmember(string id, string phone)
            {
                account Account = null;
                try
                {
                    phone = phone.Replace(" ", "");
                    phone = string.Format("*{0}*", phone.Substring(phone.Length - 9));
                    var m = new Sacco_Memberlist.Members2_Service(Navtosettings()).ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = id, Field = Sacco_Memberlist.Members2_Fields.ID_No }, new Sacco_Memberlist.Members2_Filter { Criteria = phone, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0).FirstOrDefault();
                    if (m != null)
                    {
                        return new account() { No = m.No, Name = m.Name, memberno = m.No };
                    }
                    //else
                    //{
                    //    acc = acc.Replace(" ", "");
                    //    acc = string.Format("+254{0}", acc.Substring(acc.Length - 9));
                    //    m = new Sacco_Memberlist.Members_Service(Navtosettings()).ReadMultiple(new Sacco_Memberlist.Members_Filter[] { new Sacco_Memberlist.Members_Filter { Criteria = acc, Field = Sacco_Memberlist.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
                    //}
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
                    try
                    {

                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }

                    //Account.Add(new account() { No = m.No, Name = "Mobile Money", Balance = (double)m.Mobile_Money, memberno = m.No });
                    //Account.Add(new account() { No = m.No, Name = "Mobile Money", Balance = (double)m.Mobile_Money, memberno = m.No });
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
                Sacco_MobileTransactions.MobileTransactions trans = new Sacco_MobileTransactions.MobileTransactions();
                Logging.Results res = null;
                try
                {
                    trans.Account_No = t.transaction.Account_No;

                    trans.Document_No = t.transaction.Document_No;
                    trans.Transaction_Date = (DateTime)t.transaction.Transaction_Date;
                    trans.Transaction_Time = (DateTime)t.transaction.Transaction_Time;
                    trans.Transaction_Type = (int)t.transaction.Transaction_Type;
                    trans.Transaction_TypeSpecified = true;
                    trans.Account_No_2 = t.transaction.Account_2;
                    trans.Charge = (decimal)(t.transaction.Charge ?? 0);
                    trans.Amount = (decimal)(t.transaction.Amount ?? 0);
                    trans.Mobile_No = t.transaction.MSISDN;

                    trans.Transaction_TimeSpecified = true;
                    trans.ChargeSpecified = true;
                    trans.AmountSpecified = true;
                    trans.Description = t.transaction.Description;
                    trans.Transaction_DateSpecified = true;

                    trans.Name = t.transaction.Account_Name;
                    if (new Sacco_MobileTransactions.MobileTransactions_Service(Navtosettings()).Read(trans.Document_No, trans.Transaction_Type) == null)
                    {
                        new Sacco_MobileTransactions.MobileTransactions_Service(Navtosettings()).Create(ref trans);
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
                    var ms = members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0);

                    if (ms != null)
                    {
                        m.AppendLine($"Deposits:  {ms.Sum(o => o.Current_Shares):N2}");
                        m.AppendLine($"Share Capital: {ms.Sum(o => o.Shares_Retained):N2}");
                        m.AppendLine($"Loans: {ms.Sum(o => o.Outstanding_Balance):N2}");


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
                    var ms = members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No } }, null, 0);
                    StringBuilder b = new StringBuilder();
                    if (ms == null)
                    {
                        b.AppendLine(string.Format("Loans: {0:F2}", ms.Sum(o => o.Outstanding_Balance)));
                    }
                }
                catch (Exception ex)
                {
                    Logging.Logging.ReportError(ex);
                }
                return m;
            }
            public void sendsms(Request r, string Message)
            {

                Alternate.Alternate alternate = new Alternate.Alternate(Navtosettings());
                alternate.SendSms("USSD", r.MSISDN, Message, false, r.transaction.Account_No);


            }
            public string ministatement(Request r)
            {

                return "";
            }

            public Members member(string tel)
            {
                tel = tel.Replace(" ", "");
                tel = string.Format("*{0}*", tel.Substring(tel.Length - 9));
                var d = members.ReadMultiple(new Sacco_Memberlist.Members2_Filter[] { new Sacco_Memberlist.Members2_Filter { Criteria = tel, Field = Sacco_Memberlist.Members2_Fields.Phone_No }, new Sacco_Memberlist.Members2_Filter { Criteria = "Active", Field = Sacco_Memberlist.Members2_Fields.Status } }, null, 0).FirstOrDefault();
                return new Members()
                {
                    No = d.No,
                    Name = d.Name,
                    Current_Shares = d.Current_Shares,
                    Current_Savings = d.Current_Savings,Outstanding_Balance = d.Outstanding_Balance,
                    Phone_No = d.Phone_No,ID_No = d.ID_No,
                };
            }       public LoanProducts[] loanproducts(Request r)
            {

                List<LoanProducts> loan = new List<LoanProducts>();
                var lp = Loan_Products_Service.ReadMultiple(new Loan_Products.Loan_Products_Filter[] { new Loan_Products.Loan_Products_Filter { Criteria = "Yes", Field = Loan_Products.Loan_Products_Fields.Available_on_Mobile } }, null, 0).ToArray();
                foreach (var item in lp)
                {
                    var p = new LoanProducts();
                    p.Code = item.Code;
                    p.Product_Description = item.Product_Description;
                    p.Min_Loan_Amount = item.Min_Loan_Amount;
                    p.Max_Loan_Amount = item.Max_Loan_Amount;
                    p.Auto_Appraise = item.Auto_Appraise;
                    p.Allow_Topup = item.Allow_Topup;
                    loan.Add(p);
                }
                return loan.ToArray();
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
            public Results eligibility(string tel, string loantype)
            {
                double elig = 0;
                var m = member(tel);
                elig = 0.89 * ((double)(m.Current_Shares - m.Outstanding_Balance));
                if (elig < 100)
                {
                    return new Results() { Code = -1, Desc = "You do not qualify for a loan, please try again later" };
                }
                return new Results() { Code = 0, content = elig };
            }

            public Results<LoanEligibility> eligibilitywithtopup(string tel, string loantype, string session)
            {
                return new Results<LoanEligibility>() { };
            }

            public account findmember(string id)
            {
                throw new NotImplementedException();
            }
        }
      
    }  public partial class Members : Sacco_Memberlist.Members2
        {

        }
}
