using Expense;
using Logging;
using MatatuCore.Controllers.Helpers;
using MatatuCore.Models.Database;
using MatatuCore.Services;
using MatatuCore.Services.Clients;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.HttpResults;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Posting;
using System.ServiceModel;
using System.Text;
namespace MatatuCore.Controllers
{

    [ApiController]
    [Route("api/[controller]")]
    public partial class MatatuController : ControllerBase
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly string _clientIdentifier;
        private readonly Iclient client;
        private readonly ILogger logger;
        private readonly MatatuContext _context;
        public MatatuController( IHttpContextAccessor httpContextAccessor)
        {

          try
                {
                _httpContextAccessor = httpContextAccessor;
var clientId = _httpContextAccessor.HttpContext?.Items["X-Client-Identifier"]?.ToString();
            // Default log folder if header missing
            var logFolder = string.IsNullOrEmpty(clientId) ? "Logs/General" : $"Logs/{clientId}";

            // Daily log file
            var logFilePath = Path.Combine(logFolder, $"{DateTime.Today:dd-MMM-yy}.txt");

            // Build logger
            var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder.AddProvider(new FileLoggerProvider(logFilePath));
            });

            logger = loggerFactory.CreateLogger("MatatuLogger");
   logger.LogInformation($"Base {AppContext.BaseDirectory}");
                var baseDir = AppContext.BaseDirectory;
                var configPath = Path.Combine(baseDir, "appsettings.json");

                if (System.IO.File.Exists(configPath))
                {
                   logger.LogInformation($"✅ Found appsettings.json ");
                }
                else
                {
                    logger.LogInformation($"❌ appsettings.json not found at {configPath}");
                }
                var config = new ConfigurationBuilder()
        .SetBasePath(AppContext.BaseDirectory)   // 👈 ensures correct root
        .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
        .Build();

                var connectionString = config.GetConnectionString("DefaultConnection");

            var optionsBuilder = new DbContextOptionsBuilder<MatatuContext>();
            optionsBuilder.UseSqlServer(connectionString);

            _context = new MatatuContext(optionsBuilder.Options);
         
                _httpContextAccessor = httpContextAccessor;
            var cs = _context.Database.GetDbConnection().ConnectionString;
               
            
                
         
            logger.LogInformation($"Connection string {cs}");
          
                
                    if (string.IsNullOrEmpty(clientId))
                    {
                        
                        logger.LogWarning("Request missing X-Client-Identifier header.");
                        return;
                    }

                    client = new Services.client().GetIclient(_context, clientId);

