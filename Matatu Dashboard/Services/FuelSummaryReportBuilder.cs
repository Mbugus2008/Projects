using Matatu_Dashboard.Models;

namespace Matatu_Dashboard.Services;

/// <summary>
/// The shaped Dispatch &amp; Fuel Summary: the tiles across the top plus the
/// ordered depot table.
///
/// The page, the Excel export and the print/PDF view all render this object, so
/// the three can never drift apart. Previously this shaping lived inline in the
/// view, which meant any export would have had to re-implement it.
/// </summary>
public sealed class FuelSummaryReport
{
    public List<FuelSummaryTile> Tiles { get; init; } = [];

    /// <summary>Depot columns in display order (OData field names).</summary>
    public List<string> Columns { get; init; } = [];

    public Dictionary<string, string> ColumnLabels { get; init; } =
        new(StringComparer.OrdinalIgnoreCase);

    /// <summary>Columns shown as money: formatted N2 and right aligned.</summary>
    public HashSet<string> MoneyColumns { get; init; } = new(StringComparer.OrdinalIgnoreCase);

    /// <summary>Columns that wrap instead of truncating on one line.</summary>
    public HashSet<string> WrapColumns { get; init; } = new(StringComparer.OrdinalIgnoreCase);

    public List<Dictionary<string, string>> Rows { get; init; } = [];

    public string Range { get; init; } = "today";

    public DateTime RetrievedAt { get; init; } = DateTime.Now;

    public string LabelFor(string column) =>
        ColumnLabels.TryGetValue(column, out var label) ? label : column.Replace("_", " ");

    public bool IsMoney(string column) => MoneyColumns.Contains(column);

    public bool IsWrapped(string column) => WrapColumns.Contains(column);

    /// <summary>
    /// Driver and conductor for a row, member number first — the same order the
    /// mobile app uses ([A169] CHARLES MWENJE OREDI).
    /// </summary>
    public static (string DriverNo, string Driver, string ConductorNo, string Conductor) Crew(
        Dictionary<string, string> row) => (
        Value(row, "Driver"),
        Value(row, "Driver_Name", "-"),
        Value(row, "Conductor"),
        Value(row, "Conductor_Name", "-"));

    /// <summary>BC vehicle type code to a friendly label ("51 Seater").</summary>
    public static string VehicleType(Dictionary<string, string> row) =>
        VehicleTypeLabels.Describe(Value(row, "Capacity"));

    /// <summary>The value for a column, or the fallback when the column is absent.</summary>
    public static string Value(Dictionary<string, string> row, string column, string fallback = "")
        => row.TryGetValue(column, out var value) && !string.IsNullOrWhiteSpace(value)
            ? value
            : fallback;
}

/// <summary>A tile in the metric strip across the top of the page.</summary>
public sealed record FuelSummaryTile(string Label, string Value, string Css);

public static class FuelSummaryReportBuilder
{
    private static readonly string[] MetricKeys =
    [
        "Total_Collection", "Total_Vehicles", "Total_Fuel_ltrs",
        "Total_Fuels_Amount", "Total_Paid", "Total_Mileage", "Total_Fuel_Arrears", "Net_Offload"
    ];

    private static readonly string[] DepotColumnOrder =
    [
        "Date", "Vehicle", "Fleet", "Capacity", "Crew",
        "Total_Collection", "Management_Target", "Fuel", "Total_Litres", "Km_Litre",
        "Amount_Paid", "Balance", "Millage", "Net_Offload", "Comments"
    ];

    private static readonly Dictionary<string, string> Labels =
        new(StringComparer.OrdinalIgnoreCase)
        {
            { "Date", "Date" }, { "Vehicle", "Vehicle" }, { "Fleet", "Fleet" },
            { "Capacity", "Vehicle Type" }, { "Crew", "Crew" },
            { "Total_Collection", "Total Collection" }, { "Management_Target", "Management Target" },
            { "Fuel", "Fuel" }, { "Total_Litres", "Litres" }, { "Km_Litre", "Km/Litre" },
            { "Amount_Paid", "Fuel Paid" },
            { "Balance", "Unpaid Fuel" }, { "Millage", "Mileage" }, { "Net_Offload", "Net Offload" },
            { "Comments", "Comments" }
        };

