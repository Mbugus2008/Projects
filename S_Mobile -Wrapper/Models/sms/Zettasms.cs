using System.Collections.Generic;

namespace S_Mobile.Models.sms
{
    public class Zettasms
    {
        public string userid { get; set; }
        public string password { get; set; }
        public string senderid { get; set; }
        public string msgType { get; set; }
        public string duplicatecheck { get; set; }
        public string sendMethod { get; set; }
        public List<zettaSm> sms { get; set; }
    }

    public class zettaSm
    {
        public List<string> mobile { get; set; }
        public string msg { get; set; }
    }

    public class zettaresponse
    {
        public string status { get; set; }
        public string mobile { get; set; }
        public string invalidMobile { get; set; }
        public string transactionId { get; set; }
        public int statusCode { get; set; }
        public string reason { get; set; }
        public string msgId { get; set; }
    }
}