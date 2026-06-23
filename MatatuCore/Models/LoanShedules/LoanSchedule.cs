using System;

namespace LoanShedules;

public class LoanSchedule
{
    public string? Key { get; set; }
    public string? Loan_No { get; set; }
    public int Line_No { get; set; }
    public bool Line_NoSpecified { get; set; }
    public string? Installment_No { get; set; }
    public DateTime Posting_Date { get; set; }
    public bool Posting_DateSpecified { get; set; }
    public double Total_Installment { get; set; }
    public bool Total_InstallmentSpecified { get; set; }
    public double Principle_Amount { get; set; }
    public bool Principle_AmountSpecified { get; set; }
    public double Interest_Amount { get; set; }
    public bool Interest_AmountSpecified { get; set; }
    public double Runing_Balance { get; set; }
    public bool Runing_BalanceSpecified { get; set; }
    public string? Month { get; set; }
}
