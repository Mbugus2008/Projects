using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;

namespace Matatu_Dashboard.Services;

public sealed class ShareDashboardWarmService : BackgroundService
{
    private readonly IServiceScopeFactory _scopeFactory;
    private readonly IOptions<BusinessCentralDashboardOptions> _options;
    private readonly ILogger<ShareDashboardWarmService> _logger;

    public ShareDashboardWarmService(
        IServiceScopeFactory scopeFactory,
        IOptions<BusinessCentralDashboardOptions> options,
        ILogger<ShareDashboardWarmService> logger)
    {
        _scopeFactory = scopeFactory;
        _options = options;
        _logger = logger;
    }

    public override Task StartAsync(CancellationToken cancellationToken)
    {
        if (!_options.Value.EnableSharePrewarm)
        {
            _logger.LogInformation("Public dashboard prewarm is disabled.");
            return base.StartAsync(cancellationToken);
        }

        // Kick off the initial warm without blocking application startup.
        _ = WarmShareDashboardSafeAsync(CancellationToken.None);
        return base.StartAsync(cancellationToken);
    }

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        if (!_options.Value.EnableSharePrewarm)
        {
            return;
        }

        using var timer = new PeriodicTimer(GetWarmInterval(_options.Value));

        while (await timer.WaitForNextTickAsync(stoppingToken))
        {
            await WarmShareDashboardSafeAsync(stoppingToken);
        }
    }

    private async Task WarmShareDashboardSafeAsync(CancellationToken cancellationToken)
    {
        try
        {
            await WarmShareDashboardAsync(cancellationToken);
        }
        catch (OperationCanceledException) when (cancellationToken.IsCancellationRequested)
        {
        }
        catch (Exception ex)
        {
            _logger.LogWarning(ex, "Failed to prewarm the public dashboard cache.");
        }
    }

    private async Task WarmShareDashboardAsync(CancellationToken cancellationToken)
    {
        using var scope = _scopeFactory.CreateScope();
        var dashboardService = scope.ServiceProvider.GetRequiredService<BusinessCentralDashboardService>();
        var warmRanges = GetWarmRanges(_options.Value);

        _logger.LogInformation("Prewarming public dashboard for ranges: {Ranges}", string.Join(", ", warmRanges));
        await dashboardService.WarmShareDashboardAsync(warmRanges, cancellationToken);
    }

    private static TimeSpan GetWarmInterval(BusinessCentralDashboardOptions options)
    {
        var cacheSeconds = Math.Max(30, options.ShareCacheSeconds);
        var leadSeconds = Math.Clamp(options.ShareWarmLeadSeconds, 5, Math.Max(5, cacheSeconds - 5));
        return TimeSpan.FromSeconds(Math.Max(30, cacheSeconds - leadSeconds));
    }

    private static IReadOnlyList<string> GetWarmRanges(BusinessCentralDashboardOptions options)
    {
        var warmRanges = options.ShareWarmRanges
            .Where(range => !string.IsNullOrWhiteSpace(range))
            .Select(range => range.Trim())
            .Distinct(StringComparer.OrdinalIgnoreCase)
            .ToList();

        return warmRanges.Count == 0 ? ["today"] : warmRanges;
    }
}