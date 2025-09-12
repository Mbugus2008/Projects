
using Agency.Customer;
using Agency.Transaction;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Script.Services;
using System.Web.Services;
using Sendsms;
using System.Xml.Serialization;
using System.Threading.Tasks;

namespace Agency
{
    /// <summary>
    /// Summary description for Agency
    /// 
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService] 
    public class Agency : System.Web.Services.WebService
    {
        private System.Net.NetworkCredential cd;
        public static AgentTransactions_Service transervice = new AgentTransactions_Service();
        private Customer_Service customerService = new Customer.Customer_Service();
        private Loans.Loans_Service loans_Service = new Loans.Loans_Service();
        private Charges.AgentCharges_Service charges_Service = new Charges.AgentCharges_Service();
        private Dimensions.Dimensions_Service dimensions_Service = new Dimensions.Dimensions_Service();
        private CustomerDetails.CustomerDetails_Service customerDetails_Service = new CustomerDetails.CustomerDetails_Service();
        private settings s;
        private AccountTypes.AccountTypes_Service accounttype_service = new AccountTypes.AccountTypes_Service();
        private Branches.Branches_Service branchservice = new Branches.Branches_Service();
        private LoanProducts.LoanProducts_Service productservice = new LoanProducts.LoanProducts_Service();
        private Agents.AgentApplications_Service agentservice = new Agents.AgentApplications_Service();
        private Functions.Agency functions = new Functions.Agency();
        private Registration.Member_Application_Service Member_Application_Service = new Registration.Member_Application_Service();


        public Agency()
        {
            string path = Server.MapPath("~/Settings.config");
            s = new settings().loadsettings(path);
            cd = new System.Net.NetworkCredential(s.EUsername, s.Epass, s.domain);

            transervice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/AgentTransactions",s.Serverip, s.Companyname, s.EInstance, s.Port);
            transervice.Credentials = cd;
            transervice.PreAuthenticate = true;


            customerService.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Customer",s.Serverip, s.Companyname, s.EInstance, s.Port);
            customerService.Credentials = cd;
            customerService.PreAuthenticate = true;

            loans_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans",s.Serverip, s.Companyname, s.EInstance, s.Port);
            loans_Service.Credentials = cd;
            loans_Service.PreAuthenticate = true;

            charges_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/AgentCharges",s.Serverip, s.Companyname, s.EInstance, s.Port);
            charges_Service.Credentials = cd;
            charges_Service.PreAuthenticate = true;


            dimensions_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Dimensions",s.Serverip, s.Companyname, s.EInstance, s.Port);
            dimensions_Service.Credentials = cd;
            dimensions_Service.PreAuthenticate = true;

            customerDetails_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/CustomerDetails",s.Serverip, s.Companyname, s.EInstance, s.Port);
            customerDetails_Service.Credentials = cd;
            customerDetails_Service.PreAuthenticate = true;


            accounttype_service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/AccountTypes",s.Serverip, s.Companyname, s.EInstance, s.Port);
            accounttype_service.Credentials = cd;
            accounttype_service.PreAuthenticate = true;


            productservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/LoanProducts",s.Serverip, s.Companyname, s.EInstance, s.Port);
            productservice.Credentials = cd;
            productservice.PreAuthenticate = true;

            functions.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/Agency",s.Serverip, s.Companyname, s.EInstance, s.Port);
            functions.Credentials = cd;
            functions.PreAuthenticate = true;
            agentservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/AgentApplications",s.Serverip, s.Companyname, s.EInstance, s.Port);
            agentservice.Credentials = cd;
            agentservice.PreAuthenticate = true;

            branchservice.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Branches",s.Serverip, s.Companyname, s.EInstance, s.Port);
            branchservice.Credentials = cd;
            branchservice.PreAuthenticate = true;


            Member_Application_Service.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/Member_Application",s.Serverip, s.Companyname, s.EInstance, s.Port);
            Member_Application_Service.Credentials = cd;
            Member_Application_Service.PreAuthenticate = true;

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Transactions(string data)
        {
            Logging.Logging.LogEntryOnFile(string.Format("\n{0}:{1}", DateTime.Now, data));
            Logging.Logging.LogEntryOnFile(string.Format("\n{0}:{1}", DateTime.Now, transervice.Url));
            RESPONSE r = new RESPONSE();
            r.RESPCODE = "0";
            r.RESPDESC = "Successfull";
            string response = "{}";
            Customer.Customer c;
            Customer.Customer[] cust;
            Loans.Loans[] loans;
            Loans.Loans loan;
            Sms sms;
            List<MEMBERS> members = new List<MEMBERS>();
            List<ACCOUNTS> accounts = new List<ACCOUNTS>();
            MEMBERS m;
            ACCOUNTS acc= null;
            TRANSACTION t;
            double amount = 0;


            try
            {
                //0   SUCESS
                //1   INVALID MEMBERID
                //2   INVALID NATIONALID
                //3   INVALID ACCOUNTTYPE
                //4   INVALID ACCOUNT
                //5   ACCOUNT CLOSED
                //6   ACCOUNT INACTIVE
                //7   INVALID DEVICEID
                //8   INVALID AGENT MEMBERID
                //9   LIMIT EXCEEDS
                //999 Other(PLEASE SPECIFY RESPDESC)

                t = JsonConvert.DeserializeObject<TRANSACTION>(data);


                if (t.FUNCTIONCD == null) throw new response(999, "Missing parameter value: FUNCTIONCD");
                checkagentcode(t);
                switch (t.FUNCTIONCD)
                {
                    #region Search Member
                    case "001":
                        if (t.SEARCHBY == null) throw new response(999, "Missing parameter value: SEARCHBY");
                        if (t.SEARCHSTRING == null) throw new response(999, "Missing parameter value: SEARCHSTRING");
                        switch (t.SEARCHBY)
                        {
                            case "0":
                                c = customerService.Read(t.SEARCHSTRING);
                                cust = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.SEARCHSTRING, Field = Customer_Fields.Staff_No }, new Customer_Filter { Criteria = "0101|0109", Field = Customer_Fields.Account_Type } }, null, 0);
                               
                                if (cust.Count() == 0) throw new response(1, "INVALID MEMBERID");
                                foreach (var cc in cust)
                                {
                                    if (cc.Status == Customer.Status.Active)
                                    {
                                        m = new MEMBERS();
                                        m.REGMOBNO = cc.Phone_No;
                                        m.BANKACCNO = cc.No;
                                        m.ID = cc.ID_No;
                                        m.CITY = cc.City;
                                        m.NAME = cc.Name;
                                       
                                        
                                        m.DOB = cc.Date_of_Birth.Date.ToString();
                                        members.Add(m);
                                    }
                                }
                                
                                r.MEMBERS = members;
                                break;
                            case "1":
                                cust = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.SEARCHSTRING, Field = Customer_Fields.ID_No }, new Customer_Filter { Criteria = "0101|0109", Field = Customer_Fields.Account_Type } }, null, 0);
                                if (cust.Count() == 0) throw new response(2, "INVALID NATIONALID");
                                foreach (var cc in cust)
                                {
                                    m = new MEMBERS();
                                    m.REGMOBNO = cc.Phone_No;
                                    m.BANKACCNO = cc.No;
                                    m.ID = cc.ID_No;
                                    m.CITY = cc.City;
                                    m.NAME = cc.Name;
                                    m.DOB = cc.Date_of_Birth.Date.ToString();
                                    members.Add(m);
                                }
                                r.MEMBERS = members;
                                break;
                            case "2":
                                cust = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.SEARCHSTRING, Field = Customer_Fields.Name }, new Customer_Filter { Criteria = "0101|0109", Field = Customer_Fields.Account_Type } }, null, 0);
                                if (cust == null) throw new response(2, "INVALID NAME");
                                foreach (var cc in cust)
                                {
                                    m = new MEMBERS();
                                    m.REGMOBNO = cc.Phone_No;
                                    m.BANKACCNO = cc.No;
                                    m.ID = cc.ID_No;
                                    m.CITY = cc.City;
                                    m.NAME = cc.Name;
                                    m.DOB = cc.Date_of_Birth.Date.ToString();
                                    members.Add(m);
                                }
                                r.MEMBERS = members;
                                break;
                        }
                        break;
                    #endregion
                    #region Get Accounts
                    case "002":
                        if (t.MEMBERID == null) throw new response(999, "Missing parameter value: MEMBERID");
                        if (t.ACCTYPE == null) throw new response(999, "Missing parameter value: ACCTYPE");
                        switch (t.ACCTYPE)
                        {
                            case "0":
                               var cc = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.MEMBERID, Field = Customer_Fields.ID_No },new Customer_Filter { Criteria = "Yes",Field = Customer_Fields.Deposit_from_agency } }, null, 0);
                                //c = customerService.Read(t.MEMBERID);
                                if (cc != null)
                                {
                                    foreach (var ccc in cc)
                                    {
                                        acc = new ACCOUNTS();
                                        acc.ACCNO = ccc.No;
                                        acc.ACCTYPE = "1";
                                        acc.REGMOBNO = (ccc.Phone_No == null ? "" : ccc.Phone_No.Replace(" ", ""));
                                        acc.CURBAL = functions.AccountBalance(ccc.No).ToString();
                                        accounts.Add(acc);
                                    }

                                }

                                //loans = loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = c.Staff_No, Field = Loans.Loans_Fields.Client_Code } }, null, 0);

                                //foreach (var l in loans)
                                //{
                                //    if ((l.Outstanding_Balance + l.Oustanding_Interest) > 0)
                                //    {
                                //        acc = new ACCOUNTS();
                                //        acc.ACCNO = l.Loan_No;
                                //        acc.ACCTYPE = "2";
                                //        acc.CURBAL = (l.Oustanding_Interest + l.Outstanding_Balance).ToString();
                                //        acc.INSTLMNTAMT = l.Installments.ToString();
                                //        if (c != null)
                                //            acc.REGMOBNO = c.Phone_No.Replace(" ", "");
                                //        accounts.Add(acc);
                                //    }
                                //}
                                if (accounts.Count() == 0) throw new response(999, "No records Found");
                                r.ACCOUNTS = accounts;
                                break;
                            case "1":
                                c = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.MEMBERID, Field = Customer_Fields.ID_No }, new Customer_Filter { Criteria = "0101|0109", Field = Customer_Fields.Account_Type } }, null, 0).FirstOrDefault();
                                //c = customerService.Read(t.MEMBERID);
                                if (c == null) throw new response(1, "INVALID MEMBERID");
                                if (c.Status != Customer.Status.Active) throw new response(6, "ACCOUNT INACTIVE");
                                acc = new ACCOUNTS();
                                acc.ACCNO = c.No;
                                acc.ACCTYPE = "1";
                                acc.REGMOBNO = (c.Phone_No == null ? "" : c.Phone_No.Replace(" ", ""));
                                acc.CURBAL = functions.AccountBalance(c.No).ToString();
                                                              accounts.Add(acc);
                                r.ACCOUNTS = accounts;
                                break;
                            case "2":
                                c = customerService.ReadMultiple(new Customer_Filter[] { new Customer_Filter { Criteria = t.MEMBERID, Field = Customer_Fields.ID_No }, new Customer_Filter { Criteria = "0101|0109", Field = Customer_Fields.Account_Type } }, null, 0).FirstOrDefault();
                                // c = customerService.Read(t.MEMBERID);
                                loans = loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = c.Staff_No, Field = Loans.Loans_Fields.Client_Code } }, null, 0);
                                if (loans.Count() == 0) throw new response(999, "No Loans Found");
                                foreach (var l in loans)
                                {
                                    if (l.Outstanding_Balance + l.Oustanding_Interest > 0)
                                    {
                                        acc = new ACCOUNTS();
                                        acc.ACCNO = l.Loan_No;
                                        acc.ACCTYPE = "2";
                                        acc.ACCDESC = l.Loan_Product_Type_Name;
                                        acc.CURBAL = (l.Oustanding_Interest + l.Outstanding_Balance).ToString();
                                        acc.INSTLMNTAMT = l.Installments.ToString();
                                        if (c != null)
                                            acc.REGMOBNO = c.Phone_No.Replace(" ", "");
                                        accounts.Add(acc);
                                    }
                                }
                                r.ACCOUNTS = accounts;
                                break;
                            default:
                                throw new response(999, "Not Applicable");
                        }
                        break;
                    #endregion
                    #region Deposit
                    case "005":
                        if (t.AMOUNT == null) throw new response(999, "Missing parameter value: AMOUNT");
                        if (Convert.ToDouble(t.AMOUNT) == 0) throw new response(999, "Invalid Amount value");
                        amount = Convert.ToDouble(t.AMOUNT);

                        createtrans(t);
                        if (amount > (double)functions.DailyLimit(t.ACCOUNTNO, (int)ttypes.Deposit, t.AGNMEMBERID)) throw new response(999, "Maximun Daily Limit exceeded", t);
                        if (amount > (double)functions.TLimit(t.ACCOUNTNO, (int)ttypes.Deposit, t.AGNMEMBERID)) throw new response(999, "Transaction Limit exceeded", t);
                        if (functions.DailyLimit(t.ACCOUNTNO, (int)ttypes.Deposit, t.AGNMEMBERID) == 0) throw new response(999, "Maximum Transaction Limit exceeded", t);
                        if (t.MEMBERID == null) throw new response(999, "Missing parameter value: MEMBERID", t);
                        if (t.TRANID == null) throw new response(999, "Missing parameter value: TRANID", t);
                        c = customerService.Read(t.ACCOUNTNO);
                        if (c == null) throw new response(4, "Invalid Account", t);
                        if (c.Account_Type.Equals("FIXED")) throw new response(999, "Deposit not allowed for this account", t);
                        if (amount > ((double)functions.AgentBalance(t.AGNMEMBERID)))
                            throw new response(999, "Insufficient funds - Agent", t);
                        break;
                    #endregion
                    #region Loans
                    case "006":
                        createtrans(t);
                        if (t.ACCOUNTNO == null) throw new response(999, "Missing parameter value: ACCOUNTNO");
                        if (t.TRANID == null) throw new response(999, "Missing parameter value: TRANID");
                        if (t.AMOUNT == null) throw new response(999, "Missing parameter value: AMOUNT");
                        if (Convert.ToDouble(t.AMOUNT) == 0) throw new response(999, "Invalid Amount value");
                        amount = Convert.ToDouble(t.AMOUNT);
                        loan = loans_Service.Read(t.ACCOUNTNO);
                        if (loan == null) throw new response(4, "Invalid Account");
                        break;
                    #endregion
                    #region Withdrawal
                    case "007":
                        createtrans(t);
                        if (t.ACCOUNTNO == null) throw new response(999, "Missing parameter value: ACCOUNTNO", t);
                        if (t.TRANID == null) throw new response(999, "Missing parameter value: TRANID", t);
                        if (t.AMOUNT == null) throw new response(999, "Missing parameter value: AMOUNT", t);
                        if (Convert.ToDouble(t.AMOUNT) == 0) throw new response(999, "Invalid Amount value", t);
                        amount = Convert.ToDouble(t.AMOUNT);
                        c = customerService.Read(t.ACCOUNTNO);
                        if (c == null) throw new response(4, "Invalid Account", t);
                        if ((!c.Account_Type.Equals("0101")) && (!c.Account_Type.Equals("0109"))) throw new response(999, "Withdraw not allowed for this account", t);
                        if (c.Blocked != Blocked._blank_) throw new response(999, "Withdraw not allowed for blocked account", t);
                        if (c.Status != Customer.Status.Active) throw new response(999, "Withdraw not allowed for Non active account", t);
                        if (amount > ((double)functions.AccountBalance(t.ACCOUNTNO) + (double)functions.Tcharges((decimal)amount, (int)ttypes.Withdrawal, t.AGNMEMBERID)))
                            throw new response(999, "Insufficient funds", t);
                        double limit = (double)functions.DailyLimit(t.ACCOUNTNO, (int)ttypes.Withdrawal, t.AGNMEMBERID);
                        Logging.Logging.LogEntryOnFile(String.Format("Limit {0}", limit));
                        if (amount > limit) throw new response(999, "Maximun Daily Limit exceeded", t);
                        if (amount > (double)functions.TLimit(t.ACCOUNTNO, (int)ttypes.Withdrawal, t.AGNMEMBERID)) throw new response(999, "Transaction Limit exceeded", t);
                        if (functions.Dailytransactions(t.ACCOUNTNO, (int)ttypes.Withdrawal, t.AGNMEMBERID) == 0) throw new response(999, "Maximum Transaction Limit exceeded", t);
                        break;
                    #endregion
                    #region Branches
                    case "011":
                        var br = branchservice.ReadMultiple(null, null, 0);
                        if (br.Count() == 0)
                            throw new response(999, "No branches found");
                        List<BRANCHES> brs = new List<BRANCHES>();
                        foreach (var b in br)
                        {
                            BRANCHES bb = new BRANCHES();
                            bb.CODE = b.Code;
                            bb.NAME = b.Name;
                            brs.Add(bb);
                        }
                        r.BRANCHES = brs;
                        break;
                    #endregion
                    #region Account info
                    case "012":
                        if (t.ACCOUNTNO == null) throw new response(999, "Missing parameter value: ACCOUNTNO");
                        c = customerService.Read(t.ACCOUNTNO);
                        if (c != null)
                        {

                            acc = new ACCOUNTS();
                            acc.ACCNO = c.No;
                            acc.ACCTYPE = "1";
                            acc.REGMOBNO = c.Phone_No;
                            acc.CURBAL = functions.AccountBalance(t.ACCOUNTNO).ToString();

                        }
                        else
                        {
                            loan = loans_Service.Read(t.ACCOUNTNO);
                            if (loan != null)
                            {

                                acc = new ACCOUNTS();
                                acc.ACCNO = loan.Loan_No;
                                acc.ACCTYPE = "2";
                                acc.CURBAL = (loan.Oustanding_Interest + loan.Outstanding_Balance).ToString();
                                acc.INSTLMNTAMT = loan.Installments.ToString();
                                c = customerService.Read(loan.Client_Code);
                                if (c != null)
                                    acc.REGMOBNO = c.Phone_No;
                            }
                        }
                        if (acc == null) throw new response(999, "Account not found");
                        r.INFO = acc;
                        break;
                    #endregion
                    #region Mini Statement
                    case "013":
                        if (t.TRANCNT == null) throw new response(999, "Missing Parameter: TRANCNT");
                        if (t.ACCOUNTNO == null) throw new response(999, "Missing parameter value: ACCOUNTNO");
                        c = customerService.Read(t.ACCOUNTNO);
                        if (!c.Account_Type.Equals("0101") && !c.Account_Type.Equals("0109")) throw new response(999, "Transaction not allowed for this account", t);
                        if (c.Blocked != Blocked._blank_) throw new response(999, "Transaction not allowed for blocked account", t);
                        if (c.Status != Customer.Status.Active) throw new response(999, "Transaction not allowed for Non active account", t);
                        var tt = Convert.ToInt32(t.TRANCNT);
                        createtrans(t);
                        var cd = customerDetails_Service.ReadMultiple(new CustomerDetails.CustomerDetails_Filter[] { new CustomerDetails.CustomerDetails_Filter { Criteria = t.ACCOUNTNO, Field = CustomerDetails.CustomerDetails_Fields.Vendor_No } }, null, 0).OrderByDescending(o => o.Entry_No);
                        if (cd.Count() == 0) throw new response(999, "No records found", t);
                        List<Mini> minis = new List<Mini>();
                        double bal = (double)functions.AccountBalance(t.ACCOUNTNO);
                        string sm = string.Empty;
                        // var min = cd.Take(tt);

                        foreach (var item in cd.Take(tt).OrderBy(o => o.Entry_No))
                        {
                            Mini mini = new Mini();
                            mini.TRANDATE = item.Posting_Date.ToShortDateString();
                            mini.VALUEDATE = item.Posting_Date.ToShortDateString();
                            mini.SEQNO = item.Entry_No.ToString();
                            mini.AMOUNT = (item.Amount >= 0 ? item.Amount : item.Amount * -1).ToString();
                            mini.DRORCR = (item.Amount >= 0 ? "DR" : "CR");
                            mini.NARRATION = item.Vendledger_Description;
                            mini.BALANCE = (bal - (double)item.Amount).ToString();
                            bal = bal - (double)item.Amount;
                            minis.Add(mini);
                            sm += string.Format("{0}|{1}|{2}|{3}\n", mini.TRANDATE, mini.NARRATION, mini.DRORCR, mini.AMOUNT);
                        }
                        r.TRANSACTIONS = minis;
                        sm += string.Format("Account bal: {0}", functions.AccountBalance(t.ACCOUNTNO));

                        //sms = new Sms();
                        //sms.Sendsms(DateTime.Now.Ticks.ToString(), c.Phone_No, sm, s.smsclient);
                       // functions.Sendsms("Agency", c.Phone_No, sm, "Agency");
                       
                        sms_tangazo.sms s = new sms_tangazo.sms(Logging.Logging.logpath);
                        s.User_ID = "1359";
                        s.service = "1";
                        s.passkey = "391ELT5DWW";
                        s.Sender = "IMARIKA";
                        s.Phone = c.Phone_No;// "+254724367745";
                        s.Message = sm;// "Agency sms test";
                        s.Type = "Notification";
                        s = s.send(s);

                        Logging.Logging.LogEntryOnFile(s.Code.ToString());
                        Logging.Logging.LogEntryOnFile(s.Desc);

                        if (s.Code == -1) throw new response(999, s.Desc);
                        break;
                    #endregion
                    #region send otp
                    case "019":
                        if (t.MOBNO == null) throw new response(999, "Missing Parameter: MOBNO");
                        if (t.MESSAGE == null) throw new response(999, "Missing Parameter: MESSAGE");
                        if (t.MOBNO.Length < 9) throw new response(999, "Invalid Phone No.");

                        //sms = new Sms();
                        //sms.Sendsms(DateTime.Now.Ticks.ToString(), t.MOBNO, t.MESSAGE, s.smsclient);

                        s = new sms_tangazo.sms(Logging.Logging.logpath);
                        s.User_ID = "1359";
                        s.service = "1";
                        s.passkey = "391ELT5DWW";
                        s.Sender = "IMARIKA";
                        s.Phone = t.MOBNO;// "+254724367745";
                        s.Message = t.MESSAGE;// "Agency sms test";
                        s.Type = "Notification";
                        s = s.send(s);

                        Logging.Logging.LogEntryOnFile(s.Code.ToString());
                        Logging.Logging.LogEntryOnFile(s.Desc);

                       if (s.Code ==-1) throw new response(999, s.Desc);

                        // functions.Sendsms("Agency", t.MOBNO, t.MESSAGE, "Agency");


                        break;
                    #endregion
                    #region schemes
                    case "020":
                        if (t.ACCTYPE == null) throw new response(999, "Missing parameter value: ACCTYPE");
                        switch (t.ACCTYPE)
                        {
                            case "0":
                                var acctypes = accounttype_service.ReadMultiple(new AccountTypes.AccountTypes_Filter[] { }, null, 0);
                                List<SCHEMES> schemes = new List<
                                    SCHEMES>();
                                if (acctypes.Count() > 0)
                                    foreach (var item in acctypes)
                                    {
                                        SCHEMES scheme = new SCHEMES();
                                        scheme.SCHEMECD = item.Code;
                                        scheme.SCHEMEDESC = item.Description;
                                        schemes.Add(scheme);
                                    }

                                var producttypes = productservice.ReadMultiple(new LoanProducts.LoanProducts_Filter[] { }, null, 0);

                                if (producttypes.Count() > 0)
                                    foreach (var item in producttypes)
                                    {
                                        SCHEMES scheme = new SCHEMES();
                                        scheme.SCHEMECD = item.Code;
                                        scheme.SCHEMEDESC = item.Product_Description;
                                        schemes.Add(scheme);

                                    }
                                r.SCHEMES = schemes;
                                break;

                            case "1":
                                acctypes = accounttype_service.ReadMultiple(new AccountTypes.AccountTypes_Filter[] { }, null, 0);
                                schemes = new List<SCHEMES>();
                                if (acctypes.Count() > 0)
                                    foreach (var item in acctypes)
                                    {
                                        SCHEMES scheme = new SCHEMES();
                                        scheme.SCHEMECD = item.Code;
                                        scheme.SCHEMEDESC = item.Description;
                                        schemes.Add(scheme);
                                    }
                                r.SCHEMES = schemes;
                                break;
                            case "2":
                                producttypes = productservice.ReadMultiple(new LoanProducts.LoanProducts_Filter[] { }, null, 0);
                                schemes = new List<SCHEMES>();
                                if (producttypes.Count() > 0)
                                    foreach (var item in producttypes)
                                    {
                                        SCHEMES scheme = new SCHEMES();
                                        scheme.SCHEMECD = item.Code;
                                        scheme.SCHEMEDESC = item.Product_Description;
                                        schemes.Add(scheme);

                                    }
                                r.SCHEMES = schemes;
                                break;
                        }
                        break;
                    #endregion
                    #region Reversal
                    case "022":

                        if (t.TRANID == null) throw new response(999, "Missing parameter value: TRANID", t);
                        if (t.RFUNCTIONCD == null) throw new response(999, "Missing parameter value: RFUNCTIONCD", t);
                        if (t.AGNMEMBERID == null) throw new response(999, "Missing parameter value: AGNMEMBERID", t);
                        if (t.DEVICEID == null) throw new response(999, "Missing parameter value: DEVICEID", t);
                        var trans = transervice.Read(t.TRANID, t.RFUNCTIONCD);
                        if (trans == null) throw new response(999, "Original transaction not found", t);
                        t.AMOUNT = (trans.Amount * -1).ToString();
                        t.ACCOUNTNO = trans.Account_No;
                        t.MEMBERID = trans.Account_No;

                        createtrans(t);

                        break;
                    #endregion
                    #region Getaccount bal
                    case "023":
                        if (t.MOBNO == null) throw new response(999, "Missing parameter value: MOBNO");
                        if (t.ACCOUNTNO == null) throw new response(999, "Missing parameter value: ACCOUNTNO");
                        c = customerService.Read(t.ACCOUNTNO);
                        if (c==null) throw new response(999, "Account Not found", t);
                        if (!c.Account_Type.Equals("0101") && !c.Account_Type.Equals("0109")) throw new response(999, "Transaction not allowed for this account", t);
                        if (c.Blocked != Blocked._blank_) throw new response(999, "Transaction not allowed for blocked account", t);
                        if (c.Status != Customer.Status.Active) throw new response(999, "Transaction not allowed for Non active account", t);
                        createtrans(t);
                        if (c != null)
                        {
                            //sms = new Sms();
                            //sms.Sendsms(DateTime.Now.Ticks.ToString(), t.MOBNO, string.Format("Your balance for acc: {0} is {1}", t.ACCOUNTNO, functions.AccountBalance(t.ACCOUNTNO)), s.smsclient);

                          //  functions.Sendsms("Agency", t.MOBNO, string.Format("Your balance for acc: {0} is {1}", t.ACCOUNTNO, functions.AccountBalance(t.ACCOUNTNO)), "Agency");
                           
                          s = new sms_tangazo.sms(Logging.Logging.logpath);
                            s.User_ID = "1359";
                            s.service = "1";
                            s.passkey = "391ELT5DWW";
                            s.Sender = "IMARIKA";
                            s.Phone = t.MOBNO;// "+254724367745";
                            s.Message = string.Format("Your balance for acc: {0} is {1}", t.ACCOUNTNO, functions.AccountBalance(t.ACCOUNTNO));// "Agency sms test";
                            s.Type = "Notification";
                            s = s.send(s);

                            Logging.Logging.LogEntryOnFile(s.Code.ToString());
                            Logging.Logging.LogEntryOnFile(s.Desc);

                            if (s.Code == -1) throw new response(999, s.Desc);
                        }
                        break;
                    #endregion
                    #region transfer
                    case "021":
                        if (t.TRANID == null) throw new response(999, "Missing parameter value: TRANID");
                        if (t.BNFMEMBERID == null) throw new response(999, "Missing parameter value: BNFMEMBERID");
                        if (t.REMMEMBERID == null) throw new response(999, "Missing parameter value: REMMEMBERID");
                        if (t.BNFACCOUNTNO == null) throw new response(999, "Missing parameter value: BNFACCOUNTNO");
                        if (t.REMACCOUNTNO == null) throw new response(999, "Missing parameter value: REMACCOUNTNO");
                        t.ACCOUNTNO = t.REMACCOUNTNO;
                        createtrans(t);
                        if (t.AMOUNT == null) throw new response(999, "Missing parameter value: AMOUNT", t);
                        if (Convert.ToDouble(t.AMOUNT) == 0) throw new response(999, "Invalid Amount value", t);
                        amount = Convert.ToDouble(t.AMOUNT);
                        c = customerService.Read(t.ACCOUNTNO);
                        if (c == null) throw new response(4, "Invalid Account", t);

                        if (amount > (double)functions.DailyLimit(t.ACCOUNTNO, (int)ttypes.Transfer, t.AGNMEMBERID)) throw new response(999, "Maximun Daily Limit exceeded", t);
                        if (amount > (double)functions.TLimit(t.ACCOUNTNO, (int)ttypes.Transfer, t.AGNMEMBERID)) throw new response(999, "Transaction Limit exceeded", t);
                        if (functions.Dailytransactions(t.ACCOUNTNO, (int)ttypes.Transfer, t.AGNMEMBERID) == 0) throw new response(999, "Maximum Transaction Limit exceeded", t);


                        c = customerService.Read(t.BNFACCOUNTNO);
                        if (c == null) throw new response(4, "Invalid To Account", t);

                        //double accb = (double)functions.AccountBalance(t.ACCOUNTNO);
                        if (amount > ((double)functions.AccountBalance(t.ACCOUNTNO) + (double)functions.Tcharges((decimal)amount, (int)ttypes.Transfer, t.AGNMEMBERID)))
                            throw new response(999, "Insufficient funds", t);
                        break;
                    #endregion
                    #region Agent balance
                    case "024":
                        if (t.AGNMEMBERID == null) throw new response(999, "Missing parameter value: AGNMEMBERID");
                        r.FLOATAMOUNT = functions.AgentBalance(t.AGNMEMBERID).ToString();
                        break;
                    #endregion
                    #region Registration
                    case "014":
                        if (t.MOBNO == null) throw new response(999, "Missing parameter value: MOBNO");
                        if (t.NATIONALID == null) throw new response(999, "Missing parameter value: NATIONALID");
                        if (t.FIRSTNAME == null) throw new response(999, "Missing parameter value: FIRSTNAME");
                        if (t.LASTNAME == null) throw new response(999, "Missing parameter value: LASTNAME");
                        if (t.MIDDLENAME == null) throw new response(999, "Missing parameter value: MIDDLENAME");
                        if (t.MOBNO.Length <9) throw new response(999, "Mobile No is invalid");

                        var reg = Member_Application_Service.ReadMultiple(new Registration.Member_Application_Filter[] { new Registration.Member_Application_Filter { Criteria = t.NATIONALID, Field = Registration.Member_Application_Fields.ID_No } }, null, 0).FirstOrDefault();

                        if (reg!=null)
                            throw new response(999, "Application exists");

                        Registration.Member_Application member_Application = new Registration.Member_Application();
                        member_Application.Name = String.Format("{0} {1} {2}", t.FIRSTNAME, t.MIDDLENAME, t.LASTNAME);
                        member_Application.ID_No = t.NATIONALID;
                        member_Application.Phone_No = t.MOBNO;
                        member_Application.Salesperson_Code = t.AGENTCODE;
                        member_Application.Pin = t.KRAPIN;
                        member_Application.Address = t.ADDRESS;
                        Member_Application_Service.Create(ref member_Application);

                        //functions.Saveimage(t.NATIONALID, t.PHOTO,0);
                        //functions.Saveimage(t.NATIONALID, t.SIGNATURE,1);


                        break;
                    #endregion
                    #region Images
                    case "025":
                      
                        if (t.NATIONALID == null) throw new response(999, "Missing parameter value: NATIONALID");
                        switch (t.IMGCODE)
                        {
                            case "01":

                                functions.Saveimage(t.NATIONALID, t.IMAGESTR, 0);
                                break;
                            case "07":
                                functions.Saveimage(t.NATIONALID, t.IMAGESTR, 1);
                                break;
                        }                 
                    


                        break;
                        #endregion


                }
            }
            catch (response res)
            {
                r.RESPCODE = res.code.ToString();
                r.RESPDESC = res.desc;
                Logging.Logging.ReportError(res);
            }
            catch (Exception ex)
            {
                r.RESPCODE = "999";
                r.RESPDESC = "Unspecified Error";
                Logging.Logging.ReportError(ex);
            }
            finally
            {
                //response = new JavaScriptSerializer().Serialize(r);
                response = JsonConvert.SerializeObject(r, Formatting.Indented, new JsonSerializerSettings { NullValueHandling = NullValueHandling.Ignore });
                Logging.Logging.LogEntryOnFile(string.Format("{0}:{1}\n", DateTime.Now, response));

                Task.Run(() =>
                {
                    try
                    {
                        Logging.Logging.LogEntryOnFile("Posting");
                        functions.Post();
                    }
                    catch (Exception e)
                    {
                        Logging.Logging.ReportError(e);


                    }
                });

            }
          

            Context.Response.Output.Write(response);
        }

        private void checkagentcode(TRANSACTION t)
        {
            switch (t.FUNCTIONCD) {
                case "005":
                case "006":
                case "007":
                case "022":
                case "021":
                    if (string.IsNullOrEmpty( t.AGNMEMBERID)) throw new response(999, "Missing Parameter value: AGNMEMBERID");
                    var dd = agentservice.ReadMultiple(new Agents.AgentApplications_Filter[] { }, null, 0);
                    var a = dd.FirstOrDefault (i => i.Agent_Code == t.AGNMEMBERID);
                    if (a == null) throw new response(999, "Agent Account not found.");
                    if (string.IsNullOrEmpty(t.DEVICEID )) throw new response(999, "Missing Parameter value: DEVICEID");
                    if (string.IsNullOrEmpty( t.TRANID)) throw new response(999, "Missing parameter value: TRANID");
                    if (!t.DEVICEID.Equals(a.Device_ID)) throw new response(999, "Device Id, Agent Mismatch");
                    break;
                         }
        }

        public enum ttypes
        {
            Registration =1,
            Withdrawal=2,
            Deposit=3,
            LoanRepayment = 4,
            Transfer = 5,
            Sharedeposit = 6,
            Schoolfeespayment = 7,
            Balance = 8,
            Ministatment = 9,
            Paybill = 10,
            Memberactivation = 11,
            MemberRegistration = 12,
            Share_Variation = 13,
            Loan_Applications = 14,
        }
       
        private double charges(string code, double amount) {
            double c = 0;
            var ch = charges_Service.Read(code);
            if (ch !=null)
            {
                var ct = ch.Agent_charge_details.FirstOrDefault(o => o.Lower_Limit <= (decimal)amount && o.Upper_Limit >= (decimal)amount);
                if (ct != null)
                    c =(double) ct.Charge_Amount;

            }

            return c;
        }
        private bool  createtrans(TRANSACTION t)
            {
            bool success = true;
            if (string.IsNullOrEmpty(t.TRANID))
                t.TRANID = DateTime.Now.Ticks.ToString();
            var tt = transervice.Read(t.TRANID,t.FUNCTIONCD);
            if (tt != null) throw new response(999, "Transaction exists");
            var nt = new AgentTransactions();
            nt.Member_No = t.MEMBERID;
            nt.Account_No = t.ACCOUNTNO;
            nt.Account_No_2 = t.BNFACCOUNTNO;
            nt.Amount = Convert.ToDecimal(t.AMOUNT);
            nt.AmountSpecified = true;
            nt.Agent_Code = t.AGNMEMBERID;
            nt.Document_No = t.TRANID;
            nt.Description = t.NARRATION;
            nt.Device_Id = t.DEVICEID;
            nt.Function_Code = t.FUNCTIONCD;
            nt.Transaction_Date = DateTime.Now.Date;
            nt.Transaction_DateSpecified = true;
            nt.Transaction_Time = DateTime.Now;
            nt.Transaction_TimeSpecified = true;
            
            transervice.Create(ref nt);
            
            return success ;
        }
        private bool updatetran(TRANSACTION t)
        {
            bool success = true;
            var nt = Agency.transervice.Read(t.TRANID, t.FUNCTIONCD);
            if (nt != null)
            {
                nt.Member_No = t.MEMBERID;
                nt.Account_No = t.ACCOUNTNO;
                nt.Amount = Convert.ToDecimal(t.AMOUNT);
                nt.AmountSpecified = true;
                nt.Agent_Code = t.AGNMEMBERID;
                nt.Document_No = t.TRANID;
                nt.Device_Id = t.DEVICEID;
                nt.Function_Code = t.FUNCTIONCD;
                nt.Transaction_Date = DateTime.Now.Date;
                nt.Transaction_DateSpecified = true;
                nt.Transaction_Time = DateTime.Now;
                nt.Transaction_TimeSpecified = true;
                Agency.transervice.Update(ref nt);
            }
            return success;
        }

       
    }
    public class BRANCHES{
        public string CODE;
        public string NAME;
 }
    public class SCHEMES{
        public string SCHEMECD;
        public string SCHEMEDESC;
}
public class MEMBERS
    {
        public string ID;
        public string NAME;
        public string DOB;
        public string CITY;
        public string BANKACCNO;
        public string REGMOBNO;
    }
