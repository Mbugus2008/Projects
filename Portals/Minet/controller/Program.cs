using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Bandari_Sacco.NavService2;

namespace Bandari_Sacco.controller
{
    using System;
    using System.IO;
    using System.Data;
    using System.Text;
    using System.Web;
    using System.Net;
    using System.Collections.Generic;
    using System.Net.Mail;
    using System.Web.UI;
    using System.Security;
    using System.Security.Cryptography;
    using System.Threading;
    using System.Web.SessionState;

    using OGL;
    using SQL_ICAP = System.Data.SqlClient;
    using System.Configuration;
    using System.Globalization;
    using System.Data.SqlClient;
    using System.Text.RegularExpressions;
    using Bandari_Sacco.controller;
    using Bandari_Sacco;
    using NavService2;

    /// <summary>
    /// This class is used for all reads/writes to the database. 
    /// </summary>
    public sealed class cConnect
    {
        //ALL VARIABLE MEMBERS ARE PRIVATE FOR ABSTRACTION IN IMPLEMENTATION PURPOSES
        //private sqlMobile.SqlCeConnection mDB = new sqlMobile.SqlCeConnection(cConnect.mConnectionString);
        //private Access.OleDbConnection mDB = new Access.OleDbConnection(cConnect.mConnectionString);
        private SQL_ICAP.SqlConnection mDB;
        public static string conStr = "";
        public static SqlConnection conn;

        /// <summary>
        /// Class Constructor
        /// initializes the connection [opens the database].
        /// </summary>
        public cConnect()
        {
            try
            {
                //conStr = @"Data Source=APPSERVER\APPSERVER;Initial Catalog='KNCHR';User ID=web;Password='Pass1234';Timeout=60";
                //conStr = @"Data Source=SALOMON-PC;Initial Catalog='KNCHR';User ID=sa;Password='123';Timeout=60";
                conStr = @"Data Source=" + Config.source + ";Initial Catalog=" + Config.dbName + ";MultipleActiveResultSets=true;User ID=" + Config.user + ";Password=" + Config.password + "";
                this.mDB = new SQL_ICAP.SqlConnection(conStr);
                this.mDB.Open();
            }
            catch (Exception ex)
            {
                string y = ex.Message;
                throw; /* bubble the error to the active document, 
                        * where the error is caught and resolved */
            }
        }

        /// <summary>
        /// DR: This method is used for reading purposes only.
        /// NB: Only for reading NOT writing.
        /// The database will have a shared lock.
        /// </summary>
        /// 
        /// <param name="vSQL">SQL statement 2B executed.</param>
        /// <returns>
        /// returns a data reader containing the execution
        /// results of the sql select statement
        /// </returns>
        public SQL_ICAP.SqlDataReader ReadDB(string vSQL)
        {
            SQL_ICAP.SqlDataReader r = null;

            try
            {
                SQL_ICAP.SqlCommand vCMD = new System.Data.SqlClient.SqlCommand(vSQL, this.mDB);
                r = vCMD.ExecuteReader(CommandBehavior.CloseConnection);
            }
            catch (Exception)
            {
                //string s = ex.Message;
                throw; /* bubble the error to the active document, 
                        * where the error is caught and resolved */
            }
            return r;
        }

        /// <summary>
        /// DA: This method is used for reading purposes only.
        /// NB: Only for reading NOT writing.
        /// The database will have a shared lock.
        /// </summary>
        /// 
        /// <param name="vSQL">SQL statement 2B executed.</param>m>
        /// <returns>
        /// returns a data adapter containing the execution
        /// results of the sql select statement
        /// </returns>
        public SQL_ICAP.SqlDataAdapter ReadDB2(string vSQL)
        {
            SQL_ICAP.SqlDataAdapter r = null;

            try
            {
                r = new SQL_ICAP.SqlDataAdapter(vSQL, this.mDB);
                r.AcceptChangesDuringFill = false;
                r.AcceptChangesDuringUpdate = false;

            }
            catch (Exception)
            {
                //string s = ex.Message;
                throw; /* bubble the error to the active document, 
                        * where the error is caught and resolved */
            }
            return r;
        }

        /// <summary>
        /// This method is used to update/insert/delete
        /// records using the appropriate SQL Statements. 
        /// The database will have an exclusive lock.
        /// 
        /// 
        /// 
        /// </summary>
        /// 
        /// <param name="vSQL">SQL Statement 2B executed</param>
        /// <param name="vCryptographyDetails">
        /// the parameters used to encrypt the sql statement</param>
        public void WriteDB(string vSQL)
        {
            DataSet vDS = new DataSet();

            try
            {
                vDS.EnforceConstraints = true;

                SQL_ICAP.SqlDataAdapter vDA = new SQL_ICAP.SqlDataAdapter
                    (vSQL, conStr);

                vDA.AcceptChangesDuringFill = true;
                vDA.Fill(vDS);
            }
            catch (Exception)
            {
                vDS.RejectChanges();
                vDS.Dispose();
                throw; /* bubble the error to the active document, 
                        * where the error is caught and resolved */

            }
            finally
            {
                this.mDB.Close();
            }
        }
        public void Dispose()
        {
            try
            {
                if (mDB != null)
                    if (mDB.State == ConnectionState.Open)
                        mDB.Close();

                mDB.Dispose();
                mDB = null;
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
            }
        }
        public static SqlConnection GetConnectionToDB()
        {
            // String Datasource = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;     

            //if (conn == null)

            //conn = new SqlConnection(@"Data Source=ERIC\ERIC_SQL2012;Initial Catalog='KNCHR';User ID=sa;Password='eric';Timeout=60");

            return CRUD.getconnToNAV();
        }
    }

