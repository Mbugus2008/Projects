using System.Globalization;

namespace Matatu_Dashboard.Services;

/// <summary>
/// Two-sheet waybill workbook: the waybill entries, then every trip behind them.
/// </summary>
public static class WaybillExcelWriter
{
    private const int MaxWidth = 44;
    private const int MinWidth = 10;

    public static byte[] Build(WaybillReport report)
    {
        return XlsxWriter.Create([WaybillSheet(report), TripSheet(report)]);
    }

    private static XlsxSheet WaybillSheet(WaybillReport report)
    {
        string[] columns =
        [
            "Date", "Vehicle", "Fleet", "Driver", "Conductor", "Entry",
            "Target", "Expected", "Collected", "Shortage", "Cash",
            "Trips", "Passengers", "Trip Revenue"
        ];

        var rows = TileBlock(report);
        var widths = columns.Select(c => Math.Max(c.Length, 6) + 2.0).ToArray();

        rows.Add(columns.Select(c => XlsxCell.OfText(c, XlsxStyle.Bold)).ToList());
        var headerRow = rows.Count;

        foreach (var waybill in report.Waybills)
        {
            var trips = WaybillReportBuilder.TripsFor(report, waybill);
            var (driverNo, conductorNo) = WaybillReport.Crew(waybill);
            var cells = new List<XlsxCell>
            {
                XlsxCell.OfText(ShortDate(WaybillReport.Value(waybill, "Date", "-"))),
                XlsxCell.OfText(Label(waybill, "Vehicle_No")),
                XlsxCell.OfText(Label(waybill, "Fleet_No")),
                XlsxCell.OfText(driverNo),
                XlsxCell.OfText(conductorNo),
                XlsxCell.OfNumber(WaybillReport.Whole(waybill, "Entry_No")),
                XlsxCell.OfNumber(WaybillReport.Number(waybill, "Target_Revenue"), XlsxStyle.Money),
                XlsxCell.OfNumber(WaybillReport.Number(waybill, "Total_Expected"), XlsxStyle.Money),
                XlsxCell.OfNumber(WaybillReport.Number(waybill, "Total_Collected"), XlsxStyle.Money),
                XlsxCell.OfNumber(WaybillReport.Number(waybill, "Shortage"), XlsxStyle.Money),
                XlsxCell.OfNumber(WaybillReport.Number(waybill, "Cash"), XlsxStyle.Money),
                XlsxCell.OfNumber(trips.Count),
                XlsxCell.OfNumber(trips.Sum(t => WaybillReport.Whole(t, "Pax_No"))),
                XlsxCell.OfNumber(trips.Sum(t => WaybillReport.Number(t, "Total")), XlsxStyle.Money)
            };
            rows.Add(cells);
        }

        return new XlsxSheet
        {
            Name = "Waybills",
            Rows = rows,
            ColumnWidths = widths.Select(w => Math.Clamp(w, MinWidth, MaxWidth)).ToArray(),
            FreezeRows = headerRow
        };
    }

    private static XlsxSheet TripSheet(WaybillReport report)
    {
        string[] columns =
        [
            "Entry", "Vehicle", "Trip", "From", "To", "Departure", "Arrival",
            "Pax", "Fare", "Total", "Received", "Status", "Started By", "Comments"
        ];

        var vehicleByEntry = report.Waybills.ToDictionary(
            w => WaybillReport.Whole(w, "Entry_No"),
            w => Label(w, "Vehicle_No"));

        var rows = new List<List<XlsxCell>>
        {
            columns.Select(c => XlsxCell.OfText(c, XlsxStyle.Bold)).ToList()
        };

        foreach (var trip in report.Trips)
        {
            var entry = WaybillReport.Whole(trip, "Weign_Bridge_id");
            rows.Add(
            [
                XlsxCell.OfNumber(entry),
                XlsxCell.OfText(vehicleByEntry.TryGetValue(entry, out var v) ? v : "-"),
                XlsxCell.OfNumber(WaybillReport.Whole(trip, "Trip_No")),
                XlsxCell.OfText(WaybillReport.Value(trip, "From", "-")),
                XlsxCell.OfText(WaybillReport.Value(trip, "To", "-")),
                XlsxCell.OfText(WaybillReport.Clock(WaybillReport.Value(trip, "From_Time"))),
                XlsxCell.OfText(WaybillReport.Clock(WaybillReport.Value(trip, "To_Time"))),
                XlsxCell.OfNumber(WaybillReport.Whole(trip, "Pax_No")),
                XlsxCell.OfNumber(WaybillReport.Number(trip, "Fare_Amount"), XlsxStyle.Money),
                XlsxCell.OfNumber(WaybillReport.Number(trip, "Total"), XlsxStyle.Money),
                XlsxCell.OfText(WaybillReport.Value(trip, "Amount_Received", "-")),
                XlsxCell.OfText(WaybillReport.TripStatus(trip)),
                XlsxCell.OfText(WaybillReport.Value(trip, "Started_By", "-")),
                XlsxCell.OfText(WaybillReport.Value(trip, "Comments", string.Empty))
            ]);
        }

        return new XlsxSheet
        {
            Name = "Trips",
            Rows = rows,
            ColumnWidths = columns
                .Select(c => Math.Clamp(Math.Max(c.Length, 6) + 2.0, MinWidth, MaxWidth))
                .ToArray(),
            FreezeRows = 1
        };
    }

    private static List<List<XlsxCell>> TileBlock(WaybillReport report)
    {
        var rows = new List<List<XlsxCell>>();
        foreach (var tile in report.Tiles)
        {
            rows.Add(
            [
                XlsxCell.OfText(tile.Label, XlsxStyle.Bold),
                XlsxCell.OfText(tile.Value, XlsxStyle.Bold)
            ]);
        }

        if (rows.Count > 0)
        {
            rows.Add([XlsxCell.Empty()]);
        }

        return rows;
    }

    private static string Label(Dictionary<string, string> row, string column)
        => WaybillReport.Value(row, column, "-");

    /// <summary>OData sends a full timestamp; the report shows the date only.</summary>
    private static string ShortDate(string value)
        => value.Length > 10 ? value[..10] : value;
}
