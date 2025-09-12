using System;
using System.Collections.Generic;

namespace EtimsWorker.Models;

public partial class SaleItem
{
    public string? ItemName { get; set; }

    public string ItemCode { get; set; } = null!;

    public string? ItemClassificationCode { get; set; }

    public double? Quantity { get; set; }

    public double? UnitPrice { get; set; }

    public double? DiscountRate { get; set; }

    public double? DiscountAmount { get; set; }

    public string? TaxationTypeCode { get; set; }

    public double? TaxAmount { get; set; }

    public double? TotalAmount { get; set; }

    public string? ModifierId { get; set; }

    public string? ModifierName { get; set; }

    public string InvoiceNumber { get; set; } = null!;

    public bool? Sync { get; set; }
}
