using System;
using System.Net;

namespace S_Mobile.Models.sms
{
    public class Africas : Ismsrepository
    {
        //Logging.settings log;
        //public Africas(Logging.settings s) {
        //    log = s;
        //}

        public Logging.Results sendsms(ref BulkSm s)
        {
            ServicePointManager.ServerCertificateValidationCallback += (sender, cert, chain, errors) => true;
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
            Logging.Results r = new Logging.Results();
            // Specify your login credentials
            string username = "Paulo";
            string apiKey = "9268c470fa9a9dae0ba01fee00053f8c3025af9542e98e8f79543df4da0fa728";
            // Specify the numbers that you want to send to in a comma-separated list
            // Please ensure you include the country code (+254 for Kenya in this case)

            string recipients = s.Phone;
            // And of course we want our recipients to know what we really do
            string message = s.Message_to_send;
            // Create a new instance of our awesome gateway class
            AfricasTalkingGateway gateway = new AfricasTalkingGateway(username, apiKey);
            // Any gateway errors will be captured by our custom Exception class below,
            // so wrap the call in a try-catch block
            try
            {
                // Thats it, hit send and we'll take care of the rest
                dynamic results;
                if (s.Client != "10000")
                    results = gateway.sendMessage(recipients, message, s.Client);
                else
                    results = gateway.sendMessage(recipients, message);

                foreach (dynamic result in results)
                {
                    Logging.Logging.LogEntryOnFile(string.Format("{0}:{1}", (string)result["messageId"], (string)result["status"]));
                    // s.cost = Convert.ToDouble(((string)result["cost"]).Replace("KES", "").Trim());
                    s.Destination_Id = (string)result["messageId"];
                    s.Trace = (string)result["status"];
                    s.Status = 1;
                    s.Datetime_Sent = DateTime.Now;
                }
            }
            catch (AfricasTalkingGatewayException e)
            {
                Logging.Logging.ReportError(e);
                s.Status = 2;
                s.Comments = e.Message;
                r.Code = -1;
                r.Desc = e.Message;
            }

            return r;
        }
    }
}