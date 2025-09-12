using Logging;
using Newtonsoft.Json;
using S_Mobile.Controllers.SaccoClients;
using S_Mobile.Loans;
using S_Mobile.Members;
using S_Mobile.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using Tovu.Nav;

namespace S_Mobile.Controllers.SaccoClients
{
    public class Tovu : ISacco
    {
        private System.Net.NetworkCredential cd;

        private MobileBanking mobile = new MobileBanking();

        public Client clnt { get; set; }

        public Tovu()
        {
            clnt = new MobileEntities().Clients.Where(o => o.Client_Code == WebApiApplication.client).FirstOrDefault();
            cd = new System.Net.NetworkCredential(clnt.UserName, clnt.Password);
            mobile = new MobileBanking
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
                            mobile.Url),
                Credentials = cd,
                PreAuthenticate = true
            };
        }

        public Results<mobile_Member> member(string acc)
        {
            Results<mobile_Member> r = new Results<mobile_Member>();
            string code = "", desc = "";

            mobile.GetMemberProfile(string.Format("+254{0}", acc.Substring(acc.Length - 9)), ref code, ref desc);
            Member member = JsonConvert.DeserializeObject<Member>(desc);
            if (Environment.UserInteractive)
            {
                code = "00";
                //  member = new Member() { MemberNo = "0001", FirstName = "Paul Njoroge" };
            }
            if (code == "00")
            {
                List<Accounts_Service.Accounts> accounts = member.Accounts.Select(item =>
                {
                    decimal.TryParse(item.Balance, out decimal bal);
                    return new Accounts_Service.Accounts
                    {
                        No = item.Code,
                        Name = item.Description,
                        Balance = bal,
                        BalanceSpecified = true
                    };
                }).ToList();

                List<Loans.Loans_mobile> loans = member.Loans.Select(item =>
                {
                    decimal.TryParse(item.Balance, out decimal bal);
                    int.TryParse(item.Installments, out int installments);
                    return new Loans.Loans_mobile()
                    {
                        Loan_No = item.LoanNo,
                        Loan_Name = item.Description,
                        Outstanding_Balance = bal,
                        Application_Date = item.ApplicationDate,
                        perfomance = (Perfomance)Enum.Parse(typeof(Perfomance), item.Status),
                        Installments = installments,
                        InstallmentsSpecified = true,
                        Application_DateSpecified = true,
                        Disbursement_Date = item.ApplicationDate,
                        Outstanding_BalanceSpecified = true,
                    };
                }).ToList();

                r.Contents = new mobile_Member()
                {
                    No = member.MemberNo,
                    Name = member.FullName,
                    ID_No = member.NationalIDNo,
                    TargetAccount = member.GoalTargetAccounts.ToArray(),
                    Accounts = accounts,
                    Loans = loans.ToArray(),
                };
            }
            else
            {
                r.Code = -1;
                r.Desc = member.error;
            }
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
            string code = "", desc = "";
            mobile.MiniStatement(ref acc, ref code, ref desc);
            if (code == "00")
            {
                TransactionRoot statements = JsonConvert.DeserializeObject<TransactionRoot>(desc);
                List<Account_Entries.Account_Entries> ls = statements.Transactions.Select(item =>
                {
                    return new Account_Entries.Account_Entries()
                    {
                        Customer_No = acc,
                        Amount = (decimal)item.amount,
                        AmountSpecified = true,
                        Document_No = item.transactionID,
                        Posting_Date = item.postingDate,
                        Posting_DateSpecified = true,
                        Description = item.Description,
                        //Transaction_Type = item.Transaction_Type,
                        Debit = 0,
                        Credit = 0,
                        Loan_No = "",
                    };
                }).ToList();
                r.Contents = ls;
            }
            else
            {
                r.Code = -1; r.Desc = desc;
            }
            return r;
        }

        public Results<List<Account_Entries.Account_Entries>> Schedule(string LoanNo)
        {
            throw new NotImplementedException();
        }

        public Results<List<LoanProducts.LoanProducts>> loan_products()
        {
            Results<List<LoanProducts.LoanProducts>> r = new Results<List<LoanProducts.LoanProducts>>();
            string code = "", desc = "";
            mobile.GetLoanProducts(ref code, ref desc);
            if (code == "00")
            {
                LoanProductsResponse loanProducts = JsonConvert.DeserializeObject<LoanProductsResponse>(desc);
                List<LoanProducts.LoanProducts> ls = loanProducts.LoanProducts.Select(item =>
                {
                    return new LoanProducts.LoanProducts()
                    {
                        Product_ID = item.Code,
                        Product_Description = item.Description,
                        Ordinary_Default_Intallments = item.MaxInstallments,
                        Interest_Rate_Min = item.InterestRate,
                    };
                }).ToList();
                r.Contents = ls;
            }
            return r;
        }

        public Results<Member_mobile_info.Member_mobile_info> CreateAccount(Member_mobile_info.Member_mobile_info request)
        {
            Results<Member_mobile_info.Member_mobile_info> r = new Results<Member_mobile_info.Member_mobile_info>();
            return r;
        }

        public Results<Member_Application.Member_Application> Customer_Registration(Member_Application.Member_Application application)
        {
            Results<Member_Application.Member_Application> r = new Results<Member_Application.Member_Application>();

            string firstName = application.First_Name,
                        middleName = application.Second_Name,
                        lastName = application.Last_Name,
                        phoneNo = application.Phone_No,
                        nationalIDNo = application.ID_No,
                        email = application.E_Mail,

                        gender = application.Gender.ToString();
            DateTime dateofBirth = application.Date_of_Birth;

            string code = "", desc = "";
            mobile.ActivateCustomer(ref firstName, ref middleName, ref lastName, ref phoneNo, ref nationalIDNo, ref email, ref dateofBirth, ref gender, ref code, ref desc);
            if (code == "00")
            { }

            return r;
        }
    }

    public class LoanProduct
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public decimal InterestRate { get; set; }
        public int MaxInstallments { get; set; }
        public string RepaymentFrequency { get; set; }
        public string LoanCategory { get; set; }
    }

    public class LoanProductsResponse
    {
        public List<LoanProduct> LoanProducts { get; set; }
    }

    public class SavingsProduct
    {
        public string Code { get; set; }

        public string Description { get; set; }
    }

    public class Savings : Error
    {
        public List<SavingsProduct> SavingsProducts { get; set; }
    }

    public class Error
    {
        public String error { get; set; }
    }

    public class statement
    {
        public string transactionID { get; set; }
        public string DrCr { get; set; }
        public string Description { get; set; }
        public DateTime postingDate { get; set; }
        public DateTime postingTime { get; set; }
        public double amount { get; set; }
        public double RunningBalance { get; set; }
    }

    public class TransactionRoot
    {
        public List<statement> Transactions { get; set; }
    }

    public class Member : Error
    {
        public string MemberNo { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public string FullName { get; set; }
        public string NationalIDNo { get; set; }
        public List<Account> Accounts { get; set; }
        public List<GoalTargetAccount> GoalTargetAccounts { get; set; }
        public List<Loan> Loans { get; set; }
        public string ShareCapital { get; set; }
        public string Deposits { get; set; }
        public string TotalLoans { get; set; }
        public string Savings { get; set; }
    }

    public class Loan
    {
        [DataMember]
        public string LoanNo { get; set; }

        [DataMember]
        public string Description { get; set; }

        [DataMember]
        public string PrincipleAmount { get; set; }

        [DataMember]
        public string Installments { get; set; }

        [DataMember]
        public string MonthlyInstallment { get; set; }

        [DataMember]
        public DateTime ApplicationDate { get; set; }

        [DataMember]
        public string Status { get; set; }

        [DataMember]
        public string ControlAccount { get; set; }

        [DataMember]
        public string Balance { get; set; }
    }

    public class Account
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public string Balance { get; set; }
    }

    public class GoalTargetAccount
    {
        public string AccountNo { get; set; }
        public string Description { get; set; }
        public string PrincipleAmount { get; set; }
        public string AccountPeriod { get; set; }
        public string TargetAccount { get; set; }
        public string LockAccount { get; set; }
        public string ApplicationDate { get; set; }
        public string Status { get; set; }
        public string Interest { get; set; }
        public string Balance { get; set; }
    }
}

namespace S_Mobile.Members
{
    public partial class mobile_Member
    {
        public GoalTargetAccount[] TargetAccount { get; set; }
        public List<Accounts_Service.Accounts> Accounts { get; set; }
        public Loans.Loans_mobile[] Loans { get; set; }
    }
}

namespace S_Mobile.Loans
{
    public partial class Loans_mobile
    {
        public Perfomance perfomance { get; set; }
    }

    public enum Perfomance
    { Performing, Doubtful, Substandard, Loss }
}