using System;
using System.Data;
using System.Data.SqlClient;
using Bandari_Sacco.controller;
using OGL;

namespace Bandari_Sacco
{
    public partial class ForgotPassword : System.Web.UI.Page
    {

        public string body = "", subject = "", Personal_No = "", Password = "", Msg = "", attachment = "";


        protected void Page_Load(object sender, EventArgs e)
        {
            User_No.Focus();
        }
        protected void ResetButton_Click(object sender, EventArgs e)
        {

            try
            {
                bool isHuman = SampleCaptcha.Validate(txtsecurity_code.Text);

                lblError.Text = "";
               // Captcha1.ValidateCaptcha(txtsecurity_code.Text.Trim());

                if (!isHuman)
                {
                    lblError.Text = "Invalid Security Code entered. Please try again !";
                    Message(lblError.Text);
                    txtsecurity_code.Text = "";
                    txtsecurity_code.Focus();

                    return;
                }

                string memberNo = "";
                var mobilePhoneNo = "";
                var Name = "";
                var pass = "";
                var Entry_No_ = "";
                memberNo = User_No.Text.Trim().ToUpper();

                Logging.Logging.LogEntryOnFile(String.Format("Member: {0}", memberNo));

                try
                {

                    //using (SqlConnection conn = MyClass.getconnToNAV())
                    //{

                    //    string s = String.Format("SELECT [E-Mail],[Phone No_],[Mobile Phone No],[Name], [Employer Code],[ID No_] FROM [{0}$Members] WHERE [No_] = @Member_No;", MyClass.CompanyName);
                    //    SqlCommand command = new SqlCommand(s, conn);
                    //    command.Parameters.AddWithValue("@Member_No", memberNo);

                    //    using (SqlDataReader dr = command.ExecuteReader())
                    //    {
                    //        if (dr.HasRows)
                    //        {
                    //            dr.Read();

                    var m = Global.member_Service.Read(memberNo);
                    if (m != null)
                    {
                        Logging.Logging.LogEntryOnFile(String.Format("Ok: {0}", memberNo));

                        var idNumber = m.National_ID_No.ToString();
                        Logging.Logging.LogEntryOnFile(String.Format("OK: {0}", memberNo));
                        mobilePhoneNo = m.Phone_No.ToString();
                        Logging.Logging.LogEntryOnFile(String.Format("ok: {0}", memberNo));
                        Name = m.Name.ToString();

                        Logging.Logging.LogEntryOnFile(String.Format("ok: {0}", memberNo));
                        // Password = MyClass.RandomString();

                        Password = MyClass.GenerateRandomPassword(6);

                        //if (!String.IsNullOrEmpty(email))
                        //{

                        //    #region ++++++++++ CREATE USER IF NOT EXISTS +++++++++++++++++++++++++++++

                        //    string C =
                        //        String.Format(
                        //            "SELECT [User Name] FROM [{0}$Online Users2] WHERE [User Name] = @Member_No;",
                        //            MyClass.CompanyName);
                        //    SqlCommand command_ = new SqlCommand(C, conn);
                        //    command_.Parameters.AddWithValue("@Member_No", memberNo);
                        //    using (SqlDataReader dr_ = command_.ExecuteReader())
                        //    {
                        //        if (dr_.HasRows == false)
                        //        {

                        //            string I =
                        //                String.Format(
                        //                    "INSERT INTO [{0}$Online Users2] ([User Name],[Password],[Changed Password],[Date Created],[Email],[User Type],[ID Number],[Number of Logins],[Line No])" +
                        //                    " VALUES(@Member_No,@Password,@Changed_Password,@Date_Created,@Email,@UserType,@IdNumber,0,0);",
                        //                    MyClass.CompanyName);

                        //            SqlCommand cmd_ = new SqlCommand()
                        //            {
                        //                CommandType = CommandType.Text,
                        //                Connection = conn,
                        //                CommandText = I
                        //            };
                        //            cmd_.Parameters.AddWithValue("@Member_No", memberNo);
                        //            cmd_.Parameters.AddWithValue("@Password", MyClass.GetMd5Hash(Password));
                        //            cmd_.Parameters.AddWithValue("@Changed_Password", "0");
                        //            cmd_.Parameters.AddWithValue("@Email", dr["E-Mail"].ToString());
                        //            cmd_.Parameters.AddWithValue("@UserType", emplCode);
                        //            cmd_.Parameters.AddWithValue("@Date_Created",
                        //                DateTime.Now.ToString("yyyy-MMM-dd"));
                        //            cmd_.Parameters.AddWithValue("@IdNumber", idNumber);

                        //            cmd_.ExecuteNonQuery();
                        //        }
                        //    }

                        //    #endregion

                        //    subject = "Bandari Sacco Members Portal ";

                        //    body = "Hi,<br/>" +
                        //           "Below are you Members Portal login credentials.<br/>" +
                        //           "Username: <b>" + memberNo + "</b></br> " +
                        //           "Password: <b>" + Password + "</b></br> </br> " +
                        //           "Thankyou";
                        //    var sendSmsOrEmail = false;
                        //    if (MyClass.SendEmailAlert(body, email, subject, attachment))
                        //    {
                        //        string T =
                        //            String.Format(
                        //                "UPDATE [{0}$Online Users2] SET Password=@Password,[Changed Password]=0 WHERE [User Name] = @UserName;",
                        //                MyClass.CompanyName);
                        //        SqlCommand cmd = new SqlCommand(T, conn);
                        //        cmd.Parameters.AddWithValue("@UserName", memberNo);
                        //        cmd.Parameters.AddWithValue("@Password", MyClass.GetMd5Hash(Password));
                        //        cmd.ExecuteNonQuery();

                        //        Msg = "Username and password sent to " + cSite.MemberEmail;
                        //        txtsecurity_code.Text = "";
                        //        User_No.Text = "";
                        //        lblError.Text = Msg;
                        //        Message(Msg);

                        //        const string currentPage = "Login.aspx?option=Login&action=Login";
                        //        //Response.AddHeader("REFRESH", "10;URL=" + currentPage);
                        //        Context.ApplicationInstance.CompleteRequest();
                        //        sendSmsOrEmail = true;

                        //    }

                        //    #region SMS

                        //    if (!String.IsNullOrEmpty(mobilePhoneNo))
                        //    {
                        //        var msisdn = mobilePhoneNo.Trim();

                        //        if (msisdn.Length > 5)
                        //        {
                        //            int entryNo = 0;
                        //            var T =
                        //                String.Format(
                        //                    "UPDATE [{0}$Online Users2] SET Password=@Password,[Changed Password]=0 WHERE [User Name] = @UserName;",
                        //                    MyClass.CompanyName);
                        //            SqlCommand cmd = new SqlCommand(T, conn);
                        //            cmd.Parameters.AddWithValue("@UserName", memberNo);
                        //            cmd.Parameters.AddWithValue("@Password", MyClass.GetMd5Hash(Password));
                        //            cmd.ExecuteNonQuery();

                        //            string getEntryNo =
                        //                String.Format(
                        //                    "SELECT MAX([Entry No]) as [Entry No] FROM [{0}$SMS Messages]",
                        //                    MyClass.CompanyName);
                        //            SqlCommand cmd_Entry = new SqlCommand(getEntryNo, conn);
                        //            using (SqlDataReader dr__ = cmd_Entry.ExecuteReader())
                        //            {
                        //                if (dr__.HasRows)
                        //                {
                        //                    dr__.Read();

                        //                    if (dr__["Entry No"] != null)
                        //                    {
                        //                        entryNo = Convert.ToInt32(dr__["Entry No"]);
                        //                    }


                        //                }
                        //            }

                        //            int bulkSmsBalance = 0;

                        //            string getSmsBal =
                        //                String.Format(
                        //                    "SELECT [SMS Balance] FROM [{0}$SMS Messages] WHERE [Entry No]=@Entry_No",
                        //                    MyClass.CompanyName);
                        //            SqlCommand cmd_SMSBal = new SqlCommand(getSmsBal, conn);
                        //            cmd_SMSBal.Parameters.AddWithValue("@Entry_No", entryNo);

                        //            using (SqlDataReader dr__Sms = cmd_SMSBal.ExecuteReader())
                        //            {
                        //                if (dr__Sms.HasRows)
                        //                {
                        //                    dr__Sms.Read();
                        //                    bulkSmsBalance = Convert.ToInt32(dr__Sms["SMS Balance"]);

                        //                }
                        //            }

                        //            entryNo += 1;

                        //            #region Queue SMS

                        //            var documentNo = msisdn;
                        //            const string Source = "PORTAL";

                        //            var Msg_ =
                        //                String.Format(
                        //                    "Dear {0}, Your Mwalimu National Portal password was successfuly reset, new password: {1}.",
                        //                    Name, Password);

                        //            cSite.ObjNav.SendSms(entryNo: entryNo, phoneNumber: msisdn, message: Msg_, documentNo: documentNo, accountNo: Source, balance: bulkSmsBalance - 1);

                        //            Msg = "Username and password sent to " + msisdn;
                        //            txtsecurity_code.Text = "";
                        //            User_No.Text = "";
                        //            lblError.Text = Msg;
                        //            Message(Msg);

                        //            string CurrentPage = "Login.aspx?option=Login&action=Login";
                        //            Response.AddHeader("REFRESH", "10;URL=" + CurrentPage);
                        //            Context.ApplicationInstance.CompleteRequest();

                        //            #endregion

                        //        }
                        //        else
                        //        {

                        //            Msg = "Please submit a valid phone number to Mwalimu National ";
                        //            lblError.Text = Msg;
                        //            Message(Msg);
                        //            txtsecurity_code.Text = "";

                        //        }
                        //        sendSmsOrEmail = true;

                        //    }

                        //    #endregion

                        //    string CurrentPage_ = "Login.aspx?option=Login&action=Login";
                        //    Response.AddHeader("REFRESH", "10;URL=" + CurrentPage_);
                        //    Context.ApplicationInstance.CompleteRequest();


                        //}
                        if (string.IsNullOrEmpty(m.Phone_No.ToString()) == false)
                        {


                            #region ++++++++++ CREATE USER IF NOT EXISTS +++++++++++++++++++++++++++++
                            var user = Global.user_Service.Read(m.No);

                            if (user == null)
                            {
                                Online_User.Online_User u = new Online_User.Online_User();
                                u.Login_ID = m.No;
                                u.User_Name = m.Name;
                                u.Member_Id = m.No;
                                u.Password = MyClass.GetMd5Hash( Password);
                                u.User_Type = Online_User.User_Type.Member;
                                u.User_TypeSpecified = true;

                                Global.user_Service.Create(ref u);
                            }
                            else
                            {
                                user.Password = MyClass.GetMd5Hash(Password);
                                Global.user_Service.Update(ref user);
                            }

                            Global.mBranch.SendSms("Portal", m.Phone_No, string.Format("Dear {0}, Your Bandari Sacco Portal password was successfuly reset, new password: {1}.", m.Name, Password), Password);

                            string CurrentPage = "Login.aspx?option=Login&action=Login";
                                      Response.AddHeader("REFRESH", "10;URL=" + CurrentPage);
                                      Context.ApplicationInstance.CompleteRequest();

                            #endregion


                        }
                        else
                        {

                            string Msg =
                            "Either Bandari Sacco does not recognize the member number," +
                            " or you have not supplied your ID number to the Sacco." +
                            " Contact the Sacco for more assistance.";

                            lblError.Text = Msg;
                            Message(Msg);
                        }
                        // }

                        //  conn.Close();
                        // }
                    } }
                catch (Exception ex)
                {
                    string Msg = "The system have encountered an error please contact Bandari Sacco for assistance.";
                    lblError.Text = Msg;

                    Message(Msg);
                    Logging.Logging.ReportError(ex);

                    string body, recepient = "", subject = "", attachment = "";

                    recepient = "cmunyao@coretec.co.ke";
                    subject = "Error Bandari Sacco Members Portal ";
                    body = "Hi,<br/>" +

                            "Error at " + DateTime.Now + " <br/>" + ex;
                    // MyClass.SendEmailAlert(body, recepient, subject, attachment);
                    ex.Data.Clear();
                }

            }
            catch (Exception ex)
            {

                ex.Data.Clear();
                Logging.Logging.ReportError(ex);
                string body, recepient = "", subject = "", attachment = "";

                recepient = "cmunyao@coretec.co.ke";
                subject = "Error Bandari Sacco Members Portal ";
                body = "Hi,<br/>" +
                        "Error at " + DateTime.Now + "  <br/>" + ex;

             //   MyClass.SendEmailAlert(body, recepient, subject, attachment);

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


    }
}