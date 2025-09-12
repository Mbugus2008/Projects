using Logging;
using S_Mobile.Mpesa_Transactions;
using Serilog;
using System;

namespace S_Mobile.Controllers.Clients
{
    public class Blazing : Iclient

    {
        public Results<Mpesa_Transactions.Mpesa_Transactions> Mpesa(Mpesa_Transactions.Mpesa_Transactions mpesa)
        {
            Results<Mpesa_Transactions.Mpesa_Transactions> r = new Results<Mpesa_Transactions.Mpesa_Transactions>();
            try
            {
                Logging.Logging.LogEntryOnFile(mpesa.Completion_Time.ToString());
                mpesa.Transaction_DateSpecified = true;
                mpesa.Paid_InSpecified = true;
                mpesa.TranstypeSpecified = true;
                mpesa.Completion_TimeSpecified = true;
                mpesa.ChargeSpecified = true;
                // 1767371#Jerusalem-O
                var mp = new Mpesa_Transactions_Service(WebApiApplication.currentclient).Read(mpesa.Receipt_No);
                if (mp == null)
                {
                    new Mpesa_Transactions_Service(WebApiApplication.currentclient).Create(ref mpesa);
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Kanisa");
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            finally
            {
                r.Contents = mpesa;
            }
            return r;
        }
    }
}