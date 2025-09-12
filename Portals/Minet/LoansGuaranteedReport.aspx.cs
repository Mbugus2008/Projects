using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bandari_Sacco.controller;

namespace Bandari_Sacco
{
    public partial class LoansGuaranteedReport : System.Web.UI.Page
    {
        private Member.mobile_Member member = null;
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["Member_No"] == null)
            {
                Session.Abandon();
                Response.Redirect("Login.aspx");
            }
            string membernumber = Session["Member_No"].ToString();
            member = Global.member_Service.Read(Session["user_id"].ToString());
            if (!IsPostBack)
            {
                GenerateReport(membernumber);
            }
        }
        //private void PopulateDropDownList(string membernumber)
        //{
        //    try
        //    {
        //        System.Web.UI.WebControls.ListItem li = null;
        //        ddlAccount.Items.Clear();

        //        using (SqlConnection conn = MyClass.getconnToNAV())
        //        {
        //            string A = "SELECT [Loan Account] FROM [" + MyClass.CompanyName + "$Loans] WHERE [Member No_]=@MemberNo ";
        //            SqlCommand command = new SqlCommand(A, conn);
        //            command.Parameters.AddWithValue("@MemberNo", membernumber);

        //            using (SqlDataReader dr = command.ExecuteReader())
        //            {
        //                if (dr.HasRows)
        //                {
        //                    while (dr.Read())
        //                    {
        //                        li = new System.Web.UI.WebControls.ListItem(dr["Loan Account"].ToString());
        //                        ddlAccount.Items.Add(li);
        //                    }
        //                }
        //            }
        //            conn.Close();

        //        }
        //    }
        //    catch (Exception ex)
        //    {

        //        throw;

        //    }
        //}
        protected void GenerateReport(string membernumber)
        {
            try
            {
             
                string path1 = HttpRuntime.AppDomainAppPath;
                string path2 = string.Format(@"App_Temp_Reports\Account Statement\{1}{2}.pdf", path1, member.No, DateTime.Now.Second);
                string path = path1 + path2;

                Global.mBranch.LoanGuaranteed(member.No, path);


                //string sourcefile = @"\\172.17.1.3\Statements\Account Statements\" + accountnumber + ".pdf";
                //string destinationfile = @"C:\Portal\LIVE\App_Temp_Reports\Account Statements\" + accountnumber + ".pdf";

                //string sourcefile = @"\\172.17.1.3\Statements\Account Statements\" + accountnumber + ".pdf";
                //string destinationfile = @"C:\Portal\LIVE2\App_Temp_Reports\Account Statements\" + accountnumber + ".pdf";
                ////string destinationfile = @"C:\Portal\BandariSacco\App_Temp_Reports\Account Statements\" + accountnumber + ".pdf";

                //if (System.IO.File.Exists(destinationfile) == true)
                //{
                //    System.IO.File.Delete(destinationfile);
                //    System.IO.File.Move(sourcefile, destinationfile);
                //}
                //if (System.IO.File.Exists(destinationfile) == false)
                //{
                //    System.IO.File.Move(sourcefile, destinationfile);
                //}

                // pdfLoans.Attributes.Add("src",
                // ResolveUrl("~/App_Temp_Reports/Account Statements/" + String.Format("{0}.pdf", accountnumber)));
                pdfLoans.Attributes.Add("src", ResolveUrl("~/" + path2 ));
            }
            catch (Exception ex)
            {

                throw;
            }
        }
    }
}