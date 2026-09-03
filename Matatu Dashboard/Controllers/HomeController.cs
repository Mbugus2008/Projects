using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Matatu_Dashboard.Models;
using Matatu_Dashboard.Services;

namespace Matatu_Dashboard.Controllers;

public class HomeController : Controller
{
    private readonly BusinessCentralDashboardService _dashboardService;

    public HomeController(BusinessCentralDashboardService dashboardService)
    {
        _dashboardService = dashboardService;
    }

    public async Task<IActionResult> Index(string? range, CancellationToken cancellationToken)
    {
        return View(await _dashboardService.GetDashboardAsync(range, cancellationToken));
    }

    [ResponseCache(Duration = 300, Location = ResponseCacheLocation.Any, NoStore = false)]
    public async Task<IActionResult> Share(string? range, CancellationToken cancellationToken)
    {
        return View(await _dashboardService.GetShareDashboardAsync(range, cancellationToken));
    }

    public async Task<IActionResult> Fuel(string? range, CancellationToken cancellationToken)
    {
        ViewData["Title"] = "Depot Fuel";
        ViewData["RetrievedAt"] = DateTime.Now;
        ViewData["SelectedRange"] = range?.Trim().ToLowerInvariant() switch
        {
            "yesterday" => "yesterday",
            "week" => "week",
            "month" => "month",
            _ => "today"
        };
        return View(await _dashboardService.GetSourceSectionAsync("Deport Fuel", range, cancellationToken));
    }

    public async Task<IActionResult> FuelSummary(string? range, CancellationToken cancellationToken)
    {
        ViewData["Title"] = "Dispatch & Fuel Summary";
        ViewData["RetrievedAt"] = DateTime.Now;
        var rawRange = range?.Trim().ToLowerInvariant();
        ViewData["SelectedRange"] = rawRange switch
        {
            "yesterday" => "yesterday",
            "week" => "week",
            "month" => "month",
            null or "" => "today",
            _ => rawRange // keep specific dates as-is
        };

        // Load both sections in parallel
        var summaryTask = _dashboardService.GetSourceSectionAsync("DisFuel Summary", range, cancellationToken);
        var depotTask = _dashboardService.GetSourceSectionAsync("Deport Fuel", range, cancellationToken);
        await Task.WhenAll(summaryTask, depotTask);

        ViewData["Summary"] = await summaryTask;
        return View(await depotTask);
    }

    public async Task<IActionResult> DispatchSummary(string? range, CancellationToken cancellationToken)
    {
        ViewData["Title"] = "Dispatch Summary";
        ViewData["RetrievedAt"] = DateTime.Now;
        var rawRange = range?.Trim().ToLowerInvariant();
        ViewData["SelectedRange"] = rawRange switch
        {
            "yesterday" => "yesterday",
            "week" => "week",
            "month" => "month",
            null or "" => "today",
            _ => rawRange // keep specific dates as-is
        };

        // Load both sections in parallel
        var summaryTask = _dashboardService.GetSourceSectionAsync("DisFuel Summary", range, cancellationToken);
        var depotTask = _dashboardService.GetSourceSectionAsync("Deport Fuel", range, cancellationToken);
        await Task.WhenAll(summaryTask, depotTask);

        ViewData["Summary"] = await summaryTask;
        return View(await depotTask);
    }

    public IActionResult Privacy()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
