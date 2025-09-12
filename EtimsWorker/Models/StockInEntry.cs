using System;
using System.Collections.Generic;

namespace EtimsWorker.Models;

public partial class StockInEntry
{
    public string ItemCode { get; set; } = null!;

    public string? ItemClassificationCode { get; set; }

    public string? BarCode { get; set; }

    public double? Quantity { get; set; }

    public double? ResidualQuantity { get; set; }

    public double? UnitPrice { get; set; }

    public double? DiscountRate { get; set; }

    public double? DiscountAmount { get; set; }

    public string? TaxationTypeCode { get; set; }

    public decimal? TaxAmount { get; set; }

    public decimal? TotalAmount { get; set; }

    public int StoredReleasedNo { get; set; }

    public bool? Sync { get; set; }
}
