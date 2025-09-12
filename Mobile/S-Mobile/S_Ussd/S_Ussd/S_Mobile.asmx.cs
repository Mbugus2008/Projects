using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Logs = Logging.Logging;

using System.Data.SqlClient;
using System.Drawing;
using System.Data.Entity.Core.EntityClient;
using System.Data.Entity;
using System.Xml.Serialization;
using System.IO;
using static S_Ussd.enums;
using System.Globalization;
using System.Text;
using System.ComponentModel.Design.Serialization;
using Logging;
using RestSharp;
using Newtonsoft.Json;
using System.Reflection.Emit;
using System.Runtime.Remoting.Contexts;
using static System.Net.Mime.MediaTypeNames;
using System.Web.Services.Description;
using System.Data.Entity.Infrastructure;
using S_Ussd.ClientData;
using S_Ussd.Loans;
using System.Threading.Tasks;

namespace S_Ussd
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://trimline.co.ke/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]

    public class S_Mobile : WebService
    {
        public string res = "END Thank You";
        public string channel = "";
        static settings s = new settings();
        public static Request req = new Request();
        public lang lang = new lang();

        public static S_mobileClient.Client smobile = new S_mobileClient.Client();
        private RestClient List_client = new RestClient("http://listsoftware.zapto.org:18033/USSD");

        public Iservice service = null;

        public S_Mobile()
        {

            s = s.loadsettings(HttpContext.Current.Server.MapPath("~/Settings.config"));
            List_client = new RestClient(s.Url);
            // var connectionstring = PData. Connectionstring(@".\", "Mobile");


        }
        public static string ConnectionString()
        {
            // Specify the provider name, server and database.
            string providerName = "System.Data.SqlClient";
            //string serverName = "Server\\sql2008";
            //string databaseName = client.Db;
            // Initialize the connection string builder for the
            // underlying provider.
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            // Set the properties for the data source.
            sqlBuilder.DataSource = string.Concat(s.Serverip, @"\", s.Instance);
            sqlBuilder.InitialCatalog = s.Database;
            sqlBuilder.IntegratedSecurity = s.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;
            if (s.IntegratedSecurity == false)
            {
                sqlBuilder.UserID = s.Username;
                sqlBuilder.Password = s.pass;
            }
            // Build the SqlConnection connection string.
            string providerString = sqlBuilder.ToString();
            Logging.Logging.LogEntryOnFile(providerString);
           // Initialize the EntityConnectionStringBuilder.
           EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            //Set the provider name.
            entityBuilder.Provider = providerName;
            // Set the provider-specific connection string.
            entityBuilder.ProviderConnectionString = providerString;
            // Set the Metadata location.
            entityBuilder.Metadata = "res://*/";
            return entityBuilder.ToString();
        }
        listrequest listrequest;
        Trans trans;
        requests currentrequest;
        public listrequest getsession(string Path)
        {
            listrequest lr = null;
            if (File.Exists(Path))
            {
                long fileLen = new FileInfo(Path).Length;
                if (fileLen > 0)
                {
                    string[] d = File.ReadAllLines(Path, Encoding.UTF8);
                    lr = JsonConvert.DeserializeObject<listrequest>(d[d.Length - 1]);
                }
            }
            return lr;
        }
        [WebMethod(EnableSession = true)]
        public void USSDLIST(string phoneNumber, string sessionId, string serviceCode, string text)
        {
            Logging.Logging.logpath += @"List\";
            var pathh = String.Format(@"{1}Sessions\{0}\", phoneNumber.Replace("+", ""), Logging.Logging.logpath);
            var file = string.Format("{0}.txt", sessionId);
            Otp otp = new Otp();
            try
            {
                listrequest = getsession(pathh + file);
                if (listrequest == null)
                    listrequest = new listrequest { phone = phoneNumber, session = sessionId };
                //Context.Session[sessionId] = listrequest;

                Logging.Logging.LogEntryOnFile(string.Format("> {0}", JsonConvert.SerializeObject(listrequest)));

                if (serviceCode == "*483*909#")
                    if (text == "")
                        text = "10" + text;
                    else
                        text = "10*" + text;

                text = text.Replace("98*", "");
                currentrequest = new requests { text = text, datetime = DateTime.Now };

                if (listrequest.core_requests == null)
                    listrequest.core_requests = new List<Core_requests>();

                Trans trans = new Trans();
                phoneNumber = String.Concat("+254", phoneNumber.Substring(phoneNumber.Length - 9));
                StringBuilder s = new StringBuilder();
                res = "Sorry we could not process your request";
                IRestResponse response = null;
                RestRequest request = null;
                var inputs = text.Split(new char[] { '*' }, StringSplitOptions.None);
                Invalidselection:
                switch (text)
                {
                    case "10": //Menu
                        Menu:
                        s.AppendLine("Welcome to TOWER SACCO AGENCY BANKING. Please enter Agency Code Below");
                        res = s.ToString();
                        break;

                    default:

                        switch (inputs.Length)
                        {
                            case 2:

                                listrequest.agencycode = inputs[inputs.Length - 1];

                                if (int.TryParse(listrequest.agencycode, out int result))
                                {
                                    s.AppendLine(string.Format("Enter agent code", Request.newline));
                                    res = s.ToString();
                                }
                                else
                                {
                                    s.AppendLine(string.Format("Invalid entry", Request.newline));
                                    res = s.ToString();
                                }
                                break;
                            case 3:
                                listrequest.agentcode = inputs[inputs.Length - 1];
                                if (int.TryParse(listrequest.agencycode, out int result1))
                                {
                                    s.AppendLine(string.Format("Enter your pin", Request.newline));
                                    res = s.ToString();
                                }
                                else
                                {
                                    s.AppendLine(string.Format("Invalid entry", Request.newline));
                                    res = s.ToString();
                                }
                                break;
                            case 4:
                                if (int.TryParse(inputs[inputs.Length - 1].ToString(), out int result2))
                                {

                                    Agent agent = new Agent
                                    {
                                        BCCODE = listrequest.agencycode,
                                        AGENTCD = listrequest.agentcode.ToString(),
                                        MOBILENO = phoneNumber,
                                        PASSWORD = inputs[inputs.Length - 1].ToString()
                                    };

                                    request = new RestRequest(String.Format("/accreditationAgent/{0}", JsonConvert.SerializeObject(agent)), Method.POST);

                                    response = List_client.Execute(request);
                                    listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                    if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                    {
                                        JsonConvert.PopulateObject(response.Content, agent);
                                        listrequest.agent = agent;
                                        if (agent.RESPCODE == "0")
                                        {
                                            agent = new Agent
                                            {
                                                BCCODE = listrequest.agencycode,
                                                AGENTCD = listrequest.agentcode.ToString(),
                                                MOBILENO = phoneNumber,
                                                AGNMEMBERID = listrequest.agent.MEMBERID

                                            };

                                            request = new RestRequest(String.Format("/getAgentFloat/{0}", JsonConvert.SerializeObject(agent)), Method.POST);
                                            response = List_client.Execute(request);
                                            listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                            if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                            {
                                                JsonConvert.PopulateObject(response.Content, agent);
                                                listrequest.agent = agent;
                                                if (agent.RESPCODE == "0")
                                                {
                                                    List<List_Menu> list_Menus = new List<List_Menu>();
                                                    list_Menus.Add(new List_Menu { Id = 1, name = "Deposit" });
                                                    list_Menus.Add(new List_Menu { Id = 2, name = "Withdrawal" });
                                                    list_Menus.Add(new List_Menu { Id = 3, name = "Transfer" });
                                                    list_Menus.Add(new List_Menu { Id = 4, name = "Float Amount" });

                                                    s.AppendLine(string.Format("Welcome, {0}{1}", listrequest.agent.AGENTNAME, Request.newline));
                                                    foreach (List_Menu item in list_Menus)
                                                    {
                                                        s.AppendLine(string.Format("{0}. {1}", item.Id, item.name, Request.newline));
                                                    }
                                                    listrequest.menu = list_Menus;

                                                    res = s.ToString();
                                                }
                                            }
                                        }
                                        else
                                            res = s.AppendLine(string.Format("{0}", listrequest.agent.RESPDESC)).ToString();
                                    }
                                }
                                else
                                {
                                    s.AppendLine(string.Format("Invalid entry", Request.newline));
                                    res = s.ToString();
                                }
                                break;

                            case 5:
                                listrequest.menu.FirstOrDefault(o => o.Id == Convert.ToInt16(inputs[inputs.Length - 1])).selected = true;
                                switch (listrequest.menu.FirstOrDefault(o => o.selected == true).Id)
                                {
                                    case 4:
                                        s.AppendLine(string.Format("Float Balance: {0} ", listrequest.agent.FLOATAMOUT));
                                        res = s.ToString();
                                        break;
                                    default:
                                        s.AppendLine(string.Format("{0}: Enter Customer Id/National id", listrequest.menu.FirstOrDefault(o => o.selected == true).name, Request.newline));
                                        res = s.ToString();
                                        break;
                                }


                                break;
                            case 6://get customer id

                                list_Member gm = new list_Member
                                {
                                    BCCODE = listrequest.agencycode,
                                    MOBILENO = phoneNumber,
                                    AGENTCD = listrequest.agentcode,
                                    MEMBERID = inputs[inputs.Length - 1].ToString(),
                                    SEARCHBY = "1",
                                    SEARCHSTRING = inputs[inputs.Length - 1].ToString()

                                };
                                request = new RestRequest(String.Format("/checkingMember/{0}", JsonConvert.SerializeObject(gm)), Method.POST);
                                response = List_client.Execute(request);
                                listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                {
                                    JsonConvert.PopulateObject(response.Content, gm);

                                    if (gm.RESPCODE == "2")
                                    {

                                        gm = new list_Member
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MOBILENO = phoneNumber,
                                            AGENTCD = listrequest.agentcode,
                                            MEMBERID = inputs[inputs.Length - 1].ToString(),
                                            SEARCHBY = "0",
                                            SEARCHSTRING = inputs[inputs.Length - 1].ToString()

                                        };
                                        request = new RestRequest(String.Format("/checkingMember/{0}", JsonConvert.SerializeObject(gm)), Method.POST);
                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, gm);
                                        }
                                    }
                                    if (gm.RESPCODE == "0")
                                    {
                                        List<list_Member> list_Members = JsonConvert.DeserializeObject<List<list_Member>>(gm.MEMBERS);

                                        listrequest.member = list_Members[0];

                                        gm = new list_Member
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MOBILENO = phoneNumber,
                                            AGENTCD = listrequest.agentcode,
                                            MEMBERID = listrequest.member.MEMBERID,
                                            ACCTYPE = "1"
                                        };
                                        request = new RestRequest(String.Format("/produceMemberAccounts/{0}", JsonConvert.SerializeObject(gm)), Method.POST);

                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, gm);
                                            if (gm.RESPCODE == "0")
                                            {
                                                listrequest.member.accounts = JsonConvert.DeserializeObject<List<List_Accounts>>(gm.ACCOUNTS);
                                                s.AppendLine(string.Format("Select Accounts {0}", listrequest.menu.FirstOrDefault(o => o.selected == true).name, Request.newline));
                                                for (int i = 0; i < listrequest.member.accounts.Count; i++)
                                                {
                                                    listrequest.member.accounts[i].id = i + 1;
                                                    var ac = listrequest.member.accounts[i].ACCNO.Split(new char[] { '~' });
                                                    if (ac.Length > 1)
                                                        listrequest.member.accounts[i].ACC = ac[1];

                                                    var acn = listrequest.member.accounts[i].ACCNO.Split(new char[] { '(' });
                                                    if (acn.Length > 1)
                                                        listrequest.member.accounts[i].ACCNAME = acn[1];
                                                    s.AppendLine(string.Format("{0}.{1}", i + 1, listrequest.member.accounts[i].ACCNAME, Request.newline));
                                                }
                                                res = s.ToString();
                                            }
                                        }
                                    }
                                    else
                                        res = s.AppendLine(string.Format("{0}", gm.MEMBERS)).ToString();
                                }
                                else
                                    res = s.AppendLine(string.Format("Invalid response from CBS")).ToString();
                                break;
                            case 7:
                                listrequest.member.accounts.FirstOrDefault(o => o.id == Convert.ToInt16(inputs[inputs.Length - 1])).selected = true;
                                switch (listrequest.menu.FirstOrDefault(o => o.selected == true).Id)
                                {
                                    case 3:
                                        s.AppendLine(string.Format("Enter Beneficiary Cust id/National id"));
                                        res = s.ToString();

                                        break;
                                    default:

                                        s.AppendLine(string.Format("Enter Amount to {0}", listrequest.menu.FirstOrDefault(o => o.selected == true).name, Request.newline));
                                        res = s.ToString();
                                        break;
                                }

                                break;
                            case 8:

                                listrequest.amount = Convert.ToDouble(inputs[inputs.Length - 1]);
                                switch (listrequest.menu.FirstOrDefault(o => o.selected == true).Id)
                                {
                                    case 3:
                                        list_Member gm1 = new list_Member
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MOBILENO = phoneNumber,
                                            AGENTCD = listrequest.agentcode,
                                            MEMBERID = inputs[inputs.Length - 1].ToString(),
                                            SEARCHBY = "1",
                                            SEARCHSTRING = inputs[inputs.Length - 1].ToString()

                                        };
                                        request = new RestRequest(String.Format("/checkingMember/{0}", JsonConvert.SerializeObject(gm1)), Method.POST);
                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, gm1);

                                            if (gm1.RESPCODE == "2")
                                            {

                                                gm1 = new list_Member
                                                {
                                                    BCCODE = listrequest.agencycode,
                                                    MOBILENO = phoneNumber,
                                                    AGENTCD = listrequest.agentcode,
                                                    MEMBERID = inputs[inputs.Length - 1].ToString(),
                                                    SEARCHBY = "0",
                                                    SEARCHSTRING = inputs[inputs.Length - 1].ToString()

                                                };
                                                request = new RestRequest(String.Format("/checkingMember/{0}", JsonConvert.SerializeObject(gm1)), Method.POST);
                                                response = List_client.Execute(request);
                                                listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                                {
                                                    JsonConvert.PopulateObject(response.Content, gm1);
                                                }
                                            }
                                            if (gm1.RESPCODE == "0")
                                            {
                                                List<list_Member> list_Members = JsonConvert.DeserializeObject<List<list_Member>>(gm1.MEMBERS);

                                                listrequest.Bn_member = list_Members[0];

                                                gm1 = new list_Member
                                                {
                                                    BCCODE = listrequest.agencycode,
                                                    MOBILENO = phoneNumber,
                                                    AGENTCD = listrequest.agentcode,
                                                    MEMBERID = inputs[inputs.Length - 1].ToString(),
                                                    ACCTYPE = "1"
                                                };
                                                request = new RestRequest(String.Format("/produceMemberAccounts/{0}", JsonConvert.SerializeObject(gm1)), Method.POST);

                                                response = List_client.Execute(request);
                                                listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                                {
                                                    JsonConvert.PopulateObject(response.Content, gm1);
                                                    if (gm1.RESPCODE == "0")
                                                    {
                                                        listrequest.member.accounts_2 = JsonConvert.DeserializeObject<List<List_Accounts>>(gm1.ACCOUNTS);
                                                        s.AppendLine(string.Format("Select Accounts {0}", listrequest.menu.FirstOrDefault(o => o.selected == true).name, Request.newline));
                                                        for (int i = 0; i < listrequest.member.accounts_2.Count; i++)
                                                        {
                                                            listrequest.member.accounts_2[i].id = i + 1;
                                                            var ac = listrequest.member.accounts_2[i].ACCNO.Split(new char[] { '~' });
                                                            if (ac.Length > 1)
                                                                listrequest.member.accounts_2[i].ACC = ac[1];

                                                            var acn = listrequest.member.accounts_2[i].ACCNO.Split(new char[] { '(' });
                                                            if (acn.Length > 1)
                                                                listrequest.member.accounts_2[i].ACCNAME = acn[1];
                                                            s.AppendLine(string.Format("{0}.{1}", i + 1, listrequest.member.accounts_2[i].ACCNAME, Request.newline));
                                                        }
                                                        res = s.ToString();
                                                    }
                                                }
                                            }
                                            else
                                                res = s.AppendLine(string.Format("{0}", gm1.MEMBERS)).ToString();
                                        }
                                        else
                                            res = s.AppendLine(string.Format("Invalid response from CBS")).ToString();

                                        break;
                                    case 2:
                                        otp = new Otp
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MOBILENO = phoneNumber,
                                            AGENTCD = listrequest.agentcode,
                                            MEMBERID = listrequest.member.MEMBERID,
                                            MESSAGE = String.Format("OTP"),
                                            REQSTATUS = "",
                                            REMMEMBERID = listrequest.member.MEMBERID,
                                            FROMACTIVITY = "019",
                                        };
                                        listrequest.otp = otp;
                                        request = new RestRequest(String.Format("/initiateOtp/{0}", JsonConvert.SerializeObject(otp)), Method.POST);
                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, otp);
                                            if (otp.RESPCODE == "0")
                                            {
                                                listrequest.otp = otp;
                                            }
                                        }
                                        s.AppendLine(string.Format("Enter Otp", Request.newline));
                                        res = s.ToString();
                                        break;
                                    case 1:
                                        trans = new Trans
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MEMBERID = listrequest.member.MEMBERID,
                                            TRANID = sessionId,
                                            ACCOUNTNO = listrequest.member.accounts.FirstOrDefault(o => o.selected == true).ACC,
                                            AGNMEMBERID = listrequest.agent.MEMBERID,
                                            AGENTNAME = listrequest.agent.AGENTNAME,
                                            AGENTCD = listrequest.agentcode,
                                            AMOUNT = listrequest.amount.ToString(),
                                            //OTP =  ,
                                            //OTPREF = list ,
                                            AGNMOBNO = phoneNumber,
                                            MEMBERNM = listrequest.member.NAME,
                                            NARRATION = "Deposit from Agent",
                                            MOBILENO = phoneNumber,
                                            ACCTYPE = "1",
                                            REQSTATUS = "U",
                                            FUNCTIONCD = "005",
                                            FROMACTIVITY = "DEPOSIT"
                                        };
                                        listrequest.trans = trans;
                                        request = new RestRequest(String.Format("/secureDeposit/{0}", JsonConvert.SerializeObject(trans)), Method.POST);

                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, trans);
                                            if (trans.RESPCODE == "0")
                                            {
                                                listrequest.trans = trans;
                                                s.AppendLine(string.Format("Transaction successfull", Request.newline));
                                            }
                                            else
                                                s.AppendLine(string.Format("Transaction Failed: {0}", trans.RESPDESC));
                                            res = s.ToString();
                                        }
                                        break;
                                }
                                break;
                            case 9:
                                switch (listrequest.menu.FirstOrDefault(o => o.selected == true).Id)
                                {
                                    case 3:
                                        listrequest.member.accounts_2.FirstOrDefault(o => o.id == Convert.ToInt16(inputs[inputs.Length - 1])).selected = true;
                                        s.AppendLine(string.Format("Enter Amount to {0}", listrequest.menu.FirstOrDefault(o => o.selected == true).name, Request.newline));
                                        res = s.ToString();
                                        break;
                                    default:

                                        trans = new Trans
                                        {
                                            BCCODE = listrequest.agencycode,
                                            MEMBERID = listrequest.member.MEMBERID,
                                            TRANID = sessionId,
                                            ACCOUNTNO = listrequest.member.accounts.FirstOrDefault(o => o.selected == true).ACC,
                                            AGNMEMBERID = listrequest.agent.MEMBERID,
                                            AGENTNAME = listrequest.agent.AGENTNAME,
                                            AGENTCD = listrequest.agentcode,
                                            AMOUNT = listrequest.amount.ToString(),
                                            OTP = inputs[inputs.Length - 1],
                                            OTPREF = listrequest.otp.OTPREF,
                                            AGNMOBNO = phoneNumber,
                                            MEMBERNM = listrequest.member.NAME,
                                            NARRATION = "Withdrawal from Agent",
                                            MOBILENO = phoneNumber,
                                            ACCTYPE = "1",
                                            REQSTATUS = "U",
                                            //FUNCTIONCD = "005",
                                            FROMACTIVITY = "DEPOSIT"
                                        };

                                        request = new RestRequest(String.Format("/departAmount/{0}", JsonConvert.SerializeObject(trans)), Method.POST);

                                        response = List_client.Execute(request);
                                        listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                        if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                        {
                                            JsonConvert.PopulateObject(response.Content, trans);
                                            if (trans.RESPCODE == "0")
                                            {

                                                s.AppendLine(string.Format("Transaction successfull", Request.newline));


                                            }
                                            else
                                                s.AppendLine(string.Format("Transaction Failed: {0}", trans.RESPDESC));
                                            res = s.ToString();
                                        }
                                        break;
                                }
                                break;
                            case 10:
                                listrequest.amount = Convert.ToDouble(inputs[inputs.Length - 1]);
                                otp = new Otp
                                {
                                    BCCODE = listrequest.agencycode,
                                    MOBILENO = phoneNumber,
                                    AGENTCD = listrequest.agentcode,
                                    MEMBERID = listrequest.member.MEMBERID,
                                    MESSAGE = String.Format("OTP"),
                                    REQSTATUS = "",
                                    REMMEMBERID = listrequest.member.MEMBERID,
                                    FROMACTIVITY = "019",
                                };
                                listrequest.otp = otp;
                                request = new RestRequest(String.Format("/initiateOtp/{0}", JsonConvert.SerializeObject(otp)), Method.POST);
                                response = List_client.Execute(request);
                                listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                {
                                    JsonConvert.PopulateObject(response.Content, otp);
                                    if (otp.RESPCODE == "0")
                                    {
                                        listrequest.otp = otp;
                                    }
                                }
                                s.AppendLine(string.Format("Enter Otp", Request.newline));
                                res = s.ToString();
                                break;

                            case 11:
                                trans = new Trans
                                {
                                    BCCODE = listrequest.agencycode,
                                    MEMBERID = listrequest.member.MEMBERID,
                                    TRANID = sessionId,

                                    AGNMEMBERID = listrequest.agent.MEMBERID,
                                    AGENTNAME = listrequest.agent.AGENTNAME,
                                    AGENTCD = listrequest.agentcode,
                                    AMOUNT = listrequest.amount.ToString(),
                                    OTP = inputs[inputs.Length - 1],
                                    OTPREF = listrequest.otp.OTPREF,
                                    MOBILENO = phoneNumber,
                                    NARRATION = "Transfer from Agent",
                                    FROMACTIVITY = "TRANSFER",
                                    BNFMEMBERID = listrequest.Bn_member.MEMBERID,
                                    REMMEMBERID = listrequest.member.MEMBERID,
                                    BNFMEMBERNM = listrequest.Bn_member.NAME,
                                    REMMEMBERNM = listrequest.member.NAME,
                                    BNFACCOUNTNO = listrequest.member.accounts_2.FirstOrDefault(o => o.selected == true).ACC,
                                    REMACCOUNTNO = listrequest.member.accounts.FirstOrDefault(o => o.selected == true).ACC,
                                };

                                request = new RestRequest(String.Format("/relocateAmount/{0}", JsonConvert.SerializeObject(trans)), Method.POST);

                                response = List_client.Execute(request);
                                listrequest.core_requests.Add(new Core_requests { request = request.Resource.ToString(), response = response.Content.ToString() });
                                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                                {
                                    JsonConvert.PopulateObject(response.Content, trans);
                                    if (trans.RESPCODE == "0")
                                    {

                                        s.AppendLine(string.Format("Transaction successfull", Request.newline));


                                    }
                                    else
                                        s.AppendLine(string.Format("Transaction Failed: {0}", trans.RESPDESC));
                                    res = s.ToString();
                                }
                                break;
                                break;
                        }
                        break;
                }

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            if (!string.IsNullOrEmpty(text))
                res = string.Format("CON {0}", res);

            currentrequest.response = res;
            listrequest.trans = trans;
            if (listrequest.requests == null)
            {
                var lists = new List<requests>();
                lists.Add(currentrequest);
                listrequest.requests = lists;
            }
            else
                listrequest.requests.Add(currentrequest);
            Logging.Logging.LogEntry(pathh, file, JsonConvert.SerializeObject(listrequest));
            //Context.Session[sessionId] = listrequest;
            Context.Response.Write(res);
        }
        [WebMethod]
        public void USSDAFRICAN(string SESSIONID, string MSISDN, string STAGE, string ussdcode, string DATA)
        {
            try
            {
                if (!MSISDN.Contains("+"))
                    MSISDN = "+" + MSISDN;
                Logs.LogEntryOnFile(string.Format("{0}|{1}|{2}|{3}", MSISDN, SESSIONID, DATA, STAGE));
                String[] coption = DATA.Split(new Char[] { '*' }, StringSplitOptions.None);
                req.MSISDN = MSISDN;
                req.SESSIONID = SESSIONID;
                req.SERVICECODE = ussdcode;
                req.USSDSTRING = DATA;
                req.Currentoption = coption[coption.GetUpperBound(0)];
                lang.request = req;
                //Welcome to our test USSD menu|12345| 254701123456|CONT 
                res = Menu();
            }

            catch (Exception ex)
            {
                Logs.ReportError(ex);
            }
            Context.Response.Write(res);
        }
        [WebMethod]
        public void USSDMTECH(string MSISDN, string SESSIONID, string DATA, string STAGE)
        {
            try
            {
                MSISDN = "+" + MSISDN;
                Logs.LogEntryOnFile(string.Format("{0}|{1}|{2}|{3}", MSISDN, SESSIONID, DATA, STAGE));
                String[] coption = DATA.Split(new Char[] { '*' }, StringSplitOptions.None);
                req.MSISDN = MSISDN;
                req.SESSIONID = SESSIONID;
                req.SERVICECODE = "";
                req.USSDSTRING = (STAGE == "BEGIN" ? "" : DATA);
                req.Currentoption = coption[coption.GetUpperBound(0)];
                lang.request = req;
                //Welcome to our test USSD menu|12345| 254701123456|CONT 
                string m = Menu();
                string r = string.Format("{0}|{1}|{2}|{3}", m.Replace("CON ", "").Replace("END ", ""), SESSIONID, MSISDN, (m.StartsWith("CON") == true ? "CONTINUE" : "ABORT"));
                Logging.Logging.LogEntryOnFile(r);
                res = r;
            }
            catch (Exception ex)
            {
                Logs.ReportError(ex);
            }
            Context.Response.Write(res);
        }
        [WebMethod]
        public async void USSD(string phoneNumber, string sessionId, string serviceCode, string text)
        {
            Logging.Logging.LogEntryOnFile(String.Format("\n{1} Start Session - {0} ",  sessionId,  DateTime.Now));
            using (Request.db = new ussdEntities(ConnectionString()))
            {
                using (var dbtrans = Request.db.Database.BeginTransaction())
                {
                    try
                    {
                        Logging.Logging.LogEntryOnFile(String.Format("\n{4} Session - {1} \nPhone - {0}\nService Code - {2}\nText - {3}", phoneNumber, sessionId, serviceCode, text, DateTime.Now));
                        req.coption = text.Split(new Char[] { '*' }, StringSplitOptions.None);
                        var d = serviceCode.Split(new Char[] { '*' }, StringSplitOptions.RemoveEmptyEntries);
                        //*657*2222#
                        //*657*2222*24736536#
                        if (d.Count() > 2)
                            serviceCode = string.Format("*{0}*{1}#", d[0], d[1]);
                        req.client = Request.db.Clients.FirstOrDefault(o => o.USSD_Code == serviceCode);
                        String[] channels = serviceCode.Split(new Char[] { '*' }, StringSplitOptions.None);
                        req.Ussd_Code = channels[1];
                        Logging.Logging.LogEntryOnFile(String.Format("\n{1} Client Session - {0} ", sessionId, DateTime.Now));
                        if (channels.Count() > 1)
                            channel = channels[2].Replace("#", "");


                        setclient(req.client);
                        Logging.Logging.LogEntryOnFile("channel - " + channel);

                        req.MSISDN = phoneNumber;
                        req.SESSIONID = sessionId;
                        req.SERVICECODE = serviceCode;
                        req.USSDSTRING = text;
                        req.Currentoption = req.coption[req.coption.GetUpperBound(0)];
                        lang.request = req;

                        switch (req.Currentoption)
                        {
                            case "0":
                                var s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).OrderByDescending(o => o.Id).Take(2);
                                foreach (var sess in s)
                                {
                                    sess.Active = false;
                                    req.Currentoption = sess.Value;
                                }

                                var r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                                if (r.Count() == 0)
                                    req.USSDSTRING = string.Empty;
                                res = Menu();
                                break;
                            case "00":
                                s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true && o.Option != 2).OrderByDescending(o => o.Id);
                                foreach (var sess in s)
                                {
                                    sess.Active = false;
                                    req.Currentoption = sess.Value;
                                }


                                var ses = Request.db.Sessions.FirstOrDefault(o => o.SESSION_ID == req.SESSIONID && o.Option == 4);
                                if (sessionId != null)
                                    req.Currentoption = ses.Value;

                                r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                                if (r.Count() == 0)
                                    req.USSDSTRING = string.Empty;

                                res = Menu();

                                break;
                            case "000":
                                res = "END Logged out, Thank You";
                                break;
                            default:
                                res = Menu();
                                break;
                        }

                        //if (channel == "259")
                        //    res = "END Welcome to OPEN Valley";
                        //else


                        if (req.session != null)
                            if (req.session.Menu != null)
                                if (res.StartsWith("CON"))

                                    res = string.Format("{0}{1}", res, Request.common);
                        //await Task.WhenAll(_bufferTasks);
                        Logging.Logging.LogEntryOnFile(String.Format("\n{1} To save Session - {0} ", req.SESSIONID, DateTime.Now));
                        await Request.db.SaveChangesAsync();
                        Logging.Logging.LogEntryOnFile(String.Format("\n{1} Saved Session - {0} ", req.SESSIONID, DateTime.Now));
                        dbtrans.Commit();
                        Logging.Logging.LogEntryOnFile(String.Format("\n{1} Committed Session - {0} ", req.SESSIONID, DateTime.Now));

                    }
                    catch (Exception ex)
                    {
                        dbtrans.Rollback();
                        res = "END Unable to connect try again later, Thank You";
                        Logs.ReportError(ex);
                    }
                }
            }
            Logging.Logging.LogEntryOnFile(String.Format("\n{1} Session Resp - {0}", sessionId, DateTime.Now));
            Context.Response.Write(res);
            Logging.Logging.LogEntryOnFile(String.Format("\n{1} Session Responded - {0}", sessionId, DateTime.Now));
        }

        [WebMethod]
        public async void USSDMobile(string phoneNumber, string sessionId, string serviceCode, string text)
        {

            using (Request.db = new ussdEntities(ConnectionString()))
            {
                using (var dbtrans = Request.db.Database.BeginTransaction())
                {
                    try
                    {
                        //Session - 383731391
                        //Phone - 254710563359
                        //Service Code - *657 * 1111#
                        //Text -
                        //channel - 1111

                        String[] channels = serviceCode.Split(new Char[] { '*' }, StringSplitOptions.None);
                        req.Ussd_Code = channels[1];
                        if (channels.Count() > 1)
                            req.Channel = channels[2].Replace("#", "");
                        channel = req.Channel;
                        if (!req.Channel.Equals(""))
                            req.client = Request.db.Clients.FirstOrDefault(o => o.USSD_Code == req.Channel);
                        req.coption = text.Split(new Char[] { '*' }, StringSplitOptions.None);
                        req.MSISDN = string.Format("+254{0}", phoneNumber.Substring(phoneNumber.Length - 9));
                        req.SESSIONID = sessionId;
                        req.SERVICECODE = serviceCode;
                        req.USSDSTRING = text;
                        req.Currentoption = req.coption[req.coption.GetUpperBound(0)].Trim();
                        lang.request = req;

                        switch (req.Currentoption)
                        {
                            case "0":
                                var s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).OrderByDescending(o => o.Id).Take(2);
                                foreach (var sess in s)
                                {
                                    sess.Active = false;
                                    req.Currentoption = sess.Value;
                                }
                                var r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                                if (r.Count() == 0)
                                    req.USSDSTRING = string.Empty;

                                res = Menu();
                                break;
                            case "00":
                                s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true && o.Option != 2).OrderByDescending(o => o.Id);
                                foreach (var sess in s)
                                {
                                    sess.Active = false;
                                    req.Currentoption = sess.Value;
                                }
                                var ses = Request.db.Sessions.FirstOrDefault(o => o.SESSION_ID == req.SESSIONID && o.Option == 4);
                                if (sessionId != null)
                                    req.Currentoption = ses.Value;

                                r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                                if (r.Count() == 0)
                                    req.USSDSTRING = string.Empty;

                                res = Menu();

                                break;
                            case "000":
                                res = "END Logged out, Thank You";
                                break;
                            default:
                               // res = Mbranch();
                                break;
                        }




                        if (req.session != null)
                            if (req.session.Menu != null)
                                if (res.StartsWith("CON"))

                                    res = string.Format("{0}{1}", res, Request.common);


                        await Request.db.SaveChangesAsync();
                        dbtrans.Commit();


                    }
                    catch (Exception ex)
                    {
                        dbtrans.Rollback();
                        res = "END Unable to connect try again later, Thank You";
                        Logs.ReportError(ex);
                    }
                }
            }
            Logging.Logging.LogEntryOnFile(String.Format("\n{1} Session Resp - {0}", sessionId, DateTime.Now));
            Context.Response.Write(res);
        }
        //public string Mbranch()
        //{
        //    if (string.IsNullOrEmpty(req.USSDSTRING.Trim()))
        //    {
        //        req.session = new Ussd();
        //        req.session.SESSION = req.SESSIONID;
        //        req.session.Phone = req.MSISDN;
        //        req.session.Transaction_Time = DateTime.Now;
        //        req.session.Code = req.SERVICECODE;
        //        req.session.Status = (int)Status.Processing;
        //        if (Request.db.Ussds.FirstOrDefault(o => o.SESSION == req.SESSIONID) == null)
        //            Request.db.Ussds.Add(req.session);
        //        req.transaction = new Transaction();
        //        req.transaction.Reference = req.SESSIONID;
        //        req.transaction.Mpesa_Status = (int)Status.Pending;
        //        req.transaction.Posted = false;
        //        req.transaction.Status = (int)Status.Pending;
        //        if (req.SESSIONID.Length > 18)
        //            req.transaction.Document_No = req.SESSIONID.Substring(0, 20);
        //        else
        //            req.transaction.Document_No = req.SESSIONID;
        //        req.transaction.MSISDN = req.MSISDN;
        //        req.transaction.Transaction_Date = DateTime.Now;
        //        req.transaction.Transaction_Time = DateTime.Now;

        //        if (Request.db.Transactions.FirstOrDefault(o => o.Reference == req.SESSIONID) == null)
        //            Request.db.Transactions.Add(req.transaction);

        //        var cust = Request.db.Customers.Where(o => o.Telephone == req.MSISDN).ToList();
        //        if (cust.Count() == 0)
        //        {
        //            var cc = new S_Ussd.Api(req.client).member(req.MSISDN);
        //            if (cc != null)
        //            {
        //                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.EnterID, Request.newline, req.client.Client_Name);
        //            }
        //            else
        //            {
        //                req.session.Status = (int)Status.Failed;
        //                req.session.comments = "Not Registered in Sacco";
        //                return lang.getlang(enums.sessionstatus.END, ref req, enums.response.NotRegistered);
        //            }

        //        }
        //        if (cust.Count() > 1)
        //        {
        //            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectclient);
        //        }

        //        if (cust[0].Active == false)
        //        {
        //            req.session.Status = (int)Status.Failed;
        //            req.session.comments = "Not Active";
        //            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.NotActive);
        //        }
        //        req.customer = cust[0];
        //        req.session.Client = cust[0].Client;

        //        if (req.customer.PinChanged == false)
        //        {
        //            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Firstpin);
        //        }

        //        var login = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
        //        if (login == null)
        //            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Newpin, Request.newline, cust[0].client_record.Client_Name, req.customer.Name);

        //        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.pin, Request.newline, cust[0].client_record.Client_Name, req.customer.Name); ;
        //    }

        //    else
        //    {
        //        Api api = new Api(req.client);

        //        req.transaction = Request.db.Transactions.FirstOrDefault(o => o.Reference == req.SESSIONID);
        //        req.session = Request.db.Ussds.FirstOrDefault(o => o.SESSION == req.SESSIONID);
        //        if (req.session != null)
        //        {
        //            req.sessiondetails = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();

        //            req.customer = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN);

        //            if (req.customer != null)
        //                req.client = Request.db.Clients.FirstOrDefault(o => o.Client_Code == req.customer.Client);

        //            var r = req.sessiondetails.OrderByDescending(o => o.Id).FirstOrDefault();
        //            switch ((enums.response)r.Option)
        //            {
        //                case response.EnterID:
        //                    {
        //                        var cc = api.member(req.MSISDN);
        //                        if (cc != null)
        //                        {
        //                            Customer customer = new Customer();
        //                            customer.Telephone = req.MSISDN;
        //                            customer.Name = cc.Name;
        //                            customer.ID_NO = cc.ID_No;
        //                            customer.Date_Registered = DateTime.Now.Date;
        //                            customer.Client = req.client.Client_Code;
        //                            customer.Active = true;
        //                            customer.PinChanged = false;
        //                            customer.Language = "EN";
        //                            customer.Status = 1;
        //                            Request.db.Customers.Add(customer);

        //                            var pinn = Logging.Randomize.RandomString(4);

        //                            Login Logins = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);

        //                            if (Logins == null)
        //                            {
        //                                Logins = new Login();
        //                                Logins.Telephone = req.MSISDN;
        //                                Logins.Client = req.client.Client_Code;
        //                                Logins.PIN_Encrypted = "1234";// pinn;
        //                                Logins.Start_Pin = "1234";// pinn;
        //                                Request.db.Logins.Add(Logins);
        //                            }
        //                            req.transaction.Account_No = customer.ID_NO;

        //                            api.sendsms(req, "You new Pin is " + pinn);

        //                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.newreg, customer.Name, req.client.Client_Name);
        //                        }
        //                        break;
        //                    }
        //                #region Pin                   
        //                case response.Firstpin:
        //                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Newpin, Request.newline);
        //                case enums.response.Newpin:
        //                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Confirmpin, Request.newline);
        //                case enums.response.Confirmpin:
        //                    if (req.coption[req.coption.Length - 2].ToString().Equals(req.Currentoption))
        //                    {
        //                        Login login = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
        //                        if (login == null)
        //                        {
        //                            login = new Login();
        //                            login.Telephone = req.MSISDN;
        //                            Request.db.Logins.Add(login);
        //                        }
        //                        login.PIN_Encrypted = req.Currentoption;
        //                        Customer customer = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN);
        //                        if (customer != null)
        //                        {
        //                            customer.PinChanged = true;
        //                        }
        //                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Menu, Request.newline, useroptions.Menu(ref req, getmenu()), req.client.Client_Name);
        //                    }
        //                    else
        //                    {
        //                        return lang.getlang(
        //                            enums.sessionstatus.END,
        //                            ref req,
        //                            enums.response.Wrongpinconfirmation,
        //                            Request.newline
        //                         );
        //                    }
        //                case response.pin:
        //                    if (req.Currentoption == "1")
        //                    {
        //                        var pinn = Logging.Randomize.RandomString(4);


        //                        api.sendsms(req, "You new Pin is " + pinn);

        //                        if (req.customer != null)
        //                            req.customer.PinChanged = false;

        //                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Pinreset, Request.newline);


        //                    }
        //                    return Validatepin();
        //                    break;
        //                #endregion
        //                #region Menu
        //                default:
        //                    {
        //                        useroptions.selectedmenu(ref req);
        //                        var lastsession = req.sessiondetails.OrderByDescending(o => o.Id).FirstOrDefault();
        //                        switch ((enums.Menu)req.session.Menu)
        //                        {
        //                            #region balance
        //                            case enums.Menu.Balance:
        //                                switch ((enums.response)lastsession.Option)
        //                                {
        //                                    case enums.response.Menu:
        //                                        req.transaction.Transaction_Type = (int)Transtype.Balance;
        //                                        var m = api.member(req.MSISDN);
        //                                        req.transaction.Account_No = m.No;
        //                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.OtherBalances, Request.newline);
        //                                    case enums.response.OtherBalances:
        //                                        switch (req.Currentoption)
        //                                        {
        //                                            case "1":
        //                                                var mb = api.Balances(req.transaction.Account_No);
        //                                                if (!string.IsNullOrEmpty(mb))
        //                                                {
        //                                                    api.Trans(ref req);
        //                                                    api.sendsms(req, mb);
        //                                                    return lang.getlang(enums.sessionstatus.CON,
        //                                                        ref req, enums.response.accountbalances,
        //                                                        Request.newline, mb);
        //                                                }
        //                                                else
        //                                                    return lang.getlang(enums.sessionstatus.CON, ref req,
        //                                                        enums.response.NoAccount);
        //                                            case "2":
        //                                                var mlb = api.LoanBalances(req.MSISDN);
        //                                                if (!string.IsNullOrEmpty(mlb))
        //                                                {
        //                                                    api.Trans(ref req);
        //                                                    api.sendsms(req, mlb);
        //                                                    return lang.getlang(enums.sessionstatus.CON, ref req,
        //                                                        enums.response.loanbalances, Request.newline, mlb);
        //                                                }
        //                                                else
        //                                                    return lang.getlang(enums.sessionstatus.CON, ref req,
        //                                                        enums.response.NoLoans);
        //                                            default:
        //                                                return lang.getlang(enums.sessionstatus.CON, ref req,
        //                                                    enums.response.Invalidentry, Request.newline);
        //                                        }
        //                                }
        //                                break;
        //                            #endregion
        //                            #region My Vehicles
        //                            case enums.Menu.My_Vehicles:

        //                                switch ((enums.response)lastsession.Option)
        //                                {
        //                                    case enums.response.Menu:
        //                                        var accounts = api.member(req.MSISDN);
        //                                        req.transaction.Account_No = accounts.No;
        //                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectveh, Request.newline, useroptions.list(ref req, api.vehicles(req.transaction.Account_No)));
        //                                        break;
        //                                        //case enums.response.selectacc:

        //                                        //    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.list(ref req, api.vehicles(req.transaction.Account_No)));

        //                                }
        //                                break;
        //                            #endregion
        //                            #region WithDrawal
        //                            case enums.Menu.Deposits:
        //                            case enums.Menu.Withdrawal:

        //                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Commingsoon, Request.newline);
        //                                switch ((enums.response)lastsession.Option)
        //                                {
        //                                    case enums.response.Menu:
        //                                        var accounts = api.Withdrawableaccounts(req.transaction.Account_No);
        //                                        if (accounts.Count() == 0)
        //                                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);
        //                                        if (accounts.Count() > 1)
        //                                            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
        //                                        else
        //                                        {
        //                                            req.transaction.Account_No = accounts[0].No;
        //                                            goto case enums.response.selectacc;
        //                                        }
        //                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.list(ref req, api.vehicles(req.transaction.Account_No)));
        //                                        break;
        //                                    case enums.response.selectacc:
        //                                        var selection = useroptions.userselection(req, enums.options.Withacc);
        //                                        if (String.IsNullOrEmpty(req.transaction.Account_No))
        //                                            req.transaction.Account_No = selection.Acc;
        //                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.list(ref req, api.vehicles(req.transaction.Account_No)));
        //                                }
        //                                break;
        //                                #endregion
        //                        }
        //                        break;
        //                    }
        //                    #endregion
        //            }
        //            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.pin,
        //                Request.newline, req.client.Client_Name, req.customer.Name);

        //            return pin();
        //        }
        //        else return null;
        //    }
        //}
        //0720212187
        [WebMethod]
        public void USSDAPS(string phoneNumber, string sessionId, string serviceCode, string text)
        {
            try
            {
                Logging.Logging.LogEntryOnFile(String.Format("\n\nPhone - {0}\nSession - {1}\nService Code - {2}\nText - {3}", phoneNumber, sessionId, serviceCode, text));

                StringBuilder s = new StringBuilder();
                res = "Sorry we could not process your request";
                using (Request.db = new ussdEntities(ConnectionString()))
                {
                    var sessionvariables = Request.db.session_variables.Where(o => o.session == sessionId).OrderByDescending(i => i.id).ToList();
                    var sessionvariable = sessionvariables.FirstOrDefault();

                    var text1 = text.Split(new char[] { '*' });
                    var sv = new session_variable();
                    sv.session = sessionId;
                    sv.Text = text;
                    sv.lastoption = 0;
                    if (sessionvariable != null)
                        if (sessionvariable.lastoption == 2)
                        {
                            text1 = text1.Where(o => o == text1[text1.Length - 1]).ToArray();
                            text = string.Join("*", text1.ToArray());
                            sv.Text = text;
                        }
                        else
                        {
                            var reversed = sessionvariables.Where(o => o.lastoption != 0).ToList();
                            if (reversed.Count() > 0)
                            {
                                var text2 = text.Split(new char[] { '*' });
                                text = string.Format("{0}*{1}", sessionvariable.Text, text2[text2.GetUpperBound(0)]);
                                sv.Text = text;
                            }
                        }

                    Request.db.session_variables.Add(sv);

                    Invalidselection:
                    switch (text)
                    {

                        case "": //Menu
                            Menu:
                            var menu = Request.db.Client_Menus.Where(o => o.Client == "APS-BARAKA");
                            if (menu.Count() == 0)
                                throw new ussderror(-1, "Menu Not found");

                            s.AppendLine("Welcome to APS Baraka Sacco. Select one option below");

                            foreach (var item in menu)
                            {
                                s.AppendLine(String.Format("{0}. {1}{2}", item.Menu_Id, item.Description, Request.newline));
                            }

                            res = s.ToString();


                            break;

                        default:
                            var inputs = text.Split(new char[] { '*' }, StringSplitOptions.None);
                            switch (inputs.Length)
                            {
                                case 1:
                                    switch (text)
                                    {
                                        case "1":
                                            s.AppendLine(string.Format("1. Balance Enquiry{0}", Request.newline));
                                            s.AppendLine(string.Format("2. Ministatement{0}", Request.newline)); ;
                                            s.AppendLine(string.Format("0. BACK 00. HOME "));
                                            res = s.ToString();
                                            break;
                                        case "2":
                                            s.AppendLine(string.Format("1. Deposits{0}", Request.newline));
                                            s.AppendLine(string.Format("2. Toto{0}", Request.newline));
                                            s.AppendLine(string.Format("3. Share capital{0}", Request.newline));
                                            s.AppendLine(string.Format("4. Christmas savings{0}", Request.newline));
                                            s.AppendLine(string.Format("5. Plaza contribution{0}", Request.newline));
                                            s.AppendLine(string.Format("6. Loans{0}", Request.newline)); ;
                                            s.AppendLine(string.Format("0. BACK 00. HOME "));

                                            res = s.ToString();
                                            break;
                                        case "3":
                                            s.AppendLine(string.Format("1. loan Balances{0}", Request.newline));
                                            s.AppendLine(string.Format("2. Apply loan{0}", Request.newline)); ;
                                            s.AppendLine(string.Format("0. BACK 00. HOME "));
                                            res = s.ToString();
                                            break;

                                        default:
                                            sv.lastoption = 2;
                                            s.AppendLine(string.Format("Invalid Selection", Request.newline));
                                            goto Menu;

                                    }
                                    break;
                                case 2:
                                    switch (text)
                                    {
                                        case "1*1"://balance

                                            break;
                                        case "1*2"://Ministatement
                                            break;

                                        case "2*1":
                                        case "2*2":
                                        case "2*3":
                                        case "2*4":
                                        case "2*5":

                                            break;
                                        case "2*6"://Loans

                                            break;


                                        default:
                                            text = text.Substring(0, text.LastIndexOf('*'));
                                            sv.lastoption = 2;
                                            s.AppendLine(string.Format("Invalid Selection", Request.newline));
                                            goto Invalidselection;

                                    }

                                    break;
                            }

                            break;
                    }
                    Request.db.SaveChanges();
                }

            }
            catch (Exception ex)
            {
                Logs.ReportError(ex);
            }
            if (!string.IsNullOrEmpty(text))
                res = string.Format("CON{0}", res);
            Context.Response.Write(res);
        }
        [WebMethod]
        public string USSDE(string phoneNumber, string sessionId, string serviceCode, string text, string IMSI, string TIMSI)
        {
            try
            {
                Logging.Logging.LogEntryOnFile(String.Format("\n\n{4}  Phone - {0}\nSession - {1}\nService Code - {2}\nText - {3}", phoneNumber, sessionId, serviceCode, text, DateTime.Now));
                req.coption = text.Split(new Char[] { '*' }, StringSplitOptions.None);
                String[] channels = serviceCode.Split(new Char[] { '*' }, StringSplitOptions.RemoveEmptyEntries);

                // if (channels.Count() > 1)
                //    channel = channels[2].Replace("#", "");
                //else
                channel = "389";

                Logging.Logging.LogEntryOnFile("channel - " + channel);
                req.MSISDN = phoneNumber;
                req.SESSIONID = sessionId;
                req.SERVICECODE = serviceCode;
                req.USSDSTRING = text;
                req.Currentoption = req.coption[req.coption.GetUpperBound(0)];
                lang.request = req;

                switch (req.Currentoption)
                {
                    case "0":
                        var s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).OrderByDescending(o => o.Id).Take(2);
                        foreach (var sess in s)
                        {
                            sess.Active = false;
                            req.Currentoption = sess.Value;
                        }
                        Request.db.SaveChanges();
                        var r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                        if (r.Count() == 0)
                            req.USSDSTRING = string.Empty;

                        res = Menu();
                        break;
                    case "00":
                        s = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true && o.Option != 2).OrderByDescending(o => o.Id);
                        foreach (var sess in s)
                        {
                            sess.Active = false;
                            req.Currentoption = sess.Value;
                        }

                        Request.db.SaveChanges();
                        var ses = Request.db.Sessions.FirstOrDefault(o => o.SESSION_ID == req.SESSIONID && o.Option == 4);
                        if (sessionId != null)
                            req.Currentoption = ses.Value;

                        r = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();
                        if (r.Count() == 0)
                            req.USSDSTRING = string.Empty;

                        res = Menu();

                        break;
                    case "000":

                        res = "END Logged out, Thank You";
                        break;
                    default:
                        res = Menu();
                        break;
                }

                if (req.session != null)
                    if (req.session.Menu != null)
                        if (res.StartsWith("CON"))
                            res = string.Format("{0}{1}", res, Request.common);
            }
            catch (Exception ex)
            {
                Logs.ReportError(ex);
            }
            return res;
            //Context.Response.Write(res);
        }
        public string Menu()
        {

            try
            {
                if (string.IsNullOrEmpty(req.USSDSTRING))
                {
                    Logging.Logging.LogEntryOnFile(String.Format("\n{1} Menu Session - {0} ", req.SESSIONID, DateTime.Now));
                    req.session = new Ussd();
                    req.session.SESSION = req.SESSIONID;
                    req.session.Phone = req.MSISDN;
                    req.session.Transaction_Time = DateTime.Now;
                    req.session.Code = req.SERVICECODE;
                    req.session.Status = (int)Status.Processing;
                    var uss = Request.db.Ussds.FirstOrDefault(o => o.SESSION == req.SESSIONID);
                    Logging.Logging.LogEntryOnFile(String.Format("\n{1} Session Session - {0} ", req.SESSIONID, DateTime.Now));
                    if (uss == null)
                        Request.db.Ussds.Add(req.session);
                    req.transaction = new Transaction();
                    req.transaction.Reference = req.SESSIONID;
                    req.transaction.Mpesa_Status = (int)Status.Pending;
                    req.transaction.Posted = false;
                    req.transaction.Status = (int)Status.Pending;
                    if (req.SESSIONID.Length > 18)
                        req.transaction.Document_No = req.SESSIONID.Substring(0, 20);
                    else
                        req.transaction.Document_No = req.SESSIONID;
                    req.transaction.MSISDN = req.MSISDN;
                    req.transaction.Transaction_Date = DateTime.Now;
                    req.transaction.Transaction_Time = DateTime.Now;
                    var usst = Request.db.Transactions.FirstOrDefault(o => o.Reference == req.SESSIONID);
                    if (usst == null)
                        Request.db.Transactions.Add(req.transaction); Logging.Logging.LogEntryOnFile(String.Format("\n{1} Trans Session - {0} ", req.SESSIONID, DateTime.Now));
                    var cust = Request.db.Customers.Where(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code).ToList();
                    Logging.Logging.LogEntryOnFile(String.Format("\n{1} Customer Session - {0} ", req.SESSIONID, DateTime.Now));
                    if (cust.Count() == 0)

                    {

                        //client.sendsms(req, "You new M-Baraka Pin is " + pinn);
                        if (service.confirm_ID)
                        {
                            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.EnterID, Request.newline, req.client.Client_Name);
                        }
                        else
                        {
                            var cc = service.Application(req.MSISDN);// client.application(req.MSISDN);
                            if (cc != null)
                            {
                                Customer customer = new Customer();
                                customer.Telephone = req.MSISDN;
                                customer.Name = cc.Name;
                                customer.Date_Registered = DateTime.Now.Date;
                                customer.Client = req.client.Client_Code;// "APS-BARAKA";
                                customer.Active = true;
                                customer.PinChanged = false;
                                customer.Language = "EN";
                                customer.Status = 1;
                                Request.db.Customers.Add(customer);


                                var pinn = Logging.Randomize.RandomString(4);
                                Login Logins = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
                                if (Logins == null)
                                {
                                    Logins = new Login();
                                    Logins.Telephone = req.MSISDN;
                                    Logins.PIN_Encrypted = pinn;
                                    Logins.Client = req.client.Client_Code;
                                    Logins.Start_Pin = pinn;
                                    Request.db.Logins.Add(Logins);
                                    //req.transaction.Account_No = customer.ID_NO;
                                    service.sendsms(req, service.pinmessage + pinn);
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.newregistration, customer.Name);
                                }
                                else
                                {
                                    customer.PinChanged = true;
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.newregistration2, customer.Name, req.client.Client_Name);
                                }

                            }
                            else
                            {
                                req.session.Status = (int)Status.Failed;
                                req.session.comments = "Not Registered";
                                return lang.getlang(enums.sessionstatus.END, ref req, enums.response.NotRegistered);
                            }
                        }

                    }
                    if (cust.Count() > 1)
                    {
                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectclient);
                    }
                    if (cust[0].Active == false)
                    {
                        req.session.Status = (int)Status.Failed;
                        req.session.comments = "Not Active";
                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.NotActive);
                    }
                   
                    req.customer = cust[0];
                    req.session.Client = cust[0].Client;

                    if (req.customer.PinChanged == false)
                    {
                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Firstpin);
                    }

                    var login = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
                    if (login == null)
                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Newpin, Request.newline, cust[0].client_record.Client_Name, req.customer.Name);

                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.pin, Request.newline, cust[0].client_record.Client_Name, req.customer.Name);
                }
                else
                {
                    //var cust = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN).ToList();

                    req.transaction = Request.db.Transactions.FirstOrDefault(o => o.Reference == req.SESSIONID);
                    req.session = Request.db.Ussds.FirstOrDefault(o => o.SESSION == req.SESSIONID);
                    if (req.session != null)
                    {
                        req.sessiondetails = Request.db.Sessions.Where(o => o.SESSION_ID == req.SESSIONID && o.Active == true).ToList();

                        req.customer = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);

                        if (req.customer != null)
                            req.client = Request.db.Clients.FirstOrDefault(o => o.Client_Code == req.customer.Client);

                        return pin();
                    }
                }
            }
            catch (Exception ex)
            {
                Logs.ReportError(ex);
            }



            return res;
        }
        private void setclient(Client c)
        {

            switch (c.Client_Code)
            {
                case "Baraka-Yetu":
                    service = new Baraka(c);
                    break;
                case "APS-BARAKA":
                    service = new Baraka(c);
                    break;
                case "METROCREW":
                    service = new Metrocrew(c);
                    break;
                case "SOUTHLEIGH":
                    service = new Southleigh(c);
                    break;
            }

        }

        private string pin()
        {
            string res = string.Empty;
            var r = req.sessiondetails.OrderByDescending(o => o.Id).FirstOrDefault();
            switch ((enums.response)r.Option)
            {
                case enums.response.pin:
                    if (req.Currentoption == "1")
                    {
                        //switch (req.client.Client_Code)
                        //{
                        //    case "APS-BARAKA":
                        //var m = new client(req.client.Url).member(req.MSISDN);
                        //req.transaction.Account_No = m.No;
                        var pinn = Logging.Randomize.RandomString(4);
                        client.sendsms(req, "You new Pin is " + pinn);
                        var cust = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN);
                        if (cust != null)
                            cust.PinChanged = false;

                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Pinreset, Request.newline);
                        //}
                    }
                    return Validatepin();
                case enums.response.EnterID:
                    var m = service.getmember(req.Currentoption, req.MSISDN);
                    if (m != null)
                    {
                        Customer customer = new Customer();
                        customer.Telephone = req.MSISDN;
                        customer.Name = m.Name;
                        customer.Date_Registered = DateTime.Now.Date;
                        customer.Client = req.client.Client_Code;// "APS-BARAKA";
                        customer.Active = true;
                        customer.PinChanged = false;
                        customer.Language = "EN";
                        customer.Status = 1;
                        Request.db.Customers.Add(customer);

                        var pinn = Logging.Randomize.RandomString(4);
                        Login Logins = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
                        if (Logins == null)
                        {
                            Logins = new Login();
                            Logins.Telephone = req.MSISDN;
                            Logins.PIN_Encrypted = pinn;
                            Logins.Client = req.client.Client_Code;
                            Logins.Start_Pin = pinn;
                            Request.db.Logins.Add(Logins);
                            service.sendsms(req, service.pinmessage + pinn);
                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.newregistration, customer.Name, req.client.Client_Name);
                        }
                        else
                        {
                            customer.PinChanged = true;
                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.newregistration2, customer.Name, req.client.Client_Name);
                        }
                    }
                    else { return lang.getlang(enums.sessionstatus.END, ref req, enums.response.NotRegistered, Request.newline); }
                case enums.response.Firstpin:
                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Newpin, Request.newline);
                case enums.response.Newpin:
                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Confirmpin, Request.newline);
                case enums.response.Confirmpin:
                    if (req.coption[req.coption.Length - 2].ToString().Equals(req.Currentoption))
                    {
                        Login login = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
                        if (login == null)
                        {
                            login = new Login();
                            login.Telephone = req.MSISDN;
                            Request.db.Logins.Add(login);
                        }
                        login.PIN_Encrypted = req.Currentoption;
                        Customer customer = Request.db.Customers.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code);
                        if (customer != null)
                        {
                            customer.PinChanged = true;
                        }
                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Menu, Request.newline, useroptions.Menu(ref req, getmenu()), req.client.Client_Name);
                    }
                    else
                    {
                        return lang.getlang(
                            enums.sessionstatus.END,
                            ref req,
                            enums.response.Wrongpinconfirmation,
                            Request.newline
                         );
                    }
                case enums.response.BankCode:
                    req.transaction.Send_to = req.Currentoption;
                    var menu3 = Request.db.Menus.Where(o => o.Active == true).Select(i => i.ID).ToList();
                    var menu1 = Request.db.Client_Menus.Where(o => o.Client == req.client.Client_Code && o.Active == true).OrderBy(o => o.Order).ToList();
                    var fmenu = menu1.Where(o => menu3.Contains((int)o.Menu_Id)).ToList();
                    req.session.Menu_Count = 0;
                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Menu, Request.newline, useroptions.Menu(ref req, fmenu));
                default:
                    useroptions.selectedmenu(ref req);
                    return menu(ref req);
            }
        }
        private List<Client_Menu> getmenu()
        {
            var menu = Request.db.Menus.Where(o => o.Active == true).Select(i => i.ID).ToList();
            var menu1 = Request.db.Client_Menus.Where(o => o.Client == req.client.Client_Code && o.Active == true).OrderBy(o => o.Order).ToList();
            var fmenu = menu1.Where(o => menu.Contains((int)o.Menu_Id)).ToList();
            return fmenu;
        }
        private string Validatepin()
        {
            try
            {
                var login = Request.db.Logins.FirstOrDefault(o => o.Telephone == req.MSISDN && o.Client == req.client.Client_Code && o.PIN_Encrypted == req.Currentoption);
                if (login != null)
                {
                    req.session.Menu_Count = 0;
                    req.session.Menu = null;
                    switch (req.client.Client_Code)
                    {
                        // case "OPENVALLEY":
                        //   res = lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Openvalley);
                        //   break;
                        case "10":
                            res = lang.getlang(enums.sessionstatus.CON, ref req, enums.response.BankCode);
                            break;
                        default:
                            _bufferTasks.Add(Buffermember(service, req.MSISDN,Request.db));
                            res = lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Menu, Request.newline, useroptions.Menu(ref req, getmenu()), req.client.Client_Name);
                            break;
                    }
                }

                else
                {
                    switch (channel)
                    {
                        case "1111":
                            if ((req.session != null) && (req.client != null))
                            {
                                if (req.session.Menu_Count >= req.client.Pin_Retries)
                                {
                                    res = lang.getlang(enums.sessionstatus.END, ref req, enums.response.Blocked);
                                }
                                else
                                {
                                    req.session.Menu_Count += 1;
                                    res = lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Repin, (req.client.Pin_Retries - req.session.Menu_Count));
                                }
                            }
                            break;
                        default:
                            if ((req.session != null) && (req.client != null))
                            {
                                if (req.session.Menu_Count >= req.client.Pin_Retries)
                                {
                                    res = lang.getlang(enums.sessionstatus.END, ref req, enums.response.Blocked);
                                }
                                else
                                {
                                    req.session.Menu_Count += 1;
                                    res = lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Repin, (req.client.Pin_Retries - req.session.Menu_Count));
                                }
                            }
                            break;
                    }
                }

            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            return res;
        }
        private string menu(ref Request r)
        {
            try
            {
                var lastsession = r.sessiondetails.OrderByDescending(o => o.Id).FirstOrDefault();
                r.transaction.Client = r.client.Client_Code;
                client.smobile.Url = req.client.Url;
           
                switch ((enums.Menu)req.session.Menu)
                {
                    //MB
                    #region balance
                    case enums.Menu.Balance:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Balance;
                                //var m = new client(req.client.Url).member(req.MSISDN);
                                var t = service.Accounts(req.MSISDN);
                                r.transaction.Account_No = t[0].No;
                                if (service.twostepbalancemenu)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.OtherBalances, Request.newline);
                                else
                                {
                                    var mb = service.Balances(r.MSISDN);
                                    service.Trans(req);
                                    service.sendsms(r, mb);
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.accountbalances, Request.newline, mb);

                                }
                            #endregion
                            #region Show balance
                            case enums.response.OtherBalances:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        //var mb = client.Balances(r.MSISDN);
                                        //client.Trans(ref req);
                                        //client.sendsms(r, mb);

                                        var mb = service.Balances(r.MSISDN);
                                        service.Trans(req);
                                        service.sendsms(r, mb);
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.accountbalances, Request.newline, mb);
                                    case "2":
                                        //var mlb = client.LoanBalances(r.MSISDN);
                                        //client.Trans(ref req);
                                        //client.sendsms(r, mlb);

                                        var mlb = service.LoanBalances(r.MSISDN);
                                        service.Trans(req);
                                        service.sendsms(r, mlb);
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanbalances, Request.newline, mlb);
                                    default:
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);
                                }

                                #endregion
                        }
                        break;
                    #endregion
                    #region Ministatement
                    case enums.Menu.Ministatement:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Ministatement;
                                //var accounts = client.Accounts(req.MSISDN);
                                var accounts = service.Accounts(req.MSISDN);
                                if (accounts.Count() == 0)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);
                                if (accounts.Count() > 1)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
                                else
                                {
                                    r.transaction.Account_No = accounts[0].No;
                                    goto case enums.response.selectacc;
                                }
                            #endregion
                            #region Show Ministatement
                            case enums.response.selectacc:
                                var selection = useroptions.userselection(r, enums.options.Withacc);
                                if (String.IsNullOrEmpty(r.transaction.Account_No))
                                    r.transaction.Account_No = selection.Acc;

                                double bal = 0;//= client.Balance(r.transaction.Account_No);

                                if (r.client.Show_bal_for_overdrawan_acc == true)
                                {
                                    r.transaction.Status = (int)Status.Completed;
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Ministatement, client.ministatement(ref r));
                                }
                                else
                                {
                                    if (bal >= client.Tcharges(0, (Transtype)r.transaction.Transaction_Type))
                                    {
                                        r.transaction.Status = (int)Status.Completed;
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Ministatement, client.ministatement(ref r));
                                    }
                                    else
                                    {
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "Insufficcient funds";
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.insufficientfunds);
                                    }
                                }
                                #endregion
                        }
                        break;
                    #endregion
                    #region Withdrawal
                    case enums.Menu.Withdrawal:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Withdrawal;
                                //var m = new client(req.client.Url).member(req.MSISDN);
                                //r.transaction.Account_No = m.No;
                                //goto case enums.response.selectacc;

                                var accounts = service.Accounts(req.MSISDN);
                                if (accounts.Count() == 0)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);
                                if (accounts.Count() > 1)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
                                else
                                {
                                    if (service.PendingTrans(accounts[0].No, (int)Transtype.Withdrawal))
                                    {
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Pendingtrans);
                                    }
                                    r.transaction.Account_No = accounts[0].No;
                                    r.transaction.Balance = accounts[0].Balance;
                                    goto case enums.response.selectacc;
                                }
                            #endregion
                            #region Select Destination
                            case enums.response.selectacc:
                                var selection = useroptions.userselection(r, enums.options.Withacc);
                                if (String.IsNullOrEmpty(r.transaction.Account_No))
                                {
                                    if (service.PendingTrans(selection.Acc, (int)Transtype.Withdrawal))
                                    {
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Pendingtrans);
                                    }
                                    r.transaction.Account_No = selection.Acc;
                                    r.transaction.Balance = selection.Value;
                                }
                                if (service.Allow_withdrawal_to_other_Phone)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.sendto, Request.newline);
                                else { r.transaction.Send_to = r.MSISDN; return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline); }
                            #endregion
                            #region Destination
                            case enums.response.sendto:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Send_to = r.MSISDN;
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);

                                    case "2":
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.otherTelephone, Request.newline);
                                }
                                break;
                            #endregion
                            #region other telephone
                            case enums.response.otherTelephone:
                                r.transaction.Send_to = r.Currentoption;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);
                            #endregion
                            #region amount
                            case enums.response.amount:
                                double amount;
                                if (!double.TryParse(r.Currentoption, out amount))
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);
                                r.transaction.Amount = (decimal)amount;
                                r.transaction.Charge = (decimal)service.Tcharges((double)r.transaction.Amount, (int)Transtype.Withdrawal);

                                if (r.transaction.Balance >= (double)r.transaction.Charge + amount)
                                {
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.withdrawalconfirm, Request.newline, r.transaction.Amount, r.transaction.Account_No, r.transaction.MSISDN);
                                }
                                else
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.insufficientfunds, Request.newline);
                            #endregion
                            #region Confirm
                            case enums.response.withdrawalconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        service.Trans(r);
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.withdrawal, Request.newline);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Cancel_cash_Deposit, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Deposits
                    case enums.Menu.Deposits:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Deposit options
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Deposit;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectdeposit, Request.newline);

                            #endregion
                            #region Select Accounts
                            case enums.response.selectdeposit:
                                var m = new client(req.client.Url).member(req.MSISDN);
                                r.transaction.Account_No = m.No;
                                switch (req.Currentoption)
                                {
                                    case "2":
                                        List<Members.Depositaccounts> ddd = new List<Members.Depositaccounts>();
                                        if (m.DepositAccount.Count() > 0)
                                            if (m.DepositAccount.FirstOrDefault(o => o.Type == Members.Depositaccounts.status.loans) != null)
                                            {
                                                ddd = m.DepositAccount.Where(o => o.Type == Members.Depositaccounts.status.loans && o.Balance > 0).ToList();

                                            }

                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.SelectLoans, Request.newline, useroptions.Deposits(ref req, ddd));

                                    default:

                                        ddd = new List<Members.Depositaccounts>();
                                        if (m.DepositAccount.Count() > 0)
                                            if (m.DepositAccount.FirstOrDefault(o => o.Type == Members.Depositaccounts.status.savings) != null)
                                            {
                                                ddd = m.DepositAccount.Where(o => o.Type == Members.Depositaccounts.status.savings).ToList();

                                            }

                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Selectsavings, Request.newline, useroptions.Deposits(ref req, ddd));

                                }
                            #endregion
                            #region SelectLoans
                            case enums.response.SelectLoans:
                            case enums.response.Selectsavings:
                                var selection = useroptions.userselection(r, enums.options.deposit);
                                r.transaction.Deposit_type = selection.Type;
                                r.transaction.Description = selection.Name;
                                r.transaction.Loan = selection.Acc;
                                r.transaction.Account_2 = selection.Type;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);

                            #endregion
                            #region amount
                            case enums.response.amount:
                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                    r.transaction.Amount = (decimal)amount;
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Depositconfirm, Request.newline, r.transaction.Amount, r.transaction.Description, r.transaction.Account_No);

                            #endregion
                            #region Confirm
                            case enums.response.Depositconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":

                                        MpesaApi.Cust c = new MpesaApi.Cust();
                                        c.customer_key = "IAk8eFksFd1BdGTizoqXI3M7CrYrsQGt";
                                        c.customer_secret = "JZbWLAySK1RNXYM0";
                                        c.ShortCode = "910310";
                                        MpesaApi.MpesaApi mp = new MpesaApi.MpesaApi(c);
                                        MpesaApi.stkpush rr = new MpesaApi.stkpush();
                                        rr.passkey = "40487a2090d70bebf9092dd7ba1714e6fce6984b515f9ebf0d8931e6829085bd";
                                        rr.BusinessShortCode = "910310";
                                        rr.TransactionType = "CustomerPayBillOnline";
                                        rr.Amount = (float)req.transaction.Amount;// 10;// (double) propertySales.Amount;
                                        var phone = req.MSISDN;
                                        rr.PartyA = String.Format("254{0}", phone.Substring(phone.Length - 9));// "254710563359";
                                        rr.PartyB = rr.BusinessShortCode;
                                        rr.PhoneNumber = rr.PartyA;// "254710563359";
                                        rr.CallBackURL = "http://197.248.158.54:4001/Deposit.svc/stkpush";
                                        rr.AccountReference = req.transaction.Account_2;
                                        rr.TransactionDesc = r.transaction.Account_2;
                                        var sp = mp.Stkpush(rr);

                                        if (sp.httperror != null)
                                        {
                                            Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                                            Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);
                                            throw new Exception(sp.httperror.errorMessage);
                                        }
                                        if (sp.ResponseCode == "0")
                                        {
                                            r.transaction.Reference = sp.MerchantRequestID;
                                            var tr = client.Trans(ref r);
                                            if (tr.Code == 0)
                                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Deposit, Request.newline);
                                            else
                                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Depositerror, Request.newline);
                                        }
                                        else
                                        {
                                            Logging.Logging.LogEntryOnFile(sp.ResponseCode);
                                            Logging.Logging.LogEntryOnFile(sp.ResponseDescription);
                                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Depositerror, Request.newline);
                                        }

                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.canceldeposit, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Deposits Bosa
                    case enums.Menu.Deposit_Bosa:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Deposit options
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Deposit;
                                var m = new client(req.client.Url).member(req.MSISDN);
                                List<Members.Depositaccounts> dd = new List<Members.Depositaccounts>();
                                if (m.DepositAccount.Count() > 0)
                                    if (m.DepositAccount.FirstOrDefault(o => o.Type == Members.Depositaccounts.status.loans) != null)
                                    {
                                        dd = m.DepositAccount.ToList();

                                        Members.Depositaccounts d = new Members.Depositaccounts();

                                        d.Account = "Loan";
                                        d.Name = "Loans";
                                        d.Type = Members.Depositaccounts.status.savings;
                                        dd.Add(d);

                                    }

                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectdeposit, Request.newline, useroptions.Deposits(ref req, dd));

                            #endregion
                            #region Select Accounts
                            case enums.response.selectdeposit:
                                var selection = useroptions.userselection(r, enums.options.deposit);
                                r.transaction.Deposit_type = selection.Type;
                                switch (selection.Type)
                                {
                                    case "Loan":

                                        var loan = client.Loans(req.MSISDN).Where(o => o.Balance > 0 || o.Interest > 0).ToList();
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.SelectLoans, Request.newline, useroptions.loans(ref req, loan));
                                    default:
                                        r.transaction.Account_No = selection.Acc;
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);

                                }
                            #endregion
                            #region SelectLoans
                            case enums.response.SelectLoans:
                                var sel = useroptions.userselection(r, enums.options.deposit);
                                r.transaction.Loan = sel.Acc;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);

                            #endregion
                            #region amount
                            case enums.response.amount:
                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                    r.transaction.Amount = (decimal)amount;
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Depositconfirm, Request.newline, r.transaction.Amount, r.transaction.Deposit_type, r.transaction.Account_No);

                            #endregion
                            #region Confirm
                            case enums.response.Depositconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        client.Trans(ref r);
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Deposit, Request.newline);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.canceldeposit, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Transfer
                    case enums.Menu.Transfer:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Transfer_to_Fosa;
                                r.transaction.Description = "Funds Transfer";
                                var accounts = service.Accounts(req.MSISDN);
                                if (accounts.Count() == 0)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);
                                if (accounts.Count() > 1)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
                                else
                                {
                                    r.transaction.Account_No = accounts[0].No;
                                    r.transaction.Member_No = accounts[0].memberno;
                                    r.transaction.Balance = accounts[0].Balance;
                                    r.transaction.Account_Name = accounts[0].Name;
                                    goto case enums.response.selectacc;
                                }
                            #endregion
                            #region selected account
                            case enums.response.selectacc:
                                var selection = useroptions.userselection(r, enums.options.Withacc);
                                if (selection != null)
                                {
                                    r.transaction.Account_No = selection.Acc;
                                    r.transaction.Member_No = selection.Type;
                                    r.transaction.Balance = selection.Value;
                                    r.transaction.Account_Name = selection.Name;
                                }
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Transferto, Request.newline);
                            #endregion
                            #region Destination
                            case enums.response.Transferto:
                                r.transaction.Transfer_To = int.Parse(r.Currentoption);
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Send_to = r.MSISDN;
                                        var ac = r.transaction.Account_No;
                                        var ma = service.Transfer_to(req.MSISDN);
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectToacc, Request.newline, useroptions.accounts(ref req, ma, enums.options.ToAccount));
                                    case "2":
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.otheraccount, Request.newline);
                                }
                                break;
                            #endregion
                            #region other account
                            case enums.response.otheraccount:


                                var a = service.findmember(r.Currentoption);
                                if (a == null)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Invalidentry, Request.newline);
                                r.transaction.Account_2 = a.No;
                                r.transaction.Send_to = a.Name;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.transamount, r.transaction.Balance);

                            #endregion
                            #region other telephone
                            case enums.response.selectToacc:
                                var s = useroptions.userselection(r, enums.options.ToAccount);
                                if (s != null)
                                {
                                    r.transaction.Account_2 = s.Acc;
                                    r.transaction.Deposit_type = s.Custom;
                                }
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.transamount, r.transaction.Balance);

                            #endregion
                            #region amount
                            case enums.response.transamount:
                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                    r.transaction.Amount = (decimal)amount;
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);

                                r.transaction.Charge = (decimal)service.Tcharges(amount, (int)r.transaction.Transaction_Type);
                                //Are you sure you want to Transfer {1} from {2} to {3}({4}){0}1. Yes{0}2. No
                                if (amount <= ((double)r.transaction.Charge + r.transaction.Balance))
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Tconfirm, Request.newline, r.transaction.Amount, r.transaction.Account_No, r.transaction.Account_2, r.transaction.Send_to);
                                else
                                {
                                    r.transaction.Status = (int)Status.Failed;
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.insufficientfunds, Request.newline);
                                }

                            #endregion
                            #region Confirm
                            case enums.response.Tconfirm:

                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        service.Trans(r);
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Transfer, Request.newline);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Cancel_cash_Deposit, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Topup
                    case enums.Menu.Topup:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Airtime;
                                var accounts = client.Accounts(req.MSISDN);
                                if (accounts.Count() == 0)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);

                                if (accounts.Count() > 1)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
                                else
                                {
                                    r.transaction.Account_No = accounts[0].No;
                                    goto case enums.response.selectacc;
                                }
                            #endregion
                            #region Select Destination
                            case enums.response.selectacc:
                                var selection = useroptions.userselection(r, enums.options.Withacc);
                                if (String.IsNullOrEmpty(r.transaction.Account_No))
                                    r.transaction.Account_No = selection.Acc;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.sendto, Request.newline);
                            #endregion
                            #region Destination
                            case enums.response.sendto:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Send_to = r.MSISDN;
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);

                                    case "2":
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.otherTelephone, Request.newline);
                                }
                                break;
                            #endregion
                            #region other telephone
                            case enums.response.otherTelephone:
                                r.transaction.Send_to = r.Currentoption;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);
                            #endregion
                            #region amount
                            case enums.response.amount:
                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                    r.transaction.Amount = (decimal)amount;
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);
                                double bal = client.Balance(ref req);
                                r.transaction.Charge = (Decimal)((double)r.transaction.Amount + client.Tcharges((double)r.transaction.Amount, Transtype.Withdrawal));

                                if (bal >= (double)r.transaction.Charge)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Topupconfirm, Request.newline, r.transaction.Amount, r.transaction.Account_No, r.transaction.MSISDN);
                                else
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.insufficientfunds, Request.newline);
                            #endregion
                            #region Confirm
                            case enums.response.Topupconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        client.Trans(ref r);
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Topup, Request.newline);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.canceltopup, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Utility
                    case enums.Menu.utility:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Utility_Payment;
                                var accounts = client.Accounts(req.MSISDN);
                                if (accounts.Count() == 0)
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount);

                                if (accounts.Count() > 1)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectacc, Request.newline, useroptions.accounts(ref req, accounts));
                                else
                                {
                                    r.transaction.Account_No = accounts[0].No;
                                    goto case enums.response.selectacc;
                                }
                            #endregion
                            #region Select Destination
                            case enums.response.selectacc:
                                var selection = useroptions.userselection(r, enums.options.Withacc);
                                if (String.IsNullOrEmpty(r.transaction.Account_No))
                                    r.transaction.Account_No = selection.Acc;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.selectutility, Request.newline, useroptions.utilities(ref req, Request.db.Utilities.ToList()));

                            #endregion
                            #region other telephone
                            case enums.response.selectutility:
                                var sel = useroptions.userselection(r, enums.options.Utility);
                                r.transaction.Send_to = sel.Acc;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.utilityaccount, Request.newline);
                            #endregion
                            #region utility account
                            case enums.response.utilityaccount:
                                r.transaction.Account_2 = r.Currentoption;
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.amount, Request.newline);
                            #endregion
                            #region amount
                            case enums.response.amount:
                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                    r.transaction.Amount = (decimal)amount;
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);

                                double bal = client.Balance(ref req);
                                r.transaction.Charge = (Decimal)((double)r.transaction.Amount + client.Tcharges((double)r.transaction.Amount, Transtype.Withdrawal));

                                var utility = Convert.ToInt32(r.transaction.Send_to);

                                if (bal >= (double)r.transaction.Charge)
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Utilityconfirm, Request.newline, r.transaction.Amount, r.transaction.Account_No, Request.db.Utilities.FirstOrDefault(o => o.Id == utility).Name);
                                else
                                    return lang.getlang(enums.sessionstatus.END, ref req, enums.response.insufficientfunds, Request.newline);
                            #endregion
                            #region Confirm
                            case enums.response.Utilityconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        client.Trans(ref r);
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Utility, Request.newline);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.cancelUtility, Request.newline);
                                }
                                break;
                                #endregion
                        }
                        break;
                    #endregion
                    #region Pin
                    case enums.Menu.Pin:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region New Pin
                            case enums.response.Menu:
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Newpin, Request.newline);
                            #endregion
                            #region confirm
                            case enums.response.Newpin:
                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Confirmpin, Request.newline);
                            #endregion

                            #region change
                            case enums.response.Confirmpin:
                                var tel = r.MSISDN;
                                var logins = Request.db.Logins.FirstOrDefault(o => o.Telephone == tel && o.Client == req.client.Client_Code);
                                if (logins != null)
                                    logins.PIN_Encrypted = r.Currentoption;
                                return lang.getlang(enums.sessionstatus.END, ref req, enums.response.PinChanged, Request.newline);
                                #endregion
                        }
                        break;
                    #endregion
                    #region ELoan
                    case enums.Menu.E_loan:
                        switch ((enums.response)lastsession.Option)
                        {
                            #region Getaccount
                            case enums.response.Menu:
                                r.transaction.Transaction_Type = (int)Transtype.Loan_Application;
                                var m = service.member(req.MSISDN);
                                if (m != null)
                                {
                                    if (service.PendingTrans(m.No, (int)r.transaction.Transaction_Type) == false)
                                    {
                                        req.customer.getloans(m.No, req.SESSIONID);//Get customer loans
                                        req.transaction.Account_No = m.No;
                                        req.transaction.Account_Name = m.Name;
                                        req.transaction.Description = "Loan ";
                                        var lp = service.loanproducts(req);
                                        if (lp != null)
                                            if (lp.Length == 0)
                                            {
                                                return noaccount(req);

                                            };
                                        if (lp.Length == 1)
                                        {
                                            r.transaction.Loan_Type = lp[0].Code;
                                            req.transaction.Loan = lp[0].Code;
                                            req.transaction.Description = string.Format("{0} Loan", lp[0].Product_Description);
                                            req.transaction.Eligibility = (double)lp[0].Max_Loan_Amount; req.transaction.Allow_Topup = lp[0].Allow_Topup;
                                            req.transaction.Auto_appraise = lp[0].Auto_Appraise;
                                            goto case enums.response.loanproducts;
                                        }
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanproducts, Request.newline, useroptions.loanproducts(ref req, lp.ToList()));

                                    }
                                    else { return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Pendingtrans, Request.newline); }
                                }
                                else
                                    return noaccount(req);
                                break;
                            #endregion
                            #region Loan Amount
                            case enums.response.loanproducts:
                                var selection = useroptions.userselection(r, enums.options.loanproduct);
                                if (selection != null)
                                {
                                    req.transaction.Loan = selection.Acc;
                                    req.transaction.Loan_Type = selection.Acc;
                                    req.transaction.Description = string.Format("{0} Loan", selection.Acc);
                                    req.transaction.Eligibility = selection.Max_Loan_Amount;
                                    req.transaction.Allow_Topup = selection.Allow_Topup;
                                    req.transaction.Auto_appraise = selection.Auto_appraise;
                                }
                                if (req.transaction.Allow_Topup == false)// && req.transaction.Loan != "BOOSTER")
                                {
                                    if (req.transaction.Auto_appraise == true)
                                    {
                                        //var eligible = client.eligibility(r.MSISDN, req.transaction.Loan);
                                        var eligible = service.eligibility(r.MSISDN, req.transaction.Loan);
                                        if (eligible.Code == 0)
                                        {
                                            req.transaction.Eligibility = (double)eligible.content;
                                            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanamount, Request.newline, eligible.content);
                                        }
                                        else
                                        {
                                            req.transaction.Comments = eligible.Desc;
                                            req.transaction.Status = (int)Status.Failed;
                                            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.loanerror, Request.newline, eligible.Desc);
                                        }
                                    }
                                    else
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanamountnormal, Request.newline);
                                }
                                else
                                {
                                    var eligible = service.eligibilitywithtopup(r.MSISDN, req.transaction.Loan, req.transaction.Document_No);
                                    if (eligible.Code == 0)
                                    {
                                        ///To Do
                                        ///
                                        var le = eligible.Contents;
                                        req.transaction.Eligibility = (double)le.Eligible_Amount;
                                        req.transaction.Charge = le.Charges;
                                        req.transaction.Mpesa_Status = Convert.ToInt16(le.use_percentage);
                                        if (le.Loan_Balance == 0)
                                        {
                                            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanamount, Request.newline, le.Eligible_Amount);

                                        }
                                        else
                                        { //You Qualify for KES {1} Loan to Topup {2}, charges {3}, Amount to Receive {4}, Please enter amount to apply for{0} 
                                            req.transaction.Min_Amount = (double)(le.Loan_Balance + (le.use_percentage == true ? 0 : le.Charges));
                                            return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanamounttopup, Request.newline, le.Eligible_Amount, le.Loan_Balance, le.Total_charges, (le.Eligible_Amount - le.Loan_Balance + (le.use_percentage == true ? 0 : le.Charges)));
                                        }
                                    }
                                    else
                                    {
                                        req.transaction.Comments = eligible.Desc;
                                        req.transaction.Status = (int)Status.Failed;
                                        return lang.getlang(enums.sessionstatus.END, ref req, enums.response.loanerror, Request.newline, eligible.Desc);
                                    }
                                }
                            #endregion
                            #region Amount
                            case enums.response.loanamount:
                            case enums.response.loanamounttopup:
                            case enums.response.loanamountnormal:

                                double amount;
                                if (double.TryParse(r.Currentoption, out amount))
                                {
                                    req.transaction.Amount = (decimal)amount;
                                    if (req.transaction.Eligibility != null)
                                        if (req.transaction.Eligibility > 0)
                                        {
                                            if (req.transaction.Eligibility < amount)
                                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.invalidloanamount, Request.newline);
                                            if (req.transaction.Min_Amount > amount)
                                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Loanamountlow, req.transaction.Min_Amount);
                                        }
                                }
                                else
                                    return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Invalidentry, Request.newline);

                                //   if (amount > r.transaction.Eligibility)
                                //     return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.invalidloanamount, Request.newline);

                                return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.loanconfirm, Request.newline, r.transaction.Amount);


                            #endregion
                            #region Confirm
                            case enums.response.loanconfirm:
                                switch (r.Currentoption)
                                {
                                    case "1":
                                        r.transaction.Status = (int)Status.Completed;
                                        //client.Trans(ref r);
                                        service.Trans(r);
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.Loan);
                                    case "2":
                                        r.transaction.Status = (int)Status.Failed;
                                        r.transaction.Comments = "User cancelled";
                                        return lang.getlang(enums.sessionstatus.CON, ref req, enums.response.cancelloan);
                                }
                                break;
                                #endregion
                        }
                        break;
                        #endregion
                }
            }
            catch (Exception ex)
            {
                r.transaction.Status = (int)Status.Failed;
                r.transaction.Comments = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return res;
        }
        private List<Task> _bufferTasks = new List<Task>();
        private async Task Buffermember(Iservice service, string  phone,ussdEntities ussdEntities)
        {Members member = service.member(phone);
           if (member != null)
            {
                Bufferloans(service.Loanlist(member.No),ussdEntities);
               
            }
        }

        private void Bufferloans(List<Client_Loans> loans,ussdEntities ussdEntities)
        {
            foreach (var l in loans)
            {
                Customer_Loan _loan = new Customer_Loan();
                _loan.Session_ID = req.SESSIONID;
                _loan.Loan_No = l.Loan_No;
                _loan.Loan_Product = l.Loan_Product_Type;
                _loan.Member_No = l.Client_Code;
                _loan.Approved_Amount =(double) l.Approved_Amount;
                _loan.Credit_Balance = (double)l.Outstanding_Balance;
                _loan.Interest_Balance = (double)(l.Oustanding_Interest);
                ussdEntities.Customer_Loans.Add(_loan);

            } ussdEntities.SaveChanges();
        }

        private string chooseclient(ref List<Customer> customer)
        {
            return "";
        }
        public static string GenerateRandomPassword(int passwordLength)
        {
            string allowedChars = "123456789";
            char[] chars = new char[passwordLength];
            Random rd = new Random();

            for (int i = 0; i < passwordLength; i++)
            {
                chars[i] = allowedChars[rd.Next(0, allowedChars.Length)];
            }

            return new string(chars);
        }
        public static string noaccount(Request r)
        {
            return lang.getlang(enums.sessionstatus.END, ref req, enums.response.Noaccount, Request.newline);
        }
    }
    public partial class ussdEntities : DbContext
    {
        public ussdEntities(string Connectionstring)
           : base(Connectionstring)
        {
        }
    }
    public class settings
    {
        public string Serverip = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public string Database = string.Empty;
        public string Url = string.Empty;
        public int Port = 0;
        public string Username = string.Empty;
        public string pass = string.Empty;
        public string Companyname = string.Empty;
        public int PostIntervalinsec = 2;
        public int Reconnectintervalinsec = 10;
        public string logpath = string.Empty;
        public Boolean usewindowsauth = true;
        public string certpath = string.Empty;
        public bool IntegratedSecurity = false;
        public settings loadsettings(string file)
        {
            settings s = new settings();
            XmlSerializer xs = new XmlSerializer(typeof(settings));
            using (var sr = new StreamReader(file))
            {
                s = (settings)xs.Deserialize(sr);
                Logging.Logging.logpath = s.logpath;
            }
            return s;
        }
        public void setup(ref settings s)
        {
            var p = s.Username;
            s.pass = p;
        }
    }
}