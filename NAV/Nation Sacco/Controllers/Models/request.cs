namespace Nation_Sacco.Controllers.Models
{
    public class request
    {
        public string? member_number { get; set; }
        public string? account_number { get; set; }
        public string? loan_number { get; set; }
        public string? id_number { get; set; }
        public DateTime? from { get; set; }
        public DateTime? to { get; set; }
        public int? installments { get; set; }
        public Ttype? transaction_Type { get; set; }
        public string? Comments { get; set; }   

    }

    public enum Ttype {
Shares_Capital,Deposit_Contribution,School_Fee, Benevolent_Fund,
       
    }

}