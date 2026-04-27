using System.Net.Http.Headers;
using System.Text;
using Sacco.Core.Api.Middleware;

namespace Sacco.Core.Api.Services;

public sealed class BridgeProxyService(
    HttpClient httpClient,
    IClientRouteResolver routeResolver,
    ILogger<BridgeProxyService> logger) : IBridgeProxyService
{
    public async Task<ProxyResponse> ForwardAsync(
        HttpContext context,
        string canonicalRoute,
        CancellationToken ct,
        string? requestBody = null,
        string? directRoutePath = null,
        HttpMethod? directMethod = null)
    {
        var clientId = context.Items[ClientIdentifierMiddleware.ContextKey] as string;
        if (string.IsNullOrWhiteSpace(clientId))
        {
            throw new KeyNotFoundException("Client identifier not resolved from request context.");
        }

        var route = routeResolver.Resolve(clientId);
        var routePath = string.IsNullOrWhiteSpace(directRoutePath)
            ? ResolveRoutePath(route.EndpointMap, canonicalRoute)
            : directRoutePath;
        var method = directMethod ?? ResolveMethod(route.EndpointMethods, canonicalRoute);
        var targetUri = BuildTargetUri(route.BaseUrl, routePath, context.Request.QueryString.Value);

        var body = requestBody;
        if (body is null)
        {
            context.Request.EnableBuffering();
            using var reader = new StreamReader(context.Request.Body, Encoding.UTF8, detectEncodingFromByteOrderMarks: false, leaveOpen: true);
            body = await reader.ReadToEndAsync(ct);
            context.Request.Body.Position = 0;
        }

        using var requestMessage = new HttpRequestMessage(method, targetUri);
        if (method != HttpMethod.Get && (!string.IsNullOrEmpty(body) || context.Request.ContentLength.GetValueOrDefault() > 0))
        {
            var mediaType = context.Request.ContentType ?? "application/json";
            requestMessage.Content = new StringContent(body, Encoding.UTF8);
            requestMessage.Content.Headers.ContentType = MediaTypeHeaderValue.Parse(mediaType);
        }

        CopyHeaders(context, requestMessage);
        requestMessage.Headers.TryAddWithoutValidation(ClientIdentifierMiddleware.HeaderName, clientId);

        logger.LogInformation(
            "Forwarding {CanonicalRoute} for client {ClientId} to {TargetUri}. Payload: {Payload}",
            canonicalRoute,
            clientId,
            targetUri,
            LogPayloadSanitizer.ForLog(body));

        using var response = await httpClient.SendAsync(requestMessage, HttpCompletionOption.ResponseHeadersRead, ct);
        var responseBody = await response.Content.ReadAsStringAsync(ct);
        var contentType = response.Content.Headers.ContentType?.ToString() ?? "application/json";
        var headers = ExtractResponseHeaders(response);

        logger.LogInformation(
            "Received downstream response {StatusCode} from {TargetUri}. Payload: {Payload}",
            (int)response.StatusCode,
            targetUri,
            LogPayloadSanitizer.ForLog(responseBody));

        return new ProxyResponse((int)response.StatusCode, contentType, responseBody, headers);
    }

    private static IReadOnlyDictionary<string, string[]> ExtractResponseHeaders(HttpResponseMessage response)
    {
        var headers = new Dictionary<string, string[]>(StringComparer.OrdinalIgnoreCase);

        foreach (var header in response.Headers)
        {
            headers[header.Key] = header.Value.ToArray();
        }

        foreach (var header in response.Content.Headers)
        {
            headers[header.Key] = header.Value.ToArray();
        }

        return headers;
    }

    private static void CopyHeaders(HttpContext context, HttpRequestMessage requestMessage)
    {
        foreach (var header in context.Request.Headers)
        {
            if (header.Key.Equals("Host", StringComparison.OrdinalIgnoreCase) ||
                header.Key.Equals("Content-Length", StringComparison.OrdinalIgnoreCase) ||
                header.Key.Equals("Content-Type", StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            if (!requestMessage.Headers.TryAddWithoutValidation(header.Key, header.Value.ToArray()) &&
                requestMessage.Content is not null)
            {
                requestMessage.Content.Headers.TryAddWithoutValidation(header.Key, header.Value.ToArray());
            }
        }
    }

    private static Uri BuildTargetUri(string baseUrl, string routePath, string? query)
    {
        var normalizedBase = baseUrl.EndsWith("/", StringComparison.Ordinal)
            ? baseUrl
            : baseUrl + "/";

        var uri = new Uri(new Uri(normalizedBase), routePath.TrimStart('/'));
        if (string.IsNullOrWhiteSpace(query))
        {
            return uri;
        }

        return new Uri(uri + query);
    }

    private static string ResolveRoutePath(IReadOnlyDictionary<string, string> endpointMap, string canonicalRoute)
    {
        if (endpointMap.TryGetValue(canonicalRoute, out var mapped) && !string.IsNullOrWhiteSpace(mapped))
        {
            return mapped;
        }

        return canonicalRoute;
    }

    private static HttpMethod ResolveMethod(IReadOnlyDictionary<string, string> endpointMethods, string canonicalRoute)
    {
        if (!endpointMethods.TryGetValue(canonicalRoute, out var configuredMethod) || string.IsNullOrWhiteSpace(configuredMethod))
        {
            return HttpMethod.Post;
        }

        return configuredMethod.Trim().ToUpperInvariant() switch
        {
            "GET" => HttpMethod.Get,
            "PUT" => HttpMethod.Put,
            "PATCH" => HttpMethod.Patch,
            "DELETE" => HttpMethod.Delete,
            _ => HttpMethod.Post,
        };
    }
}