                    if (client == null)
                    {
                     
                        logger.LogWarning("No client found for X-Client-Identifier: {ClientId}", clientId);
                        return;
                    }

                
                }
                catch (Exception ex)
                {
                    logger.LogError(ex.Message); 
                logger.LogError(ex.StackTrace, ex);
                    logger.LogError(ex, "Failed to initialize client or logger in MatatuController.");
                }
            

        }
        private ILogger BuildLogger(string filePath)
        {
            var dir = Path.GetDirectoryName(filePath);
            if (!Directory.Exists(dir))
            {
                Directory.CreateDirectory(dir);
            }

            var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder
                    .AddConsole()
                    .AddDebug()
                    .AddProvider(new FileLoggerProvider(filePath));
            });
            return loggerFactory.CreateLogger("MatatuLogger");
        }

        private ILogger BuildDefaultLogger()
        {
            var defaultPath = $"Logs/General/{DateTime.Today:dd-MMM-yy}.txt";
            return BuildLogger(defaultPath);
        }
        [HttpPost("TransactionDate")]
        public Logging.Results<Matatu_Settings> TransactionDate()
        {
            try
            {             
                return new Logging.Results<Matatu_Settings>() { Contents = client.settings  };
            }
            catch (Exception ex)
            {
                logger.LogError(ex.Message);
                return new Logging.Results<Matatu_Settings>() { Code = -1, Desc = ex.Message };
            }
        }
        [HttpPost("agents")]
      
        public Logging.Results<Agents.Users[]> agents()
        {
            try
            {
                return new Logging.Results<Agents.Users[]> { Contents = client.Users() };


            }
            catch (Exception e)
            {
                logger.LogError(e.Message);
                return new Logging.Results<Agents.Users[]> { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("expenses")]
        //  [Authorize]
        public Logging.Results<Expenses[]> expences()
        {
            try
            {
                return new Logging.Results<Expenses[]>() { Contents = client.expences() };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Logging.Results<Expenses[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("NRODefects")]
     
        //  [Authorize]
        public Results<NRODefect.NRODefects[]> NRODefects()
        {
            try
            {
                return new Results<NRODefect.NRODefects[]>()
                { Contents = client.nrodefects() };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<NRODefect.NRODefects[]>() { Code = -1, Desc = e.Message };
            }
        }
       
      
        [HttpPost("Hires")]
    
        public Results<List<Hire.Hires>> gethires()
        {
            try
            {
                return new Results<List<Hire.Hires>>() { Contents = client.hires().ToList() };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<List<Hire.Hires>>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("addHires")]
        
        public Results<Hire.Hires> addhires(Hire.Hires hire)
        {
            try
            {
            

                return new Results<Hire.Hires>() { Contents = client.addhire(hire) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Hire.Hires>() { Code = -1, Desc = e.Message };
            }
        }

     

    }



    public class RequestResponseLoggingMiddleware
    {
        private readonly RequestDelegate _next;
        private  ILogger logger;

        public RequestResponseLoggingMiddleware(RequestDelegate next)
        {
            _next = next;

        }

        public async Task Invoke(HttpContext context)
        {



            // Extract client identifier from header (or default to "Unknown")
            var clientId = context.Request.Headers["X-Client-Identifier"].FirstOrDefault() ?? "UnknownClient";
            var logFolder = string.IsNullOrEmpty(clientId) ? "Logs/General/Requests" : $"Logs/{clientId}/Requests";

            // Daily log file
            var logFilePath = Path.Combine(logFolder, $"{DateTime.Today:dd-MMM-yy}.txt");

            // Build logger
            var loggerFactory = LoggerFactory.Create(builder =>
            {
                builder.AddProvider(new FileLoggerProvider(logFilePath));
            });

            logger = loggerFactory.CreateLogger("MatatuLogger");
            // Generate correlation ID for pairing request/response
            var correlationId = Guid.NewGuid().ToString();
            context.Items["CorrelationId"] = correlationId;

            try
            {

                // Create file per day


                // Capture request body
                context.Request.EnableBuffering();
                var requestBody = "";
                if (context.Request.ContentLength > 0)
                {
                    using var reader = new StreamReader(context.Request.Body, Encoding.UTF8, leaveOpen: true);
                    requestBody = await reader.ReadToEndAsync();
                    context.Request.Body.Position = 0;
                }

                var requestLog = $"[{correlationId}] Request: {context.Request.Method} {context.Request.Path} | Body: {requestBody}";
                logger.LogInformation(requestLog);
               // await File.AppendAllTextAsync(logFile, requestLog + Environment.NewLine);

                // Capture response
                var originalBodyStream = context.Response.Body;
                using var responseBody = new MemoryStream();
                context.Response.Body = responseBody;

                await _next(context);

                context.Response.Body.Seek(0, SeekOrigin.Begin);
                var responseText = await new StreamReader(context.Response.Body).ReadToEndAsync();
                context.Response.Body.Seek(0, SeekOrigin.Begin);

                var responseLog = $"[{correlationId}] Response: {context.Response.StatusCode} | Body: {responseText}";
                logger.LogInformation($"{responseLog}");
               // await File.AppendAllTextAsync(logFile, responseLog + Environment.NewLine);

                await responseBody.CopyToAsync(originalBodyStream);
            }
            catch (Exception ex)
            {
                logger.LogError(ex.Message);
                logger.LogError(ex.StackTrace, ex);

            }
        }
    }

}
