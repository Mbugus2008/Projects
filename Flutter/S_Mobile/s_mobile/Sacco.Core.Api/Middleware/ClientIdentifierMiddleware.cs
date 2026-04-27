using Sacco.Core.Api.Contracts;

namespace Sacco.Core.Api.Middleware;

public sealed class ClientIdentifierMiddleware(RequestDelegate next)
{
    public const string HeaderName = "X-Client-Identifier";
    public const string ContextKey = "ClientIdentifier";

    public async Task InvokeAsync(HttpContext context)
    {
        if (context.Request.Path.StartsWithSegments("/swagger", StringComparison.OrdinalIgnoreCase))
        {
            await next(context);
            return;
        }

        if (!context.Request.Headers.TryGetValue(HeaderName, out var values) || string.IsNullOrWhiteSpace(values.FirstOrDefault()))
        {
            context.Response.StatusCode = StatusCodes.Status400BadRequest;
            await context.Response.WriteAsJsonAsync(Results<object>.Failure($"Missing required header: {HeaderName}"));
            return;
        }

        context.Items[ContextKey] = values.First()!.Trim();
        await next(context);
    }
}
