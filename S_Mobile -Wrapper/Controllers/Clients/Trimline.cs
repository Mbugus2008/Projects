using Logging;
using S_Mobile.Models;
using S_Mobile.Models.Paybill;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace S_Mobile.Controllers.Clients
{
    public class Trimline : Ipaybill
    {
        public Client clnt { get; set; }
        public string paybill => "4113871";
        private IRepository _repository;
        private MobileEntities context;

        public Trimline(string Paybill)
        {


        }

        public async Task<Results<MPESA_Transaction>> ConfirmC2BPayment(MPESA_Transaction r)
        {

            var result = new Results<MPESA_Transaction>();
            try
            {
                Logging.Logging.LogEntryOnFile(r.Receipt_No_);
                context = new MobileEntities();
                _repository = new Localdb(context);

                int items = 0;
                if (r.Paid_In < 500000)
                    items = (int)((double)r.Paid_In / 0.7);
                if (r.Paid_In < 200000)
                    items = (int)((double)r.Paid_In / 0.8);
                if (r.Paid_In < 100000)
                    items = (int)r.Paid_In;

                var smskeys = _repository.GetAll<Sms_keyword>().Where(o => o.Code.ToLower() == r.A_C_No_.ToLower()).FirstOrDefault();
                if (smskeys != null)
                {
                    Client client = _repository.getclient(smskeys.Client);
                    BulkSm blk = new BulkSm();
                    blk.Source_Id = DateTime.Now.Ticks.ToString();
                    blk.Client = smskeys.Client;
                    blk.Value = items;
                    blk.Datetime = DateTime.Now;

                    _repository.Add(blk);
                    _repository.SaveChanges();

                    int bal = _repository.Getsmsbalance(smskeys.Client);
                    blk = new BulkSm();
                    blk.Source_Id = DateTime.Now.Ticks.ToString();
                    blk.Client = "TRIMLINE";
                    blk.Phone = client.Contact;
                    blk.Message = string.Format("Dear {0}, we have received your payments of KSh {1}. Current balance is now {2}", smskeys.Client, r.Paid_In, bal);
                    blk.Datetime = DateTime.Now;
                    blk.Balance = bal;
                    blk.Scheduled = false;
                    new SmsController().sendsms(blk);
                    r.Processed = true;
                    client.Last_Notification = DateTime.Today.AddDays(-1);
                    _repository.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                return new Results<MPESA_Transaction> { Code = -1, Desc = ex.Message };
            }
            return new Results<MPESA_Transaction> { Contents = r };
        }
    }
}