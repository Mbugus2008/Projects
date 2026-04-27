using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;
using Sacco.Core.Api.Configuration;
using Sacco.Core.Api.Data;
using Sacco.Core.Api.Middleware;
using Sacco.Core.Api.Services;
using Serilog;
using Serilog.Events;
using System.Net;

var builder = WebApplication.CreateBuilder(args);

var logDirectory = Path.Combine(AppContext.BaseDirectory, "logs");
Directory.CreateDirectory(logDirectory);

builder.Host.UseSerilog((_, configuration) =>
    configuration
        .MinimumLevel.Information()
        .MinimumLevel.Override("Microsoft.AspNetCore", LogEventLevel.Warning)
        .Enrich.FromLogContext()
        .WriteTo.Console()
        .WriteTo.File(
            Path.Combine(logDirectory, "api-.log"),
            rollingInterval: RollingInterval.Day,
            retainedFileCountLimit: 14,
            shared: true));

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.AddSecurityDefinition("ClientIdentifier", new OpenApiSecurityScheme
    {
        Name = ClientIdentifierMiddleware.HeaderName,
        Type = SecuritySchemeType.ApiKey,
        In = ParameterLocation.Header,
        Description = "Required client identifier header."
    });

    options.AddSecurityRequirement(new OpenApiSecurityRequirement
    {
        {
            new OpenApiSecurityScheme
            {
                Reference = new OpenApiReference
                {
                    Type = ReferenceType.SecurityScheme,
                    Id = "ClientIdentifier"
                }
            },
            Array.Empty<string>()
        }
    });
});

builder.Services.AddDbContext<MobileDbContext>(options =>
{
    var connectionString = builder.Configuration.GetConnectionString("MobileDb")
        ?? throw new InvalidOperationException("Connection string 'MobileDb' is not configured.");

    options.UseSqlServer(connectionString);
});

builder.Services.Configure<BridgeRoutingOptions>(
    builder.Configuration.GetSection("BridgeRouting"));

builder.Services.AddSingleton<IClientRouteResolver, ClientRouteResolver>();
builder.Services.AddHttpClient<IBridgeProxyService, BridgeProxyService>(client =>
{
    client.Timeout = TimeSpan.FromSeconds(60);
})
.ConfigurePrimaryHttpMessageHandler(() => new HttpClientHandler
{
    // Downstream services may return gzip/deflate/brotli responses.
    AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate | DecompressionMethods.Brotli,
});
builder.Services.AddScoped<IClientSwitchHandler, BarakaYetuSwitchHandler>();
builder.Services.AddScoped<IClientSwitchHandler, DefaultClientSwitchHandler>();
builder.Services.AddScoped<IBridgeSwitchService, BridgeSwitchService>();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseSerilogRequestLogging();
app.UseHttpsRedirection();
app.UseMiddleware<ClientIdentifierMiddleware>();

app.MapControllers();

app.Run();
