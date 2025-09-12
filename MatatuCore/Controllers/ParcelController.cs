using MatatuCore.Controllers.Helpers;
using MatatuCore.Models.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MatatuCore.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ParcelController : ControllerBase
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly string _clientIdentifier;
        private readonly Services. Iclient client;
        private readonly ILogger logger;
        private readonly MatatuContext _context;
        public ParcelController(IHttpContextAccessor httpContextAccessor)
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
                }
                );
                logger = loggerFactory.CreateLogger("MatatuLogger");
                logger.LogInformation($"Base {AppContext.BaseDirectory}");
                var baseDir = AppContext.BaseDirectory;
                var configPath = Path.Combine(baseDir, "appsettings.json");

                if (System.IO.File.Exists(configPath))
                {
                    logger.LogInformation($"✅ Found appsettings.json at {configPath}");
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

                client =new Services.client(). GetIclient(_context, clientId);

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

    }
}
