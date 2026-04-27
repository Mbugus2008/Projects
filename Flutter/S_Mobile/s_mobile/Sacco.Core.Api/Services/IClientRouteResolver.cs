using Sacco.Core.Api.Configuration;

namespace Sacco.Core.Api.Services;

public interface IClientRouteResolver
{
    ClientRouteOptions Resolve(string clientId);
}