    /// <summary>
    /// This class is used to send smtp_server e-mails
    /// Note: Requires namespace [System.Net.Mail]
    /// </summary>
    public class cMail
    {
        /// <summary>
        /// note that they are all blank at start
        /// the client code assigns all the required parameters
        /// </summary>
        private string smtpServer, from, to, subject, body;

        /// <summary>
        /// class constructor
        /// used to initialize the default smtp server
        /// </summary>
        public cMail()
        {
            try
            {
                //default smtpServer
                this.smtpServer = cSite.smtp_server;
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// get/set e-mail address of the sender
        /// e.g. xxx@yyyy.zzz
        /// </summary>
        public string From
        {
            get
            {
                try { return this.from; }
                catch (Exception)
                {
                    throw;
                }
            }
            set
            {
                try { this.from = value; }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// get/set e-mail address of the receipients (receiver)
        /// e.g. xxx@yyyy.zzz
        /// </summary>
        public string To
        {
            get
            {
                try { return this.to; }
                catch (Exception)
                {
                    throw;
                }
            }
            set
            {
                try { this.to = value; }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// title/heading for the e-mail's contents
        /// </summary>
        public string Subject
        {
            get
            {
                try { return this.subject; }
                catch (Exception)
                {
                    throw;
                }
            }
            set
            {
                try { this.subject = value; }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// The main contents of the e-mail 2B sent
        /// </summary>
        public string Body
        {
            get
            {
                try { return this.body; }
                catch (Exception)
                {
                    throw;
                }
            }
            set
            {
                try { this.body = value; }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// SEND MAIL.
        /// assumes that all the properties in this class have been set
        /// </summary>
        public void SendMail()
        {
            try
            {
                return;

                if (this.to != "")
                {
                    MailMessage message = new MailMessage(this.from, this.to, this.subject, this.body);

                    //message.BodyEncoding = Encoding.ASCII;
                    message.DeliveryNotificationOptions = DeliveryNotificationOptions.OnSuccess;
                    message.IsBodyHtml = true;
                    message.Priority = MailPriority.High;
                    MailAddress ma = new MailAddress(this.from);
                    message.From = ma;
                    //message.Attachments.Add(new Attachment("filename"));

                    //SmtpClient emailClient = new SmtpClient(this.smtpServer, 587);
                    SmtpClient emailClient = new SmtpClient(this.smtpServer, 465);

                    emailClient.EnableSsl = true;

                    //emailClient.Credentials = new NetworkCredential("webportal@chskenya.org", "Webportal1");
                    emailClient.EnableSsl = true;

                    emailClient.DeliveryMethod = SmtpDeliveryMethod.Network;
                    //emailClient.UseDefaultCredentials = true;
                    //emailClient.Send(message);
                }
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
                throw;
            }
        }

    }//end of cMail


    /// <summary>
    /// hold common information to all site users
    /// </summary>
    public static class cSite
    {
        /// <summary>
        /// 
        /// </summary>
        public const int maxLogins = 5;
        private static string rootDirectory = "C:\\Portal\\LIVE\\BandariSacco";
        //private static string rootDirectory = "A:\\Portals\\Creation\\Bandari";
        public static string smtp_server = "smtp.google.com";

        //public static string company_name = "Kenya Civil Aviation Authority";
        //public static string company_name = "Kcaa Test Company";
        public static string company_name = Config.companyName;

        /// <summary>
        /// get/set external user id
        /// </summary>
        /// 
        /// 
        /// 
        /// 

        public static NavPortal Bandari_WebService
        {
            get
            {
                NavPortal ws = new NavPortal();

                try
                {
                    string
                        //username = "erp.admin",
                        //password = "3RP@crakenya",
                        //domain = "CRAKENYA";
                        username = "Web.Portal",
                        password = "Password.123",
                        domain = "BSL2012";

                    if (HttpContext.Current.Session["username"] != null)
                    {
                        username = HttpContext.Current.Session["username"].ToString();
                    }
                    if (HttpContext.Current.Session["password"] != null)
                    {
                        password = HttpContext.Current.Session["password"].ToString();
                    }
                    if (HttpContext.Current.Session["domain"] != null)
                    {
                        domain = HttpContext.Current.Session["domain"].ToString();
                    }

                    NetworkCredential credentials = new NetworkCredential(username, password, domain);

                    ws.Credentials = credentials;
                    ws.PreAuthenticate = true;

                    //ws.UseDefaultCredentials = true;
                    //ws.Credentials = CredentialCache.DefaultNetworkCredentials;
                }
                catch (Exception ex)
                {
                    ex.Data.Clear();
                }
                return ws;
            }
        }


        public static string Employee_UserId()
        {
            string s = "";

            try
            {
                SqlDataReader dr = new cConnect().ReadDB(
                    "select [User ID]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where ([No_] = '" + cSite.ExternalUserID + "');"
                    );

                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        if (dr["User ID"] != null)
                        {
                            s = dr["User ID"].ToString();
                        }
                    }
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;

        }
        public static string GetUserID
        {
            get
            {
                string i = "";
                string empNum = cSite.ExternalUserID;
                try
                {
                    string s = "";
                    s = "SELECT [No_], [User ID]" +
                        " FROM [" + cSite.company_name + "$HR Employees] WHERE [No_] ='" + empNum + "';";

                    SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                    {
                        while (dr.Read())
                        {
                            i = dr["User ID"].ToString();
                        }
                    }
                    dr.Close();
                }
                catch (Exception ex)
                {
                    throw ex;
                    ex.Data.Clear();
                }
                return i;
            }
        }

        public static string ExternalUserID
        {
            get
            {
                string d = "";
                try
                {
                    d = HttpContext.Current.Session["ExternalUserID"].ToString().ToUpper();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }

                return d;
            }
            set
            {
                try
                {
                    HttpContext.Current.Session["ExternalUserID"] = value.ToUpper();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
            }
        }

        /// <summary>
        /// get/set external user session id
        /// </summary>
        public static string ExternalUserSessionID
        {
            get
            {
                string d = "";
                try
                {
                    d = HttpContext.Current.Session["ExternalUserSessionID"].ToString();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }

                return d;
            }
            set
            {
                try
                {
                    HttpContext.Current.Session["ExternalUserSessionID"] = value;
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
            }
        }

        /// <summary>
        /// get/set login attempt
        /// </summary>
        public static int LoginAttempt
        {
            get
            {
                int d = 0;
                try
                {
                    d = Convert.ToInt32(HttpContext.Current.Session["LoginAttempt"]);
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }

                return d;
            }
            set
            {
                try
                {
                    HttpContext.Current.Session["LoginAttempt"] = value.ToString();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
            }
        }

        /// <summary>
        /// Alerts the developers that an error occured,
        /// Includes the source and description of the error
        /// Hence, the developer should come, prepared for changes/maintenance
        /// </summary>
        /// <param name="ex"></param>
        public static void SendErrorToDeveloper(Exception ex)
        {
            try
            {
                //return;

                string s = "<HR><P>An error occured for KNCHR - WEB PORTAL";
                s += "<HR><P>ERROR DETAILS:";
                s += "<HR><P>Date: " + DateTime.Now.ToLongDateString();
                s += "<BR>Time: " + DateTime.Now.ToLocalTime().ToString();
                s += "<HR><P>Error Message: " + ex.Message;
                s += "<HR><P>Error Source: " + ex.Source;
                s += "<HR><P>Stack Trace: " + ex.StackTrace;
                s += "<HR><P>Target Site - Name: " + ex.TargetSite.Name;
                s += "<HR><P>Target Site - Module: " + ex.TargetSite.Module.FullyQualifiedName;

                cMail eml = new cMail();
                eml.Body = s;
                eml.From = "webportal@chskenya.org";
                eml.Subject = "KNCHR - ISSUES IN THE WEB PORTAL";

                eml.To = "kaniriki@gmail.com";

                eml.SendMail();

            }
            catch (Exception ex2)
            {
                ex2.Data.Clear();
            }
        }
        public static string GetEmployeeNo2(string No)
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select top 1 [EmployeeNo]" +
                    " from [" + cSite.company_name + "$Online Transport Requisations]" +
                    " where ([No] = '" + cSite.ValidateEntry(No) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["[EmployeeNo]"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;
        }

        public static string RDEmpNo(string empNo)
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select [Regional Director code]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where (No_ = '" + cSite.ValidateEntry(empNo) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["Company E-Mail"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;
        }

        public static string GetEmployeeNo(string LeaveCode)
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select top 1 [Employee No]" +
                    " from [" + cSite.company_name + "$HR Leave Application]" +
                    " where ([Application Code] = '" + cSite.ValidateEntry(LeaveCode) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["[Employee No]"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;
        }
        public static void SendAlert(string body, string recepient)
        {
            try
            {
                //recepient = "kaniriki@gmail.com";

                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                mail.From = new MailAddress("aatissupport@kcaa.or.ke");

                mail.To.Add(recepient);
                mail.To.Add("kaniriki@gmail.org");

                mail.Subject = "Web Portal Alert";
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = 25;
                //SmtpServer.Credentials = new System.Net.NetworkCredential("aatissupport", "123");
                SmtpServer.EnableSsl = true;
                //SmtpServer.Send(mail);

            }
            catch (Exception ex2)
            {
                ex2.Data.Clear();
            }
        }


        public static void send_user_mail(string mailBody, string To_Email, string subject)
        {
            //DataSet dsGet = new DataSet();
            try
            {
                MailMessage msg = new MailMessage();
                //MailAddress EmailAdd = new MailAddress("aatissupport@kcaa.or.ke");
                MailAddress EmailAdd = new MailAddress("hrms@knchr.org", "The KNCHR HRMS");
                msg.From = EmailAdd;
                EmailAdd = new MailAddress(To_Email);
                msg.To.Add(EmailAdd);
                //EmailAdd = new MailAddress("kaniriki@gmail.com");
                //msg.CC.Add(EmailAdd);
                //EmailAdd = new MailAddress("tkivuva@kcaa.or.ke");
                //msg.Bcc.Add(EmailAdd);
                msg.Subject = subject;
                //msg.Body = "Hello, \n Welcome to the Kenya Civil Aviation Authority Advanced Air Transport Information System. \nFor further information/assistance, Please contact airtransport@kcaa.or.ke.\nThis message is System Auto-generated, Please don't reply to it.";
                msg.Body = mailBody;
                msg.IsBodyHtml = true;
                msg.Priority = MailPriority.High;
                msg.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                SmtpClient client = new SmtpClient();
                client.Host = "192.168.50.4";//External IP Address. To be changed accordingly.
                //client.Host = "smtp.gmail.com";//External IP Address. To be changed accordingly.
                client.Send(msg);
                msg.Dispose();
            }
            catch (Exception ex)
            {
                ex.Data.Clear();
                //lblMessage.Text = ex.Message.ToString() + ". Please refresh Page. If problem persists contact the System's Administrator";
            }
            finally
            {
                //dsGet.Clear();
            }
        }

        public static void SendAlert(string body, string recepient, string subject)
        {
            try
            {
                //recepient = "kaniriki@gmail.com";

                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                //mail.From = new MailAddress("aatissupport@kcaa.or.ke");
                mail.From = new MailAddress("kaniriki@gmail.com");

                mail.To.Add(recepient);
                mail.Bcc.Add("kaniriki@gmail.com");

                mail.Subject = subject;
                mail.Body = body;
                mail.IsBodyHtml = true;
                SmtpServer.Port = 25;
                //SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("kaniriki", "ICAP2013!");
                SmtpServer.EnableSsl = true;
                //SmtpServer.Send(mail);

            }
            catch (Exception ex2)
            {
                ex2.Data.Clear();
            }
        }

        /// <summary>
        /// nb: change to long if the site-hit 
        /// is expected to be greater than 2.142 million
        /// this returns the site hit counter, for all users
        /// </summary>
        public static int SiteHit
        {
            get
            {
                int i = 1;
                try
                {
                    string s = "";
                    s = "SELECT COUNT([User Name]) AS [Site Hit]" +
                        " FROM [" + cSite.company_name + "$Online Sessions];";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            i = Convert.ToInt32(dr["Site Hit"]);

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return i;
            }
        }

        /// <summary>
        /// check if the user has changed the password from the default password
        /// </summary>
        public static bool ChangedPassword
        {
            get
            {
                bool b = false;

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "SELECT [Changed Password]" +
                        " FROM [" + cSite.company_name + "$Online User]" +
                        " WHERE [User Name] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "'" +
                        " and [Changed Password] = 1;"
                        );

                    b = dr.HasRows;

                    dr.Close();

                    if (b == false)
                    {
                        dr = new cConnect().ReadDB(
                            "SELECT [Portal Administrator Username] FROM [" + cSite.company_name + "$HR Setup]" +
                            " where [Portal Administrator Username] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "';"
                            );

                        b = dr.HasRows;

                        dr.Close();
                    }
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return b;
            }
        }

        /// <summary>
        /// nb: change to long if the site-hit 
        /// is expected to be greater than 2.142 million
        /// this returns the current user's site hit
        /// </summary>
        public static int SiteHitPersonal
        {
            get
            {
                int i = 1;

                try
                {
                    string s = "";
                    s = "SELECT COUNT([User Name]) AS [Site Hit]" +
                        " FROM [" + cSite.company_name + "$Online Sessions]" +
                        " WHERE [User Name] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "';";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            i = Convert.ToInt32(dr["Site Hit"]);

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return i;
            }
        }

        /// <summary>
        /// read-only property, returns true if the external user has been authenticated
        /// </summary>
        public static bool Authenticated
        {
            get
            {
                bool r = false;
                try
                {
                    string s = "";
                    s = "SELECT [User Name] FROM [" + cSite.company_name + "$Online Sessions]";
                    s += " WHERE [Session ID] = '" + cSite.ExternalUserSessionID + "'";
                    s += " AND [User Name] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "';";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);
                    r = dr.HasRows;

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return r;
            }
        }

        public static bool IsAdministrator
        {
            get
            {
                bool r = false;

                try
                {
                    string s = "";
                    s = "SELECT [Portal Administrator Username] FROM [" + cSite.company_name + "$HR Setup]";
                    s += " where [Portal Administrator Username] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "';";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);
                    r = dr.HasRows;

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return r;
            }
        }

        public static string RootDirectory
        {
            get
            {
                string s = "https://localhost/safsacco";
                try
                {
                    //Then using host name, get the IP address list..
                    IPHostEntry ipEntry = Dns.GetHostByName(Dns.GetHostName());
                    IPAddress[] addr = ipEntry.AddressList;
                    if (addr.Length > 0)
                    {
                        s = addr[0].ToString() + "/sacco/";
                        rootDirectory = new Page().ResolveUrl("https://" + s);
                    }
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return rootDirectory;
            }
        }

        public static string DonorName(string donorCode)
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select [Name] from [" + cSite.company_name + "$Dimension Value]" +
                    " where [Code] = '" + cSite.ValidateEntry(donorCode) + "' and [Dimension Code]='DONORS'"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["Name"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return s;
        }

        /// <summary>
        /// Trim all sql illegal characters
        /// </summary>
        /// <param name="Entry"></param>
        /// <returns></returns>
        public static string ValidateEntry(string Entry)
        {
            string r = Entry;
            try
            {
                if (Entry.Length > 250) Entry = Entry.Substring(0, 250);

                string s = "'";//sql illegal entry characters

                Entry = Entry.Trim();//remove spaces

                char[] c = s.ToCharArray();

                for (int i = 0; i < c.Length; i++)
                    if (Entry.Contains(c[i].ToString()))
                    {
                        //Entry = Entry.Replace(c[i].ToString(), "" );//blank
                        Entry = Entry.Replace(c[i].ToString(), "\'" + c[i].ToString());//escape character
                    }

                s = "--";//sql illegal entry characters

                if (Entry.Contains(s))
                    Entry = Entry.Replace(s, "");//blank

                r = Entry;
            }
            catch (Exception)
            {
                throw;
            }
            return r;
        }

        /// <summary>
        /// Trim all sql and other illegal characters
        /// </summary>
        /// <param name="Entry"></param>
        /// <returns></returns>
        public static string ValidateNumber(string Entry)
        {
            string r = Entry;

            try
            {
                Entry = ValidateEntry(Entry);

                string s = ",()";//sql illegal entry characters

                Entry = Entry.Trim();

                char[] c = s.ToCharArray();

                for (int i = 0; i < c.Length; i++)
                {
                    Entry = Entry.Replace(c[i].ToString(), "");
                }
                r = Entry;
            }
            catch (Exception)
            {
                throw;
            }
            return r;
        }

        /// <summary>
        /// Trim all sql and other illegal characters
        /// </summary>
        /// <param name="Number2Unformat"></param>
        /// <returns></returns>
        public static double UnformatNumber(string Number2Unformat)
        {
            double d = 0;

            try
            {
                d = Convert.ToDouble(ValidateNumber(Number2Unformat));
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return d;
        }

        /// <summary>
        /// check if number is real
        /// </summary>
        /// <param name="numberToValidate"></param>
        /// <returns></returns>
        public static bool ValidNumber(string numberToValidate)
        {
            bool b = false;

            try
            {
                numberToValidate = ValidateNumber(numberToValidate);

                if (numberToValidate.Length > 0)
                {
                    //throw exception if not double number.
                    double d = Convert.ToDouble(numberToValidate);

                    //success/valid double number
                    b = true;
                }
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return b;
        }

        public static bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool IsValidDate(string dateEntered)
        {
            DateTime outDate;
            try
            {
                var date = DateTime.TryParse(dateEntered, out outDate);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string FormatNumber(double Number2Format)
        {
            return cSite.FormatNumber(Number2Format.ToString());
        }

        public static string FormatNumber(string Number2Format)
        {
            if (Number2Format.Contains("(") || Number2Format.Contains(")"))
                Number2Format = Number2Format.Substring(1, Number2Format.Length - 2);

            double d = Convert.ToDouble(Number2Format);//remove non-numeric characters

            string s = d.ToString();//revert to string

            string wholeNumber = "";
            string decimalPoint = "";

            bool negativeNumber;

            if (Convert.ToDouble(Number2Format) < 0)
                negativeNumber = true;
            else
                negativeNumber = false;

            if (negativeNumber)
                s = s.Substring(1);

            try
            {
                int i, j, k;

                if (s.Contains(".") == false)
                    s += ".00";

                i = s.IndexOf(".");

                decimalPoint = s.Substring(i + 1);

                if (decimalPoint.Length == 1)
                    decimalPoint = decimalPoint + "0";
                else if (decimalPoint.Length > 2)
                    decimalPoint = decimalPoint.Substring(0, 2);

                k = 0;
                for (j = (i - 1); j >= 0; j--)
                {
                    wholeNumber = s.Substring(j, 1) + wholeNumber;

                    k++;
                    if (k == 3)
                    {
                        k = 0;

                        if (j > 0) wholeNumber = "," + wholeNumber;
                    }
                }
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            //if (negativeNumber) s = "(" + wholeNumber + "." + decimalPoint + ")";
            if (negativeNumber) s = "-" + wholeNumber + "." + decimalPoint;

            else s = wholeNumber + "." + decimalPoint;

            return s;
        }

        public static string FormatDate(DateTime Date2Format)
        {
            string s = "";

            try
            {
                string y, m, d, hr, mn, sc;

                y = Date2Format.Year.ToString();

                m = Date2Format.Month.ToString();
                if (m.Length == 1) m = "0" + m;

                d = Date2Format.Day.ToString();
                if (d.Length == 1) d = "0" + d;

                hr = Date2Format.Hour.ToString();
                if (hr.Length == 1) hr = "0" + hr;

                mn = Date2Format.Minute.ToString();
                if (mn.Length == 1) mn = "0" + mn;

                sc = Date2Format.Second.ToString();
                if (sc.Length == 1) sc = "0" + sc;

                //s = y + m + d + " " + hr + ":" + mn + ":" + sc;
                s = String.Format("{0}{1}{2} {3}:{4}:{5}", y, m, d, hr, mn, sc);
            }
            catch (Exception ex)
            {
                SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return s;
        }

        public static string FormatDate(DateTime Date2Format, bool excludeTime)
        {
            string s = "";

            try
            {
                string y, m, d;

                y = Date2Format.Year.ToString();

                m = Date2Format.Month.ToString();
                if (m.Length == 1) m = "0" + m;

                d = Date2Format.Day.ToString();
                if (d.Length == 1) d = "0" + d;

                if (excludeTime)
                    s = y + m + d;
                else
                    s = cSite.FormatDate(Date2Format);
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return s;
        }

        public static string FormatDate()
        {
            DateTime Date2Format = DateTime.Now;

            string s = "";

            try
            {
                string y, m, d, hr, mn, sc;

                y = Date2Format.Year.ToString();

                m = Date2Format.Month.ToString();
                if (m.Length == 1) m = "0" + m;

                d = Date2Format.Day.ToString();
                if (d.Length == 1) d = "0" + d;

                hr = Date2Format.Hour.ToString();
                if (hr.Length == 1) hr = "0" + hr;

                mn = Date2Format.Minute.ToString();
                if (mn.Length == 1) mn = "0" + mn;

                sc = Date2Format.Second.ToString();
                if (sc.Length == 1) sc = "0" + sc;

                s = y + m + d + hr + mn + sc;
            }
            catch (Exception ex)
            {
                SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return s;
        }

        public static string DateOfJoin(string empID)
        {
            string m = "";
            try
            {
                string s = "select [Date Of Join]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where [No_] = '" + cSite.ValidateEntry(empID) + "';";

                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                if (dr.HasRows)
                    while (dr.Read())
                        m = Convert.ToDateTime(dr["Date Of Join"]).ToLongDateString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            return m;
        }

        public static string UserName
        {
            get
            {
                string m = "";
                try
                {
                    string s = "select [First Name],[Middle Name],[Last Name]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where [No_] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "';";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            m =
                                dr["First Name"].ToString() + " " + dr["Middle Name"].ToString() + " " + dr["Last Name"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }

                if (m == "") m = "Guest";

                return m;
            }
        }
        public static string Encrypt(string pstrText)
        {
            string pstrEncrKey = "1239;[pewGKG)NisarFidesTech";
            byte[] byKey = { };
            byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
            byKey = System.Text.Encoding.UTF8.GetBytes(pstrEncrKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            byte[] inputByteArray = Encoding.UTF8.GetBytes(pstrText);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            return Convert.ToBase64String(ms.ToArray());
        }
        public static string Decrypt(string pstrText)
        {
            pstrText = pstrText.Replace(" ", "+");
            string pstrDecrKey = "1239;[pewGKG)NisarFidesTech";
            byte[] byKey = { };
            byte[] IV = { 18, 52, 86, 120, 144, 171, 205, 239 };
            byte[] inputByteArray = new byte[pstrText.Length];

            byKey = System.Text.Encoding.UTF8.GetBytes(pstrDecrKey.Substring(0, 8));
            DESCryptoServiceProvider des = new DESCryptoServiceProvider();
            inputByteArray = Convert.FromBase64String(pstrText);
            MemoryStream ms = new MemoryStream();
            CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(byKey, IV), CryptoStreamMode.Write);
            cs.Write(inputByteArray, 0, inputByteArray.Length);
            cs.FlushFinalBlock();
            System.Text.Encoding encoding = System.Text.Encoding.UTF8;
            return encoding.GetString(ms.ToArray());
        }
        public static string EmployeeNames(string empID)
        {
            string m = "";
            try
            {
                string s = "select [First Name],[Middle Name],[Last Name]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where [No_] = '" + cSite.ValidateEntry(empID) + "';";

                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                if (dr.HasRows)
                    while (dr.Read())
                        m =
                            dr["First Name"].ToString() + " " +
                            dr["Middle Name"].ToString() + " " +
                            dr["Last Name"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            if (m == "") m = "Guest";

            return m;
        }

        public static string EmployeeDepartmentName(string empID)
        {
            string m = "";

            try
            {
                string s = "select [HR Department]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where [No_] = '" + cSite.ValidateEntry(empID) + "';";

                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                if (dr.HasRows)
                    while (dr.Read())
                        m = dr["HR Department"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }

            if (m == "") m = "Not Specified";

            return m;
        }

        public static string EmployeeGrade
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Description]" +
                        " from [" + cSite.company_name + "$HR Employees],[" + cSite.company_name + "$HR Job Category_Grade]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "')" +
                        " and [" + cSite.company_name + "$HR Job Category_Grade].Code = [" + cSite.company_name + "$HR Employees].Grade" +
                        " and [" + cSite.company_name + "$HR Job Category_Grade].[Type] = 1;"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["Description"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeGender
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Gender]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = (Convert.ToInt32(dr["Gender"]) + 1).ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeEmail(string empNo)
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select [Company E-Mail]" +
                    " from [" + cSite.company_name + "$HR Employees]" +
                    " where (No_ = '" + cSite.ValidateEntry(empNo) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["Company E-Mail"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;
        }

        public static string EmployeeDepartment
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [" + cSite.company_name + "$Dimension Value].Name" +
                        " from [" + cSite.company_name + "$HR Employees],[" + cSite.company_name + "$Dimension Value]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "')" +
                        " and [" + cSite.company_name + "$Dimension Value].Code = [" + cSite.company_name + "$HR Employees].[HR Department]" +
                        " and [" + cSite.company_name + "$Dimension Value].[Dimension Code] = 'DEPARTMENT';"
                        );
                    //"Dimension Value".Code WHERE (Dimension Code=FILTER(DEPARTMENT))
                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["Name"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeDepartmentCode
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [HR Department]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "')"
                        );
                    //"Dimension Value".Code WHERE (Dimension Code=FILTER(DEPARTMENT))
                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["HR Department"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeJobTitle
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Job Title]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["Job Title"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeePIN
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [PIN Number]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["PIN Number"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeNHIF
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [NHIF No_]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["NHIF No_"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeNSSF
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [NSSF No_]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["NSSF No_"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }
        public static string UserId()
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select [User ID]" +
                    " from [" + cSite.company_name + "$User Setup]" +
                    " where ([Staff No] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["User ID"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;

        }

        public static string UserSupervisor()
        {
            string s = "";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                    "select [Approver ID]" +
                    " from [" + cSite.company_name + "$User Setup]" +
                    " where ([Staff No] = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["Approver ID"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;

        }

        //public static WebPortalServices_Binding WebService
        //{
        //    get
        //    {
        //        WebPortalServices_Binding ws = new WebPortalServices_Binding();

        //        try
        //        {
        //            string
        //                username = "ICAP.Portal",
        //                password = "Pass1234",
        //                domain = "NRB-NAVSVR";

        //            NetworkCredential credentials = new NetworkCredential(username, password, domain);

        //            ws.Credentials = credentials;

        //            ws.PreAuthenticate = true;
        //        }
        //        catch (Exception ex)
        //        {
        //            cSite.SendErrorToDeveloper(ex);
        //            ex.Data.Clear();
        //        }
        //        return ws;
        //    }
        //}

        public static string EmployeeBankName
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [" + cSite.company_name + "$HR Employees].[Bank Code],[Bank Name]" +
                        " from [" + cSite.company_name + "$HR Employees],[" + cSite.company_name + "$prBank Structure]" +
                        " where No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "'" +
                        " and [" + cSite.company_name + "$HR Employees].[Bank Code] = [Main Bank];"
                        );

                    if (dr.HasRows)
                        while (dr.Read())

                            s = dr["Bank Code"].ToString() + " - " + dr["Bank Name"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeBankBranch
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Branch Code],[Branch Name]" +
                        " from [" + cSite.company_name + "$HR Employees],[" + cSite.company_name + "$prBank Structure]" +
                        " where No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "'" +
                        " and [Branch Code] = [Branch Bank]" +
                        " and [" + cSite.company_name + "$HR Employees].[Bank Code] = [Main Bank];"
                        );

                    if (dr.HasRows)
                        while (dr.Read())

                            s = dr["Branch Code"].ToString() + " - " + dr["Branch Name"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static string EmployeeBankAccount
        {
            get
            {
                string s = "";

                try
                {
                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Bank Account Number]" +
                        " from [" + cSite.company_name + "$HR Employees]" +
                        " where (No_ = '" + cSite.ValidateEntry(cSite.ExternalUserID) + "');"
                        );

                    if (dr.HasRows)
                        while (dr.Read())
                            s = dr["Bank Account Number"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }
                return s;
            }
        }

        public static void WriteLog(string transactionDescription)
        {
            try
            {
                string s = "insert into [" + cSite.company_name + "$Online Audit Trail]" +
                    " ([User Name],[Session ID],[Transaction],[Time of Transaction])values(" +
                    " '" + cSite.ExternalUserID.ToUpper() + "'," +
                    " '" + cSite.ExternalUserSessionID.ToUpper() + "'," +
                    " '" + cSite.ValidateEntry(transactionDescription) + "'," +
                    " '" + cSite.FormatDate(DateTime.Now) + "')";

                new cConnect().WriteDB(s);
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
        }

        public static DateTime AddWorkingDays(DateTime specificDate, int workingDaysToAdd)
        {
            DateTime date = specificDate;

            try
            {
                int completeWeeks = workingDaysToAdd / 5;
                date = specificDate.AddDays(completeWeeks * 7);
                workingDaysToAdd = workingDaysToAdd % 5;

                for (int i = 0; i < workingDaysToAdd; i++)
                {
                    date = date.AddDays(1);

                    while (!IsWeekDay(date))
                    {
                        date = date.AddDays(1);
                    }
                }

            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return date;
        }

        private static bool IsWeekDay(DateTime date)
        {
            DayOfWeek day = date.DayOfWeek;

            if (day == DayOfWeek.Saturday || day == DayOfWeek.Sunday)
                return false;
            else
                return true;
        }

        public static string Advert1
        {
            get
            {
                string r = "";

                try
                {
                    string s = "select [Advert1] from [Online Applications Setup];";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            r = dr["Advert1"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);

                    throw;
                }

                return r;
            }
        }

        public static string Advert2
        {
            get
            {
                string r = "";

                try
                {
                    string s = "select [Advert2] from [Online Applications Setup];";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            r = dr["Advert2"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);

                    throw;
                }

                return r;
            }
        }

        public static string Advert3
        {
            get
            {
                string r = "";

                try
                {
                    string s = "select [Advert3] from [Online Applications Setup];";

                    SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    if (dr.HasRows)
                        while (dr.Read())
                            r = dr["Advert3"].ToString();

                    dr.Close();
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);

                    throw;
                }

                return r;
            }
        }

        public static string SitePath
        {
            get
            {
                string r = "";

                try
                {
                    ////string s = "select [Site Windows Path]" +
                    ////    " from [" + cSite.company_name + "$Online Setup];";

                    ////SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(s);

                    ////if (dr.HasRows)
                    ////    while (dr.Read())
                    ////        r = dr["Site Windows Path"].ToString();

                    ////dr.Close();
                    
                }
                catch (Exception ex)
                {
                    cSite.SendErrorToDeveloper(ex);
                    ex.Data.Clear();
                }

                //return r;
                //return @"C:\CoreTEC\Online Module - ICAP";
                
                return MyClass.ReportsPath();
            }
        }

        public static string RatingDescription(int rating)
        {
            string s = "Awaiting Overall Rating From Manager";

            try
            {
                SQL_ICAP.SqlDataReader dr = new cConnect().ReadDB(
                        "select [Description],[Value] from [" + cSite.company_name + "$Online Rating]" +
                        " where [Value] = " + rating
                    );

                if (dr.HasRows)
                    while (dr.Read())
                        s = dr["Value"].ToString() + " - " + dr["Description"].ToString();

                dr.Close();
            }
            catch (Exception ex)
            {
                cSite.SendErrorToDeveloper(ex);
                ex.Data.Clear();
            }
            return s;
        }

        public static Control FindControlRecursive(Control Root, string Id)
        {

            if (Root.ID == Id)
                return Root;

            foreach (Control Ctl in Root.Controls)
            {
                Control FoundCtl = FindControlRecursive(Ctl, Id);

                if (FoundCtl != null)

                    return FoundCtl;

            }

            return null;
        }

        public static decimal? CustomParse(string incomingValue)
        {
            decimal val;
            if (!decimal.TryParse(incomingValue.Replace(",", "").Replace(".", ""), NumberStyles.Number, CultureInfo.InvariantCulture, out val))
                return null;
            //return val / 100;
            return val;
        }

        public static string Get_NextNumberSeries(string Series_Code)
        {
            string Next_No_To_Use = "";
            int Increment_by_No_ = 0;
            string strLine_No_ = "10000";
            string strLast_No__Used = string.Empty;
            int last_used = 0;
            string lastUsed = "";
            DateTime dtLast_Date_Used = Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy"));

            using (SqlConnection mConn = new SqlConnection(cConnect.conStr))
            {
                mConn.Open();
                using (SqlCommand cmd = mConn.CreateCommand())
                {
                    string stringSQL =
                        "SELECT [Series Code],[Line No_],[Increment-by No_],[Last No_ Used], [Last Date Used]" +
                        ",replace(isnull([Last No_ Used],'0'),[Series Code],'0') last_used,[Open] " +
                        "FROM [" + cSite.company_name + "$No_ Series Line] " +
                        "WHERE ([Series Code] = @Series_Code)";

                    cmd.CommandText = stringSQL;

                    cmd.Parameters.Add("@Series_Code", SqlDbType.VarChar, 10);
                    cmd.Parameters["@Series_Code"].Value = Series_Code;

                    //cmd.Parameters.Add("@Line_No_", SqlDbType.Int);
                    //cmd.Parameters["@Line_No_"].Value = Line_No_;

                    using (SqlDataAdapter da = new SqlDataAdapter())
                    {
                        da.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            int numberOfRows = da.Fill(ds, "myTblName");
                            int countRows = ds.Tables["myTblName"].Rows.Count;
                            if (countRows > 0)
                            {
                                DataRow dr = ds.Tables["myTblName"].Rows[0];

                                Increment_by_No_ = int.Parse(dr["Increment-by No_"].ToString());
                                strLast_No__Used = dr["Last No_ Used"].ToString();
                                lastUsed = dr["last_used"].ToString();
                                dtLast_Date_Used = Convert.ToDateTime(dr["Last Date Used"].ToString());

                                string resultString = Regex.Match(strLast_No__Used, @"\d+").Value;
                                last_used = Int32.Parse(resultString);

                                strLine_No_ = dr["Line No_"].ToString();
                                dr = null;

                                //thisNo__Series_Line.Last_No__Used = Series_Code.Trim() + (last_used + Increment_by_No_).ToString().PadLeft(strLine_No_.Length, '0');
                                Next_No_To_Use = Series_Code.Trim() + (last_used + Increment_by_No_).ToString().PadLeft(strLine_No_.Length, '0');

                                DateTime Last_Date_Used = Convert.ToDateTime(DateTime.Now.ToString("dd-MMM-yyyy"));

                                UpdateRecord(Next_No_To_Use, Series_Code, Last_Date_Used);
                            }
                        }
                    }
                }
                mConn.Close();
            }
            return Next_No_To_Use;
        }

        public static bool UpdateRecord(string Next_No_To_Update, string seriesCode, DateTime Last_Date_Used)
        {
            bool rtVal = false;
            try
            {
                using (SqlConnection mConn = new SqlConnection(cConnect.conStr))
                {
                    mConn.Open();
                    using (SqlCommand cmd = mConn.CreateCommand())
                    {
                        string stringSQL =
                            "UPDATE [" + cSite.company_name + "$No_ Series Line] " +
                            "SET [Last No_ Used]=@Last_No__Used,[Last Date Used]= @Last_Date_Used " +
                            "WHERE ([Series Code]=@Series_Code) ";

                        cmd.CommandText = stringSQL;
                        cmd.Parameters.Add("@Last_No__Used", SqlDbType.VarChar, 20);
                        cmd.Parameters["@Last_No__Used"].Value = Next_No_To_Update;

                        cmd.Parameters.Add("@Last_Date_Used", SqlDbType.DateTime);
                        cmd.Parameters["@Last_Date_Used"].Value = Last_Date_Used;

                        cmd.Parameters.Add("@Series_Code", SqlDbType.VarChar, 10);
                        cmd.Parameters["@Series_Code"].Value = seriesCode;

                        int result = (int)cmd.ExecuteNonQuery();
                        cmd.Dispose();
                        if (result > 0)
                        { rtVal = true; }
                        else
                        { rtVal = false; }
                    }
                    mConn.Close();
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return rtVal;
        }

    }

   

    public class Messaging
    {
        public static void ShowAlert(Page currentPage, string message)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("');");
            currentPage.ClientScript.RegisterStartupScript(typeof(Messaging), "showalert", sb.ToString(), true);
        }

        public static void ShowAlert(string message)
        {
            Page currentPage = HttpContext.Current.Handler as Page;
            if (currentPage != null)
                ShowAlert(currentPage, message);
        }
    }

    public class Utility
    {
        #region WriteLog
        public static void WriteLog(string text)
        {
            try
            {
                //set up a filestream
                string strPath = @"F:\CITAM Portal Logs";
                //string fileName = "logs.txt";
                string fileName = "trail.txt";
                string filenamePath = strPath + '\\' + fileName;
                Directory.CreateDirectory(strPath);
                FileStream fs = new FileStream(filenamePath, FileMode.OpenOrCreate, FileAccess.Write);
                //set up a streamwriter for adding text
                StreamWriter sw = new StreamWriter(fs);
                //find the end of the underlying filestream
                sw.BaseStream.Seek(0, SeekOrigin.End);
                //add the text
                sw.WriteLine(text);
                //add the text to the underlying filestream
                sw.Flush();
                //close the writer
                sw.Close();
            }
            catch (Exception ex)
            {
                throw;
                //ex.Data.Clear();
            }
        }
        #endregion

    }

}