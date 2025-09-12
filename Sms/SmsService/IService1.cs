using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace SmsService
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        Delivery delivery(string s);
        // TODO: Add your service operations here
        [OperationContract]
        sms Sendsms(sms s);
        [OperationContract]
        airtime sendAirtime(airtime s);
        [OperationContract]
        sms Sendsmsonly(sms s);
        [OperationContract]
        [WebGet]
        int Sendsmsclassic(string phone, string text, string Client);
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.
   
    [DataContract]
    public class sms {
        [DataMember]
        public string Sourceid { get; set; }
        [DataMember]
        public string phone { get; set; }
        [DataMember]
        public string text { get; set; }
        [DataMember]
        public string client { get; set; }
        [DataMember]
        public string Smsclient = string.Empty;
        [DataMember]
        public int balance { get; set; }
        [DataMember]
        public Results results { get; set; }
        [DataMember]
        public string Terminationid { get; set; }
        [DataMember]
        public string status { get; set; }
        [DataMember]
        public double cost;
        [DataMember]
        public Boolean Scheduled { get; set; } = false;
        [DataMember]
        public DateTime Scheduledtime { get; set; } = DateTime.Now;
    }
    public class Results
    {
        [DataMember]
        public int code { get; set; }
        [DataMember]
        public string Description { get; set; }
    }
    public class airtime
    {
        [DataMember]
        public string telephone;
        [DataMember]
        public string client;
        [DataMember]
        public double amount;
        [DataMember]
        public double discount;
        [DataMember]
        public string status;
        [DataMember]
        public string error_message;
        [DataMember]
        public Results results;
    }
    public class Delivery {
        public string id { get; set; }  
        public string status { get; set; }  
        public string phoneNumber { get; set; } 
        public string networkCode { get; set; }
        public string failureReason { get; set; }
        public int retryCount { get; set; }
    }
}
