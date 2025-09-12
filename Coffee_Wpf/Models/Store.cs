using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class Store
    {
        public int Id { get; set; }
        public string? Entry { get; set; }
        public string? Client { get; set; }
        public string? Item { get; set; }
        public string? Variant { get; set; }
        public double? Amount { get; set; }
        public double? Quantity { get; set; }
        public DateTime? Time { get; set; }
        public DateTime? Date { get; set; }
        public string? ServedBy { get; set; }
        public string? Status { get; set; }
        public string? Factory { get; set; }
        public bool? Sent { get; set; }
        public string? Comments { get; set; }
        public double? LineTotal { get; set; }
        public string? Stock { get; set; }
        public string? Crop { get; set; }
        public int? Balance { get; set; }
        public int? Paymode { get; set; }
        public double? AmountPaid { get; set; }
    }
}
