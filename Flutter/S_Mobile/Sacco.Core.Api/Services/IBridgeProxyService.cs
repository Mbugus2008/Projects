namespace Sacco.Core.Api.Services;

public interface IBridgeProxyService
{
    Task<ProxyResponse> ForwardAsync(
        HttpContext context,
        string canonicalRoute,
        CancellationToken ct,
        string? requestBody = null,
        string? directRoutePath = null,
        HttpMethod? directMethod = null);
}

public sealed record ProxyResponse(
    int StatusCode,
    string ContentType,
    string Body,
    IReadOnlyDictionary<string, string[]>? Headers = null);
