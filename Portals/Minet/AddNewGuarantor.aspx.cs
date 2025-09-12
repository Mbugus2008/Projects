using System;
using System.Data.SqlClient;
using Bandari_Sacco.controller;
namespace Bandari_Sacco
{
    public partial class AddNewGuarantor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string Member_No_ = string.Empty;
            string E_Mail = string.Empty;
            string Phone_No_ = string.Empty;
            string Name = string.Empty;
            string ID_No = string.Empty;

            string ApllicantMember_No_ = Session["Member_No"].ToString();

            string LoanApplicantNames = MyClass.getMembersNames(ApllicantMember_No_);

            string LoanApplicationNo = string.Empty;

            if (Request.QueryString["LNo"] != null)
            {
                LoanApplicationNo = Request.QueryString["LNo"];
            }

            Member_No_ = GuarantorMemberNo.Text.Trim().Replace("'", "");
            using (SqlConnection conn = MyClass.getconnToNAV())
            {

                string s = String.Format("SELECT [E-Mail],[Phone No_],[Name],[ID No_] FROM [{0}$Customer] WHERE [No_] = @Member_No;", MyClass.CompanyName);
                SqlCommand command = new SqlCommand(s, conn);
                command.Parameters.AddWithValue("@Member_No", Member_No_);
                using (SqlDataReader dr1 = command.ExecuteReader())
                {
                    if (dr1.HasRows)
                    {
                        dr1.Read();
                        E_Mail = dr1["E-Mail"].ToString();
                        Phone_No_ = dr1["Phone No_"].ToString();
                        Name = dr1["Name"].ToString();
                        ID_No = dr1["ID No_"].ToString();

                        string s_ = String.Format("SELECT * FROM [{0}$Online Loan Guarantors] WHERE [Member No] = @Member_No AND [Loan Application No]=@LoanApplication_No ;", MyClass.CompanyName);
                        SqlCommand commandCheck = new SqlCommand(s_, conn);
                        commandCheck.Parameters.AddWithValue("@Member_No", Member_No_);
                        commandCheck.Parameters.AddWithValue("@LoanApplication_No", LoanApplicationNo);
                        using (SqlDataReader dr1Check = commandCheck.ExecuteReader())
                        {
                            if (dr1Check.HasRows == false)
                            {
                                #region Save Guarantor

                                string SQL = "INSERT INTO [" + MyClass.CompanyName + "$Online Loan Guarantors] ([Loan Application No]  ,[Member No],[Names],[Email Address] ,[Amount],[ID No],[Telephone]" +
                                      ",[Approved],[Approval Status])  VALUES  (@LoanApplication_No,@Member_No  ,@Names  ,@Email_Address, @Amount,@ID_No,@Telephone,0,'Not Approved')";

                                SqlCommand commandG = new SqlCommand(SQL, conn);
                                commandG.Parameters.AddWithValue("@LoanApplication_No", LoanApplicationNo);
                                commandG.Parameters.AddWithValue("@Member_No", Member_No_);
                                commandG.Parameters.AddWithValue("@Names", Name);
                                commandG.Parameters.AddWithValue("@Email_Address", E_Mail);
                                commandG.Parameters.AddWithValue("@Amount", "0");
                                commandG.Parameters.AddWithValue("@MemberID_No_No", Member_No_);
                                commandG.Parameters.AddWithValue("@ID_No", ID_No);
                                commandG.Parameters.AddWithValue("@Telephone", Phone_No_);
                                commandG.ExecuteNonQuery();

                                #endregion

                                #region Send SMS to Guarantor

                                string Loan_No = "";
                                string Loan_Type = "";
                                double Amount = 0;

                                string LoanDetailss_ = String.Format("SELECT [Application No],b.[Product Description] as [Loan Type],[Loan Amount],case (Approved) when 0 then 'No' when 1 then 'Yes' end as Status,CONVERT(VARCHAR,[Application Date],103) as [Application Date] FROM [{0}$Online Loan Application] a,[" + MyClass.CompanyName + "$Product Factory] b WHERE a.[Loan Type]=b.[Product ID] AND [Membership No] = @Member_No;", MyClass.CompanyName);
                                SqlCommand command_ = new SqlCommand(LoanDetailss_, conn);
                                command_.Parameters.AddWithValue("@Member_No", Member_No_);
                                using (SqlDataReader dr1_ = command_.ExecuteReader())
                                {
                                    if (dr1_.HasRows)
                                    {
                                        dr1_.Read();
                                        Loan_No = dr1_["Application No"].ToString();
                                        Loan_Type = dr1_["Loan Type"].ToString();
                                        Amount = Convert.ToDouble(dr1_["Loan Amount"].ToString());
                                    }
                                }

                                string Msg_ = String.Format("{0} , Member No {1} has requested for your Guarantorship on " + Loan_Type + " of KES " + Amount + ".Kindly login to the portal to accept or reject the request", LoanApplicantNames, ApllicantMember_No_);

                                MyClass.SendSMS(Member_No_, Msg_, conn);

                                #endregion

                                string strMsg = string.Empty;
                                strMsg = "Guarantor saved successfully. The guarantor will be notified through an SMS";
                                lblError.Text = strMsg;
                                Message(strMsg);

                                GuarantorMemberNo.Text = "";

                            }
                            else
                            {
                                string strMsg = string.Empty;
                                strMsg = "Member already entered as a guarantor, please enter another member number.";
                                lblError.Text = strMsg;
                                Message(strMsg);
                            }
                        }

                    }
                    else
                    {
                        string strMsg = string.Empty;
                        strMsg = "Sorry, the membership number you have entered does not exist.";
                        lblError.Text = strMsg;


                        Message(strMsg);
                    }
                }
                conn.Close();
            }

        }

        public void Message(string strMsg)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(strMsg);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            string LoanApplicationNo = string.Empty;

            if (Request.QueryString["LNo"] != null)
            {
                LoanApplicationNo = Request.QueryString["LNo"];
            }
            string CurrentPage = "LoanApplication.aspx?option=Add_New_Guarantor&action=LoanApplication&LNo=" + LoanApplicationNo;
            Response.Redirect(CurrentPage, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}