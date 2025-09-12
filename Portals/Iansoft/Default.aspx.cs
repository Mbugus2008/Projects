using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using Bandari_Sacco.controller;


namespace Bandari_Sacco
{
    public partial class _Default : System.Web.UI.Page
    {
        private Member.mobile_Member member = null;
        string Member_No_ = "";
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
                PopulateField();
            }
 
        }
        protected void PopulateField()
        {
            //string checkuser = Session["User_Group_Name"].ToString().ToUpper();
            string memberNumber = Session["Member_No"].ToString();
            DateTime DOB = DateTime.Now;

            if (member != null)
            {
                if (member.Member_Category != "STAFF")
                {
                    lblUserID.Text = member.No;
                    lblIDNo.Text = member.National_ID_No;
                    lblStaffNo.Text = member.Payroll_No;// dr["Payroll No__Check No_"].ToString();
                    lblName.Text = member.Name;// dr["First Name"].ToString() + " " + dr["Second Name"].ToString() + " " + dr["Last Name"].ToString();
                    lblEmailAddress.Text = member.E_Mail;// dr["E-Mail"].ToString();
                    lblGender.Text = member.Gender.ToString();
                    DOB = Convert.ToDateTime(member.Date_of_Birth.ToString());
                    lblDOB.Text = DOB.ToShortDateString();
                    lblPostalAddress.Text = member.Address;// dr["Current Address"].ToString();
                    lblCity.Text = member.City;// dr["City"].ToString();
                    lblPhoneNo.Text = member.Phone_No;// dr["Mobile Phone No"].ToString() + " " + dr["Phone No_"].ToString();

                }
                else if (member.Member_Category == "STAFF")
                {
                    lblUserID.Text = member.No;
                    lblIDNo.Text = member.National_ID_No;
                    lblStaffNo.Text = member.Payroll_No;// dr["Payroll No__Check No_"].ToString();
                    lblName.Text = member.Name;// dr["First Name"].ToString() + " " + dr["Second Name"].ToString() + " " + dr["Last Name"].ToString();
                    lblEmailAddress.Text = member.E_Mail;// dr["E-Mail"].ToString();
                    lblGender.Text = member.Gender.ToString();
                    DOB = Convert.ToDateTime(member.Date_of_Birth.ToString());
                    lblDOB.Text = DOB.ToShortDateString();
                    lblPostalAddress.Text = member.Address;// dr["Current Address"].ToString();
                    lblCity.Text = member.City;// dr["City"].ToString();
                    lblPhoneNo.Text = member.Phone_No;// dr["Mobile Phone No"].ToString() + " " + dr["Phone No_"].ToString();
                }
                




                
            }

            else
            {
                Response.Redirect("Login.aspx", true);
            }

        }

    }
}
