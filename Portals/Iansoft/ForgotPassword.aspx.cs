using System;
using System.Data;
using System.Data.SqlClient;
using Bandari_Sacco.controller;
using OGL;
using Sendsms;
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

                   
                    var m = Global.member_Service.Read(memberNo);
                    if (m != null)
                    {
                     

                        var idNumber = m.National_ID_No;
                     
                        mobilePhoneNo = m.Phone_No;
                  
                        Name = m.Name;
                                          
                        Password = MyClass.GenerateRandomPassword(6);

                        
                        if (string.IsNullOrEmpty(m.Phone_No) == false)
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

                            Sendsms.Sms sms = new Sms();
                            sms.Sendsms(DateTime.Now.Ticks.ToString(), m.Phone_No, string.Format("Dear {0}, Your Sacco Portal password was successfuly reset, new password: {1}.", m.Name, Password), "10000");


                           //Global.mBranch.SendSms("Portal", m.Phone_No, string.Format("Dear {0}, Your Sacco Portal password was successfuly reset, new password: {1}.", m.Name, Password), Password);

                            string CurrentPage = "Login.aspx?option=Login&action=Login";
                                      Response.AddHeader("REFRESH", "10;URL=" + CurrentPage);
                                      Context.ApplicationInstance.CompleteRequest();

                            #endregion


                        }
                        else
                        {
                            Logging.Logging.LogEntryOnFile("No Phone no");
                            string Msg =
                            "Either Sacco does not recognize the member number," +
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
                    string Msg = ex.Message;// "The system have encountered an error please contact Sacco for assistance.";
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