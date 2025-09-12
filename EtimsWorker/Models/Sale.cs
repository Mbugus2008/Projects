using System;
using System.Collections.Generic;

namespace EtimsWorker.Models;

public partial class Sale
{
    public string InvoiceNumber { get; set; } = null!;

    public string? CustomerPin { get; set; }

    public string? CustomerName { get; set; }

    public string? PaymentTypeCode { get; set; }

    public DateOnly? SaleDate { get; set; }

    public double? TotalAmount { get; set; }

    public double? TotalTaxableAmount { get; set; }

    public double? TotalTaxAmount { get; set; }

    public string? ModifierId { get; set; }

    public string? ModifierName { get; set; }

    public bool? Sync { get; set; }
}
