using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Pawdep_Api.Controllers
{
    public class EquityController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        Bank_Entries.Bank_Entries_Service Bank_Entries_ = new Bank_Entries.Bank_Entries_Service();
        Bank_Entries_Equity.Bank_Entries_Equity_Service Bank_Entries_equity = new Bank_Entries_Equity.Bank_Entries_Equity_Service();
        Members.Members_Service Members_Service = new Members.Members_Service();
        Mobile.Mobile mobile = new Mobile.Mobile();
        public EquityController()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
            Bank_Entries_ = new Bank_Entries.Bank_Entries_Service { Url = geturl(s, Bank_Entries_.Url), Credentials = cd, PreAuthenticate = true };
            Bank_Entries_equity = new Bank_Entries_Equity.Bank_Entries_Equity_Service { Url = geturl(s, Bank_Entries_equity.Url), Credentials = cd, PreAuthenticate = true };
            mobile = new Mobile.Mobile { Url = geturl(s, mobile.Url), Credentials = cd, PreAuthenticate = true };
            Members_Service = new Members.Members_Service { Url = geturl(s, Members_Service.Url), Credentials = cd, PreAuthenticate = true };
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }

        [HttpPost]
        [Route("api/validation")]
        public Validation_Response val([FromBody] Validation request)
        {

            Validation_Response r = new Validation_Response();
            if ((request.username == "Pawdep") && (request.password == "uyhhetnijheyjeh==")) { 


            var m = Members_Service.Read(request.account);
            if (m == null)
                m = Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Field = Members.Members_Fields.ID_No, Criteria = request.account } }, null, 0).FirstOrDefault();
            if (m != null)
            {
                r.amount = 0;
                r.type = 1;
                r.customerRefNumber = "";
                r.currencyCode = "KES";
                r.createdOn = DateTime.Today.ToString();
                r.billNumber = m.No;

                r.billName = m.Name;
                r.amount = 0;
                r.customerName = m.Name;
            }
            else
            {
                r.amount = 0;
                r.type = 1;

                r.billNumber = "";
                r.billName = "";
                r.amount = 0;
                r.description = "bill number not found";

            } }
        else
        {
                r.amount = 0;
                r.type = 1;

                r.billNumber = "";
                r.billName = "";
                r.amount = 0;
                r.description = "Invalid Crudentials";
        }


            return r;
        }
        [HttpPost]
        [Route("api/transaction")]
        public Payment_Response trans([FromBody] Payment request)
        {
            Payment_Response r = new Payment_Response();

            r.responseCode = "OK";
            r.responseMessage = "SUCCESSFUL";
            if ((request.username == "Pawdep") && (request.password == "uyhhetnijheyjeh=="))
            {

                var be = Bank_Entries_equity.ReadMultiple(new Pawdep_Api.Bank_Entries_Equity.Bank_Entries_Equity_Filter[] { new Bank_Entries_Equity.Bank_Entries_Equity_Filter { Criteria = request.bankreference, Field = Pawdep_Api.Bank_Entries_Equity.Bank_Entries_Equity_Fields.bankreference } }, null, 0).FirstOrDefault();

                if (be == null)
                {
                    be = new Bank_Entries_Equity.Bank_Entries_Equity();
                    be.bankreference = request.bankreference;
                    be.billAmount = (decimal)request.billAmount;
                    be.billAmountSpecified = true;
                    be.billNumber = request.billNumber;
                    be.CustomerRefNumber = request.CustomerRefNumber;
                    be.debitaccount = request.debitaccount;
                    be.debitcustname = request.debitcustname;
                    be.paymentMode = request.paymentMode;
                    be.phonenumber = request.phonenumber;
                    be.transactionDate = request.transactionDate;
                    be.tranParticular = request.tranParticular;
                    //try
                    //{
                    Bank_Entries_equity.Create(ref be);
                    //}
                    //catch (Exception ex) { 

                    //}


                }
                else
                    r.responseMessage = "DUPLICATE TRANSACTION";

            }
            else
            {
                r.responseCode = "FAILED";
                r.responseMessage = "Invalid Crudentials";
            }
            return r;
        }
    }
    public class Payment
    {
        public string username { get; set; }
        public string password { get; set; }
        public string billNumber { get; set; }
        public double billAmount { get; set; }
        public string CustomerRefNumber { get; set; }
        public string bankreference { get; set; }
        public string tranParticular { get; set; }
        public string paymentMode { get; set; }
        public string transactionDate { get; set; }
        public string phonenumber { get; set; }
        public string debitaccount { get; set; }
        public string debitcustname { get; set; }
    }
    public class Payment_Response
    {
        public string responseCode { get; set; }
        public string responseMessage { get; set; }
    }
    public class Validation
    {
        public string account { get; set; }
        public string username { get; set; }
        public string password { get; set; }
    }
    public class Validation_Response
    {
        public double amount { get; set; }
        public string billName { get; set; }
        public string billNumber { get; set; }
        public string billerCode { get; set; }
        public string createdOn { get; set; }
        public string currencyCode { get; set; }
        public string customerName { get; set; }
        public string customerRefNumber { get; set; }
        public string description { get; set; }
        public string dueDate { get; set; }
        public string expiryDate { get; set; }
        public string Remarks { get; set; }
        public int type { get; set; }
    }
}
