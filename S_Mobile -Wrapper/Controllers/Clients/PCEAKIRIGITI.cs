using Logging;
using S_Mobile.Models;
using S_Mobile.Models.Paybill;
using S_Mobile.Mpesa_Transactions;
using System;
using System.Globalization;
using System.Linq;
using System.Threading.Tasks;

namespace S_Mobile.Controllers.Clients
{
    public class PCEAKIRIGITI : Ipaybill
    {
        private System.Net.NetworkCredential cd;

        private Mpesa_Transactions_Service mpesa = new Mpesa_Transactions_Service();

        public Client clnt { get; set; }

        public PCEAKIRIGITI(String paybill)
        {
            clnt = new MobileEntities().Clients.FirstOrDefault(o => o.Client_Code == paybill);
            if (clnt != null)
            {
                cd = new System.Net.NetworkCredential(clnt.UserName, clnt.Password, clnt.IPAddress);
                mpesa = new Mpesa_Transactions_Service { Url = Logging.misc.geturl(new nav() { Companyname = clnt.Company, Username = clnt.UserName, pass = clnt.Password, Server = clnt.IPAddress, Instance = clnt.Instance, Port = (int)clnt.Port }, mpesa.Url), Credentials = cd, PreAuthenticate = true };
            }
        }

        public async Task<Results<MPESA_Transaction>> ConfirmC2BPayment(MPESA_Transaction r)
        {
            try
            {
                var rec = mpesa.Read(r.Receipt_No_);
                if (rec == null)
                {
                    Mpesa_Transactions.Mpesa_Transactions mPESA = new Mpesa_Transactions.Mpesa_Transactions();
                    mPESA.Receipt_No = r.Receipt_No_;
                    mPESA.Transaction_Type = Transaction_Type.None;
                    mPESA.Completion_Time = (DateTime)r.Completion_Time; mPESA.Completion_TimeSpecified = true;
                    mPESA.Paid_In = (decimal)r.Paid_In; mPESA.Paid_InSpecified = true;
                    mPESA.Paybil_Number = r.Paybil_Number;
                    mPESA.A_C_No = r.A_C_No_.Trim();
                    mPESA.Balance = (decimal)r.Balance; mPESA.BalanceSpecified = true;
                    mPESA.Phone = r.Phone;
                    mPESA.Name = CultureInfo.CurrentCulture.TextInfo.ToTitleCase(r.Name.Trim().ToLower());
                    mPESA.Transaction_Date = (DateTime)r.Transaction_Date; mPESA.Transaction_DateSpecified = true;
                    mPESA.Detaills = r.Detaills;
                    mPESA.Other_Party_Info = r.Other_Party_Info;
                    mPESA.Processed = false;
                    mpesa.Create(ref mPESA);
                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return new Results<MPESA_Transaction>() { Contents = r };
        }
    }
}