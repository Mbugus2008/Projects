using NationSacco;
using Serilog;
var logFilePath = System.IO.Path.Combine(AppContext.BaseDirectory, "logs", ".log");
Log.Logger = new LoggerConfiguration()
    .WriteTo.Console() // Log to console
    .WriteTo.File(logFilePath, rollingInterval: RollingInterval.Day) // Log to file
    .CreateLogger();

var host = Host.CreateDefaultBuilder(args)
    .UseWindowsService() // Enable running as a Windows Service
     
    .ConfigureServices((context, services) =>
    {
        services.AddHttpClient<ApiService>();
        services.AddHostedService<Worker>();
    })
 .UseSerilog()
    .Build();

await host.RunAsync();

host.Run();
