using System.ServiceModel;
using ParcelAPI.Models;

namespace ParcelAPI.Services
{
    public interface INavUserService
    {
        Task<User.Parcel_Users?> ReadUserAsync(string agentCode);
        Task<User.Parcel_Users[]> ReadMultipleUsersAsync(User.Parcel_Users_Filter[]? filters, int pageSize = 100);
        Task<User.Parcel_Users?> ChangePasswordAsync(string agentCode, string newPassword);
    }

    public class NavUserService : INavUserService, IDisposable
    {
        private readonly User.Parcel_Users_PortClient _client;
        private readonly ILogger<NavUserService> _logger;
        private readonly Client _clientInfo;
        private bool _disposed;

        public NavUserService(Client clientInfo, ILogger<NavUserService> logger)
        {
            _clientInfo = clientInfo;
            _logger = logger;
            
            // Initialize client using helper
            _client = NavClientHelper.InitializeClient<User.Parcel_Users>(clientInfo);
            
            _logger.LogInformation("NavUserService initialized for client {ClientCode} at {Host}:{Port}",
                clientInfo.ClientCode, clientInfo.IPAddress, clientInfo.Port);
        }

        public async Task<User.Parcel_Users?> ReadUserAsync(string agentCode)
        {
            try
            {
                _logger.LogInformation("Reading user {AgentCode} from NAV for client {ClientCode}", 
                    agentCode, _clientInfo.ClientCode);
                
                var result = await _client.ReadAsync(agentCode);
                return result?.Parcel_Users;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error reading user {AgentCode} from NAV", agentCode);
                throw;
            }
        }

        public async Task<User.Parcel_Users[]> ReadMultipleUsersAsync(User.Parcel_Users_Filter[]? filters, int pageSize = 100)
        {
            try
            {
                _logger.LogInformation("Reading multiple users from NAV for client {ClientCode}", 
                    _clientInfo.ClientCode);
                
                var result = await _client.ReadMultipleAsync(filters ?? [], string.Empty, pageSize);
                return result?.ReadMultiple_Result1 ?? [];
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error reading multiple users from NAV");
                throw;
            }
        }

        public async Task<User.Parcel_Users?> ChangePasswordAsync(string agentCode, string newPassword)
        {
            try
            {
                _logger.LogInformation("Changing password for user {AgentCode} in NAV for client {ClientCode}", 
                    agentCode, _clientInfo.ClientCode);
                
                // First, read the user to get the current record with Key
                var user = await ReadUserAsync(agentCode);
                if (user == null)
                {
                    _logger.LogWarning("User {AgentCode} not found for password change", agentCode);
                    return null;
                }
                
                // Update the password field
                user.Password = newPassword;
                
                // Call the Update method
                var updateRequest = new User.Update(user);
                var result = await _client.UpdateAsync(updateRequest);
                
                _logger.LogInformation("Password changed successfully for user {AgentCode}", agentCode);
                return result?.Parcel_Users;
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Error changing password for user {AgentCode} in NAV", agentCode);
                throw;
            }
        }

        public void Dispose()
        {
            if (!_disposed)
            {
                try
                {
                    if (_client.State == CommunicationState.Opened)
                    {
                        _client.Close();
                    }
                }
                catch
                {
                    _client.Abort();
                }
                _disposed = true;
            }
        }
    }
}
