namespace S_Mobile.Models
{
    public class Customer2Business
    {
        public string TransactionType { get; set; }
        public string TransID { get; set; }
        public string TransTime { get; set; }
        public double TransAmount { get; set; }
        public string BusinessShortCode { get; set; }
        public string BillRefNumber { get; set; }
        public string InvoiceNumber { get; set; }
        public double OrgAccountBalance { get; set; }
        public string ThirdPartyTransID { get; set; }
        public string MSISDN { get; set; }
        public string FirstName { get; set; }
    }

    public class MpesaResponse
    {
        public int ResultCode { get; set; }
        public string ResultDesc { get; set; }
    }
}