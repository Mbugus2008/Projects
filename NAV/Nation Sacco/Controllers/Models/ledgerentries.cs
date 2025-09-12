namespace Nation_Sacco.Controllers.Models
{
    public class ledgerentries
    {
        public string TransactionCode { get; set; }
        public string Operation { get; set; }
        public decimal Amount { get; set; }
        public string Description { get; set; }
        public decimal RunningBalance { get; set; }
        public DateTime Timestamp { get; set; }
    }
}