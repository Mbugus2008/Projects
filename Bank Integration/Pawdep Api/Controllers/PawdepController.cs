using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;

namespace Pawdep_Api.Controllers
{
    public class PawdepController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        Bank_Entries.Bank_Entries_Service Bank_Entries_ = new Bank_Entries.Bank_Entries_Service();
        Mobile.Mobile mobile = new Mobile.Mobile();
        public PawdepController()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
            Bank_Entries_ = new Bank_Entries.Bank_Entries_Service { Url = geturl(s, Bank_Entries_.Url), Credentials = cd, PreAuthenticate = true };
            mobile = new Mobile.Mobile { Url = geturl(s, mobile.Url), Credentials = cd, PreAuthenticate = true };

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
        [Route("api/ins")]
        public Reply trans([FromBody] Trans request)
        {
            Reply r = new Reply();
            r.MessageReference = request.MessageReference;
            r.MessageDateTime = request.MessageDateTime;
            try
            {
                var be = Bank_Entries_.ReadMultiple(new Bank_Entries.Bank_Entries_Filter[] { new Bank_Entries.Bank_Entries_Filter { Criteria = request.TransactionId, Field = Bank_Entries.Bank_Entries_Fields.TransactionId } }, null, 0).FirstOrDefault();
                if (be == null)
                {
                    Bank_Entries.Bank_Entries bes = new Bank_Entries.Bank_Entries();
                    bes.AccountNumber = request.AccountNumber;
                    bes.Amount = Convert.ToDecimal(request.Amount);
                    bes.AmountSpecified = true;
                    bes.Currency = request.Currency;
                    bes.Cust_Memo_Line1 = request.CustMemo.CustMemoLine1;
                    bes.Cust_Memo_Line2 = request.CustMemo.CustMemoLine2;
                    bes.Cust_Memo_Line3 = request.CustMemo.CustMemoLine3;
                    bes.Entry_Date = request.EntryDate;
                    bes.Event_Type = request.EventType;
                    bes.Exchange_Rate = request.ExchangeRate;
                    bes.Message_DateTime = request.MessageDateTime;
                    bes.Message_DateTimeSpecified = true;
                    bes.Message_reference = request.MessageReference;
                    bes.Narration = request.Narration;
                    bes.Notification_Code = request.NotificationCode;
                    bes.Payment_Ref = request.PaymentRef;
                    bes.Service_Name = request.ServiceName;
                    bes.Transaction_Date = request.TransactionDate;
                    bes.TransactionId = request.TransactionId;
                    bes.Value_Date = request.ValueDate;

                    string Ref = string.Format("{0}{1}", bes.Cust_Memo_Line1, bes.Cust_Memo_Line2);
                    Ref = Ref.Replace("  ", " ");
                    Ref = Ref.Replace("-", " ");
                    var refs = Ref.Split(new char[] { ' ' });
                    if (refs.Length >= 1)
                        bes.Reference = refs[0];
                    if (refs.Length >= 2)
                        bes.ID_No = refs[1].Replace(";", "");
                    if (refs.Length >= 3)
                        bes.Phone_No = refs[2];

                    Bank_Entries_.Create(ref bes);
                    
                }
                r.MessageCode = "0";
                r.MessageDescription = "Acknowledged";
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.MessageCode = "default";
                r.MessageDescription = "Unexpected Error";
            }
            try
            {
                Task task = Task.Factory.StartNew(() =>
                {
                    mobile.Post();
                }
                );
            }

            catch (Exception e)
            {

                Logging.Logging.ReportError(e);
            }
            return r;
        }
    }
    public class CustMemo
    {
        public string CustMemoLine1 { get; set; }
        public string CustMemoLine2 { get; set; }
        public string CustMemoLine3 { get; set; }
    }

    public class Trans
    {
        public string MessageReference { get; set; }
        public DateTime MessageDateTime { get; set; }
        public string ServiceName { get; set; }
        public string NotificationCode { get; set; }
        public string PaymentRef { get; set; }
        public string AccountNumber { get; set; }
        public string Amount { get; set; }
        public string TransactionDate { get; set; }
        public string EventType { get; set; }
        public string Currency { get; set; }
        public string ExchangeRate { get; set; }
        public string Narration { get; set; }
        public CustMemo CustMemo { get; set; }
        public string ValueDate { get; set; }
        public string EntryDate { get; set; }
        public string TransactionId { get; set; }
    }
    public class Reply
    {
        public string MessageReference { get; set; }
        public DateTime MessageDateTime { get; set; }
        public string MessageCode { get; set; }
        public string MessageDescription { get; set; }
    }
}
