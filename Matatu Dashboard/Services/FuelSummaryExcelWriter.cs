using System.Globalization;

namespace Matatu_Dashboard.Services;

/// <summary>
/// Turns a shaped <see cref="FuelSummaryReport"/> into a single-sheet workbook:
/// the metric strip, a blank row, then the depot table with a frozen header.
///
/// Named "Writer" because the controller action is called FuelSummaryExcel and
/// a bare class of the same name would shadow it inside the controller.
/// </summary>
public static class FuelSummaryExcelWriter
{
    private const int MaxWidth = 46;
    private const int MinWidth = 10;

    public static byte[] Build(FuelSummaryReport report)
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

        if (report.Tiles.Count > 0)
        {
            rows.Add([XlsxCell.Empty()]);
        }

        var widths = report.Columns
            .Select(c => Math.Max(report.LabelFor(c).Length, 6) + 2.0)
            .ToArray();

        rows.Add(report.Columns
            .Select((c, i) => XlsxCell.OfText(report.LabelFor(c), XlsxStyle.Bold))
            .ToList());
        var headerRowNumber = rows.Count;

        foreach (var row in report.Rows)
        {
            var cells = new List<XlsxCell>(report.Columns.Count);
            for (var i = 0; i < report.Columns.Count; i++)
            {
                var cell = Cell(report, row, report.Columns[i]);
                cells.Add(cell);

                var length = cell.Number is { } number
                    ? number.ToString("#,##0.00", CultureInfo.InvariantCulture).Length
                    : Math.Min(cell.Text?.Length ?? 0, MaxWidth);
                widths[i] = Math.Max(widths[i], length + 2.0);
            }
            rows.Add(cells);
        }

        return XlsxWriter.Create(new XlsxSheet
        {
            Name = "Fuel Summary",
            Rows = rows,
            ColumnWidths = widths.Select(w => Math.Clamp(w, MinWidth, MaxWidth)).ToArray(),
            FreezeRows = headerRowNumber
        });
    }

    private static XlsxCell Cell(
        FuelSummaryReport report,
        Dictionary<string, string> row,
        string column)
    {
        if (column == "Crew")
        {
            // One line per cell: driver then conductor, member number first.
            var (driverNo, driver, conductorNo, conductor) = FuelSummaryReport.Crew(row);
            var driverText = string.Join(' ', new[] { driverNo, driver }.Where(s => !string.IsNullOrWhiteSpace(s)));
            var conductorText = string.Join(' ', new[] { conductorNo, conductor }.Where(s => !string.IsNullOrWhiteSpace(s)));

            if (driverText.Length == 0 && conductorText.Length == 0)
            {
                return XlsxCell.OfText("-");
            }

            return XlsxCell.OfText(conductorText.Length == 0
                ? driverText
                : $"{driverText} | {conductorText}");
        }

        if (column == "Capacity")
        {
            return XlsxCell.OfText(FuelSummaryReport.VehicleType(row));
        }

        var raw = FuelSummaryReport.Value(row, column, "-");

        if (column == "Date")
        {
            // OData returns a full timestamp; the page shows the date only.
            return XlsxCell.OfText(raw.Length > 11 ? raw[..11].Trim() : raw);
        }

        if (report.IsMoney(column) && decimal.TryParse(raw, out var money))
        {
            return XlsxCell.OfNumber(money, XlsxStyle.Money);
        }

        return XlsxCell.OfText(raw);
    }
}
