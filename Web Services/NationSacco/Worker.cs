using Microsoft.Extensions.Configuration;
using System.ServiceModel;

namespace NationSacco
{
    public class Worker : BackgroundService
    {
        private readonly ILogger<Worker> _logger;
        private IConfiguration _configuration;
        Nav? ss;
        private readonly ApiService _apiService;
        public Worker(ApiService apiService, ILogger<Worker> logger)
        {
            _logger = logger;
            _apiService = apiService;
        }

        protected override async Task ExecuteAsync(CancellationToken stoppingToken)
        {
            Nation nation = new Nation(_apiService, _logger);
            while (!stoppingToken.IsCancellationRequested)
            {
                if (_logger.IsEnabled(LogLevel.Information))
                {
                    _logger.LogInformation("Worker running at: {time}", DateTimeOffset.Now);
                }
                await nation.loancallbacksAsync();
                await nation.applicationcallbacksAsync();
                await nation.mobilecallbacksAsync();
                await nation.Post();
                await Task.Delay(10000, stoppingToken);
            }
        }

    }
}
