using System.Text.Json.Nodes;
using Sacco.Core.Api.Contracts;
using Sacco.Core.Api.Middleware;

namespace Sacco.Core.Api.Services;

public sealed class BridgeSwitchService(
    IEnumerable<IClientSwitchHandler> handlers,
    ILogger<BridgeSwitchService> logger) : IBridgeSwitchService
{
    public async Task<ProxyResponse> MemberAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/member",
            static (handler, httpContext, incoming, token) => handler.MemberAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> GroupAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/group",
            static (handler, httpContext, incoming, token) => handler.GroupAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> RegistrationAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/Registration",
            static (handler, httpContext, incoming, token) => handler.RegistrationAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> CreateAccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/Createaccount",
            static (handler, httpContext, incoming, token) => handler.CreateAccountAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> AccountsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/accounts",
            static (handler, httpContext, incoming, token) => handler.AccountsAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> AccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/account",
            static (handler, httpContext, incoming, token) => handler.AccountAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> AccountPhoneAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/account_Phone",
            static (handler, httpContext, incoming, token) => handler.AccountPhoneAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> AccountsByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/accounts_byid",
            static (handler, httpContext, incoming, token) => handler.AccountsByIdAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> AccountTypesAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/account_types",
            static (handler, httpContext, incoming, token) => handler.AccountTypesAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> LoansAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/loans",
            static (handler, httpContext, incoming, token) => handler.LoansAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> LoansByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/loans_byid",
            static (handler, httpContext, incoming, token) => handler.LoansByIdAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> GuarantorsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/guarantors",
            static (handler, httpContext, incoming, token) => handler.GuarantorsAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> EligibilityAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/eligibility",
            static (handler, httpContext, incoming, token) => handler.EligibilityAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> LoanProductsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/Loan_products",
            static (handler, httpContext, incoming, token) => handler.LoanProductsAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> ScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/Schedule",
            static (handler, httpContext, incoming, token) => handler.ScheduleAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> RepaymentScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/RepaymentSchedule",
            static (handler, httpContext, incoming, token) => handler.RepaymentScheduleAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> TransactionAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/transaction",
            static (handler, httpContext, incoming, token) => handler.TransactionAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> TransactionChargeAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/transaction_charge",
            static (handler, httpContext, incoming, token) => handler.TransactionChargeAsync(httpContext, incoming, token),
        incoming,
            ct);
    }

    public async Task<ProxyResponse> StatementAsync(HttpContext context, Request? incoming, CancellationToken ct)
    {
        var clientId = context.Items[ClientIdentifierMiddleware.ContextKey] as string ?? string.Empty;

        logger.LogInformation("Switch handling route {Route} for client {ClientId}", "api/Statement", clientId);

        var handler = ResolveHandler(clientId);
        return await handler.StatementAsync(context, incoming, ct);
    }

    public async Task<ProxyResponse> RegisterAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/register",
            static (handler, httpContext, incoming, token) => handler.RegisterAsync(httpContext, incoming, token),
            incoming,
            ct);
    }

    public async Task<ProxyResponse> NextOfKinAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        return await DispatchAsync(
            context,
            "api/nextofkin",
            static (handler, httpContext, incoming, token) => handler.NextOfKinAsync(httpContext, incoming, token),
            incoming,
            ct);
    }

    private async Task<ProxyResponse> DispatchAsync(
        HttpContext context,
        string operation,
        Func<IClientSwitchHandler, HttpContext, JsonNode?, CancellationToken, Task<ProxyResponse>> dispatch,
    JsonNode? incoming,
        CancellationToken ct)
    {
        var clientId = context.Items[ClientIdentifierMiddleware.ContextKey] as string ?? string.Empty;

        logger.LogInformation("Switch handling route {Route} for client {ClientId}", operation, clientId);

        var handler = ResolveHandler(clientId);
        return await dispatch(handler, context, incoming, ct);
    }

    private IClientSwitchHandler ResolveHandler(string clientId)
    {
        var handler = handlers
            .OrderByDescending(h => h.Priority)
            .FirstOrDefault(h => h.CanHandle(clientId));

        if (handler is null)
        {
            throw new KeyNotFoundException($"No switch handler registered for client '{clientId}'.");
        }

        return handler;
    }
}
