using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Summary description for MyComponents
/// </summary>

namespace Bandari_Sacco.controller
{
    public class MyComponents
    {

        public static SqlConnection connToNAV;

        #region Get Report Path

        public static string ReportsPath()
        {
            string currDir = "";
            Directory.SetCurrentDirectory(AppDomain.CurrentDomain.BaseDirectory);
            String Root = Directory.GetCurrentDirectory();
            currDir = Root;

            return currDir;
        }

        #endregion

        public static string Company_Name = "Bandari Sacco Ltd";

        #region getconn To NAV
        public static SqlConnection getconnToNAV()
        {
            try
            {
                if (connToNAV == null || connToNAV.State == ConnectionState.Closed)

                  //  connToNAV = new SqlConnection(@"Data Source=192.168.10.10;Initial Catalog=KIM_DB;MultipleActiveResultSets=true;User ID=webportal;Password=login*4");

                //connToNAV = new SqlConnection(@"Data Source=192.168.0.235;Initial Catalog=KENYA WATER INSTITUTE;MultipleActiveResultSets=true;User ID=sa;Password=kewi2014");
                connToNAV = new SqlConnection(@"Data Source=" + Config.source + ";Initial Catalog=" + Config.dbName + ";MultipleActiveResultSets=true;User ID=" + Config.user + ";Password=" + Config.password + "");
                connToNAV.Open();
            }
            catch (Exception es)
            {
                es.Data.Clear();
            }
            return connToNAV;
        }
        #endregion


        public static void SendEmailAlerts(string body, string recepient, string subject)
        {

            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                //SmtpClient SmtpServer = new SmtpClient("mail.rti.ac.ke");

                mail.Headers.Add("Message-Id", String.Concat("<", DateTime.Now.ToString("yyMMdd"), ".", DateTime.Now.ToString("HHmmss"), "@gmail.com>"));
                mail.From = new MailAddress("engskaranja@gmail.com");

                // mail.Headers.Add("Message-Id", String.Concat("<", DateTime.Now.ToString("yyMMdd"), ".", DateTime.Now.ToString("HHmmss"), "@rti.ac.ke>"));
                // mail.From = new MailAddress("training@rti.ac.ke");

                mail.To.Add(recepient);
                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = 25;
                SmtpServer.Credentials = new System.Net.NetworkCredential("engskaranja", "simonmkenya1234$#@!");
                //SmtpServer.Credentials = new System.Net.NetworkCredential("training", "rtitraining");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);

            }
            catch (Exception ex2)
            {

                ex2.Data.Clear();
            }

        }

        public static bool IsNumeric(string no)
        {
            double result;
            if (double.TryParse(no, out result))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}