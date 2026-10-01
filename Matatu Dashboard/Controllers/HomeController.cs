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
        var (depot, summary, selectedRange) = await LoadFuelSummaryAsync(range, cancellationToken);
        ApplyFuelSummaryViewData(selectedRange);
        ViewData["Summary"] = summary;
        return View(depot);
    }

    /// <summary>
    /// Excel export of exactly what the page shows - same shaping, same order.
    ///
    /// A separate path rather than /fuelsummary/export: the page's own
    /// "fuelsummary/{range?}" route would match an "export" segment and the two
    /// would be ambiguous.
    /// </summary>
    [HttpGet("/fuelsummary-export/{range?}")]
    public async Task<IActionResult> FuelSummaryExcel(string? range, CancellationToken cancellationToken)
    {
        var report = await BuildFuelSummaryReportAsync(range, cancellationToken);
        var bytes = FuelSummaryExcelWriter.Build(report);
        var name = $"dispatch-fuel-summary-{report.Range}-{report.RetrievedAt:yyyyMMdd-HHmm}.xlsx";

        return File(bytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", name);
    }

    /// <summary>
    /// Print view of the same page: no tabs or filters, print stylesheet, and
    /// the browser's print dialog on load so it can be saved as PDF.
    /// </summary>
    [HttpGet("/fuelsummary-print/{range?}")]
    public async Task<IActionResult> FuelSummaryPrint(string? range, CancellationToken cancellationToken)
    {
        var (depot, summary, selectedRange) = await LoadFuelSummaryAsync(range, cancellationToken);
        ApplyFuelSummaryViewData(selectedRange);
        ViewData["Summary"] = summary;
        ViewData["PrintMode"] = true;
        return View("FuelSummary", depot);
    }

    /// <summary>
    /// Trip Book: pick a vehicle, see that vehicle's trips for the day and the
    /// settlement that follows from them.
    /// </summary>
    [HttpGet("/tripbook/{range?}")]
    public async Task<IActionResult> TripBook(string? range, CancellationToken cancellationToken)
    {
        var selectedRange = NormalizeRange(range);

        // Depot gives the vehicle list plus each vehicle's management figure,
        // the waybill gives crew/cash and the trips hang off its entry number.
        var depotTask = _dashboardService.GetSourceSectionAsync("Deport Fuel", range, cancellationToken);
        var waybillsTask = _dashboardService.GetSourceSectionAsync("Waybill", range, cancellationToken);
        var tripsTask = _dashboardService.GetSourceSectionAsync("Waybill Trip", range, cancellationToken);
        await Task.WhenAll(depotTask, waybillsTask, tripsTask);

        ViewData["Title"] = "Trip Book";
        ViewData["RetrievedAt"] = DateTime.Now;
        ViewData["SelectedRange"] = selectedRange;

        return View(TripBookBuilder.Build(
            await depotTask, await waybillsTask, await tripsTask, selectedRange, DateTime.Now));
    }

    /// <summary>
    /// Loading performance: how often vehicles reach the loading points, find the bay full and
    /// have to go round, versus trips that loaded normally.
    /// </summary>
    [HttpGet("/loading/{range?}")]
    public async Task<IActionResult> Loading(string? range, CancellationToken cancellationToken)
    {
        ViewData["Title"] = "Loading Performance";
        ViewData["RetrievedAt"] = DateTime.Now;
        ViewData["SelectedRange"] = NormalizeRange(range);
        return View(await _dashboardService.GetLoadingTripsAsync(range, cancellationToken));
    }

    private async Task<FuelSummaryReport> BuildFuelSummaryReportAsync(
        string? range,
        CancellationToken cancellationToken)
    {
        var (depot, summary, selectedRange) = await LoadFuelSummaryAsync(range, cancellationToken);
        return FuelSummaryReportBuilder.Build(depot, summary, selectedRange, DateTime.Now);
    }

    /// <summary>
    /// Waybill summary: entries in range plus the trips that hang off them.
    /// </summary>
    [HttpGet("/waybillsummary/{range?}")]
    public async Task<IActionResult> WaybillSummary(string? range, CancellationToken cancellationToken)
    {
        var report = await BuildWaybillReportAsync(range, cancellationToken);
        ApplyWaybillViewData(report.Range);
        return View(report);
    }

    [HttpGet("/waybillsummary-export/{range?}")]
    public async Task<IActionResult> WaybillSummaryExcel(string? range, CancellationToken cancellationToken)
    {
        var report = await BuildWaybillReportAsync(range, cancellationToken);
        var bytes = WaybillExcelWriter.Build(report);
        var name = $"waybill-summary-{report.Range}-{report.RetrievedAt:yyyyMMdd-HHmm}.xlsx";

        return File(bytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", name);
    }

    [HttpGet("/waybillsummary-print/{range?}")]
    public async Task<IActionResult> WaybillSummaryPrint(string? range, CancellationToken cancellationToken)
    {
        var report = await BuildWaybillReportAsync(range, cancellationToken);
        ApplyWaybillViewData(report.Range);
        ViewData["PrintMode"] = true;
        return View("WaybillSummary", report);
    }

    private async Task<WaybillReport> BuildWaybillReportAsync(
        string? range,
        CancellationToken cancellationToken)
    {
        // Trips carry no date of their own, so they come back unfiltered and are
        // matched to the in-range waybills by entry number.
        var waybillsTask = _dashboardService.GetSourceSectionAsync("Waybill", range, cancellationToken);
        var tripsTask = _dashboardService.GetSourceSectionAsync("Waybill Trip", range, cancellationToken);
        await Task.WhenAll(waybillsTask, tripsTask);

        return WaybillReportBuilder.Build(
            await waybillsTask, await tripsTask, NormalizeRange(range), DateTime.Now);
    }

    private void ApplyWaybillViewData(string selectedRange)
    {
        ViewData["Title"] = "Waybill Summary";
        ViewData["RetrievedAt"] = DateTime.Now;
        ViewData["SelectedRange"] = selectedRange;
    }

    /// <summary>Maps the route segment onto the range names the service expects.</summary>
    private static string NormalizeRange(string? range)
    {
        var rawRange = range?.Trim().ToLowerInvariant();
        return rawRange switch
        {
            "yesterday" => "yesterday",
            "week" => "week",
            "month" => "month",
            null or "" => "today",
            _ => rawRange // keep specific dates as-is
        };
    }

    /// <summary>Loads both sections of the Dispatch &amp; Fuel Summary in parallel.</summary>
    private async Task<(DashboardSectionViewModel Depot, DashboardSectionViewModel Summary, string Range)>
        LoadFuelSummaryAsync(string? range, CancellationToken cancellationToken)
    {
        var selectedRange = NormalizeRange(range);

        var summaryTask = _dashboardService.GetSourceSectionAsync("DisFuel Summary", range, cancellationToken);
        var depotTask = _dashboardService.GetSourceSectionAsync("Deport Fuel", range, cancellationToken);
        await Task.WhenAll(summaryTask, depotTask);

        return (await depotTask, await summaryTask, selectedRange);
    }

    private void ApplyFuelSummaryViewData(string selectedRange)
    {
        ViewData["Title"] = "Dispatch & Fuel Summary";
        ViewData["RetrievedAt"] = DateTime.Now;
        ViewData["SelectedRange"] = selectedRange;
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