public class TRANSACTION
{
    public string SEARCHBY;
    public string SEARCHSTRING;
    public string FUNCTIONCD;
    public string MEMBERID;
    public string TRANID;
    public string ACCOUNTNO;
    public string AMOUNT;
    public string AGNMEMBERID;
    public string SCHEMECODE;
    public string DEVICEID;
    public string ACCTYPE;
    public string TRANCNT;
    public string MOBNO;
    public string MESSAGE;
    public string RFUNCTIONCD;
    public string BNFMEMBERID;
    public string REMMEMBERID;
    public string BNFACCOUNTNO;
    public string REMACCOUNTNO;
    public string HAND;
    public string FINGERNUMBER;
    public string FINGERIMAGE;
    public string AGNMEMBERI;
    public string NARRATION;

        //Registration

        public string BCCODE;
        public string LEFT3;
        public string LEFT2;
        public string FIRSTNAME;
        public string SIGNATURE;
        public string NATIONALID;
        public string NOOFKINS;
        public string DISTRICT;
  
        public string MIDDLENAME;
        public string LASTNAME;
        public string DOB;
        public string PHOTO;
        public string COUNTY;
        public string ADDPRFIMG;
        public string SACCOSCHEMA;
        public string ADDPRFBKIMG;
        public string IDPRFDOCNO;
        public string ADDPRFDOCNO;
        public string IDPRFEXPRDT;
        public string TEMPCUSTID;
        public string IDPRFBKIMG;
        public string KRAPIN;
        public string ADDPRFEXPRDT;
        public string AGENTCODE;
        public string ADDPRF;
        public string IDPRF;
   
