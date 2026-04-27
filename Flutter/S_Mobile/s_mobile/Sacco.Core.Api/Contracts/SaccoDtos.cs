namespace Sacco.Core.Api.Contracts;

public sealed class SaccoParams
{
    public string? Phone { get; init; }
    public string? Acc { get; init; }
    public string? IdNo { get; init; }
    public string? LoanNo { get; init; }
    public string? LoanType { get; init; }
}

public sealed class Request
{
    public string? Phone { get; init; }
    public string? Acc { get; init; }
    public string? CS_Number { get; init; }
    public string? Id_No { get; init; }
    public string? text { get; init; }
    public string? Agent_Code { get; init; }
    public string? Application_No { get; init; }
    public string? Loan_Type { get; init; }
    public string? Image { get; init; }
    public string? Loan_No { get; init; }
    public int? Transaction_Type { get; init; }
}

public sealed class AccountDto
{
    public string No { get; init; } = string.Empty;
    public string Name { get; init; } = string.Empty;
    public string MemberNo { get; init; } = string.Empty;
    public string MobileNo { get; init; } = string.Empty;
    public string IdNo { get; init; } = string.Empty;
    public decimal Balance { get; init; }
}

public sealed class LoanDto
{
    public string LoanNo { get; init; } = string.Empty;
    public string MemberNo { get; init; } = string.Empty;
    public string ProductName { get; init; } = string.Empty;
    public decimal OutstandingBalance { get; init; }
    public int Installments { get; init; }
    public string Status { get; init; } = string.Empty;
}

public sealed class MemberDto
{
    public string MemberNo { get; init; } = string.Empty;
    public string Name { get; init; } = string.Empty;
    public string IdNo { get; init; } = string.Empty;
    public string Phone { get; init; } = string.Empty;
    public List<AccountDto> Accounts { get; init; } = [];
    public List<LoanDto> Loans { get; init; } = [];
}

public sealed class StatementEntryDto
{
    public int EntryNo { get; init; }
    public string CustomerNo { get; init; } = string.Empty;
    public DateTime PostingDate { get; init; }
    public string Description { get; init; } = string.Empty;
    public decimal Amount { get; init; }
    public decimal Debit { get; init; }
    public decimal Credit { get; init; }
    public string LoanNo { get; init; } = string.Empty;
}

public sealed class Account_Entries
{
    public string? Key { get; init; }
    public DateTime Posting_Date { get; init; }
    public int Entry_No { get; init; }
    public string? Document_No { get; init; }
    public decimal Amount { get; init; }
    public string? Customer_No { get; init; }
    public string? Description { get; init; }
    public decimal Balance { get; init; }
}

public sealed class RepaymentSchedule
{
    public string? Key { get; init; }
    public int? Entry_No { get; init; }
    public string? Customer_No { get; init; }
    public DateTime? Posting_Date { get; init; }
    public string? Document_No { get; init; }
    public string? Description { get; init; }
    public decimal? Amount { get; init; }
    public decimal? Debit_Amount { get; init; }
    public decimal? Credit_Amount { get; init; }
    public int? Transaction_Type { get; init; }
    public string? Loan_No { get; init; }
    public DateTime? Date_Filter { get; init; }
}

public sealed class TransactionRequestDto
{
    public string DocumentNo { get; init; } = string.Empty;
    public string AccountNo { get; init; } = string.Empty;
    public string LoanNo { get; init; } = string.Empty;
    public string TransactionType { get; init; } = string.Empty;
    public decimal Amount { get; init; }
    public string Source { get; init; } = "Mobile";
}

public sealed class TransactionResultDto
{
    public string DocumentNo { get; init; } = string.Empty;
    public string AccountNo { get; init; } = string.Empty;
    public string TransactionType { get; init; } = string.Empty;
    public decimal Amount { get; init; }
    public decimal Charge { get; init; }
    public string Desc { get; init; } = string.Empty;
    public List<Account_Entries> MiniStatement { get; init; } = [];
}

public sealed class AccountTypeDto
{
    public string Code { get; init; } = string.Empty;
    public string Name { get; init; } = string.Empty;
}

public sealed class LoanProductDto
{
    public string ProductId { get; init; } = string.Empty;
    public string ProductDescription { get; init; } = string.Empty;
    public decimal InterestRate { get; init; }
    public int MaxInstallments { get; init; }
}

public sealed class TransactionLineDto
{
    public string? Code { get; set; }
    public string? Name { get; set; }
    public int? Type { get; set; }

    public decimal? Amount { get; set; }

    public string? Loan_No { get; set; }
}
