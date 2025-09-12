using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using Newtonsoft.Json;

namespace Collection {
    /// <summary>
    /// Summary description for Enwealth
    /// </summary>
    [WebService (Namespace = "http://tempuri.org/")]
    [WebServiceBinding (ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem (false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Enwealth : System.Web.Services.WebService {
        public Enwealth () {
            string path = Server.MapPath ("~/Settings.txt");
            ServerSetting.getsettings (path);
            Logging.Logging.logpath = ServerSetting.logpath;
            Logging.Logging.LogEntryOnFile (ServerSetting.logpath);
            contributionrequest m = new contributionrequest ();
            m.company_code = "";
            JsonSerializerSettings jsSettings = new JsonSerializerSettings ();
            jsSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            var d = JsonConvert.SerializeObject (m, Formatting.None, jsSettings);
        }

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
        public void Members (string Code) {
            Logging.Logging.LogEntryOnFile (String.Format (">\nMembers\n{0}", Code));
            var response = string.Empty;
            membersResponse mr = new membersResponse ();
            try {
                using (var db = new Enwealth1Entities ()) {
                    memberrequest code = JsonConvert.DeserializeObject<memberrequest> (Code);
                    var c = new company ().Getcompany (code.company_code);
                    if (c != null) {
                        List<members> v = null;
                        v = db.Database.SqlQuery<members> (String.Format ("Select No_, Name as Member_Name, [Date of Birth] as [Date_of_Birth], [Date of Joining] as [Date_of_Joining], [Expected Retirement Date] as Retirement_Date, [PIN No_] as Pin_No, [E-Mail] as E_mail, [Phone No_] as Phone_No, [ID_ No_] as ID_No  from [{0}$Vendor] ", c.Company_Name)).ToList ();
                        if (!string.IsNullOrEmpty (code.member_no))
                            v = db.Database.SqlQuery<members> (String.Format ("Select No_, Name as Member_Name, [Date of Birth] as [Date_of_Birth], [Date of Joining] as [Date_of_Joining], [Expected Retirement Date] as Retirement_Date, [PIN No_] as Pin_No, [E-Mail] as E_mail, [Phone No_] as Phone_No, [ID_ No_] as ID_No  from [{0}$Vendor] where No_ = '{1}'", c.Company_Name, code.member_no)).ToList ();
                        if (!string.IsNullOrEmpty (code.registrationdate)) {
                            v = db.Database.SqlQuery<members> (String.Format ("Select No_, Name as Member_Name, [Date of Birth] as [Date_of_Birth], [Date of Joining] as [Date_of_Joining], [Expected Retirement Date] as Retirement_Date, [PIN No_] as Pin_No, [E-Mail] as E_mail, [Phone No_] as Phone_No, [ID_ No_] as ID_No  from [{0}$Vendor] where [Date of Joining] = '{1}'", c.Company_Name, code.registrationdate)).ToList ();
                        }
                        if (!Available())
                            mr.Members = v.ToArray ();
                        mr.response_code = 0;
                        mr.response_desc = "successfull";
                    } else {
                        mr.response_code = -1;
                        mr.response_desc = "Company code not found";
                    }
                }

            } catch (Exception ex) {
                Logging.Logging.ReportError (ex);
                mr.response_code = -1;
                mr.response_desc = "System Error";
            }
            JsonSerializerSettings jsSettings = new JsonSerializerSettings ();
            jsSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            response = JsonConvert.SerializeObject (mr, Formatting.None, jsSettings);
            Logging.Logging.LogEntryOnFile (String.Format ("<\n\n"));
            Context.Response.Output.Write (response);
        }

        [WebMethod]
        [ScriptMethod (ResponseFormat = ResponseFormat.Json)]
        public void MemberContributions (string p) {
            Logging.Logging.LogEntryOnFile (String.Format (">\nContributions\n{0}", p));
            var response = string.Empty;
            ContributionResponse mr = new ContributionResponse ();
            try {
                using (var db = new Enwealth1Entities ()) {
                    var code = JsonConvert.DeserializeObject<contributionrequest> (p);
                    var c = new company ().Getcompany (code.company_code);
                    if (c != null) {

                        var col = db.Database.SqlQuery<contributions> (String.Format ("select [Entry No_] as ID, [Posting Date] as PostingDate,[Vendor No_] as Member_No ,[Document No_] as Reference,Amount,[Contribution Type] as contribution_Type,[Transaction Type] as transaction_Type, [Exemption Type] as [Exemption_Type]  from [{0}$Detailed Vendor Ledg_ Entry]", c.Company_Name)).ToArray ();
                        if (!string.IsNullOrEmpty (code.member_no))
                            col = db.Database.SqlQuery<contributions> (String.Format ("select [Entry No_] as ID, [Posting Date] as PostingDate,[Vendor No_] as Member_No ,[Document No_] as Reference,Amount,[Contribution Type] as contribution_Type,[Transaction Type] as transaction_Type, [Exemption Type] as [Exemption_Type]  from [{0}$Detailed Vendor Ledg_ Entry]  Where [Vendor No_] ='{1}'", c.Company_Name, code.member_no)).ToArray ();
                        if (!string.IsNullOrEmpty (code.postingdate))
                            col = db.Database.SqlQuery<contributions> (String.Format ("select [Entry No_] as ID, [Posting Date] as PostingDate,[Vendor No_] as Member_No ,[Document No_] as Reference,Amount,[Contribution Type] as contribution_Type,[Transaction Type] as transaction_Type, [Exemption Type] as [Exemption_Type]  from [{0}$Detailed Vendor Ledg_ Entry]  Where [Posting Date] ='{1}'", c.Company_Name, code.postingdate)).ToArray ();
                        if (!Available())
                        mr.contributions = col.ToArray ();

                        mr.response_code = 0;
                        mr.response_desc = "successfull";
                    } else {
                        mr.response_code = -1;
                        mr.response_desc = "Company code not found";
                    }
                }

            } catch (Exception ex) {
                Logging.Logging.ReportError (ex);
                mr.response_code = -1;
                mr.response_desc = "System Error";
            }
            JsonSerializerSettings jsSettings = new JsonSerializerSettings ();
            jsSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;

            response = JsonConvert.SerializeObject (mr, Formatting.None, jsSettings);
            Logging.Logging.LogEntryOnFile (String.Format ("<\n\n"));
            Context.Response.Output.Write (response);

        }

        private bool Available() {

            return DateTime.Now.Date > new DateTime(2019, 10, 23);
        }
    }
    public class company : Collection.Company {

        public string code { get; set; }
        public Company Getcompany (String Companycode) {
            Company c = null;
            using (var db = new Enwealth_ServiceEntities ()) {

                c = db.Companies.FirstOrDefault (o => o.Code == Companycode);

            }
            return c;
        }

    }
    public class Response {
        public int response_code;
        public string response_desc;
    }
    public class memberrequest {
        public string company_code { get; set; }
        public string member_no { get; set; }
        public string registrationdate { get; set; }

    }
    public class contributionrequest {
        public string company_code { get; set; }
        public string member_no { get; set; }
        public string postingdate { get; set; }

    }
    public class membersResponse : Response {
        public members[] Members;
    }
    public class ContributionResponse : Response {
        public contributions[] contributions;
    }
    public class members {
        public string No_ { get; set; }
        public string Member_Name { get; set; }

        [JsonIgnore]
        public DateTime Date_of_Birth { get; set; }

        [JsonIgnore]
        public DateTime Date_of_joining { get; set; }

        [JsonIgnore]
        public DateTime Retirement_Date { get; set; }
        public int ID_No { get; set; }
        public string Pin_No { get; set; }
        public string E_mail { get; set; }
        public string Phone_No { get; set; }
        public string DateofBirth {
            get {
                return Date_of_Birth.ToString ("dd/MM/yyyy");
            }
        }
        public string Dateofjoining {
            get {
                return Date_of_joining.ToString ("dd/MM/yyyy");
            }
        }
        public string DateofRetirement {
            get {
                return Retirement_Date.ToString ("dd/MM/yyyy");
            }
        }
        public contributions[] contributions { get; set; }

    }
    public class contributions {
        public int ID { get; set; }
        public string Member_No { get; set; }

        public DateTime PostingDate { get; set; }
        public string Reference { get; set; }
        public decimal Amount { get; set; }
        public contribution_type contribution_Type { get; set; }
        public transaction_type transaction_Type { get; set; }
        public int Exemption_Type { get; set; }
    }
    public enum contribution_type {
        Blank = 0,
        Employee_Contribution = 1,
        Employer_Normal = 2,
        Emp_Addition = 3,
        Employee_Additional = 4,
        NSSF_Contribution = 5
    }
    public enum transaction_type {
        Blank = 0,
        Contribution = 1,
        Withdrawal = 2,
        Interest = 3,
        Transfer = 4
    }
    public class ServerSetting {
        public static string server, db, user, pass, Companyname, domain, Port, Instance, logpath;

        public static void getsettings (string path) {
            using (StreamReader sr = new StreamReader (path)) {
                server = sr.ReadLine ();
                Port = sr.ReadLine ();
                db = sr.ReadLine ();
                user = sr.ReadLine ();
                pass = sr.ReadLine ();
                domain = sr.ReadLine ();
                Companyname = sr.ReadLine ();
                Instance = sr.ReadLine ();
                logpath = sr.ReadLine ();

            }
        }
    }
}