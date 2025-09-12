using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace sms_tests
{
    class Program
    {
 
        static void Main(string[] args)
        {
            //sms_tangazo.sms s = new sms_tangazo.sms(@"D:\logs\sms");
            //s.User_ID = "1359";
            //s.service = "1";
            //s.passkey = "391ELT5DWW";
            //s.Sender = "IMARIKA";
            //s.Phone = "+254724367745";
            //s.Message = "Agency sms test";
            //s.Type = "Notification";
            //s=   s.send(s);

            //Africanstalking.sms s = new Africanstalking.sms();
            //s.from = "mwiruafcs";
            //s.username = "mwiruasms";
            //s.apiKey = "e6aef56f040d4b5adf860e9afd59685ff1fc7065e2fbbabedbd7754bff4373cb";
            //s.recipients = "+254710563359";
            //s.message = "Test";

            //s = s.send(s);

            Procom.Procom p = new Procom.Procom("mbugus2008@gmail.com", "Mbanking12345*");

            Procom.Procom.smss sms = new Procom.Procom.smss();
            sms.message = "Testings";
            sms.phone_number = "+254710563359";
            sms.sender_name = "PROCOM LTD";
            sms.unique_identifier = "000333";
            var pp =p.sendsms(sms);

        }
    }
}