        public string CITY;
        public string ADDRESS;
        public string TITLE;
        public string IDPRFIMG;

        //IMAGES
        public string IMAGESTR;
        public string IMGCODE;



    }
    public class Mini {
        public string TRANDATE;
        public string VALUEDATE;
        public string NARRATION;
        public string AMOUNT;
        public string DRORCR;
        public string BALANCE;
        public string SEQNO;

    }
    public class ACCOUNTS
    {
        public string ACCNO;
        public string ACCTYPE;
        public string CURBAL;
        public string OVERDUEAMT;
        public string INSTLMNTAMT;
        public string REGMOBNO;
        public string ACCDESC;
    }

    public class RESPONSE
    {
        public RESPONSE() { }
        [JsonProperty("RESPCODE")]
        public string RESPCODE;
        [JsonProperty("RESPDESC")]
        public string RESPDESC;
        [JsonProperty("MEMBERS")]
        public List<MEMBERS> MEMBERS;
        [JsonProperty("ACCOUNTS")]
        public List<ACCOUNTS> ACCOUNTS;
        [JsonProperty("INFO")]
        public ACCOUNTS INFO;
        [JsonProperty("BRANCHES")]
        public List<BRANCHES> BRANCHES;
        [JsonProperty("TRANSACTIONS")]
        public List<Mini> TRANSACTIONS;
        [JsonProperty("SCHEMES")]
        public List<SCHEMES> SCHEMES;
        [JsonProperty("FLOATAMOUNT")]
        public String	FLOATAMOUNT ;
    }

    public class response : Exception
    {
        public int code;
        public string desc;
        
        public response(int c, string d,TRANSACTION t =null)
        {
            code = c;
            desc = d;
            if (t != null)
                updatetran(t);
        }
        private bool updatetran(TRANSACTION t)
        {
            bool success = true;
            var nt = Agency .transervice.Read(t.TRANID,t.FUNCTIONCD);
            if (nt != null)
            {
                nt.Messages = desc;
                if (code != 0)
                { nt.Status = Transaction.Status.Failed;
                    nt.StatusSpecified = true;
                }
                Agency . transervice.Update(ref nt);
            }
            return success;
        }

    }

    public class settings
    {
        public string Serverip = string.Empty;
        public string Server = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public string EInstance = string.Empty;
        public int Port = 0;
        public string database = string.Empty;
        public bool IntegratedSecurity = true;
        public string Username = string.Empty;
        public string pass = string.Empty;
        public string EUsername = string.Empty;
        public string Epass = string.Empty;
        public string Companyname = string.Empty;
        public int PostIntervalinsec = 2;
        public int Reconnectintervalinsec = 10;
        public string logpath = string.Empty;
public string smsclient = string.Empty;

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
    }
}
