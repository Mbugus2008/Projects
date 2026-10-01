using System.Globalization;
using System.IO.Compression;
using System.Text;

namespace Matatu_Dashboard.Services;

/// <summary>Cell formatting for <see cref="XlsxWriter"/>.</summary>
public enum XlsxStyle
{
    Normal = 0,
    Bold = 1,
    Money = 2,
    BoldMoney = 3
}

public sealed class XlsxCell
{
    private XlsxCell() { }

    public string? Text { get; private init; }
    public decimal? Number { get; private init; }
    public XlsxStyle Style { get; private init; }

    public static XlsxCell OfText(string? text, XlsxStyle style = XlsxStyle.Normal) =>
        new() { Text = text ?? string.Empty, Style = style };

    public static XlsxCell OfNumber(decimal value, XlsxStyle style = XlsxStyle.Normal) =>
        new() { Number = value, Style = style };

    /// <summary>Empty cell - keeps the column alignment of sparse rows.</summary>
    public static XlsxCell Empty(XlsxStyle style = XlsxStyle.Normal) =>
        new() { Text = string.Empty, Style = style };
}

public sealed class XlsxSheet
{
    /// <summary>Excel limits sheet names to 31 characters.</summary>
    public string Name { get; init; } = "Sheet1";

    public List<List<XlsxCell>> Rows { get; init; } = [];

    /// <summary>Column widths in characters, applied positionally.</summary>
    public IReadOnlyList<double> ColumnWidths { get; init; } = [];

    /// <summary>Number of leading rows to keep visible while scrolling.</summary>
    public int FreezeRows { get; init; }
}

/// <summary>
/// Writes a minimal but valid .xlsx (SpreadsheetML) package by hand.
///
/// The dashboard keeps zero NuGet dependencies, so rather than pull in a
/// spreadsheet library this emits the five parts Excel needs: content types,
/// package relationships, the workbook, its relationships, a small styles part,
/// and one worksheet using inline strings (which avoids sharedStrings).
/// </summary>
public static class XlsxWriter
{
    public static byte[] Create(XlsxSheet sheet) => Create([sheet]);

    public static byte[] Create(IReadOnlyList<XlsxSheet> sheets)
    {
        if (sheets.Count == 0)
        {
            sheets = [new XlsxSheet { Name = "Sheet1" }];
        }

        var names = UniqueNames(sheets);

        using var buffer = new MemoryStream();

        using (var zip = new ZipArchive(buffer, ZipArchiveMode.Create, leaveOpen: true))
        {
            Write(zip, "[Content_Types].xml", ContentTypes(sheets.Count));
            Write(zip, "_rels/.rels", RootRels());
            Write(zip, "xl/workbook.xml", Workbook(names));
            Write(zip, "xl/_rels/workbook.xml.rels", WorkbookRels(sheets.Count));
            Write(zip, "xl/styles.xml", Styles());

            for (var i = 0; i < sheets.Count; i++)
            {
                Write(zip, $"xl/worksheets/sheet{i + 1}.xml", Worksheet(sheets[i]));
            }
        }

        return buffer.ToArray();
    }

    /// <summary>Excel rejects duplicate sheet names and caps them at 31 chars.</summary>
    private static List<string> UniqueNames(IReadOnlyList<XlsxSheet> sheets)
    {
        var names = new List<string>();
        foreach (var sheet in sheets)
        {
            var candidate = SheetName(sheet.Name);
            var suffix = 2;
            while (names.Contains(candidate, StringComparer.OrdinalIgnoreCase))
            {
                var tag = $" ({suffix++})";
                var room = 31 - tag.Length;
                candidate = (candidate.Length > room ? candidate[..room] : candidate) + tag;
            }
            names.Add(candidate);
        }
        return names;
    }

    private static void Write(ZipArchive zip, string path, string content)
    {
        var entry = zip.CreateEntry(path, CompressionLevel.Optimal);
        using var stream = entry.Open();
        // No BOM: the declaration below already states UTF-8 and some readers
        // treat a leading BOM as part of the first element.
        var bytes = new UTF8Encoding(encoderShouldEmitUTF8Identifier: false).GetBytes(content);
        stream.Write(bytes, 0, bytes.Length);
    }

    private static string ContentTypes(int sheetCount)
    {
        var overrides = new StringBuilder();
        for (var i = 1; i <= sheetCount; i++)
        {
            overrides.Append($"<Override PartName=\"/xl/worksheets/sheet{i}.xml\" ContentType=\"application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml\"/>");
        }

        return $"""
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
        <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
        <Default Extension="xml" ContentType="application/xml"/>
        <Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>
        {overrides}
        <Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>
        </Types>
        """;
    }

