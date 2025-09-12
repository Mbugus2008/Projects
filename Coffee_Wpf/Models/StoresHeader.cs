using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class StoresHeader
    {
        public int Id { get; set; }
        public string? Client { get; set; }
        public DateTime? Date { get; set; }
        public string? Entry { get; set; }
        public double? Total { get; set; }
        public bool? Posted { get; set; }
        public int? Paymode { get; set; }
        public double? AmountPaid { get; set; }
        public double? Balance { get; set; }
        public double? Limit { get; set; }
        public double? Stores { get; set; }
        public double? LimitAvailable { get; set; }
        public string? Collector { get; set; }
        public string? CollectorNo { get; set; }
        public string? MemberName { get; set; }
        public bool? CollectorIsMember { get; set; }
        public string? MpesaCode { get; set; }
        public string? MpesaNo { get; set; }
        public string? MpesaName { get; set; }
        public string? CropYear { get; set; }
        public string? Factory { get; set; }
        public string? FactoryName { get; set; }
        public string? ServedBy { get; set; }
        public bool? Sent { get; set; }
        public double? CreditAmount { get; set; }
        public string? Comments { get; set; }
    }
}
