using Logging;
using MatatuCore.Controllers.Helpers;
using MatatuCore.Models.Database;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Parcels;

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
                var logFolder = string.IsNullOrEmpty(clientId) ? "Logs/Parcel" : $"Logs/{clientId}";

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
        [HttpPost("Parcels")]

        public Results<Parcels.Parcel []> Parcels(Request request)
        {
            try
            {

                return new Results<Parcels.Parcel[]>()
                {
                    Contents = client.getparcels(request)
                };
            }
            catch (Exception e)
            {

                return new Results<Parcels.Parcel[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("Locations")]

        public Results<Location.Locations[]> locations()
        {
            try
            {
                return new Results<Location.Locations[]>()
                {
                    Contents = client.getlocations()
                };
            }
            catch (Exception e)
            {

                return new Results<Location.Locations[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("updateparcels")]

        public Results<Parcels.Parcel> updateParcels(Parcels  .Parcel request)
        {
            try
            {

                return new Results<Parcels.Parcel>()
                {
                    Contents = client.Addeditparcel(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Parcels.Parcel>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("Users")]

        public Logging.Results<Agents.Users[]> agents()
        {
            try
            {
                return new Logging.Results<Agents.Users[]> { Contents = client.Users().Where(o => o.Account_type == Agents.Account_type.Parcel).ToArray() };


            }
            catch (Exception e)
            {
                logger.LogError(e.Message);
                return new Logging.Results<Agents.Users[]> { Code = -1, Desc = e.Message };
            }
        }
    }
}
