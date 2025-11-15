namespace Nation_Sacco.Controllers.Models
{
    public class LoanApplication
    {
        public int Source { get; set; }
        public string MemberNumber { get; set; }
        public string? Loan_Number { get; set; }
        public string LoanProductType { get; set; }
        public decimal LoanRequestedAmount { get; set; }
        public int LoanDuration { get; set; }
        public string LoanPurpose { get; set; }
        public string SasraMainSector { get; set; }
        public string SasraSubSector1 { get; set; }
        public string SasraSubSector2 { get; set; }
        public List<Guarantor> Guarantors { get; set; }
        public List<string> Collaterals { get; set; }
        public List<string> LoansToBeCleared { get; set; }
        public string StatusChangeCallbackUrl { get; set; }
    }
}
