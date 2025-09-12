using System;
using System.Data.SqlClient;
using Bandari_Sacco.controller;
using System.Linq;
namespace Bandari_Sacco
{
    public partial class Dashboard : System.Web.UI.Page
    {
       private Member.mobile_Member member =null;
        private Mobile_Loan.Mobile_Loan[] loans; 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Member_No"] == null)
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
            else
            {
                member = Global.member_Service.Read(Session["user_id"].ToString());
              loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);
            }
        }
        public string TotalDeposits()
        {
            string totalDeposits = string.Empty;
            //try
            //{                
                double depositdigits = 0;
                var acc = member.Mobile_Accounts.Where(o => o.Account_Type == "S01" || o.Account_Type == "S02" || o.Account_Type == "S06");

                if (acc.Count() > 0)
                    depositdigits =(double) acc.Sum(o => o.Balance);
                totalDeposits = depositdigits.ToString("N");
            //}
            //catch
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}

            return totalDeposits;
        }
        public string TotalLoanRepayments()
        {
            var totalRepayments = string.Empty;
            //try
            //{
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                double repayments = 0;
                if (loans.Count() > 0)
                    repayments =(double) loans.Sum(o => o.Loan_Repayments);

                totalRepayments = repayments.ToString("N");
                           
            //}
            //catch
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}
            return totalRepayments;
        }
        public string TotalShareCapital()
        {
            var totalShareCapital = string.Empty;
            //try
            //{
                var acc = member.Mobile_Accounts.Where(o => o.Account_Type == "S04" );

                if (acc.Count() > 0)
                    totalShareCapital = acc.Sum(o => o.Balance).ToString("N");
              
            //}
            //catch
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}
            return totalShareCapital;
        }
        public string TotalLoans()
        {
            var totalloans = string.Empty;
            //try
            //{
                double totalbalance = 0;
                double balance = 0;
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                if (loans.Count() > 0)
                    totalbalance =(double) loans.Sum(o => o.Loan_Balance);
            
                totalloans = totalbalance.ToString("N");
            //}
            //catch
            //{
            //    //Session.Abandon();
            //    //Response.Redirect("Login.aspx");

            //}
            return totalloans;
        }
        public string LatestTransactions()
        {
            string htmlStr = "";
          
            foreach (var one in member.Mobile_Accounts)
            {
                //balancelcy = GetBalanceLCY(one);
                //productname = GetProductName(one);
                //productid = GetProductID(one);
                if (one.Balance != 0)
                {
                    htmlStr += string.Format("<tr><td class='small' style='font-size:10px'>{0}</td><td class='small' style='font-size:10px'>{1}</td><td class='small' style='font-size:10px'>{2}</td><td></td></tr>", one.Name , one.No, one.Balance);
                }

            }


            return htmlStr;
        }
        // 
        public string LoanStatement()
        {
            string htmlStr = "";
            //try
            //{
                string Loan_Type = "", Loan_Detail = "";
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);
                foreach (var loan in loans)
                {

                    Loan_Detail = loan.Loan_Name;
                    DateTime dt_ = DateTime.Now;

                  
                    if (loan.Posting_Date != null)
                    {
                        dt_ = Convert.ToDateTime(loan.Posting_Date);
                    }


                    else if (loan.Application_Date != null)
                    {
                        dt_ = Convert.ToDateTime(loan.Application_Date);
                    }
                    Loan_Type = loan.Loan_Name.ToUpper();
                    var approvedAmount = Convert.ToDouble(loan.Principle_Amount.ToString()).ToString("N");
                    htmlStr += "<tr><td class='small' style='font-size:10px'>" + dt_ +
                               "</td><td class='small' style='font-size:10px'>" + Loan_Detail + "</td><td class='small' style='font-size:10px'>" + Loan_Type +
                               "</td><td class='small' align='right' style='font-size:10px'>" + approvedAmount + "</td></tr>";
                }

              
                

            //}
            //catch
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}
            return htmlStr;
            
        }

        protected string SavingsAccountStatement()
        {
            string htmlStr = "";
            //try
            //{
                string description = "";
                double amount = 0, closingbalance = 0, creditamount = 0, debitamount = 0, totalcreditamount = 0, totalclosingbalance = 0;
                DateTime postingdate = DateTime.Now;
                string stringpostingdate = "";
                foreach (var mm in member.Mobile_Accounts)
                {
                    var entries = Global.entries_Service.ReadMultiple(new Account_Entries.Mobile_Account_Entries_Filter[] { new Account_Entries.Mobile_Account_Entries_Filter { Criteria = mm.No, Field = Account_Entries.Mobile_Account_Entries_Fields.Vendor_No } }, null, 0);
                    foreach (var m in entries)
                    {
                        postingdate = Convert.ToDateTime(m.Posting_Date.ToString().Trim());
                        stringpostingdate = postingdate.ToShortDateString();
                        description = m.Desc;
                        amount = -Convert.ToDouble(m.Amount.ToString().Trim());
                        debitamount = Convert.ToDouble(m.Debit_Amount.ToString().Trim());
                        creditamount = Convert.ToDouble(m.Credit_Amount.ToString().Trim());
                        closingbalance += (creditamount - debitamount);
                        totalcreditamount += creditamount;
                        totalclosingbalance += closingbalance;
                        htmlStr += "<tr><td class='small' style='font-size:10px'>" + stringpostingdate +
                                   "</td><td class='small' style='font-size:10px'>" + description +
                                   "</td><td class='small' style='font-size:10px'>" + debitamount +
                                   "</td><td class='small' style='font-size:10px'>" + creditamount +
                                   "</td><td class='small' style='font-size:10px'>" + amount + "</td></tr>";
                    }
                }

               

            //}
            //catch
            //{
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}
            return htmlStr;
        }

        protected double GetOustandingBalance(string loannumber)
        {
            double balance = 0;
            //try
            //{
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);
                var loan = loans.FirstOrDefault(o => o.Loan_No == loannumber);
                if (loan != null)
                    balance =(double) loan.Loan_Balance;

             
            //}
            //catch
            //{
            //    throw;
            //    Session.Abandon();
            //    Response.Redirect("Login.aspx");

            //}
            return balance;
        }

        protected int GetLoansCount(string membernumber)
        {
            int count = 0;
            try
            {
                count = loans.Count();
            }
            catch
            {
                throw;
            }

            return count;
        }

        protected string[] GetLoansNumber(string membernumber, int count)
        {
            int i = 0;
            string[] loannumbers = new string[count];
            try
            {
                loannumbers = loans.Select(o => o.Loan_No).ToArray();

            }
            catch
            {
                throw;
            }
            return loannumbers;
        }
        protected int GetAccountCount(string membernumber)
        {
            int count = 0;
            try
            {
                count = member.Mobile_Accounts.Count();
            }
            catch
            {
                throw;
                
            }

            return count;
        }

        protected string[] GetMembersAccount(string membernumber, int count)
        {
            int i = 0;
            string[] accountnumber = new string[count];
            try
            {
                accountnumber = member.Mobile_Accounts.Select(o => o.No).ToArray();

               
            }
            catch
            {
                throw;
            }

            return accountnumber;
        }

        protected double GetBalanceLCY(string accountnumber)
        {
            double balance = 0;
            try
            {
                balance =(double) member.Mobile_Accounts.FirstOrDefault(o => o.No == accountnumber).Balance;
               
            }
            catch
            {
                throw;

            }

            return balance;
        }


        protected string GetProductName(string accountnumber)
        {
            string productname = "";
            try
            {

                productname = member.Mobile_Accounts.FirstOrDefault(o => o.No == accountnumber).Search_Name;
               
            }
            catch
            {
                throw;

            }

            return productname;
        }

        protected string GetProductID(string accountnumber)
        {
            string productid = "";
            try
            {
                productid = member.Mobile_Accounts.FirstOrDefault(o => o.No == accountnumber).Account_Type;
                
            }
            catch
            {
                throw;

            }

            return productid;
        }

    }
}