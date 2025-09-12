using System;

namespace S_Mobile.Models.sms
{
    public class Blank : Ismsrepository
    {
        //Logging.settings log;
        //public Africas(Logging.settings s) {
        //    log = s;
        //}

        public Logging.Results sendsms(ref BulkSm s)
        {
            Logging.Results r = new Logging.Results();
            try
            {
                s.Destination_Id = "";
                s.Trace = "Not Sent";
                s.Status = 1;
                s.Datetime_Sent = DateTime.Now;
            }
            catch (AfricasTalkingGatewayException e)
            {
                Logging.Logging.ReportError(e);
                r.Code = -1;
                r.Desc = e.Message;
            }

            return r;
        }
    }
}