namespace Sacco.Core.Api.Configuration;

public sealed class BridgeRoutingOptions
{
    public Dictionary<string, ClientRouteOptions> Clients { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);
}

public sealed class ClientRouteOptions
{
    public string BaseUrl { get; set; } = string.Empty;

    // Optional per-client path overrides (key: canonical route like "api/member").
    public Dictionary<string, string> EndpointMap { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);

    // Optional per-client method overrides (values: GET, POST, PUT, PATCH, DELETE).
    public Dictionary<string, string> EndpointMethods { get; set; } =
        new(StringComparer.OrdinalIgnoreCase);
}
