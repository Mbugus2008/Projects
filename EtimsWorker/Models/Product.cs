using System;
using System.Collections.Generic;

namespace EtimsWorker.Models;

public partial class Product
{
    public string ItemCode { get; set; } = null!;

    public string? ItemClassificationCode { get; set; }

    public string? ItemTypeCode { get; set; }

    public string? ItemName { get; set; }

    public string? OriginCode { get; set; }

    public string? TaxationTypeCode { get; set; }

    public string? BatchNumber { get; set; }

    public string? BarCode { get; set; }

    public double? DefaultPrice { get; set; }

    public bool? Sync { get; set; }
}
