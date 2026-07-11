using System.Text.Json;
using System.Text.Json.Nodes;
using Sacco.Core.Api.Contracts;

namespace Sacco.Core.Api.Services;

public sealed class BarakaYetuSwitchHandler(IBridgeProxyService proxyService) : ClientSwitchHandlerBase(proxyService)
{
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNamingPolicy = null,
        WriteIndented = false,
    };

    public override int Priority => 100;

    public override bool CanHandle(string clientId) =>
        clientId.Equals("BarakaYetu", StringComparison.OrdinalIgnoreCase);

    public override async Task<ProxyResponse> MemberAsync(
        HttpContext context,
        JsonNode? incoming,
        CancellationToken ct)
    {
        var request = Deserialize<member>(incoming);
        var phone = NormalizePhone(request?.Phone_No);

        if (string.IsNullOrWhiteSpace(phone))
        {
            phone = ExtractPhone(incoming);
        }

        if (phone is null)
        {
            return FailureResponse("Phone is required for member lookup.", 400);
        }

        var payload = new JsonObject { ["body"] = phone };
        var ds = await ProxyService.ForwardAsync(
            context,
            "api/member",
            ct,
            requestBody: payload.ToJsonString(),
            directRoutePath: "api/member",
            directMethod: HttpMethod.Post);
        return ds;
    }

    public override Task<ProxyResponse> GroupAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.GroupAsync(context, incoming, ct);

    public override Task<ProxyResponse> RegistrationAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.RegistrationAsync(context, incoming, ct);

    public override Task<ProxyResponse> CreateAccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.CreateAccountAsync(context, incoming, ct);

    public override async Task<ProxyResponse> AccountsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var phone = ExtractPhone(incoming);
        if (phone is null)
        {
            return FailureResponse("Phone is required for accounts lookup.", 400);
        }

        var ds = await ForwardClientRequestAsync(context, "api/Getacctrans", phone, ct);
        return ds;
    }

    public override async Task<ProxyResponse> AccountAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var value = ExtractString(incoming, "Acc", "Phone", "Id_No", "account", "phone", "idNo");
        if (string.IsNullOrWhiteSpace(value))
        {
            return FailureResponse("Account/Phone/Id_No is required.", 400);
        }

        var payload = new JsonObject { ["Account"] = value };
        var ds = await ProxyService.ForwardAsync(context, "api/account", ct, requestBody: payload.ToJsonString(), directRoutePath: "api/findmember");
        return ds;
    }

    public override Task<ProxyResponse> AccountPhoneAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        AccountAsync(context, incoming, ct);

    public override Task<ProxyResponse> AccountsByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        AccountAsync(context, incoming, ct);

    public override Task<ProxyResponse> AccountTypesAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.AccountTypesAsync(context, incoming, ct);

    public override async Task<ProxyResponse> LoansAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var phone = ExtractPhone(incoming);
        if (phone is null)
        {
            return FailureResponse("Phone is required for loans lookup.", 400);
        }

        var ds = await ForwardClientRequestAsync(context, "api/Getacctrans", phone, ct);
        return ds;
    }

    public override Task<ProxyResponse> LoansByIdAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.LoansByIdAsync(context, incoming, ct);

    public override Task<ProxyResponse> GuarantorsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.GuarantorsAsync(context, incoming, ct);

    public override async Task<ProxyResponse> EligibilityAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var phone = ExtractPhone(incoming);
        var loanType = ExtractString(incoming, "Loan_Type", "loanType", "loantype");

        if (phone is null || string.IsNullOrWhiteSpace(loanType))
        {
            return FailureResponse("Phone and Loan_Type are required for eligibility.", 400);
        }

        var payload = new JsonObject
        {
            ["body"] = new JsonObject
            {
                ["phone"] = phone,
                ["loantype"] = loanType,
            }
        };

        var ds = await ProxyService.ForwardAsync(context, "api/eligibility", ct, requestBody: payload.ToJsonString(), directRoutePath: "api/eligibility");
        return ds;
    }

    public override async Task<ProxyResponse> EligibilityWithTopupAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var phone = ExtractPhone(incoming);
        var code = ExtractString(incoming, "Code", "code", "Loan_Code");
        var loanType = ExtractString(incoming, "Loan_Type", "loanType", "loantype");

        if (phone is null || string.IsNullOrWhiteSpace(code))
        {
            return FailureResponse("Phone and Code are required for eligibility check.", 400);
        }

        var payload = new JsonObject
        {
            ["body"] = new JsonObject
            {
                ["phone"] = phone,
                ["Code"] = code,
                ["loantype"] = loanType ?? code,
            }
        };

        var ds = await ProxyService.ForwardAsync(
            context,
            "api/eligibilitywithtopup",
            ct,
            requestBody: payload.ToJsonString(),
            directRoutePath: "api/eligibilitywithtopup");
        return ds;
    }

    public override Task<ProxyResponse> LoanProductsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        ProxyService.ForwardAsync(context, "api/Loan_products", ct, directRoutePath: "api/loanproducts2", directMethod: HttpMethod.Get);

    public override Task<ProxyResponse> ScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.ScheduleAsync(context, incoming, ct);

    public override async Task<ProxyResponse> RepaymentScheduleAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var loanNo = ExtractString(incoming, "Loan_No", "LoanNo", "loanNo", "loan_no", "Acc", "Account", "No");
        if (string.IsNullOrWhiteSpace(loanNo))
        {
            return FailureResponse("Loan number is required for repayment schedule lookup.", 400);
        }

        var payload = new JsonObject { ["LoanNo"] = loanNo.Trim() };
        var ds = await ProxyService.ForwardAsync(
            context,
            "api/RepaymentSchedule",
            ct,
            requestBody: payload.ToJsonString(),
            directRoutePath: "api/Getschedule",
            directMethod: HttpMethod.Post);
        return ds;
    }

    public override async Task<ProxyResponse> TransactionAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var wrapped = new JsonObject { ["body"] = incoming?.DeepClone() ?? new JsonObject() };
        var ds = await ProxyService.ForwardAsync(context, "api/transaction", ct, requestBody: wrapped.ToJsonString(), directRoutePath: "api/transactions");
        return ds;
    }

    public override async Task<ProxyResponse> TransactionChargeAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        var transactionType = ExtractInt(incoming, "Transaction_Type", "transactionType");
        var amount = ExtractDecimal(incoming, "Amount", "amount");

        if (transactionType is null || amount is null)
        {
            return FailureResponse("Transaction_Type and Amount are required for transaction charge.", 400);
        }

        var payload = new JsonObject
        {
            ["Transaction_Type"] = transactionType.Value,
            ["Amount"] = amount.Value
        };

        var ds = await ProxyService.ForwardAsync(context, "api/transaction_charge", ct, requestBody: payload.ToJsonString(), directRoutePath: "api/Tcharges");
        return ds;
    }

    public override Task<ProxyResponse> RegisterAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.RegisterAsync(context, incoming, ct);

    public override async Task<ProxyResponse> GetTransactionsAsync(HttpContext context, JsonNode? incoming, CancellationToken ct)
    {
        try
        {
            var accountNo = ExtractString(incoming, "Account_No", "Account", "Acc", "account");
            var transactionType = ExtractInt(incoming, "Transaction_Type", "transactionType");

            var payload = new JsonObject { ["Account"] = accountNo ?? "" };
            if (transactionType.HasValue)
            {
                payload["Transaction_Type"] = transactionType.Value;
            }

            var ds = await ProxyService.ForwardAsync(
                context,
                "api/Gettransactions",
                ct,
                requestBody: payload.ToJsonString(),
                directRoutePath: "api/Gettransactions",
                directMethod: HttpMethod.Post);
            return ds;
        }
        catch (Exception ex)
        {
            return FailureResponse($"GetTransactions error: {ex.GetType().Name} - {ex.Message}", 500);
        }
    }

    public override Task<ProxyResponse> NextOfKinAsync(HttpContext context, JsonNode? incoming, CancellationToken ct) =>
        base.NextOfKinAsync(context, incoming, ct);

    public override async Task<ProxyResponse> StatementAsync(HttpContext context, Request? incoming, CancellationToken ct)
    {
        var accountNo = incoming?.Acc;
        var transactionType = incoming?.Transaction_Type;

        if (string.IsNullOrWhiteSpace(accountNo))
        {
            return FailureResponse("Account number is required for statement lookup in BarakaYetu.", 400);
        }

        var payload = new JsonObject { ["Account"] = accountNo.Trim() };
        if (!string.IsNullOrWhiteSpace(transactionType))
        {
            payload["Transaction_Type"] = transactionType;
        }
        var ds = await ProxyService.ForwardAsync(
            context,
            "api/Statement",
            ct,
            requestBody: payload.ToJsonString(),
            directRoutePath: "api/Getacctrans",
            directMethod: HttpMethod.Post);
        return ds;
    }

    private async Task<ProxyResponse> ForwardClientRequestAsync(HttpContext context, string route, string value, CancellationToken ct)
    {
        var payload = new JsonObject { ["body"] = value };
        return await ProxyService.ForwardAsync(context, route, ct, requestBody: payload.ToJsonString(), directRoutePath: route, directMethod: HttpMethod.Post);
    }

    private static ProxyResponse FailureResponse(string desc, int statusCode)
    {
        return new ProxyResponse(statusCode, "application/json", JsonSerializer.Serialize(Results<object>.Failure(desc), JsonOptions));
    }

    private static string? ExtractPhone(JsonNode? node)
    {
        var raw = ExtractString(node, "Phone", "phone", "MSISDN", "Phone_No");
        return NormalizePhone(raw);
    }

    private static T? Deserialize<T>(JsonNode? node)
    {
        if (node is null)
        {
            return default;
        }

        try
        {
            return node.Deserialize<T>(JsonOptions);
        }
        catch (JsonException)
        {
            return default;
        }
    }

    private static string? NormalizePhone(string? raw)
    {
        if (string.IsNullOrWhiteSpace(raw))
        {
            return null;
        }

        var digits = new string(raw.Where(char.IsDigit).ToArray());
        if (digits.Length < 9)
        {
            return null;
        }

        return "+254" + digits[^9..];
    }

    private static string? ExtractString(JsonNode? node, params string[] keys)
    {
        if (node is not JsonObject obj)
        {
            return null;
        }

        foreach (var key in keys)
        {
            var match = obj.FirstOrDefault(kvp => kvp.Key.Equals(key, StringComparison.OrdinalIgnoreCase));
            if (match.Value is null)
            {
                continue;
            }

            if (match.Value is JsonValue)
            {
                var value = match.Value.GetValue<string?>();
                if (!string.IsNullOrWhiteSpace(value))
                {
                    return value.Trim();
                }
            }
        }

        return null;
    }

    private static int? ExtractInt(JsonNode? node, params string[] keys)
    {
        var raw = ExtractString(node, keys);
        if (int.TryParse(raw, out var value))
        {
            return value;
        }

        if (node is JsonObject obj)
        {
            foreach (var key in keys)
            {
                var match = obj.FirstOrDefault(kvp => kvp.Key.Equals(key, StringComparison.OrdinalIgnoreCase));
                if (match.Value is JsonValue jsonValue && jsonValue.TryGetValue<int>(out var jsonInt))
                {
                    return jsonInt;
                }
            }
        }

        return null;
    }

    private static decimal? ExtractDecimal(JsonNode? node, params string[] keys)
    {
        var raw = ExtractString(node, keys);
        if (decimal.TryParse(raw, out var value))
        {
            return value;
        }

        if (node is JsonObject obj)
        {
            foreach (var key in keys)
            {
                var match = obj.FirstOrDefault(kvp => kvp.Key.Equals(key, StringComparison.OrdinalIgnoreCase));
                if (match.Value is JsonValue jsonValue && jsonValue.TryGetValue<decimal>(out var jsonDecimal))
                {
                    return jsonDecimal;
                }
            }
        }

        return null;
    }
}
