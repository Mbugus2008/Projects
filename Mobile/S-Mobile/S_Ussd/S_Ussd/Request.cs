using S_Ussd.ClientData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using static S_Ussd.enums;

namespace S_Ussd
{
    public class ussderror : Exception
    {
        public int code;
        public string desc;

        public ussderror(int c, string d)
        {
            code = c;
            desc = d;

        }


    }
    public class depositoptions
    {
        public string no;
        public string name;
        public string type;

    }
    public class useroptions
    {
        public static string Menu(ref Request r, List<Client_Menu> m)
        {
            string menu = string.Empty;
            try
            {
                int i = 1;
                foreach (Client_Menu mm in m)
                {
                    User_Option nm = new User_Option();
                    nm.Acc = mm.Menu_Id.ToString();
                    nm.Name = mm.Description;
                    nm.Session = r.SESSIONID;
                    nm.Selection = i;
                    nm.Option = (int)enums.options.Menu;
                    Request.db.User_Options.Add(nm);
                    menu = string.Format("{0}{1}. {2}{3}", menu, i, nm.Name, Request.newline);
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return menu;
        }
        public static string list(ref Request r, List<Vehicles.Vehicles> m, enums.options option = enums.options.Withacc, bool showbal = false)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (Vehicles.Vehicles mm in m)
                {
                    User_Option nm = new User_Option();
                    nm.Acc = mm.Vehicle_Number.ToString();
                    nm.Name = mm.Vehicle_Type.ToString();
                    nm.Session = r.SESSIONID;
                    //nm.Value = mm.Balance;
                    nm.Selection = i;
                    //nm.Type = mm.memberno;
                    nm.Option = (int)option;
                    Request.db.User_Options.Add(nm);
                    string s = string.Empty;
             
                        s = string.Format("{0}{1}. {2}{3}", str1, i, nm.Acc, Request.newline);
                    str1 = s;
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }
        public static string accounts(ref Request r, List<account> m, enums.options option = enums.options.Withacc, bool showbal = false)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (account mm in m)
                {
                    User_Option nm = new User_Option();
                    nm.Acc = mm.No.ToString();
                    nm.Name = mm.Name;
                    nm.Session = r.SESSIONID;
                    nm.Value = mm.Balance;
                    nm.Selection = i;
                    nm.Type = mm.memberno;
                    nm.Option = (int)option;
                    nm.Custom = mm.Type.ToString();
                    Request.db.User_Options.Add(nm);
                    string s = string.Empty;
                    if (showbal)
                        s = string.Format("{0}{1}. {2} - {3}{4}", str1, i, nm.Name, nm.Value, Request.newline);
                    else
                        s = string.Format("{0}{1}. {2}{3}", str1, i, nm.Name, Request.newline);


                    str1 = s;
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }
        public static string utilities(ref Request r, List<Utility> m)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (Utility mm in m)
                {
                    User_Option nm = new User_Option();
                    nm.Acc = mm.Id.ToString();
                    nm.Name = mm.Name;
                    nm.Session = r.SESSIONID;
                    nm.Value = 0;
                    nm.Selection = i;

                    nm.Option = (int)enums.options.Utility;
                    Request.db.User_Options.Add(nm);
                    str1 = string.Format("{0}{1}. {2}{3}", str1, i, nm.Name, Request.newline);
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }
        public static string loans(ref Request r, List<loan> m)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (loan mm in m)
                {
                    User_Option nm = new User_Option();
                    nm.Acc = mm.No.ToString();
                    nm.Name = mm.Name;
                    nm.Session = r.SESSIONID;
                    nm.Value = mm.Balance + mm.Interest;
                    nm.Selection = i;
                    nm.Option = (int)enums.options.Loans;
                    Request.db.User_Options.Add(nm);
                    str1 = string.Format("{0}{1}. {2}({3}){4}", str1, i, nm.Acc, nm.Value, Request.newline);
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }

        public static string Deposits(ref Request r, List<Members.Depositaccounts> m)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (Members.Depositaccounts mm in m)
                {
                    r.transaction.Account_2 = mm.keyword;

                    User_Option nm = new User_Option();
                    nm.Acc = mm.Account.ToString();
                    nm.Name = mm.Name;
                    nm.Session = r.SESSIONID;
                    nm.Value = 0;
                    nm.Selection = i;
                    nm.Type = mm.keyword;
                    nm.Option = (int)enums.options.deposit;
                    
                    //if (mm.Type == Client_Service.Members.Depositaccounts.status.loans)
                      //  nm.Option = (int)enums.options.Depositloans;
                    Request.db.User_Options.Add(nm);
                    str1 = string.Format("{0}{1}. {2}{4}{3}", str1, i, nm.Name, Request.newline,(mm.Balance > 0?string.Format(" ({0:0.00})",mm.Balance):""));
                   
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }
        public static string loanproducts(ref Request r, List<LoanProducts> m)
        {
            string str1 = string.Empty;
            try
            {
                int i = 1;
                foreach (LoanProducts mm in m)
                {
                    LoanProducts loanProducts = mm;

                    User_Option nm = new User_Option();
                    nm.Acc = loanProducts.Code;
                    nm.Name = mm.Product_Description;
                    nm.Session = r.SESSIONID;
                    nm.Value = (double) mm.Max_Loan_Amount;
                    nm.Max_Loan_Amount = (double) mm.Max_Loan_Amount;
                    nm.Selection = i;
                    nm.Type =mm.Auto_Appraise.ToString();
                    nm.Auto_appraise =mm.Auto_Appraise;
                    nm.Option = (int)enums.options.loanproduct;
                    nm.Custom = mm.Allow_Topup.ToString();
                    nm.Allow_Topup = mm.Allow_Topup;
                    
                   
                    Request.db.User_Options.Add(nm);
                    str1 = string.Format("{0}{1}. {2}{3}", str1, i, nm.Name, Request.newline);
                   
                    i += 1;
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return str1;
        }
        public static void selectedmenu(ref Request r)
        {
            if (String.IsNullOrEmpty(r.session.Menu.ToString()))
            {
                Request rr = r;
                User_Option u = userselection(rr, enums.options.Menu);
                var usersel =Convert.ToInt32 (u.Acc);
                var d = Request.db.Menus.FirstOrDefault(o => o.ID == usersel);
                r.session.Menu = d.ID;
            }

        }
        public static User_Option userselection(Request r, enums.options e)
        {
            var usersel = int.Parse(r.Currentoption);
            int ee = (int)e;

            var d = Request.db.User_Options.FirstOrDefault(o => o.Selection == usersel && o.Session == r.SESSIONID && o.Option == ee);
            return d;
        }
    }
    public class Request
    {
        public static ussdEntities db;
        public static string newline = "&#x000a;";
        public string MSISDN;
        public string SESSIONID;
        public string SERVICECODE;
        public string USSDSTRING;
        public string clientCode;
        public string Currentoption;
        public Customer customer;
        public Ussd session;
        public string Ussd_Code { get; set; }
        public string Channel { get; set; }

        public Client client;
        public List<Session> sessiondetails;
        public Transaction transaction;
        public Session lastsession;
        public String[] coption;
        public static string common = string.Format("{0}0. Back{0}00. Menu{0}000. Logout", newline);
    }
    public class lang
    {
        public Request request;
        public enums.response message;
        public static string getlang(enums.sessionstatus s, ref Request l, enums.response message, params object[] args)
        {
            string mes = message.ToString();
            string lan = "EN";

            if (l.customer == null)
                lan = "EN";
            else
                lan = l.customer.Language;

            if (lan ==null)
            lan = "EN";
            Session ss = new Session();
            ss.SESSION_ID = l.SESSIONID;
            ss.Value = l.Currentoption;
            ss.Transaction_Time = DateTime.Now;
            ss.Phone = l.MSISDN;
            ss.Active = true;
            ss.Option = (int)message;
            Request.db.Sessions.Add(ss);
            var ll = Request.db.Ussd_Languages.FirstOrDefault(o => o.Languagecode == lan && o.Messagecode == mes);
            return string.Format("{0} {1}", s.ToString(), string.Format(ll.Message, args));
            //  return string.Concat( string.Format("{0} {1}", s.ToString(), string.Format(Request.db.Languages.FirstOrDefault(o => o.Languagecode == lan && o.Messagecode == mes).Message, args)),Request.common);
        }
    }
    public class enums
    {
        public enum options
        {
            Menu = 0,
            Withacc = 1,
            Loans,
            deposit,
            ToAccount,
            Utility,
            investment,
            properties,
            propertylines,
            investmentPaymenttype,
            investmentPaymentmethod,
            investmentterms,
            investmentselectaccount,
            shares_buy,
            Sharesetup,
            sharefloattype,
            shares_myshares,
            projects,
            investmentdeposits,
            Depositloans,
            loanproduct,
            investmentsourcedeposits
        }
        public enum sessionstatus
        {
            CON,
            END
        }
        public enum Transtype
        {
            _blank_ = 0,
            Withdrawal = 1,
            Deposit = 2,
            Balance = 3,
            Ministatement = 4,
            Airtime = 5,
            Loan_balance = 6,
            Loan_Status = 7,
            Share_Deposit_Balance = 8,
            Transfer_to_Fosa = 9,
            Transfer_to_Bosa = 10,
            Utility_Payment = 11,
            Loan_Application = 12,
            Standing_orders = 13,
            Cash_Deposit = 14,
            Cash_Withdrawal = 15,
            Cash_Withdrawal_Agency = 16,
            bills_agency = 17,
            account_to = 18,
            Transfer_agency = 19,
            Properties = 20,
            Bond = 21,
            Investmentaccount = 22,
            Share_Trading = 23,
            MyProperties = 24
        }
        public enum response
        {
            NotRegistered = 0,
            NotActive = 1,
            pin = 2,
            selectclient = 3,
            Menu = 4,
            Repin = 5,
            Blocked = 6,
            balance = 7,
            insufficientfunds = 8,
            Ministatement = 9,
            selectacc = 10,
            Noaccount = 11,
            sendto = 12,
            amount = 13,
            otheraccount = 14,
            Invalidentry = 15,
            withdrawalconfirm = 16,
            withdrawal = 17,
            Cancel_cash_Deposit = 18,
            selectdeposit = 19,
            SelectLoans = 20,
            Depositconfirm = 21,
            Deposit = 22,
            canceldeposit = 23,
            Transferto = 24,
            selectToacc = 25,
            Tconfirm = 26,
            Transfer = 27,
            otherTelephone = 28,
            Topupconfirm = 29,
            Topup = 30,
            canceltopup = 31,
            selectutility = 32,
            utilityaccount = 33,
            Utilityconfirm = 34,
            Utility = 35,
            cancelUtility = 36,
            Newpin = 37,
            Confirmpin = 38,
            PinChanged = 39,
            loanamount = 40,
            invalidloanamount = 41,
            loanconfirm = 42,
            Loan = 43,
            cancelloan = 44,
            Failed = 45,
            Wrongpinconfirmation = 46,

            //agency
            enter_account = 101,
            enter_amount = 102,
            agency_confirm = 103,
            cash_Deposit = 104,
            enter_id = 105,
            enter_amount_withdrawal = 106,
            customerpin = 107,
            customerotp = 108,
            wrongotp = 109,
            agency_withdrawal_confirm = 110,
            cash_withdrawal = 111,
            Cancel_trans = 112,
            BankCode = 113,
            enter_amount_bill = 114,
            agency_bills_confirm = 115,
            bill_type = 116,
            enter_account_to = 117,
            enter_amount_transfer = 118,
            agency_transfer_confirm = 119,
            bill_account = 120,


            //Properties
            selectprop = 201,
            selectinv = 202,
            Noprop = 11,
            selectproplines = 203,
            book = 204,
            booked = 205,
            Cancel_book = 206,
            Investment = 207,
            Investmentid = 208,
            InvestmentNoaccount = 209,
            InvestmentPassword = 210,
            InvestmentOtpInvalid = 211,
            InvestmentConfirm = 212,
            InvestmentConfirmed = 213,
            InvestmentConfirmationfailed = 214,
            Investmentaccount = 215,
            InvestmentBalance = 216,
            InvestmentMini = 217,
            Investmentnoaccount = 218,
            Investmentpaymenttype = 219,
            Investmentpaymentmethod = 220,
            Investmentbookconfirmation = 221,
            Investmentrepaymentreference = 222,
            Investmentnotagreed = 223,
            Investmentconfirmed = 224,
            InvestmentNotconfirmed = 225,
            Investmentconfirmedbooking = 226,
            Investmentrepaymentmpesa = 227,
            Investmentrepaymenttransfer = 228,
            investmentselectaccount = 229,
            shares_buy_sell = 230,
            shares_buy = 231,
            shares_amount = 232,
            share_error = 233,
            shares_buy_confirmation = 234,
            shares_buy_confirmed = 235,
            shares_buy_invalid_selection = 236,
            shares_sell = 237,
            shares_setup = 238,
            shares_floattype = 239,
            shares_Sharetofloat = 240,
            shares_askingamount = 241,
            shares_confirm = 242,
            shares_success = 243,
            shares_cancelled = 244,
            shares_myshares = 245,
            shares_view = 246,
            shares_reversed = 247,
            InvestmentMinistatement = 248,
            shares_buy_Failed = 249,
            NewCustomer = 250,
            NewCustomer_id = 251,
            NewCustomer_DOB = 252,
            Firstpin = 253,
            Pinreset = 254,
            selectproject = 255,
            MyProperties = 256,
            NoProperties = 257,
            InvestmentDeposit = 258,
            inv_depoconfirm = 259,
            Depositerror = 260,
            OtherBalances = 261,
            accountbalances = 262,
            loanbalances = 263,
            newregistration = 264,
            loanproducts = 265,
            loanamountnormal = 266,
            loanerror = 267,
            Selectsavings = 268,
            InvestmenttoDeposit = 269,
            InvestmentdepositMpesa = 270,
            Investmentdepositcancel = 271,
            InvestmentdepositFailed = 272,
            nosharetradingacc = 273,
            error = 274,
            Openvalley = 275,
            Openvalley_loanamount = 276,
            Openvalley_loanunavailable = 277,
            Openvalley_limitexceeded = 278,
            Openvalley_loanapplied = 279,
            Openvalley_loanConfirmed = 280,
            Openvalley_loanCancelled = 281,
            Openvalley_payloan = 282,
            Openvalley_Repayment = 283,
            Openvalley_NoLoantopay = 284,
            Newcustconfirm = 285,
            NewCustCancel = 286,
            openvalley_name = 287,
            loanamounttopup = 288,
            Loanamountlow = 289,
            EnterID = 290,
            newreg = 291,
            NoLoans = 292,
            NoAccount = 293,
            Commingsoon = 294,
            selectveh = 295,
            Pendingtrans = 296,
            transamount = 297,
            newregistration2 = 298
        }
        public enum Status
        {
            Processing = 0,
            Pending = 1,
            Completed = 2,
            Failed = 3
        }
        public enum Menu
        {
            Balance = 1,
            Ministatement = 2,
            Withdrawal = 3,
            Deposits = 4,
            Transfer = 5,
            Topup = 6,
            utility = 7,
            Pin = 8,
            E_loan = 9,
            Deposit_Bosa = 10,
            My_Vehicles = 11,

            //Agency
            Cash_withdrawal_agency = 1006,
            Cash_Deposit_agency = 1007,
            Fund_Transfer_agency = 1008,
            Bill_Payment_agency = 1009,

            //Investment
            Properties = 1011,
            Shares_Trading = 1012,
            My_Account = 1013,
            Investment_Transfer = 1014,
            My_Properties = 1015,
            Funds_Deposit = 1016,
            Account_Opening = 1017,

            apply = 1018,
            Mini = 1019,
            pay = 1020

        }
    }
    public class Member
    {
        public string No;
        public string Name;
        public List<account> Account;

    }
    public class account
    {
        public string No { set; get; }
        public string Name { set; get; }
        public Stat Status { set; get; }
        public double Balance { set; get; }
        public string memberno { set; get; }
public status Type { set; get; }

        public enum status
        {

            savings,
            loans
        }
        public enum Stat
        {

            /// <remarks/>
            Active,

            /// <remarks/>
            Frozen,

            /// <remarks/>
            Closed,

            /// <remarks/>
            Archived,
            /// <remarks/>
            New,

            /// <remarks/>
            Dormant,

            /// <remarks/>
            Deceased,
        }
        public account() { }
        
        public account(string no, string name, Stat status, double balance, string member)
        {
            No = no;
            Name = name;
            Status = status;
            Balance = balance;
            memberno = member;
        }
    }
    public class loan
    {
        public string No;
        public string Name;
        public Stat Status;
        public double Balance;
        public double Interest;
         public enum Stat
        {
            /// <remarks/>
            New,

            /// <remarks/>
            Appraisal,

            /// <remarks/>
            Posted,
        }
        public loan(string no, string name, Stat status, double balance, double interest)
        {
            No = no;
            Name = name;
            Status = status;
            Balance = balance;
            Interest = interest;
        }
    }



    public partial class Customer
    {

        public Client client_record
        {
            get
            {
                using (var db = new ussdEntities(S_Mobile.ConnectionString()))
                {
                    if (Client != null)
                        return db.Clients.FirstOrDefault(o => o.Client_Code == Client);
                    else
                        return null;
                }
            }
        }public Customer_Loan[] Loans
        {
            get; set;
        }
        public void getloans(string account,string session)
        {
 using (var db = new ussdEntities(S_Mobile.ConnectionString()))
                {
                    Loans =  db.Customer_Loans.Where(o => o.Member_No == account && o.Session_ID == session).ToArray();
                  
                }
        

        }
    }

}
