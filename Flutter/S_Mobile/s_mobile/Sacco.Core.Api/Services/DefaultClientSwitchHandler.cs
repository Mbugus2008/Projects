using System.Text.Json.Nodes;

namespace Sacco.Core.Api.Services;

public sealed class DefaultClientSwitchHandler(IBridgeProxyService proxyService) : ClientSwitchHandlerBase(proxyService)
{
    public override bool CanHandle(string clientId) => true;
}
