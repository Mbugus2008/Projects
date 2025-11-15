using Logging;
using MatatuCore.Controllers.Helpers;
using MatatuCore.Models.Database;
using MatatuCore.Services;
using MemberAccounts;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;


namespace MatatuCore.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class MembersController : ControllerBase
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly Iclient client;
        private readonly ILogger logger;
        private readonly MatatuContext _context;

        public MembersController(IHttpContextAccessor httpContextAccessor)
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
                    logger.LogInformation($"✅ Found appsettings.json at {configPath}");
                }
                else
                {
                    logger.LogInformation($"❌ appsettings.json not found at {configPath}");
                }

                var config = new ConfigurationBuilder()
                    .SetBasePath(AppContext.BaseDirectory)
                    .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
                    .Build();

                var connectionString = config.GetConnectionString("DefaultConnection");

                var optionsBuilder = new DbContextOptionsBuilder<MatatuContext>();
                optionsBuilder.UseSqlServer(connectionString);

                _context = new MatatuContext(optionsBuilder.Options);

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
                logger.LogError(ex, "Failed to initialize client or logger in MembersController.");
            }
        }

        [HttpPost("GetAllMembers")]
        public Results<Member.Members[]> GetAllMembers()
        {
            try
            {
                logger.LogInformation("GetAllMembers called - attempting to retrieve all members");
                
                // Create an empty request to get all members
                var emptyRequest = new ClientRequest();
                var members = client.getmembers(emptyRequest);
                
                if (members == null)
                {
                    logger.LogWarning("getmembers returned null");
                    return new Results<Member.Members[]> { Contents = Array.Empty<Member.Members>(), Code = 0, Desc = "No members found" };
                }
                
                logger.LogInformation($"Retrieved {members.Length} member(s)");
                
                return new Results<Member.Members[]> { Contents = members };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetAllMembers");
                return new Results<Member.Members[]> { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("GetMember")]
        public Results<Member.Members> GetMember(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetMember called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");
                
                var member = client.getmember(request);
                
                if (member == null)
                {
                    logger.LogWarning("getmember returned null");
                    return new Results<Member.Members> { Code = 404, Desc = "Member not found" };
                }
                
                logger.LogInformation($"Retrieved member: {member.No}");
                
                return new Results<Member.Members> { Contents = member };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetMember");
                return new Results<Member.Members> { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("GetMemberVehicles")]
        public Results<Vbasics.VehiclesBasics[]> GetMemberVehicles(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetMemberVehicles called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");
                
                var vehicles = client.getmembervehicles(request);
                
                if (vehicles == null)
                {
                    logger.LogWarning("getvehicles returned null");
                    return new Results<Vbasics.VehiclesBasics[]> { Contents = Array.Empty<Vbasics.VehiclesBasics>(), Code = 0, Desc = "No vehicles found" };
                }
                
                logger.LogInformation($"Retrieved {vehicles.Length} vehicle(s)");
                
                return new Results<Vbasics.VehiclesBasics[]> { Contents = vehicles };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetMemberVehicles");
                return new Results<Vbasics.VehiclesBasics[]> { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("GetMemberLoans")]
        public Results<Loan. Loans[]> GetMemberLoans(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetMemberLoans called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");
                
                var loans = client.getmemberloans(request);
                
                if (loans == null || loans.Length == 0)
                {
                    logger.LogWarning("No loans found");
                    return new Results<Loan.Loans[]> { Contents = Array.Empty<Loan.Loans>(), Code = 0, Desc = "No loans found" };
                }
                
                logger.LogInformation($"Retrieved {loans.Length} loan(s)");

                return new Results<Loan.Loans[]> { Contents = loans };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetMemberLoans");
                return new Results<Loan.Loans[]> { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("GetMemberAccounts")]
        public Results<Accounts[]> GetMemberAccounts(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetMemberAccounts called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");
                
                var accounts = client.getmemberaccounts(request);
                
                if (accounts == null || accounts.Length == 0)
                {
                    logger.LogWarning("No accounts found");
                    return new Results<Accounts[]> { Contents = Array.Empty<Accounts>(), Code = 0, Desc = "No accounts found" };
                }
                
                logger.LogInformation($"Retrieved {accounts.Length} account(s)");
                
                return new Results<Accounts[]> { Contents = accounts };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetMemberAccounts");
                return new Results<Accounts[]> { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("GetAccountEntries")]
        public Results<Entries. AccountEntries[]> GetAccountEntries(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetMemberAccounts called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");

                var accounts = client.getaccountentries(request);

                if (accounts == null || accounts.Length == 0)
                {
                    logger.LogWarning("No accounts found");
                    return new Results<Entries.AccountEntries[]> { Contents = Array.Empty<Entries.AccountEntries>(), Code = 0, Desc = "No accounts found" };
                }

                logger.LogInformation($"Retrieved {accounts.Length} account(s)");

                return new Results<Entries.AccountEntries[]> { Contents = accounts };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetMemberAccounts");
                return new Results<Entries.AccountEntries[]> { Code = -1, Desc = e.Message };
            }
        }

[HttpPost("GetLoanEntries")]
        public Results<Entries.AccountEntries[]> GetLoanEntries(ClientRequest request)
        {
            try
            {
                logger.LogInformation($"GetLoanEntries called with request: {System.Text.Json.JsonSerializer.Serialize(request)}");

                var accounts = client.getloanentries(request);

                if (accounts == null || accounts.Length == 0)
                {
                    logger.LogWarning("No loan entries found");
                    return new Results<Entries.AccountEntries[]> { Contents = Array.Empty<Entries.AccountEntries>(), Code = 0, Desc = "No loan entries found" };
                }

                logger.LogInformation($"Retrieved {accounts.Length} loan entry(s)");

                return new Results<Entries.AccountEntries[]> { Contents = accounts };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in GetLoanEntries");
                return new Results<Entries.AccountEntries[]> { Code = -1, Desc = e.Message };
            }
        }


    }
}
