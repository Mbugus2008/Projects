namespace MatatuCore.Controllers.Helpers
{
    public class ClientIdentifierMiddleware
    {
        private readonly RequestDelegate _next;

        public ClientIdentifierMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            if (context.Request.Headers.TryGetValue("X-Client-Identifier", out var clientId))
            {
                context.Items["X-Client-Identifier"] = clientId.ToString();
            }
            

            await _next(context);
        }
    }
}
