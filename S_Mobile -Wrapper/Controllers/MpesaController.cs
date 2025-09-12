using S_Mobile.Controllers.Clients;
using S_Mobile.Models;
using S_Mobile.Models.Paybill;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Web.Http;

namespace S_Mobile.Controllers
{
    /// <summary>
    /// Mpesa End Points
    /// </summary>

    public class MpesaController : ApiController
    {
        private IRepository _repository;
        private MobileEntities context;

        //public MpesaController(IRepository repository)
        //{
        //    _repository = repository;
        //}

        [HttpPost]
        [Route("api/validate")]
        public MpesaResponse ValidateC2BPayment(Customer2Business request)
        {
            return new MpesaResponse() { ResultCode = 0, ResultDesc = "Accepted" };
        }

        [HttpPost]
        [Route("api/confirm")]
        public MpesaResponse ConfirmC2BPayment(Customer2Business r)
        {
            try
            {
                context = new MobileEntities();
                _repository = new Localdb(context);

                DateTime d = new DateTime(Convert.ToInt32(r.TransTime.Substring(0, 4)), Convert.ToInt32(r.TransTime.Substring(4, 2)), Convert.ToInt32(r.TransTime.Substring(6, 2)), Convert.ToInt32(r.TransTime.Substring(8, 2)), Convert.ToInt32(r.TransTime.Substring(10, 2)), Convert.ToInt32(r.TransTime.Substring(12, 2)));
 MPESA_Transaction mPESA = new MPESA_Transaction();
                MPESA_Transaction rec = _repository.where<MPESA_Transaction>(m => m.Receipt_No_ == r.TransID).FirstOrDefault();
                if (rec == null)
                {                   
                    mPESA.Receipt_No_ = r.TransID;
                    mPESA.Transaction_Type = r.TransactionType;
                    mPESA.Completion_Time = d;
                    mPESA.Paid_In = (decimal)r.TransAmount;
                    mPESA.Paybil_Number = r.BusinessShortCode;
                    mPESA.A_C_No_ = r.BillRefNumber;
                    mPESA.Balance = (decimal)r.OrgAccountBalance;
                    mPESA.Phone = r.MSISDN;
                    mPESA.Name = r.FirstName;
                    mPESA.Transaction_Date = d;
                    mPESA.Sent = false;
                    _repository.Add(mPESA);
                    _repository.SaveChanges();
                }
                else
                {
                    mPESA = rec;
                }
                Client_Paybill client_Paybill = _repository.where<Client_Paybill>(c => c.PayBill == mPESA.Paybil_Number).FirstOrDefault();

                    Ipaybill paybill = new paybill().GetClientInstance(client_Paybill);
                    //switch (mPESA.Paybil_Number)
                    //{
                    //    case "4113871":
                    //        paybill = new Trimline(mPESA.Paybil_Number);
                    //        break;

                    //    case "4044387":
                    //        paybill = new Cityhoppa(mPESA.Paybil_Number);
                    //        break;

                    //    case "5177624":

                    //        paybill = new Embassava(mPESA.Paybil_Number);
                    //        break;
                    //}

                    Task.Run(() => paybill.ConfirmC2BPayment(mPESA));

                    //int items = 0;
                    //if (mPESA.Paid_In < 500000)
                    //    items = (int)((double)mPESA.Paid_In / 0.7);
                    //if (mPESA.Paid_In < 200000)
                    //    items = (int)((double)mPESA.Paid_In / 0.8);
                    //if (mPESA.Paid_In < 100000)
                    //    items = (int)mPESA.Paid_In;
                    //var smskeys = _repository.GetAll<Sms_keyword>().Where(o => o.Code.ToLower() == mPESA.A_C_No_.ToLower()).FirstOrDefault();
                    //if (smskeys != null)
                    //{
                    //    Client client = _repository.getclient(smskeys.Client);
                    //    BulkSm blk = new BulkSm();
                    //    blk.Source_Id = DateTime.Now.Ticks.ToString();
                    //    blk.Client = smskeys.Client;
                    //    blk.Value = items;
                    //    blk.Datetime = DateTime.Now;

                    //    _repository.Add(blk);
                    //    _repository.SaveChanges();

                    //    int bal = _repository.Getsmsbalance(smskeys.Client);
                    //    blk = new BulkSm();
                    //    blk.Source_Id = DateTime.Now.Ticks.ToString();
                    //    blk.Client = "TRIMLINE";
                    //    blk.Phone = client.Contact;
                    //    blk.Message = string.Format("Dear {0}, we have received your payments of KSh {1}. Current balance is now {2}", smskeys.Client, mPESA.Paid_In, bal);
                    //    blk.Datetime = DateTime.Now;
                    //    blk.Balance = bal;
                    //    blk.Scheduled = false;
                    //    new SmsController().sendsms(blk);
                    //    mPESA.Processed = true;
                    //    client.Last_Notification = DateTime.Today.AddDays(-1);
                    //    _repository.SaveChanges();
                    //}
               
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return new MpesaResponse() { ResultCode = 0, ResultDesc = "Accepted" };
        }

        [HttpPost]
        [Route("api/results")]
        public MpesaResponse Results(Results request)
        {
            try
            {
                Mpesa_Result r = _repository.where<Mpesa_Result>(d => d.OriginatorConversationID == request.Result.OriginatorConversationID).FirstOrDefault();
                if (r == null)
                {
                    r = new Mpesa_Result();
                    r.ResultCode = request.Result.ResultCode;
                    r.ResultDesc = request.Result.ResultDesc;
                    r.ResultType = request.Result.ResultType;
                    r.TransactionID = request.Result.TransactionID;
                    r.OriginatorConversationID = request.Result.OriginatorConversationID;
                    r.ConversationID = request.Result.ConversationID;
                    _repository.Add(r);
                    _repository.SaveChanges();
                }
                Result_Parameter refitem = _repository.where<Result_Parameter>(d => d.OriginatorConversationID == request.Result.OriginatorConversationID && d.Key == request.Result.ReferenceData.ReferenceItem.Key).FirstOrDefault();
                if (refitem == null)
                {
                    refitem = new Result_Parameter();
                    refitem.OriginatorConversationID = request.Result.OriginatorConversationID;
                    refitem.Key = request.Result.ReferenceData.ReferenceItem.Key;
                    refitem.Value = request.Result.ReferenceData.ReferenceItem.Value.ToString();
                    refitem.Parameter_type = 1;
                    _repository.Add(refitem);
                    _repository.SaveChanges();
                }
                if (request.Result.ResultParameters != null)
                    foreach (var rp in request.Result.ResultParameters.ResultParameter)
                    {
                        Result_Parameter resultParameter = _repository.where<Result_Parameter>(d => d.OriginatorConversationID == request.Result.OriginatorConversationID && d.Key == rp.Key).FirstOrDefault();
                        if (resultParameter == null)
                        {
                            resultParameter = new Result_Parameter();
                            resultParameter.OriginatorConversationID = request.Result.OriginatorConversationID;
                            resultParameter.Key = rp.Key;
                            resultParameter.Value = rp.Value.ToString();
                            resultParameter.Parameter_type = 0;
                            _repository.Add(resultParameter);
                            _repository.SaveChanges();
                        }
                    }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

            return new MpesaResponse() { ResultCode = 0, ResultDesc = "Accepted" };
        }
    }
}