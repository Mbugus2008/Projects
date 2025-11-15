namespace Nation_Sacco.Controllers.Models
{
    public class LoanProduct
    {
        public string Product_Id { get; set; }
        public string Loan_Name { get; set; }
        public string Source { get; set; }
        public int Min_Guarantors { get; set; }
        public int Max_Guarantors { get; set; }
        public decimal Min_Loan_Amount { get; set; }
        public decimal Max_Loan_Amount { get; set; }
        public decimal Interest_rate { get; set; }
        public string Interest_Calculation_Method { get; set; }
        public int Min_Duration { get; set; }
        public int Max_Duration { get; set; }
        public int Min_Member_Age { get; set; }
        public int? Max_Member_Age { get; set; } // Nullable to allow null values
        public string Category { get; set; }
        public string Status { get; set; }
        public int Guarantorship_Multiplier { get; set; }
        public int Deposit_Multiplier { get; set; }
        public int Title_Multiplier { get; set; }
        public int Logbook_Multiplier { get; set; }
        public List<string> Required_Documents { get; set; }
    }
}