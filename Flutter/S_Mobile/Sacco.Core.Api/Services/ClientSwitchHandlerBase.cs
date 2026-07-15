using System.Text.Json.Nodes;
using Sacco.Core.Api.Contracts;

namespace Sacco.Core.Api.Services;

public abstract class ClientSwitchHandlerBase(IBridgeProxyService proxyService) : IClientSwitchHandler
{
    protected IBridgeProxyService ProxyService { get; } = proxyService;

    public virtual int Priority => 0;

    public abstract bool CanHandle(string clientId);

    public virtual Task<ProxyResponse> MemberAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct)
    {
        return ProxyService.ForwardAsync(context, "api/member", ct);
    }

    public virtual Task<ProxyResponse> GroupAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/group", ct);

    public virtual Task<ProxyResponse> RegistrationAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Registration", ct);

    public virtual Task<ProxyResponse> CreateAccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Createaccount", ct);

    public virtual Task<ProxyResponse> AccountsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/accounts", ct);

    public virtual Task<ProxyResponse> AccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/account", ct);

    public virtual Task<ProxyResponse> AccountPhoneAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/account_Phone", ct);

    public virtual Task<ProxyResponse> AccountsByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/accounts_byid", ct);

    public virtual Task<ProxyResponse> AccountTypesAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/account_types", ct);

    public virtual Task<ProxyResponse> LoansAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/loans", ct);

    public virtual Task<ProxyResponse> LoansByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/loans_byid", ct);

    public virtual Task<ProxyResponse> GuarantorsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/guarantors", ct);

    public virtual Task<ProxyResponse> EligibilityAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/eligibility", ct);

    public virtual Task<ProxyResponse> LoanProductsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Loan_products", ct);

    public virtual Task<ProxyResponse> EligibilityWithTopupAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/eligibilitywithtopup", ct);

    public virtual Task<ProxyResponse> ScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Schedule", ct);

    public virtual Task<ProxyResponse> RepaymentScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/RepaymentSchedule", ct, directRoutePath: "api/Getschedule", directMethod: HttpMethod.Post);

    public virtual Task<ProxyResponse> TransactionAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/transaction", ct);

    public virtual Task<ProxyResponse> TransactionChargeAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/transaction_charge", ct);

    public virtual Task<ProxyResponse> StatementAsync(HttpContext context, Request? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Statement", ct);

    public virtual Task<ProxyResponse> RegisterAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/register", ct);

    public virtual Task<ProxyResponse> NextOfKinAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/nextofkin", ct);

    public virtual Task<ProxyResponse> GetTransactionsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Gettransactions", ct);

    public virtual Task<ProxyResponse> UpdateMemberAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/updatemember", ct, directRoutePath: "api/updatemember");
}
