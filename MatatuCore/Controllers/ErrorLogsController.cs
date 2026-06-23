using Logging;
using MatatuCore.Controllers.Helpers;
using MatatuCore.Models.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace MatatuCore.Controllers;

[ApiController]
[Route("api/[controller]")]
public class ErrorLogsController : ControllerBase
{
    private readonly IHttpContextAccessor _httpContextAccessor;
    private readonly ILogger _logger;
    private readonly MatatuContext _context;

    public ErrorLogsController(IHttpContextAccessor httpContextAccessor)
    {
        _httpContextAccessor = httpContextAccessor;

        var clientId = _httpContextAccessor.HttpContext?.Items["X-Client-Identifier"]?.ToString();
        var logFolder = string.IsNullOrEmpty(clientId) ? "Logs/General" : $"Logs/{clientId}";
        var logFilePath = Path.Combine(logFolder, $"{DateTime.Today:dd-MMM-yy}.txt");

        var loggerFactory = LoggerFactory.Create(builder =>
        {
            builder.AddProvider(new FileLoggerProvider(logFilePath));
        });
        _logger = loggerFactory.CreateLogger("MatatuLogger");

        var baseDir = AppContext.BaseDirectory;
        var configPath = Path.Combine(baseDir, "appsettings.json");
        var config = new ConfigurationBuilder()
            .SetBasePath(AppContext.BaseDirectory)
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .Build();

        var connectionString = config.GetConnectionString("DefaultConnection");
        var optionsBuilder = new DbContextOptionsBuilder<MatatuContext>();
        optionsBuilder.UseSqlServer(connectionString);
        _context = new MatatuContext(optionsBuilder.Options);
    }

