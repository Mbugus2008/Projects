using Microsoft.AspNetCore.Mvc;
using Sacco.Core.Api.Contracts;
using Sacco.Core.Api.Data;
using Sacco.Core.Api.Services;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;
using System.Text.Json.Nodes;

namespace Sacco.Core.Api.Controllers;

[ApiController]
[Route("api")]
public sealed class SaccoBridgeController(
    IBridgeSwitchService switchService,
    MobileDbContext mobileDbContext,
    ILogger<SaccoBridgeController> logger) : ControllerBase
{
    [HttpPost("login")]
    public async Task<IActionResult> Login([FromBody] LoginRequest request, CancellationToken ct)
    {
        if (request is null || string.IsNullOrWhiteSpace(request.Phone))
        {
            return BadRequest(Results<object>.Failure("Phone is required."));
        }

        var providedPin = (request.Pin ?? request.Password)?.Trim();
        if (string.IsNullOrWhiteSpace(providedPin))
        {
            return BadRequest(Results<object>.Failure("Pin is required."));
        }

        var requestedLast9 = ExtractLast9Digits(request.Phone);
        if (requestedLast9 is null)
        {
            return BadRequest(Results<object>.Failure("Phone must contain at least 9 digits."));
        }

        // Validate phone identity using only the last 9 digits regardless of stored format.
        var allLogins = await mobileDbContext.Logins
            .AsNoTracking()
            .ToListAsync(ct);

        var loginRecord = allLogins.FirstOrDefault(x =>
            string.Equals(ExtractLast9Digits(x.Telephone), requestedLast9, StringComparison.Ordinal));

        if (loginRecord is null)
        {
            return Unauthorized(Results<object>.Failure("Invalid phone or pin."));
        }

        var isValid = string.Equals(providedPin, loginRecord.StartPin, StringComparison.Ordinal) ||
                      string.Equals(providedPin, loginRecord.PinEncrypted, StringComparison.Ordinal);

        if (!isValid)
        {
            return Unauthorized(Results<object>.Failure("Invalid phone or pin."));
        }

        var payload = new
        {
            Telephone = loginRecord.Telephone,
            Client = loginRecord.Client,
            PinChanged = loginRecord.PinChanged,
        };

        logger.LogInformation(
            "Returning login response for {Path}: {Payload}",
            HttpContext.Request.Path,
            LogPayloadSanitizer.ForLog(JsonSerializer.Serialize(Results<object>.Success(payload, "Login successful"))));

        return Ok(Results<object>.Success(payload, "Login successful"));
    }

    [HttpPost("member")]
    public Task<IActionResult> Member(member? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.MemberAsync);
    }

    [HttpPost("group")]
    public Task<IActionResult> Group(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.GroupAsync);
    }

    [HttpPost("Registration")]
    public Task<IActionResult> Registration(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.RegistrationAsync);
    }

    [HttpPost("Createaccount")]
    public Task<IActionResult> CreateAccount(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.CreateAccountAsync);
    }

    [HttpPost("accounts")]
    public Task<IActionResult> Accounts(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.AccountsAsync);
    }

    [HttpPost("account")]
    public Task<IActionResult> Account(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.AccountAsync);
    }

    [HttpPost("account_Phone")]
    public Task<IActionResult> AccountPhone(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.AccountPhoneAsync);
    }

    [HttpPost("accounts_byid")]
    public Task<IActionResult> AccountsById(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.AccountsByIdAsync);
    }

    [HttpPost("account_types")]
    public Task<IActionResult> AccountTypes(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.AccountTypesAsync);
    }

    [HttpPost("loans")]
    public Task<IActionResult> Loans(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.LoansAsync);
    }

    [HttpPost("loans_byid")]
    public Task<IActionResult> LoansById(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.LoansByIdAsync);
    }

    [HttpPost("guarantors")]
    public Task<IActionResult> Guarantors(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.GuarantorsAsync);
    }

    [HttpPost("eligibility")]
    public Task<IActionResult> Eligibility(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.EligibilityAsync);
    }

    [HttpPost("Loan_products")]
    public Task<IActionResult> LoanProducts(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.LoanProductsAsync);
    }

    [HttpPost("Schedule")]
    public Task<IActionResult> Schedule(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.ScheduleAsync);
    }

    [HttpPost("RepaymentSchedule")]
    public Task<IActionResult> RepaymentSchedule(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.RepaymentScheduleAsync);
    }

    [HttpPost("transaction")]
    public Task<IActionResult> Transaction(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.TransactionAsync);
    }

    [HttpPost("transaction_charge")]
    public Task<IActionResult> TransactionCharge(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.TransactionChargeAsync);
    }

    [HttpPost("Statement")]
    public Task<IActionResult> Statement([FromBody] Request? request, CancellationToken ct)
    {
        return ExecuteTypedAsync(request, ct, switchService.StatementAsync);
    }

    [HttpPost("register")]
    public Task<IActionResult> Register(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.RegisterAsync);
    }

    [HttpPost("nextofkin")]
    public Task<IActionResult> NextOfKin(JsonNode? request, CancellationToken ct)
    {
        return ExecuteAsync(request, ct, switchService.NextOfKinAsync);
    }

    private Task<IActionResult> ExecuteAsync<TRequest>(
        TRequest? request,
        CancellationToken ct,
        Func<HttpContext, JsonNode?, CancellationToken, Task<ProxyResponse>> dispatch)
    {
        JsonNode? payload = request switch
        {
            null => null,
            JsonNode node => node,
            _ => JsonSerializer.SerializeToNode(request),
        };

        return ExecuteProxyAsync(payload, ct, dispatch);
    }

    private async Task<IActionResult> ExecuteTypedAsync<TRequest>(
        TRequest? request,
        CancellationToken ct,
        Func<HttpContext, TRequest?, CancellationToken, Task<ProxyResponse>> dispatch)
    {
        try
        {
            var downstream = await dispatch(HttpContext, request, ct);

            if (downstream.Headers is not null)
            {
                foreach (var header in downstream.Headers)
                {
                    if (ShouldSkipDownstreamHeader(header.Key))
                    {
                        continue;
                    }

                    Response.Headers[header.Key] = header.Value;
                }
            }

            var envelope = ToResultsEnvelope(downstream);
            logger.LogInformation(
                "Returning API response for {Path} with status {StatusCode}: {Payload}",
                HttpContext.Request.Path,
                downstream.StatusCode,
                LogPayloadSanitizer.ForLog(JsonSerializer.Serialize(envelope)));
            return StatusCode(downstream.StatusCode, envelope);
        }
        catch (KeyNotFoundException ex)
        {
            logger.LogWarning(ex, "Client routing failed for {Path}", HttpContext.Request.Path);
            return BadRequest(Results<object>.Failure(ex.Message));
        }
        catch (HttpRequestException ex)
        {
            logger.LogWarning(ex, "Downstream forwarding failed for {Path}", HttpContext.Request.Path);
            return StatusCode(StatusCodes.Status502BadGateway, Results<object>.Failure($"Downstream API request failed: {ex.Message}"));
        }
    }

    private async Task<IActionResult> ExecuteProxyAsync(
        JsonNode? request,
        CancellationToken ct,
        Func<HttpContext, JsonNode?, CancellationToken, Task<ProxyResponse>> dispatch)
    {
        try
        {
            var downstream = await dispatch(HttpContext, request, ct);

            if (downstream.Headers is not null)
            {
                foreach (var header in downstream.Headers)
                {
                    if (ShouldSkipDownstreamHeader(header.Key))
                    {
                        continue;
                    }

                    Response.Headers[header.Key] = header.Value;
                }
            }

            var envelope = ToResultsEnvelope(downstream);
            logger.LogInformation(
                "Returning API response for {Path} with status {StatusCode}: {Payload}",
                HttpContext.Request.Path,
                downstream.StatusCode,
                LogPayloadSanitizer.ForLog(JsonSerializer.Serialize(envelope)));
            return StatusCode(downstream.StatusCode, envelope);
        }
        catch (KeyNotFoundException ex)
        {
            logger.LogWarning(ex, "Client routing failed for {Path}", HttpContext.Request.Path);
            return BadRequest(Results<object>.Failure(ex.Message));
        }
        catch (HttpRequestException ex)
        {
            logger.LogWarning(ex, "Downstream forwarding failed for {Path}", HttpContext.Request.Path);
            return StatusCode(StatusCodes.Status502BadGateway, Results<object>.Failure($"Downstream API request failed: {ex.Message}"));
        }
    }

    private static Results<object?> ToResultsEnvelope(ProxyResponse downstream)
    {
        if (string.IsNullOrWhiteSpace(downstream.Body))
        {
            return downstream.StatusCode is >= 200 and < 300
                ? Results<object?>.Success(null)
                : Results<object?>.Failure($"Downstream returned HTTP {downstream.StatusCode} with empty body.");
        }

        JsonNode? node;
        try
        {
            node = JsonNode.Parse(downstream.Body);
        }
        catch (JsonException)
        {
            node = null;
        }

        if (node is JsonObject obj && HasEnvelopeShape(obj))
        {
            var code = ReadInt(GetNodeIgnoreCase(obj, "Code")) ?? (downstream.StatusCode is >= 200 and < 300 ? 0 : -1);
            var desc = ReadString(GetNodeIgnoreCase(obj, "Desc")) ?? (code == 0 ? "Successful" : $"Downstream returned HTTP {downstream.StatusCode}.");
            var envelopeContents =
                GetNodeIgnoreCase(obj, "Contents", "content")?.DeepClone();
            return new Results<object?> { Code = code, Desc = desc, Contents = envelopeContents };
        }

        var fallbackCode = downstream.StatusCode is >= 200 and < 300 ? 0 : -1;
        var fallbackDesc = fallbackCode == 0 ? "Successful" : $"Downstream returned HTTP {downstream.StatusCode}.";
        object? contents = node ?? downstream.Body;

        return new Results<object?>
        {
            Code = fallbackCode,
            Desc = fallbackDesc,
            Contents = contents,
        };
    }

    private static bool HasEnvelopeShape(JsonObject obj)
    {
        return GetNodeIgnoreCase(obj, "Code") is not null &&
               GetNodeIgnoreCase(obj, "Desc") is not null;
    }

    private static JsonNode? GetNodeIgnoreCase(JsonObject obj, params string[] keys)
    {
        foreach (var key in keys)
        {
            foreach (var kvp in obj)
            {
                if (kvp.Key.Equals(key, StringComparison.OrdinalIgnoreCase))
                {
                    return kvp.Value;
                }
            }
        }

        return null;
    }

    private static int? ReadInt(JsonNode? node)
    {
        if (node is not JsonValue value)
        {
            return null;
        }

        if (value.TryGetValue<int>(out var intValue))
        {
            return intValue;
        }

        if (value.TryGetValue<string>(out var stringValue) && int.TryParse(stringValue, out var parsed))
        {
            return parsed;
        }

        return null;
    }

    private static string? ReadString(JsonNode? node)
    {
        if (node is not JsonValue value)
        {
            return null;
        }

        if (value.TryGetValue<string>(out var stringValue))
        {
            return stringValue;
        }

        return null;
    }

    private static bool ShouldSkipDownstreamHeader(string key)
    {
        return key.Equals("Content-Type", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Content-Length", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Transfer-Encoding", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Connection", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Keep-Alive", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Proxy-Authenticate", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Proxy-Authorization", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("TE", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Trailer", StringComparison.OrdinalIgnoreCase) ||
               key.Equals("Upgrade", StringComparison.OrdinalIgnoreCase);
    }

    private static string? ExtractLast9Digits(string? raw)
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

        return digits[^9..];
    }
}
