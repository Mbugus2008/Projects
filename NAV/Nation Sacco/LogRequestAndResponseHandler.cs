using Serilog;
using Serilog.Context;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;



public class RequestResponseLoggingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<RequestResponseLoggingMiddleware> _logger;

    public RequestResponseLoggingMiddleware(RequestDelegate next, ILogger<RequestResponseLoggingMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task Invoke(HttpContext context)
    {
        // Log the request
        _logger.LogInformation($"Request: {context.Request.Method} {context.Request.Path}");

        // Copy a pointer to the original response body stream
        var originalBodyStream = context.Response.Body;

        // Create a new memory stream to capture the response
        using (var responseBody = new MemoryStream())
        {
            // Replace the original response body stream with the memory stream
            context.Response.Body = responseBody;

            // Call the next middleware in the pipeline
            await _next(context);

            // Log the response
            responseBody.Seek(0, SeekOrigin.Begin);
            var responseBodyText = await new StreamReader(responseBody).ReadToEndAsync();
            _logger.LogInformation($"Response: {responseBodyText}");

            // Copy the contents of the new memory stream to the original stream
            responseBody.Seek(0, SeekOrigin.Begin);
            await responseBody.CopyToAsync(originalBodyStream);
        }
    }
}
