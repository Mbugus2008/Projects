using Matatu_Dashboard.Models;

namespace Matatu_Dashboard.Services;

/// <summary>
/// The shaped waybill picture: headline figures, one row per waybill and the
/// trips behind them.
///
/// Waybill trips carry no date of their own, so they are pulled unfiltered and
/// matched to the waybills in range through Weign_Bridge_id (the waybill's
/// Entry_No). Doing that join in one place keeps the page, the Excel export and
/// the print view identical.
/// </summary>
public sealed class WaybillReport
{
    public List<FuelSummaryTile> Tiles { get; init; } = [];

    /// <summary>One row per waybill, ordered by fleet.</summary>
    public List<Dictionary<string, string>> Waybills { get; init; } = [];

    /// <summary>Trips belonging to those waybills.</summary>
    public List<Dictionary<string, string>> Trips { get; init; } = [];

    public string Range { get; init; } = "today";

    public DateTime RetrievedAt { get; init; } = DateTime.Now;

    public static string Value(Dictionary<string, string> row, string column, string fallback = "")
        => row.TryGetValue(column, out var value) && !string.IsNullOrWhiteSpace(value)
            ? value
            : fallback;

    public static decimal Number(Dictionary<string, string> row, string column)
        => row.TryGetValue(column, out var value) && decimal.TryParse(value, out var parsed) ? parsed : 0m;

    public static int Whole(Dictionary<string, string> row, string column)
        => row.TryGetValue(column, out var value) && int.TryParse(value, out var parsed) ? parsed : 0;

    /// <summary>Driver and conductor, member number first - same shape as the depot table.</summary>
    public static (string DriverNo, string ConductorNo) Crew(Dictionary<string, string> row) =>
        (Value(row, "Driver"), Value(row, "Conductor"));

    /// <summary>Time part of an OData time value (BC sends 0001-01-01THH:mm:ss).</summary>
    public static string Clock(string? value)
    {
        if (string.IsNullOrWhiteSpace(value)) return "-";
        var trimmed = value.Length > 11 ? value[11..].Trim() : value.Trim();
        if (trimmed.Length > 5) trimmed = trimmed[..5];
        return string.IsNullOrWhiteSpace(trimmed) || trimmed == "00:00" ? "-" : trimmed;
    }

    /// <summary>A trip with no arrival time has not been closed yet.</summary>
    public static string TripStatus(Dictionary<string, string> trip) =>
        string.IsNullOrWhiteSpace(Value(trip, "To_Time")) ||
        Clock(Value(trip, "To_Time")) == "-"
            ? "Open"
            : "Closed";
}

public static class WaybillReportBuilder
{
    public static WaybillReport Build(
        DashboardSectionViewModel waybills,
        DashboardSectionViewModel? trips,
        string range,
        DateTime retrievedAt)
    {
        var waybillRows = waybills.Rows;

        // Only the trips whose waybill is in range belong on this page.
        var entryNumbers = waybillRows
            .Select(row => WaybillReport.Whole(row, "Entry_No"))
            .Where(entry => entry > 0)
            .ToHashSet();

        var tripRows = (trips?.Rows ?? [])
            .Where(trip => entryNumbers.Contains(WaybillReport.Whole(trip, "Weign_Bridge_id")))
            .ToList();

        var passengers = tripRows.Sum(trip => WaybillReport.Whole(trip, "Pax_No"));
        var tripRevenue = tripRows.Sum(trip => WaybillReport.Number(trip, "Total"));
        var openTrips = tripRows.Count(trip => WaybillReport.TripStatus(trip) == "Open");

        var target = waybillRows.Sum(row => WaybillReport.Number(row, "Target_Revenue"));
        var actual = waybillRows.Sum(row => WaybillReport.Number(row, "Actual_Revenue"));
        var collected = waybillRows.Sum(row => WaybillReport.Number(row, "Total_Collected"));
        var expected = waybillRows.Sum(row => WaybillReport.Number(row, "Total_Expected"));
        var shortage = waybillRows.Sum(row => WaybillReport.Number(row, "Shortage"));
        var cash = waybillRows.Sum(row => WaybillReport.Number(row, "Cash"));

        var tiles = new List<FuelSummaryTile>
        {
            new("Waybills", waybillRows.Count.ToString("N0"), string.Empty),
            new("Trips", tripRows.Count.ToString("N0"), string.Empty),
            new("Passengers", passengers.ToString("N0"), string.Empty),
            new("Trip Revenue", tripRevenue.ToString("N2"), "blue"),
            new("Target Revenue", target.ToString("N2"), string.Empty),
            new("Collected", collected.ToString("N2"), string.Empty),
            new("Expected", expected.ToString("N2"), string.Empty),
            // Stragglers are what the desk chases, so colour it when there is one.
            new("Open Trips", openTrips.ToString("N0"), openTrips > 0 ? "red" : string.Empty),
            new("Shortage", shortage.ToString("N2"), shortage > 0 ? "red" : string.Empty),
            new("Cash", cash.ToString("N2"), string.Empty)
        };

        // Second tile pass: Actual mirrors Collected for most clients; only show
        // it when it actually carries a number.
        if (actual != 0)
        {
            tiles.Insert(5, new FuelSummaryTile("Actual Revenue", actual.ToString("N2"), string.Empty));
        }

        return new WaybillReport
        {
            Tiles = tiles,
            // Fleet is text in BC, so '99' would sort after '100' without this.
            Waybills = waybillRows
                .OrderBy(row => int.TryParse(WaybillReport.Value(row, "Fleet_No").Trim(), out var fleet) ? fleet : int.MaxValue)
                .ThenBy(row => WaybillReport.Value(row, "Fleet_No"), StringComparer.OrdinalIgnoreCase)
                .ThenBy(row => WaybillReport.Value(row, "Vehicle_No"), StringComparer.OrdinalIgnoreCase)
                .ToList(),
            Trips = tripRows
                .OrderBy(trip => WaybillReport.Whole(trip, "Weign_Bridge_id"))
                .ThenBy(trip => WaybillReport.Whole(trip, "Trip_No"))
                .ToList(),
            Range = range,
            RetrievedAt = retrievedAt
        };
    }

    /// <summary>Trips belonging to one waybill, for the expandable detail row.</summary>
    public static List<Dictionary<string, string>> TripsFor(
        WaybillReport report, Dictionary<string, string> waybill)
    {
        var entry = WaybillReport.Whole(waybill, "Entry_No");
        return report.Trips
            .Where(trip => WaybillReport.Whole(trip, "Weign_Bridge_id") == entry)
            .ToList();
    }
}
