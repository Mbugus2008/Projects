using Logging;
using Newtonsoft.Json;
using S_Mobile.Members;
using S_Mobile.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using Tovu.Nav;

namespace S_Mobile.Controllers.SaccoClients
{
    public class TrimLine : ISacco
    {
        private System.Net.NetworkCredential cd;
        private TrimData.Members.Members_Service members = new TrimData.Members.Members_Service();
        private TrimData.Loans.Loans_Service loans = new TrimData.Loans.Loans_Service();
        private TrimData.LedgerEntries.LedgerEntries_Service ledgerEntries = new TrimData.LedgerEntries.LedgerEntries_Service();
        private MobileBanking mobile = new MobileBanking();
        public Client clnt { get; set; }

        public TrimLine()
        {
            clnt = new MobileEntities().Clients.Where(o => o.Client_Code == WebApiApplication.client).FirstOrDefault();
            cd = new System.Net.NetworkCredential(clnt.UserName, clnt.Password);
            members = new TrimData.Members.Members_Service
            {
                Url =
                    Logging.misc
                        .geturl(
                            new Logging.nav()
                            {
                                Companyname = clnt.Company,
                                Username = clnt.UserName,
                                pass = clnt.Password,
                                Instance = clnt.Instance
                                ,
                                Server = clnt.IPAddress,
                                Port = (int)clnt.Port
                            },
                            members.Url),
                Credentials = cd,
                PreAuthenticate = true
            };
            loans = new TrimData.Loans.Loans_Service
            {
                Url =
                    Logging.misc
                        .geturl(
                            new Logging.nav()
                            {
                                Companyname = clnt.Company,
                                Username = clnt.UserName,
                                pass = clnt.Password,
                                Instance = clnt.Instance
                                ,
                                Server = clnt.IPAddress,
                                Port = (int)clnt.Port
                            },
                            loans.Url),
                Credentials = cd,
                PreAuthenticate = true
            };
            ledgerEntries = new TrimData.LedgerEntries.LedgerEntries_Service
            {
                Url =
                     Logging.misc
                         .geturl(
                             new Logging.nav()
                             {
                                 Companyname = clnt.Company,
                                 Username = clnt.UserName,
                                 pass = clnt.Password,
                                 Instance = clnt.Instance
                                 ,
                                 Server = clnt.IPAddress,
                                 Port = (int)clnt.Port
                             },
                             ledgerEntries.Url),
                Credentials = cd,
                PreAuthenticate = true
            };
        }

