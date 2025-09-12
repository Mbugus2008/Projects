using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Kps_B2B.Controllers
{

    public class B2bController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        
        Bank_Deposits.Bank_Deposits_Service Bank_Deposits_Service = new Bank_Deposits.Bank_Deposits_Service();
        Members.Member_Service Member_Service = new Members.Member_Service();
        public B2bController() {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
           
            Bank_Deposits_Service    = new Bank_Deposits.Bank_Deposits_Service { Url = geturl(s, Bank_Deposits_Service.Url), Credentials = cd, PreAuthenticate = true };
            Member_Service    = new Members.Member_Service { Url = geturl(s, Member_Service.Url), Credentials = cd, PreAuthenticate = true };



        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings  s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        [HttpPost]
        [Route("api/AccountValidation")]
        public Models.reply AccountValidation([FromBody] Models.Request request)
        {
            Models.header header = new Models.header();
            Models.body response = new Models.body();
            Models.reply r = new Models.reply();
            try
            {
                header.messageID = request.header.messageID;
                response.TransactionReferenceCode = request.request.TransactionReferenceCode;
                response.TransactionDate = request.request.TransactionDate;
                response.TotalAmount = "0";
                response.InstitutionCode = request.request.InstitutionCode;
                response.InstitutionName = "Kenya Police Investment";
                if ((request.header.connectionID != "INVESTMENT") || (request.header.connectionPassword != "Investment02020!"))
                {
                    header.statusCode = "401";
                    header.statusDescription = "Authentication failed";
                    response.Currency = "KES";
                    response.AdditionalInfo = "";
                    response.AccountNumber = request.request.TransactionReferenceCode;
                    response.AccountName = "";
                    r.header = header;
                    r.response = response;
                    return r;
                }

                var m = Member_Service.ReadMultiple(new Members.Member_Filter[] { new Members.Member_Filter { Criteria = request.request.TransactionReferenceCode, Field = Members.Member_Fields.National_ID_No } }, null, 0).FirstOrDefault();
                if (m != null)
                {
                    header.statusCode = "200";
                    header.statusDescription = "Successfully validated account";
                    response.Currency = "KES";
                    response.AdditionalInfo = m.Name;
                    response.AccountNumber = request.request.TransactionReferenceCode;
                    response.AccountName = m.Name;
                }
                else
                {
                    if (request.request.TransactionReferenceCode.Equals("00000"))
                    {
                        header.statusCode = "200";
                        header.statusDescription = "Successfully validated account";
                        response.Currency = "KES";
                        response.AdditionalInfo = "Unknown";
                        response.AccountNumber = request.request.TransactionReferenceCode;
                        response.AccountName = "Unknown";
                    }
                    else
                    {
                        header.statusCode = "401";
                        header.statusDescription = "Member ID does not exist";
                        response.AdditionalInfo = "";
                        response.Currency = "KES";
                        response.AccountNumber = request.request.TransactionReferenceCode;
                        response.AccountName = "";
                    }
                }
            }
            catch (Exception ex)
            { Logging.Logging.ReportError(ex); }
            r.header = header;
            r.response = response;
            return r;
        }
        
        [HttpPost]
        [Route("api/Payment")]
        public Models.reply Payment([FromBody] Models.Request request)
        {  Models.reply r = new Models.reply();
            try
            {           
                Models.header header = request.header;
                Models.body response = request.request;
                header.messageID = request.header.messageID;
               
                Logging.Logging.LogEntryOnFile(request.header.connectionID);
                response.TransactionReferenceCode = request.request.TransactionReferenceCode;
                response.TransactionDate = request.request.TransactionDate;
                response.TransactionAmount = "0";
                response.TotalAmount = null;
                response.InstitutionCode = request.request.InstitutionCode;
                response.InstitutionName = "Kenya Police Investment";
                response.AccountNumber = request.request.AccountNumber;
                response.AccountName = "";
                //var t = from banks in invest.Bank_Deposits  select banks;
                if ((!request.header.connectionID.Equals( "INVESTMENT")) || (!request.header.connectionPassword .Equals("Investment02020!")))
                {
                    header.statusCode = "401";
                    header.statusDescription = "Authentication failed";
                    header.connectionID = null;
                    header.connectionPassword = null;
                    header.serviceName = null;
                    response.DocumentReferenceNumber = null;
                    response.BankCode = null;
                    response.BranchCode = null;
                    response.PaymentDate = null;
                    response.PaymentMode = null;
                    response.PaymentReferenceCode = null;
                    response.PaymentCode = null;
                    response.PaymentAmount = null;
                    response.AdditionalInfo = null;
                    response.Currency = null;
                    r.header = header;
                    r.response = response;
                    return r;
                }
                header.connectionID = null;
                header.connectionPassword = null;
                header.serviceName = null;
                var t = Bank_Deposits_Service.Read(request.request.TransactionReferenceCode);

                if (t==null )
                {
                    header.statusCode = "200";
                    header.statusDescription = "Payment successfully received";
         

                    Bank_Deposits.Bank_Deposits bd = new Bank_Deposits.Bank_Deposits();
                    bd.Reference = request.request.TransactionReferenceCode;
                    bd.Date = request.request.TransactionDate;
                    bd.DateSpecified = true;
                    bd.Amount = Convert.ToDecimal( request.request.TotalAmount);
                    bd.AmountSpecified = true;
                    bd.Currency = request.request.Currency;
                    bd.Document_reference = request.request.DocumentReferenceNumber;
                    bd.Payment_Reference = request.request.PaymentReferenceCode;
                    bd.BankCode = request.request.BankCode;
                    bd.Branchcode = request.request.BranchCode;
                    bd.Payment_Date =Convert.ToDateTime( request.request.PaymentDate);
                    bd.Payment_DateSpecified = true;
                    bd.Payment_Code = request.request.PaymentCode;
                    bd.Payment_Mode = request.request.PaymentMode;
                    bd.Payment_Amount = Convert.ToDecimal( request.request.PaymentAmount);
                    bd.Payment_AmountSpecified = true;
                    bd.Account_No = request.request.AccountNumber;
                    bd.Account_Name = request.request.AccountName;
                    Bank_Deposits_Service.Create(ref bd);
                    var m = Member_Service.ReadMultiple(new Members.Member_Filter[] { new Members.Member_Filter { Criteria = request.request.TransactionReferenceCode, Field = Members.Member_Fields.National_ID_No } }, null, 0).FirstOrDefault();
                    if (m != null)
                    {
                        //response.AccountNumber = request.request.TransactionReferenceCode;
                        response.AccountName = m.Name;
                    }
                        response.TransactionAmount =bd.Amount.ToString();
                    response.DocumentReferenceNumber = null;
                    response.BankCode = null;
                    response.TotalAmount = null;
                    response.BranchCode = null;
                    response.PaymentDate = null;
                    response.PaymentMode = null;
                    response.PaymentReferenceCode = null;
                    response.PaymentCode = null;
                    response.PaymentAmount = null;
                    response.AdditionalInfo = null;
                    response.Currency = null;
                   
                }
                else
                {
                    header.statusCode = "402";
                    header.statusDescription = "Duplicate transaction";
                   
                    response.DocumentReferenceNumber = null;
                    response.BankCode = null;
                    response.BranchCode = null;
                    response.PaymentDate = null;
                    response.PaymentMode = null;
                    response.PaymentReferenceCode = null;
                    response.PaymentCode = null;
                    response.PaymentAmount = null;
                    response.AdditionalInfo = null;
                    response.Currency = null;
                }
                r.header = header;
                r.response = request.request;


            }catch(Exception ex)
            {
                Logging.Logging.ReportError(ex);

            }
            return r;
        }
    }
}
