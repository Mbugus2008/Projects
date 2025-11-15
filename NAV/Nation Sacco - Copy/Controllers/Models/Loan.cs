namespace Nation_Sacco.Controllers.Models
{
    public class Loan
    {
        public string account_number { get; set; }
        public string product_code { get; set; }
        public string product_name { get; set; }
        public decimal requested_amount { get; set; }
        public decimal unpaid_amount { get; set; }
        public decimal repayment { get; set; }

        public decimal overdue_amount { get; set; }
        public int duration_in_months { get; set; }
        public decimal installment_amount { get; set; }
        public DateTime last_installment_paid_at { get; set; }
        public string status { get; set; }
        public string Remarks { get; set; }
        public string Recovery_Mode { get; set; }
        public string loan_performance { get; set; }
        public DateTime disbursed_at { get; set; }

    }
}