        public Results<mobile_Member> member(string acc)
        {
            Results<mobile_Member> r = new Results<mobile_Member>();

            var member = members.ReadMultiple(new TrimData.Members.Members_Filter[] { new TrimData.Members.Members_Filter { Criteria = acc, Field = TrimData.Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
            if (member != null)
            {
                var lns = loans.ReadMultiple(new TrimData.Loans.Loans_Filter[] { new TrimData.Loans.Loans_Filter { Criteria = member.No, Field = TrimData.Loans.Loans_Fields.Client_Code } }, null, 0);
                List<Loans.Loans_mobile> ls = lns.Select(item =>
                {
                    return new Loans.Loans_mobile()
                    {
                        Loan_No = item.Loan_No,
                        Loan_Name = item.Loan_Product_Type,
                        Outstanding_Balance = item.Outstanding_Balance + item.Oustanding_Interest,
                        Application_Date = item.Application_Date,
                        Installments = item.Installments,
                        InstallmentsSpecified = true,
                        Application_DateSpecified = true,
                        Disbursement_Date = item.Loan_Disbursement_Date,
                        Outstanding_BalanceSpecified = true,
                    };
                }).ToList();
                List<Accounts_Service.Accounts> accounts = new List<Accounts_Service.Accounts>();
                Accounts_Service.Accounts accounts1 = new Accounts_Service.Accounts();
                accounts1.No = "Shares";
                accounts1.Name = "Shares";
                accounts1.Balance = member.Shares_Retained;
                accounts1.BalanceSpecified = true;
                accounts.Add(accounts1);
                accounts1 = new Accounts_Service.Accounts();
                accounts1.No = "Deposits";
                accounts1.Name = "Deposits";
                accounts1.Balance = member.Current_Shares;
                accounts1.BalanceSpecified = true;
                accounts.Add(accounts1);

                accounts1 = new Accounts_Service.Accounts();
                accounts1.No = "Loans";
                accounts1.Name = "Loans";
                accounts1.Balance = member.Outstanding_Balance;
                accounts1.BalanceSpecified = true;
                accounts.Add(accounts1);

                r.Contents = new mobile_Member()
                {
                    No = member.No,
                    Name = member.Name,
                    ID_No = member.ID_No,
                    Loans = ls.ToArray(),
                    Accounts = accounts,
                };
            }
            else { r.Code = -1; r.Desc = "Account Not found"; }

            var json = JsonConvert.SerializeObject(r);

            return r;
        }

        public Results<List<Accounts_Service.Accounts>> Accounts(string Phone)
        {
            Results<List<Accounts_Service.Accounts>> r = new Results<List<Accounts_Service.Accounts>>();
            //try
            //{
            //   r.Contents = accounts.ReadMultiple(new Accounts_Service.Accounts_Filter[] { new Accounts_Service.Accounts_Filter { Criteria = Phone.Phone, Field = Accounts_Service.Accounts_Fields.Member_No } }, null, 0).ToList();
            //}
            //catch (Exception ex)
            //{
            //    Logging.Logging.ReportError(ex);
            //    r.Code = -1;
            //    r.Desc = ex.Message;
            //}
            return r;
        }

        public Results<List<Account_Entries.Account_Entries>> Statement(string acc)
        {
            Results<List<Account_Entries.Account_Entries>> r = new Results<List<Account_Entries.Account_Entries>>();
            var entries = ledgerEntries.ReadMultiple(new TrimData.LedgerEntries.LedgerEntries_Filter[] { new TrimData.LedgerEntries.LedgerEntries_Filter { Criteria = acc, Field = TrimData.LedgerEntries.LedgerEntries_Fields.Customer_No }, new TrimData.LedgerEntries.LedgerEntries_Filter { Criteria = "No", Field = TrimData.LedgerEntries.LedgerEntries_Fields.Reversed } }, null, 0);
            if (entries != null)
            {
                List<Account_Entries.Account_Entries> ls = entries.Select(item =>
                {
                    return new Account_Entries.Account_Entries()
                    {
                        Entry_No = item.Entry_No,
                        Entry_NoSpecified = true,
                        Customer_No = item.Customer_No,
                        Amount = item.Amount,
                        AmountSpecified = true,
                        Document_No = item.Document_No,
                        Posting_Date = item.Posting_Date,
                        Posting_DateSpecified = true,
                        Description = item.Description,
                        Transaction_Type = item.Transaction_Type,
                        Debit = item.Debit_Amount,
                        Credit = item.Credit_Amount,
                        Loan_No = item.Loan_No,
                    };
                }).ToList();

                r.Contents = ls;
            }
            else { r.Code = -1; r.Desc = "Entries Not found"; }

            var json = JsonConvert.SerializeObject(r);

            return r;
        }

        public Results<List<Account_Entries.Account_Entries>> Schedule(string LoanNo)
        {
            throw new NotImplementedException();
        }

        public Results<List<LoanProducts.LoanProducts>> loan_products()
        {
            throw new NotImplementedException();
        }

        public Results<Member_mobile_info.Member_mobile_info> CreateAccount(Member_mobile_info.Member_mobile_info request)
        {
            throw new NotImplementedException();
        }

        public Results<Member_Application.Member_Application> Customer_Registration(Member_Application.Member_Application application)
        {
            throw new NotImplementedException();
        }
    }
}