    private static readonly HashSet<string> Money = new(StringComparer.OrdinalIgnoreCase)
    {
        "Total_Collection", "Management_Target", "Fuel", "Total_Litres", "Km_Litre",
        "Amount_Paid", "Balance", "Net_Offload"
    };

    /// <summary>
    /// Shapes the depot rows of [depot] and the aggregate row of [summary] into
    /// everything the views need.
    /// </summary>
    public static FuelSummaryReport Build(
        DashboardSectionViewModel depot,
        DashboardSectionViewModel? summary,
        string range,
        DateTime retrievedAt)
    {
        var depotRows = depot.Rows;
        var depotCols = depot.Columns;
        var summaryRows = summary?.Rows ?? [];
        var summaryCols = summary?.Columns ?? [];

        // Vehicles are counted as active/total, the rest are summed.
        var activeVehicles = summaryRows.Sum(r => Int(r, "Active_Vehicles"));
        var totalVehicles = summaryRows.Sum(r => Int(r, "Total_Vehicles"));

        // DisFuelSummary has no management figure, so total it from the depot rows.
        var hasManagement = depotCols.Contains("Management", StringComparer.OrdinalIgnoreCase);
        var totalManagement = depotRows.Sum(r => Dec(r, "Management"));

        // Built up front so the management total can sit beside the collection
        // total no matter what order BC returns its columns in.
        var tiles = new List<FuelSummaryTile>();
        foreach (var key in MetricKeys.Where(k => summaryCols.Contains(k, StringComparer.OrdinalIgnoreCase)))
        {
            var isInt = key == "Total_Vehicles";
            var value = isInt
                ? totalVehicles
                : summaryRows.Sum(r => Dec(r, key));
            var css = key == "Total_Fuel_Arrears" && value > 0
                ? "red"
                : key == "Total_Collection" ? "blue" : string.Empty;

            tiles.Add(new FuelSummaryTile(
                isInt ? "Vehicles (Active/Total)" : key.Replace("_", " "),
                isInt ? $"{activeVehicles}/{totalVehicles}" : value.ToString("N2"),
                css));

            if (key == "Total_Collection" && hasManagement)
            {
                tiles.Add(new FuelSummaryTile("Total Management", totalManagement.ToString("N2"), string.Empty));
            }
        }

        // "Crew" is synthesised from Driver/Conductor, so it is always present
        // even though there is no such OData field.
        var columns = DepotColumnOrder
            .Where(c => c == "Crew" || depotCols.Contains(c, StringComparer.OrdinalIgnoreCase))
            .ToList();

        return new FuelSummaryReport
        {
            Tiles = tiles,
            Columns = columns,
            ColumnLabels = Labels,
            MoneyColumns = Money,
            WrapColumns = new HashSet<string>(StringComparer.OrdinalIgnoreCase) { "Comments" },
            // Order by fleet no - numeric ascending, blank / non-numeric fleets
            // last. (Fleet arrives as text, so '99' would sort after '100'.)
            Rows = depotRows
                .OrderBy(r => int.TryParse(FuelSummaryReport.Value(r, "Fleet").Trim(), out var no) ? no : int.MaxValue)
                .ThenBy(r => FuelSummaryReport.Value(r, "Fleet"), StringComparer.OrdinalIgnoreCase)
                .ThenBy(r => FuelSummaryReport.Value(r, "Vehicle"), StringComparer.OrdinalIgnoreCase)
                .ToList(),
            Range = range,
            RetrievedAt = retrievedAt
        };
    }

    private static int Int(Dictionary<string, string> row, string column) =>
        row.TryGetValue(column, out var value) && int.TryParse(value, out var parsed) ? parsed : 0;

    private static decimal Dec(Dictionary<string, string> row, string column) =>
        row.TryGetValue(column, out var value) && decimal.TryParse(value, out var parsed) ? parsed : 0m;
}
