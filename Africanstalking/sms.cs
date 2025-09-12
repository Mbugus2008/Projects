using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Africanstalking
{
    public class sms
    {

        public string message { get; set; }
        public string username { get; set; }
        public string apiKey { get; set; }
        public string recipients { get; set; }
        public string from { get; set; }
       
        public string Terminationid { get; set; }
        public double cost { get; set; }
        public string status { get; set; }

        public sms send(sms s)
        {

            // Specify your login credentials
            string username = s.username;
            string apiKey = s.apiKey;
            // Specify the numbers that you want to send to in a comma-separated list
            // Please ensure you include the country code (+254 for Kenya in this case)
            string recipients = s.recipients;
            // And of course we want our recipients to know what we really do
            string message = s.message;
            // Create a new instance of our awesome gateway class
            AfricasTalkingGateway gateway = new AfricasTalkingGateway(username, apiKey);
            // Any gateway errors will be captured by our custom Exception class below,
            // so wrap the call in a try-catch block   
            try
            {
                // Thats it, hit send and we'll take care of the rest 
                dynamic results;
                results = gateway.sendMessage(recipients, message, s.from);

                foreach (dynamic result in results)
                {
                    Logging.Logging.LogEntryOnFile(string.Format("{0}:{1}", (string)result["messageId"], (string)result["status"]));
                    s.cost = Convert.ToDouble(((string)result["cost"]).Replace("KES", "").Trim());
                    s.Terminationid = (string)result["messageId"];
                    s.status = (string)result["status"];

                }
            }
            catch (AfricasTalkingGatewayException e)
            {
                Logging.Logging.ReportError(e);

                throw;
            }
            return s;


        } 
    }
}
