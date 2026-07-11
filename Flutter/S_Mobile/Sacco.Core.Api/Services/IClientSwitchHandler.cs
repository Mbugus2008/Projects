using System.Text.Json.Nodes;
using Sacco.Core.Api.Contracts;

namespace Sacco.Core.Api.Services;

public interface IClientSwitchHandler
{
    int Priority { get; }

    bool CanHandle(string clientId);

    Task<ProxyResponse> MemberAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> GroupAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> RegistrationAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> CreateAccountAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> AccountsAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> AccountAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> AccountPhoneAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> AccountsByIdAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> AccountTypesAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> LoansAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> LoansByIdAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> GuarantorsAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> EligibilityAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> LoanProductsAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> EligibilityWithTopupAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> ScheduleAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> RepaymentScheduleAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> TransactionAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> TransactionChargeAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> StatementAsync(
        HttpContext context,
        Request? incoming,
        CancellationToken ct);

    Task<ProxyResponse> RegisterAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> NextOfKinAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);

    Task<ProxyResponse> GetTransactionsAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct);
}
