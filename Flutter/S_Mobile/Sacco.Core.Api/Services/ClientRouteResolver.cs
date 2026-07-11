using Microsoft.Extensions.Options;
using Sacco.Core.Api.Configuration;

namespace Sacco.Core.Api.Services;

public sealed class ClientRouteResolver(IOptionsMonitor<BridgeRoutingOptions> options) : IClientRouteResolver
{
    public ClientRouteOptions Resolve(string clientId)
    {
        if (string.IsNullOrWhiteSpace(clientId))
        {
            throw new KeyNotFoundException("Client identifier is required.");
        }

        var routes = options.CurrentValue.Clients;
        if (!routes.TryGetValue(clientId, out var route))
        {
            throw new KeyNotFoundException($"No bridge route configured for client '{clientId}'.");
        }

        if (string.IsNullOrWhiteSpace(route.BaseUrl))
        {
            throw new KeyNotFoundException($"Client '{clientId}' has no BaseUrl configured.");
        }

        return route;
    }
}