    /// <summary>
    /// Submit client-side errors for logging.
    /// </summary>
    [HttpPost]
    public IActionResult PostErrors([FromBody] ErrorLogRequest request)
    {
        try
        {
            if (request?.Errors == null || request.Errors.Count == 0)
                return BadRequest("No errors provided.");

            var clientId = _httpContextAccessor.HttpContext?.Items["X-Client-Identifier"]?.ToString();

            var logs = new List<ErrorLog>();
            foreach (var err in request.Errors)
            {
                logs.Add(new ErrorLog
                {
                    ClientId = clientId ?? request.Device?.ClientId,
                    Timestamp = err.Timestamp ?? DateTime.UtcNow,
                    Level = err.Level,
                    Message = err.Message,
                    ExceptionType = err.ExceptionType,
                    StackTrace = err.StackTrace,
                    Screen = err.Screen,
                    Action = err.Action,
                    Endpoint = err.Endpoint,
                    HttpStatusCode = err.HttpStatusCode,
                    Extra = err.Extra != null
                        ? System.Text.Json.JsonSerializer.Serialize(err.Extra)
                        : null,
                    DeviceId = request.Device?.DeviceId,
                    DeviceModel = request.Device?.DeviceModel,
                    OsVersion = request.Device?.OsVersion,
                    AppVersion = request.Device?.AppVersion,
                    AgentCode = request.User?.AgentCode,
                    AgentName = request.User?.AgentName,
                    Status = ErrorStatus.New,
                    CreatedAt = DateTime.UtcNow
                });
            }

            _context.ErrorLogs.AddRange(logs);
            _context.SaveChanges();

            _logger.LogInformation($"Logged {logs.Count} error(s) for client {clientId}");
            return Ok(new { Count = logs.Count });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error logging client errors");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Get error logs with optional filters.
    /// </summary>
    [HttpGet]
    public IActionResult GetErrors(
        [FromQuery] ErrorStatus? status = null,
        [FromQuery] string? agentCode = null,
        [FromQuery] string? level = null,
        [FromQuery] int days = 7,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 50)
    {
        try
        {
            var query = _context.ErrorLogs.AsQueryable();
            var since = DateTime.UtcNow.AddDays(-days);
            query = query.Where(e => e.CreatedAt >= since);

            if (status.HasValue)
                query = query.Where(e => e.Status == status.Value);
            if (!string.IsNullOrEmpty(agentCode))
                query = query.Where(e => e.AgentCode == agentCode);
            if (!string.IsNullOrEmpty(level))
                query = query.Where(e => e.Level == level);

            var total = query.Count();
            var items = query
                .OrderByDescending(e => e.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return Ok(new { Total = total, Page = page, PageSize = pageSize, Items = items });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error fetching error logs");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Get unresolved error logs.
    /// </summary>
    [HttpGet("unresolved")]
    public IActionResult GetUnresolved(
        [FromQuery] string? agentCode = null,
        [FromQuery] string? level = null,
        [FromQuery] int page = 1,
        [FromQuery] int pageSize = 50)
    {
        try
        {
            var query = _context.ErrorLogs
                .Where(e => e.Status != ErrorStatus.Resolved && e.Status != ErrorStatus.Ignored);

            if (!string.IsNullOrEmpty(agentCode))
                query = query.Where(e => e.AgentCode == agentCode);
            if (!string.IsNullOrEmpty(level))
                query = query.Where(e => e.Level == level);

            var total = query.Count();
            var items = query
                .OrderByDescending(e => e.CreatedAt)
                .Skip((page - 1) * pageSize)
                .Take(pageSize)
                .ToList();

            return Ok(new { Total = total, Page = page, PageSize = pageSize, Items = items });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error fetching unresolved error logs");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Get a single error log by ID.
    /// </summary>
    [HttpGet("{id}")]
    public IActionResult GetError(int id)
    {
        try
        {
            var log = _context.ErrorLogs.Find(id);
            if (log == null)
                return NotFound();
            return Ok(log);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error fetching error log {id}");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Resolve a single error log.
    /// </summary>
    [HttpPut("{id}/resolve")]
    public IActionResult ResolveError(int id, [FromBody] ResolveErrorRequest request)
    {
        try
        {
            var log = _context.ErrorLogs.Find(id);
            if (log == null)
                return NotFound();

            log.Status = request.Status;
            log.ResolutionComments = request.Comments;
            log.ResolvedBy = request.ResolvedBy;
            log.ResolvedAt = DateTime.UtcNow;

            _context.SaveChanges();
            return Ok(log);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"Error resolving error log {id}");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Bulk resolve multiple error logs.
    /// </summary>
    [HttpPut("bulk-resolve")]
    public IActionResult BulkResolve([FromBody] BulkResolveRequest request)
    {
        try
        {
            if (request.Ids == null || request.Ids.Count == 0)
                return BadRequest("No IDs provided.");

            var logs = _context.ErrorLogs.Where(e => request.Ids.Contains(e.Id)).ToList();
            foreach (var log in logs)
            {
                log.Status = request.Status;
                log.ResolutionComments = request.Comments;
                log.ResolvedBy = request.ResolvedBy;
                log.ResolvedAt = DateTime.UtcNow;
            }

            _context.SaveChanges();
            return Ok(new { Count = logs.Count });
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error bulk resolving error logs");
            return StatusCode(500, ex.Message);
        }
    }

    /// <summary>
    /// Get error log summary counts.
    /// </summary>
    [HttpGet("summary")]
    public IActionResult GetSummary([FromQuery] int days = 7)
    {
        try
        {
            var since = DateTime.UtcNow.AddDays(-days);
            var query = _context.ErrorLogs.Where(e => e.CreatedAt >= since);

            var summary = new ErrorLogSummary
            {
                Total = query.Count(),
                New = query.Count(e => e.Status == ErrorStatus.New),
                Acknowledged = query.Count(e => e.Status == ErrorStatus.Acknowledged),
                Investigating = query.Count(e => e.Status == ErrorStatus.Investigating),
                Resolved = query.Count(e => e.Status == ErrorStatus.Resolved),
                Ignored = query.Count(e => e.Status == ErrorStatus.Ignored),
                Reopened = query.Count(e => e.Status == ErrorStatus.Reopened)
            };

            return Ok(summary);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Error fetching error log summary");
            return StatusCode(500, ex.Message);
        }
    }
}
