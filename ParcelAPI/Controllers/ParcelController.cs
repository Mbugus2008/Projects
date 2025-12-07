using Microsoft.AspNetCore.Mvc;
using ParcelAPI.Clients;
using ParcelAPI.Filters;
using ParcelAPI.Models;
using ParcelAPI.Services;
using NavUsers = User;
using NavLocations = Loc;

namespace ParcelAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [ServiceFilter(typeof(ClientIdentifierFilter))]
    public class ParcelController : ControllerBase
    {
        private readonly ILogger<ParcelController> _logger;
        private readonly IClientService _clientService;

        public ParcelController(
            ILogger<ParcelController> logger,
            IClientService clientService)
        {
            _logger = logger;
            _clientService = clientService;
        }

        private string ClientId => HttpContext.Items["ClientId"]?.ToString() ?? string.Empty;
        private IClient Client => (IClient)HttpContext.Items["Client"]!;

        [HttpPost("Parcels")]
        public async Task<ActionResult<Results<Parcels.Parcel[]>>> GetParcels([FromBody] NavParcelRequest? request)
        {
            try
            {
                if (Client.NavParcelService == null)
                    return BadRequest(new Results<Parcels.Parcel[]> { Code = -1, Desc = "NAV Parcel Service not available" });

                var filters = BuildNavFilters(request);
                var parcels = await Client.NavParcelService.ReadMultipleParcelsAsync(filters, request?.PageSize ?? 100);
                return Ok(new Results<Parcels.Parcel[]> { Code = 0, Contents = parcels });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving parcels");
                return StatusCode(500, new Results<Parcels.Parcel[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("Locations")]
        public async Task<ActionResult<Results<NavLocations.Locations[]>>> GetLocations([FromBody] NavLocationRequest? request)
        {
            try
            {
                if (Client.NavLocationService == null)
                    return BadRequest(new Results<NavLocations.Locations[]> { Code = -1, Desc = "NAV Location Service not available" });

                var filters = BuildNavLocationFilters(request);
                var locations = await Client.NavLocationService.ReadMultipleLocationsAsync(filters, request?.PageSize ?? 100);
                return Ok(new Results<NavLocations.Locations[]> { Code = 0, Contents = locations });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving locations");
                return StatusCode(500, new Results<NavLocations.Locations[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("Users")]
        public async Task<ActionResult<Results<NavUsers.Parcel_Users[]>>> GetUsers()
        {
            try
            {
                var users = await Client.GetParcelUsersAsync();
                return Ok(new Results<NavUsers.Parcel_Users[]> { Code = 0, Contents = users });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving users");
                return StatusCode(500, new Results<NavUsers.Parcel_Users[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpGet("nav/parcels/{documentNo}")]
        public async Task<ActionResult<Results<Parcels.Parcel>>> GetNavParcel(string documentNo)
        {
            try
            {
                if (Client.NavParcelService == null)
                    return BadRequest(new Results<Parcels.Parcel> { Code = -1, Desc = "NAV Parcel Service not available" });

                var parcel = await Client.NavParcelService.ReadParcelAsync(documentNo);
                if (parcel == null)
                    return NotFound(new Results<Parcels.Parcel> { Code = -1, Desc = $"Parcel {documentNo} not found" });

                return Ok(new Results<Parcels.Parcel> { Code = 0, Contents = parcel });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving parcel {DocumentNo}", documentNo);
                return StatusCode(500, new Results<Parcels.Parcel> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("nav/parcels/create")]
        public async Task<ActionResult<Results<Parcels.Parcel>>> CreateNavParcel([FromBody] Parcels.Parcel parcel)
        {
            try
            {
                if (Client.NavParcelService == null)
                    return BadRequest(new Results<Parcels.Parcel> { Code = -1, Desc = "NAV Parcel Service not available" });

                var createdParcel = await Client.NavParcelService.CreateParcelAsync(parcel);
                return Ok(new Results<Parcels.Parcel> { Code = 0, Desc = $"Parcel created: {createdParcel.Document_No}", Contents = createdParcel });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error creating parcel");
                return StatusCode(500, new Results<Parcels.Parcel> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPut("nav/parcels/update")]
        public async Task<ActionResult<Results<Parcels.Parcel>>> UpdateNavParcel([FromBody] Parcels.Parcel parcel)
        {
            try
            {
                if (Client.NavParcelService == null)
                    return BadRequest(new Results<Parcels.Parcel> { Code = -1, Desc = "NAV Parcel Service not available" });

                var updatedParcel = await Client.NavParcelService.UpdateParcelAsync(parcel);
                return Ok(new Results<Parcels.Parcel> { Code = 0, Desc = "Parcel updated", Contents = updatedParcel });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error updating parcel");
                return StatusCode(500, new Results<Parcels.Parcel> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpDelete("nav/parcels/{key}")]
        public async Task<ActionResult<Results<bool>>> DeleteNavParcel(string key)
        {
            try
            {
                if (Client.NavParcelService == null)
                    return BadRequest(new Results<bool> { Code = -1, Desc = "NAV Parcel Service not available" });

                var deleted = await Client.NavParcelService.DeleteParcelAsync(key);
                return Ok(new Results<bool> { Code = deleted ? 0 : -1, Desc = deleted ? "Deleted" : "Failed", Contents = deleted });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error deleting parcel");
                return StatusCode(500, new Results<bool> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("nav/users")]
        public async Task<ActionResult<Results<NavUsers.Parcel_Users[]>>> GetNavUsers([FromBody] NavUserRequest? request)
        {
            try
            {
                if (Client.NavUserService == null)
                    return BadRequest(new Results<NavUsers.Parcel_Users[]> { Code = -1, Desc = "NAV User Service not available" });

                var filters = BuildNavUserFilters(request);
                var users = await Client.NavUserService.ReadMultipleUsersAsync(filters, request?.PageSize ?? 100);
                return Ok(new Results<NavUsers.Parcel_Users[]> { Code = 0, Contents = users });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving users from NAV");
                return StatusCode(500, new Results<NavUsers.Parcel_Users[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpGet("nav/users/{agentCode}")]
        public async Task<ActionResult<Results<NavUsers.Parcel_Users>>> GetNavUser(string agentCode)
        {
            try
            {
                if (Client.NavUserService == null)
                    return BadRequest(new Results<NavUsers.Parcel_Users> { Code = -1, Desc = "NAV User Service not available" });

                var user = await Client.NavUserService.ReadUserAsync(agentCode);
                if (user == null)
                    return NotFound(new Results<NavUsers.Parcel_Users> { Code = -1, Desc = $"User {agentCode} not found" });

                return Ok(new Results<NavUsers.Parcel_Users> { Code = 0, Contents = user });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving user {AgentCode}", agentCode);
                return StatusCode(500, new Results<NavUsers.Parcel_Users> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("nav/users/change-password")]
        public async Task<ActionResult<Results<NavUsers.Parcel_Users>>> ChangeUserPassword([FromBody] ChangePasswordRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request?.AgentCode) || string.IsNullOrEmpty(request?.Password))
                    return BadRequest(new Results<NavUsers.Parcel_Users> { Code = -1, Desc = "AgentCode and Password are required" });

                if (Client.NavUserService == null)
                    return BadRequest(new Results<NavUsers.Parcel_Users> { Code = -1, Desc = "NAV User Service not available" });

                var updatedUser = await Client.NavUserService.ChangePasswordAsync(request.AgentCode, request.Password);
                if (updatedUser == null)
                    return NotFound(new Results<NavUsers.Parcel_Users> { Code = -1, Desc = $"User {request.AgentCode} not found" });

                return Ok(new Results<NavUsers.Parcel_Users> { Code = 0, Desc = "Password changed", Contents = updatedUser });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error changing password for {AgentCode}", request?.AgentCode);
                return StatusCode(500, new Results<NavUsers.Parcel_Users> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("nav/locations")]
        public async Task<ActionResult<Results<NavLocations.Locations[]>>> GetNavLocations([FromBody] NavLocationRequest? request)
        {
            try
            {
                if (Client.NavLocationService == null)
                    return BadRequest(new Results<NavLocations.Locations[]> { Code = -1, Desc = "NAV Location Service not available" });

                var filters = BuildNavLocationFilters(request);
                var locations = await Client.NavLocationService.ReadMultipleLocationsAsync(filters, request?.PageSize ?? 100);
                return Ok(new Results<NavLocations.Locations[]> { Code = 0, Contents = locations });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving locations from NAV");
                return StatusCode(500, new Results<NavLocations.Locations[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpGet("nav/locations/{code}")]
        public async Task<ActionResult<Results<NavLocations.Locations>>> GetNavLocation(string code)
        {
            try
            {
                if (Client.NavLocationService == null)
                    return BadRequest(new Results<NavLocations.Locations> { Code = -1, Desc = "NAV Location Service not available" });

                var location = await Client.NavLocationService.ReadLocationAsync(code);
                if (location == null)
                    return NotFound(new Results<NavLocations.Locations> { Code = -1, Desc = $"Location {code} not found" });

                return Ok(new Results<NavLocations.Locations> { Code = 0, Contents = location });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving location {Code}", code);
                return StatusCode(500, new Results<NavLocations.Locations> { Code = -1, Desc = ex.Message });
            }
        }

        // ==================== Parcel Logs Endpoints ====================

        [HttpPost("nav/logs")]
        public async Task<ActionResult<Results<ParcelLogs.Parcel_Logs[]>>> GetParcelLogs([FromBody] NavParcelLogsRequest? request)
        {
            try
            {
                if (Client.NavParcelLogsService == null)
                    return BadRequest(new Results<ParcelLogs.Parcel_Logs[]> { Code = -1, Desc = "NAV Parcel Logs Service not available" });

                var filters = BuildNavParcelLogsFilters(request);
                var logs = await Client.NavParcelLogsService.ReadMultipleLogsAsync(filters, request?.PageSize ?? 100);
                return Ok(new Results<ParcelLogs.Parcel_Logs[]> { Code = 0, Contents = logs });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error retrieving parcel logs from NAV");
                return StatusCode(500, new Results<ParcelLogs.Parcel_Logs[]> { Code = -1, Desc = ex.Message });
            }
        }

        [HttpPost("nav/logs/create")]
        public async Task<ActionResult<Results<ParcelLogs.Parcel_Logs>>> CreateParcelLog([FromBody] ParcelLogs.Parcel_Logs log)
        {
            try
            {
                if (Client.NavParcelLogsService == null)
                    return BadRequest(new Results<ParcelLogs.Parcel_Logs> { Code = -1, Desc = "NAV Parcel Logs Service not available" });

                var createdLog = await Client.NavParcelLogsService.CreateLogAsync(log);
                return Ok(new Results<ParcelLogs.Parcel_Logs> { Code = 0, Desc = "Log created", Contents = createdLog });
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error creating parcel log in NAV");
                return StatusCode(500, new Results<ParcelLogs.Parcel_Logs> { Code = -1, Desc = ex.Message });
            }
        }

        private Parcels.Parcel_Filter[]? BuildNavFilters(NavParcelRequest? request)
        {
            if (request == null) return null;
            var filters = new List<Parcels.Parcel_Filter>();
            if (!string.IsNullOrEmpty(request.DocumentNo))
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Document_No, Criteria = request.DocumentNo });
            if (!string.IsNullOrEmpty(request.SenderName))
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Sender_Name, Criteria = $"*{request.SenderName}*" });
            if (!string.IsNullOrEmpty(request.ReceiverName))
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Receiver_Name, Criteria = $"*{request.ReceiverName}*" });
            if (request.Status.HasValue)
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Status, Criteria = request.Status.Value.ToString() });
            if (request.DateFrom.HasValue)
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Date_sent, Criteria = $">={request.DateFrom.Value:yyyy-MM-dd}" });
            if (request.DateTo.HasValue)
                filters.Add(new Parcels.Parcel_Filter { Field = Parcels.Parcel_Fields.Date_sent, Criteria = $"<={request.DateTo.Value:yyyy-MM-dd}" });
            return filters.Count > 0 ? filters.ToArray() : null;
        }

        private NavUsers.Parcel_Users_Filter[]? BuildNavUserFilters(NavUserRequest? request)
        {
            if (request == null) return null;
            var filters = new List<NavUsers.Parcel_Users_Filter>();
            if (!string.IsNullOrEmpty(request.AgentCode))
                filters.Add(new NavUsers.Parcel_Users_Filter { Field = NavUsers.Parcel_Users_Fields.Agent_Code, Criteria = request.AgentCode });
            if (!string.IsNullOrEmpty(request.Name))
                filters.Add(new NavUsers.Parcel_Users_Filter { Field = NavUsers.Parcel_Users_Fields.Name, Criteria = $"*{request.Name}*" });
            if (!string.IsNullOrEmpty(request.MobileNo))
                filters.Add(new NavUsers.Parcel_Users_Filter { Field = NavUsers.Parcel_Users_Fields.Mobile_No, Criteria = request.MobileNo });
            if (request.AccountType.HasValue)
                filters.Add(new NavUsers.Parcel_Users_Filter { Field = NavUsers.Parcel_Users_Fields.Account_type, Criteria = request.AccountType.Value.ToString() });
            return filters.Count > 0 ? filters.ToArray() : null;
        }

        private NavLocations.Locations_Filter[]? BuildNavLocationFilters(NavLocationRequest? request)
        {
            if (request == null) return null;
            var filters = new List<NavLocations.Locations_Filter>();
            if (!string.IsNullOrEmpty(request.Code))
                filters.Add(new NavLocations.Locations_Filter { Field = NavLocations.Locations_Fields.Code, Criteria = request.Code });
            if (!string.IsNullOrEmpty(request.Name))
                filters.Add(new NavLocations.Locations_Filter { Field = NavLocations.Locations_Fields.Name, Criteria = $"*{request.Name}*" });
            return filters.Count > 0 ? filters.ToArray() : null;
        }

        private ParcelLogs.Parcel_Logs_Filter[]? BuildNavParcelLogsFilters(NavParcelLogsRequest? request)
        {
            if (request == null) return null;
            var filters = new List<ParcelLogs.Parcel_Logs_Filter>();
            if (!string.IsNullOrEmpty(request.DocumentNo))
                filters.Add(new ParcelLogs.Parcel_Logs_Filter { Field = ParcelLogs.Parcel_Logs_Fields.Document_No, Criteria = request.DocumentNo });
            if (!string.IsNullOrEmpty(request.User))
                filters.Add(new ParcelLogs.Parcel_Logs_Filter { Field = ParcelLogs.Parcel_Logs_Fields.User, Criteria = request.User });
            if (!string.IsNullOrEmpty(request.Action))
                filters.Add(new ParcelLogs.Parcel_Logs_Filter { Field = ParcelLogs.Parcel_Logs_Fields.Action, Criteria = request.Action });
            return filters.Count > 0 ? filters.ToArray() : null;
        }
    }

    public class NavParcelRequest
    {
        public string? DocumentNo { get; set; }
        public string? SenderName { get; set; }
        public string? ReceiverName { get; set; }
        public Parcels.Status? Status { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int PageSize { get; set; } = 100;
    }

    public class NavUserRequest
    {
        public string? AgentCode { get; set; }
        public string? Name { get; set; }
        public string? MobileNo { get; set; }
        public User.Account_type? AccountType { get; set; }
        public int PageSize { get; set; } = 100;
    }

    public class NavLocationRequest
    {
        public string? Code { get; set; }
        public string? Name { get; set; }
        public int PageSize { get; set; } = 100;
    }

    public class ChangePasswordRequest
    {
        public string AgentCode { get; set; } = string.Empty;
        public string Password { get; set; } = string.Empty;
    }

    public class NavParcelLogsRequest
    {
        public string? DocumentNo { get; set; }
        public string? User { get; set; }
        public string? Action { get; set; }
        public int PageSize { get; set; } = 100;
    }
}
