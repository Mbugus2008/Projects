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

    [ResponseCache(Duration = 300, Location = ResponseCacheLocation.Any, NoStore = false)]
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
