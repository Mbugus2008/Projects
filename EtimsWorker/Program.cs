using EtimsWorker;
using EtimsWorker.Models;
using Microsoft.EntityFrameworkCore;
using Serilog;

Log.Logger = new LoggerConfiguration()
    .WriteTo.File(
        Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "sample-service.log")
    )
    .CreateLogger();

var b = Host.CreateDefaultBuilder(args).UseWindowsService(options => { options.ServiceName = "EtimsSc"; })
   .UseSerilog().
   ConfigureServices((hostContext, services) =>
            { 
    
             var configuration = hostContext.Configuration;
             services.AddDbContext<EtimsContext>(options =>
                            options.UseSqlServer(configuration.GetConnectionString("DefaultConnection")));
             services.AddHostedService<Worker>();
            })
    .Build();

b.Run();


