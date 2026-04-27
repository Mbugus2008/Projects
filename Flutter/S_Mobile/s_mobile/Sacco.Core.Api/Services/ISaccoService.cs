using Sacco.Core.Api.Contracts;

namespace Sacco.Core.Api.Services;

public interface ISaccoService
{
    Task<MemberDto?> GetMemberAsync(string clientId, string phoneOrMemberNo, CancellationToken ct);
    Task<List<AccountDto>> GetAccountsAsync(string clientId, string phoneOrMemberNo, CancellationToken ct);
    Task<AccountDto?> GetAccountAsync(string clientId, string accountNo, CancellationToken ct);
    Task<AccountDto?> GetAccountByPhoneAsync(string clientId, string phone, CancellationToken ct);
    Task<List<AccountDto>> GetAccountsByIdAsync(string clientId, string idNo, CancellationToken ct);
    Task<List<LoanDto>> GetLoansAsync(string clientId, string phoneOrMemberNo, CancellationToken ct);
    Task<List<LoanDto>> GetLoansByIdAsync(string clientId, string idNo, CancellationToken ct);
    Task<List<Account_Entries>> GetStatementAsync(string clientId, string accountNo, CancellationToken ct);
    Task<TransactionResultDto> PostTransactionAsync(string clientId, TransactionRequestDto request, CancellationToken ct);
    Task<decimal> CalculateChargeAsync(string clientId, TransactionRequestDto request, CancellationToken ct);
    Task<List<AccountTypeDto>> GetAccountTypesAsync(string clientId, CancellationToken ct);
    Task<List<LoanProductDto>> GetLoanProductsAsync(string clientId, CancellationToken ct);
}
