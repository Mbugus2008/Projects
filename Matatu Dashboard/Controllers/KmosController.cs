using Matatu_Dashboard.Services;
using Microsoft.AspNetCore.Mvc;

namespace Matatu_Dashboard.Controllers;

/// <summary>
/// KMOS dashboard - a separate NAV instance (KmoService / company KMO) from the CityServices
/// business central that feeds HomeController. Kept in its own controller so nothing about the
/// existing screens changes.
/// </summary>
public class KmosController : Controller
{
    private readonly KmosDashboardService _kmosService;

    public KmosController(KmosDashboardService kmosService)
    {
        _kmosService = kmosService;
    }

    public async Task<IActionResult> Index(string? range, CancellationToken cancellationToken)
    {
        var model = await _kmosService.GetDashboardAsync(range, cancellationToken);
        ViewData["Title"] = "KMOS Dashboard";
        ViewData["SelectedRange"] = model.Range;
        return View(model);
    }
}
