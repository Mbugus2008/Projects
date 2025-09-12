using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bandari_Sacco.controller;
//using iTextSharp.text.pdf.events;
//using Microsoft.Ajax.Utilities;

namespace Bandari_Sacco
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
      
        public DateTime totalstart = new DateTime(2011, 1, 1);
        public DateTime totalend = new DateTime(2015, 12, 31);

        public DateTime datestart2011 = new DateTime(2011, 1, 1);
        public DateTime dateend2011 = new DateTime(2011, 12, 31);

        public DateTime datestart2012 = new DateTime(2012, 1, 1);
        public DateTime dateend2012 = new DateTime(2012, 12, 31);

        public DateTime datestart2013 = new DateTime(2013, 1, 1);
        public DateTime dateend2013 = new DateTime(2013, 12, 31);

        public DateTime datestart2014 = new DateTime(2014, 1, 1);
        public DateTime dateend2014 = new DateTime(2014, 12, 31);

        public DateTime datestart2015 = new DateTime(2015, 1, 1);
        public DateTime dateend2015 = new DateTime(2015, 12, 31);

        public DateTime datestart2016 = new DateTime(2016, 1, 1);
        public DateTime dateend2016 = new DateTime(2016, 12, 31);

           private Member.mobile_Member member = null;
        protected void Page_Load(object sender, EventArgs e)
        {
         

            if (Session["Member_No"] == null)
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
            else
                member = Global.member_Service.Read(Session["user_id"].ToString());
        }


        public string TotalDeposits(DateTime deposityearfrom, DateTime deposityearto)
        {
            string totalDeposits = string.Empty;
            try
            {

                double depositdigits = 0;
                var acc = member.Mobile_Accounts.Where(o => o.Account_Type == "S01" || o.Account_Type == "S02" || o.Account_Type == "S06");

                if (acc.Count() > 0)
                    depositdigits = (double)acc.Sum(o => o.Balance);
                totalDeposits = depositdigits.ToString("N");


            }
            catch (Exception ex)
            {
                
               // throw;
               SessionExpiry();

            }
            return totalDeposits;
           
        }
        public string TotalLoanRepayments(DateTime loansyearfrom, DateTime loansyearto)
        {

            var totalRepayments = string.Empty;
            try
            {

                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                double repayments = 0;
                if (loans.Count() > 0)
                    repayments = (double)loans.Sum(o => o.Loan_Repayments);

                totalRepayments = repayments.ToString("N");

            }
            catch (Exception)
            {
                //throw;
                SessionExpiry();
            }
            return totalRepayments;
            
        }

        public string TotalShareCapital(DateTime sharesyearfrom, DateTime sharesyearto)
        {
            var totalShareCapital = string.Empty;
            try
            {

                var acc = member.Mobile_Accounts.Where(o => o.Account_Type == "S04");

                if (acc.Count() > 0)
                    totalShareCapital = acc.Sum(o => o.Balance).ToString("N");


            }
            catch (Exception)
            {
                //throw;
                SessionExpiry();
            }
            return totalShareCapital;
         
        }

        public string TotalLoans(DateTime loansyearsfrom, DateTime loansyearsto)
        {
            var totalloans = string.Empty;
            try
            {
                double totalbalance = 0;
                double balance = 0;
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                if (loans.Count() > 0)
                    totalbalance = (double)loans.Sum(o => o.Loan_Balance);

                totalloans = totalbalance.ToString("N");


                //using (var conn = CRUD.getconnToNAV())
                //{

                //    var s = string.Format("SELECT isnull(Sum([Approved Amount]),0) AS [LoanAmount] FROM {0}" +
                //        " WHERE [Member No_]=@Member_No AND [Issued Date] BETWEEN @LoansYearFrom AND @LoansYearTo", "[" + MyClass.CompanyName + "$Loans]");

                //    var s = string.Format("SELECT isnull(Sum([Approved Amount]),0) AS [LoanAmount] FROM {0}" +
                //       " WHERE [Member No_]=@Member_No AND [Loan Disbursement Date] BETWEEN @LoansYearFrom AND @LoansYearTo", "[" + MyClass.CompanyName + "$Loans]");

                //    var command = new SqlCommand(s, conn);
                //    command.Parameters.AddWithValue("@Member_No", Session["Member_No"]);
                //    command.Parameters.AddWithValue("@LoansYearFrom", loansyearsfrom);
                //    command.Parameters.AddWithValue("@LoansYearTo", loansyearsto);
                //    using (var dr = command.ExecuteReader())
                //    {
                //        if (dr.HasRows)
                //        {
                //            while (dr.Read())
                //            {
                //                totalloans = (Convert.ToDouble(dr["LoanAmount"])).ToString();
                //            }
                //        }
                //    }
                //}

            }
            catch (Exception)
            {
                //throw;
                SessionExpiry();
            }
            return totalloans;
            
        }

        public string TotalLoanRepayments()
        {
            var totalRepayments = string.Empty;
            double repayment = 0;
            try
            {

                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                double repayments = 0;
                if (loans.Count() > 0)
                    repayments = (double)loans.Sum(o => o.Loan_Repayments);

                totalRepayments = repayments.ToString("N");


            }
            catch
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");

            }
            return totalRepayments;
        }

        public string TotalLoans()
        {
            var totalloans = string.Empty;
            try
            {
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

                double repayments = 0;
                if (loans.Count() > 0)
                    repayments = (double)loans.Sum(o => o.Loan_Balance);

                totalloans = repayments.ToString("N");

            }
            catch
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");

            }
            return totalloans;
        }

        protected double GetOustandingBalance(string loannumber)
        {
            double balance = 0;
            try
            {
                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);

              
                if (loans.Count() > 0)
                    balance = (double)loans.Sum(o => o.Loan_Balance);
            }
            catch
            {
               // throw;
                Session.Abandon();
                Response.Redirect("Login.aspx");

            }
            return balance;
        }

        protected int GetLoansCount(string membernumber)
        {
            int count = 0;
            try
            {

                var loans = Global.loan_Service.ReadMultiple(new Mobile_Loan.Mobile_Loan_Filter[] { new Mobile_Loan.Mobile_Loan_Filter { Criteria = Session["Member_No"].ToString(), Field = Mobile_Loan.Mobile_Loan_Fields.Member_No } }, null, 0);
                count = loans.Count();
                 
            }
            catch
            {
                throw;
            }

            return count;
        }

        //protected string[] GetLoansNumber(string membernumber, int count)
        //{
        //    int i = 0;
        //    string[] loannumbers = new string[count];
        //    try
        //    {
        //        using (SqlConnection conn = MyClass.getconnToNAV())
        //        {
        //            string A = String.Format("SELECT [Loan  No_] FROM [{0}$Loans] WHERE [Member No_]=@MemberNo", MyClass.CompanyName);
        //            SqlCommand command = new SqlCommand(A, conn);
        //            command.Parameters.AddWithValue("@MemberNo", membernumber);

        //            using (SqlDataReader dr = command.ExecuteReader())
        //            {
        //                if (dr.HasRows)
        //                    while (dr.Read())
        //                    {

        //                        loannumbers[i] = dr["Loan  No_"].ToString();
        //                        i++;

        //                    }
        //            }
        //        }
        //    }
        //    catch
        //    {
        //        throw;
        //    }
        //    return loannumbers;
        //}

        public string DisplayName()
        {
            var membername = string.Empty;


            try
            {
                membername = member.Name;
               

            }
            catch (Exception ex)
            {
                //throw;
               // SessionExpiry();
            }
            return membername;


        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            LogTimeOut();
            Session.Remove("Member_No");
            Session.Remove("User_Group_Name");
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }

        protected void SessionExpiry()
        {
            LogTimeOut();
            Session.Remove("Member_No");
            Session.Remove("User_Group_Name");
            Session.Abandon();
            Response.Redirect("Login.aspx");

        }

        protected void LogTimeOut()
        {
            try
            {
                DateTime LogoutTime = DateTime.Now;
                string sessionID = Session["SessionID"].ToString();
                string membernumber = Session["Member_No"].ToString(); 
                using (SqlConnection conn = MyClass.getconnToNAV())
                {
                    string A = "UPDATE [" + MyClass.CompanyName + "$Online Sessions]" +
                               " SET [LogoutTime] = @LogoutTime " +
                               " WHERE [User Number] = @UserName AND [SessionID]=@Session";

                    SqlCommand command = new SqlCommand(A, conn);
                    command.Parameters.AddWithValue("@LogoutTime", LogoutTime);
                    command.Parameters.AddWithValue("@UserName", membernumber);
                    command.Parameters.AddWithValue("@Session", sessionID);  
                    command.ExecuteNonQuery();
                }
            }
            catch
            {
                //throw;
                //SessionExpiry();
            }

        }


      

    }


}