    private static string RootRels() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
        <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="xl/workbook.xml"/>
        </Relationships>
        """;

    private static string Workbook(IReadOnlyList<string> sheetNames)
    {
        var sheets = new StringBuilder();
        for (var i = 0; i < sheetNames.Count; i++)
        {
            sheets.Append($"<sheet name=\"{Escape(sheetNames[i])}\" sheetId=\"{i + 1}\" r:id=\"rId{i + 1}\"/>");
        }

        return $"""
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <workbook xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main" xmlns:r="http://schemas.openxmlformats.org/officeDocument/2006/relationships">
        <sheets>{sheets}</sheets>
        </workbook>
        """;
    }

    private static string WorkbookRels(int sheetCount)
    {
        var rels = new StringBuilder();
        for (var i = 1; i <= sheetCount; i++)
        {
            rels.Append($"<Relationship Id=\"rId{i}\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/worksheet\" Target=\"worksheets/sheet{i}.xml\"/>");
        }

        // The styles part gets the next free relationship id.
        rels.Append($"<Relationship Id=\"rId{sheetCount + 1}\" Type=\"http://schemas.openxmlformats.org/officeDocument/2006/relationships/styles\" Target=\"styles.xml\"/>");

        return $"""
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
        {rels}
        </Relationships>
        """;
    }

    /// <summary>
    /// Four formats: normal, bold (headers), #,##0.00, and bold #,##0.00.
    /// numFmtId 4 is the built-in "#,##0.00", so no custom numFmts are needed.
    /// </summary>
    private static string Styles() =>
        """
        <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
        <fonts count="2"><font><sz val="11"/><name val="Calibri"/></font><font><b/><sz val="11"/><name val="Calibri"/></font></fonts>
        <fills count="2"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill></fills>
        <borders count="1"><border/></borders>
        <cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>
        <cellXfs count="4">
        <xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0"/>
        <xf numFmtId="0" fontId="1" fillId="0" borderId="0" xfId="0" applyFont="1"/>
        <xf numFmtId="4" fontId="0" fillId="0" borderId="0" xfId="0" applyNumberFormat="1"/>
        <xf numFmtId="4" fontId="1" fillId="0" borderId="0" xfId="0" applyFont="1" applyNumberFormat="1"/>
        </cellXfs>
        </styleSheet>
        """;

    private static string Worksheet(XlsxSheet sheet)
    {
        var xml = new StringBuilder();
        xml.Append("""<?xml version="1.0" encoding="UTF-8" standalone="yes"?>""");
        xml.Append($"<worksheet xmlns=\"{Ns}\">");

        if (sheet.FreezeRows > 0)
        {
            xml.Append("<sheetViews><sheetView workbookViewId=\"0\">");
            xml.Append($"<pane ySplit=\"{sheet.FreezeRows}\" topLeftCell=\"A{sheet.FreezeRows + 1}\" activePane=\"bottomLeft\" state=\"frozen\"/>");
            xml.Append("</sheetView></sheetViews>");
        }

        if (sheet.ColumnWidths.Count > 0)
        {
            xml.Append("<cols>");
            for (var i = 0; i < sheet.ColumnWidths.Count; i++)
            {
                xml.Append($"<col min=\"{i + 1}\" max=\"{i + 1}\" width=\"{sheet.ColumnWidths[i].ToString("0.##", CultureInfo.InvariantCulture)}\" customWidth=\"1\"/>");
            }
            xml.Append("</cols>");
        }

        xml.Append("<sheetData>");
        for (var r = 0; r < sheet.Rows.Count; r++)
        {
            var rowNumber = r + 1;
            xml.Append($"<row r=\"{rowNumber}\">");
            var cells = sheet.Rows[r];
            for (var c = 0; c < cells.Count; c++)
            {
                var cell = cells[c];
                var reference = $"{ColumnName(c)}{rowNumber}";
                var style = (int)cell.Style;

                if (cell.Number is { } number)
                {
                    xml.Append($"<c r=\"{reference}\" s=\"{style}\"><v>{number.ToString(CultureInfo.InvariantCulture)}</v></c>");
                }
                else
                {
                    // Inline strings keep the package to five parts (no sharedStrings).
                    xml.Append($"<c r=\"{reference}\" s=\"{style}\" t=\"inlineStr\"><is><t xml:space=\"preserve\">{Escape(cell.Text ?? string.Empty)}</t></is></c>");
                }
            }
            xml.Append("</row>");
        }
        xml.Append("</sheetData></worksheet>");

        return xml.ToString();
    }

    private const string Ns = "http://schemas.openxmlformats.org/spreadsheetml/2006/main";

    /// <summary>0-based column index to a spreadsheet name (A, B, ... AA, AB, ...).</summary>
    internal static string ColumnName(int index)
    {
        var name = string.Empty;
        var value = index;
        do
        {
            name = (char)('A' + value % 26) + name;
            value = value / 26 - 1;
        } while (value >= 0);

        return name;
    }

    /// <summary>Excel rejects : \ / ? * [ ] in sheet names.</summary>
    private static string SheetName(string name)
    {
        var cleaned = new string(name.Where(ch => ch is not (':' or '\\' or '/' or '?' or '*' or '[' or ']')).ToArray());
        return cleaned.Length > 31 ? cleaned[..31] : cleaned.Length == 0 ? "Sheet1" : cleaned;
    }

    private static string Escape(string value)
    {
        var escaped = new StringBuilder(value.Length);
        foreach (var ch in value)
        {
            switch (ch)
            {
                case '&': escaped.Append("&amp;"); break;
                case '<': escaped.Append("&lt;"); break;
                case '>': escaped.Append("&gt;"); break;
                case '"': escaped.Append("&quot;"); break;
                case '\'': escaped.Append("&apos;"); break;
                case '\t':
                case '\n':
                case '\r': escaped.Append(ch); break;
                default:
                    // Control characters are not legal in XML 1.0.
                    if (ch >= ' ') escaped.Append(ch);
                    break;
            }
        }

        return escaped.ToString();
    }
}
