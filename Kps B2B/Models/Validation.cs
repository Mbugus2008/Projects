using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Kps_B2B.Models
{   
    public class header
    {
        public string messageID { get; set; }
        public string statusCode { get; set; }
        public string statusDescription { get; set; }
        public string serviceName { get; set; }
        public string connectionID { get; set; }
        public string connectionPassword { get; set; }
    }
    public class body
    {
        public string TransactionReferenceCode { get; set; }
        public DateTime TransactionDate { get; set; }
        public string TransactionAmount { get; set; }
        public string TotalAmount { get; set; }
        public string Currency { get; set; }
        public string AdditionalInfo { get; set; }
        public string AccountNumber { get; set; }
        public string AccountName { get; set; }
        public string InstitutionCode { get; set; }
        public string InstitutionName { get; set; }
        public string DocumentReferenceNumber { get; set; }
        public string BankCode { get; set; }
        public string BranchCode { get; set; }
        public string PaymentDate { get; set; }
        public string PaymentReferenceCode { get; set; }
        public string PaymentCode { get; set; }
        public string PaymentMode { get; set; }
        public string PaymentAmount { get; set; }






    }
    public class Request
    {
      public  header header { get; set; }
        public body request { get; set; }
    }
    public class reply
    {
    public    header header { get; set; }
    public    body response { get; set; }
    }
}