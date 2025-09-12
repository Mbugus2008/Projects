using System;
using System.Collections.Generic;

namespace Coffee_MVP
{
    public partial class DailyCollectionsDetail
    {
        public string FarmersNumber { get; set; } = null!;
        public DateTime CollectionsDate { get; set; }
        public string CollectionNumber { get; set; } = null!;
        public string? CoffeeType { get; set; }
        public int No { get; set; }
        public string? FarmersName { get; set; }
        public double? KgCollected { get; set; }
        public string? Cancelled { get; set; }
        public byte? Paid { get; set; }
        public string? IdNumber { get; set; }
        public string? Factory { get; set; }
        public bool? Sent { get; set; }
        public string? Comments { get; set; }
        public double? Cumm { get; set; }
        public string? User { get; set; }
        public string? Can { get; set; }
        public DateTime? CollectionTime { get; set; }
        public string? CollectType { get; set; }
        public string? Crop { get; set; }
        public double? Gross { get; set; }
        public double? Tare { get; set; }
        public int? NoOfBags { get; set; }
        public string? DeliveredBy { get; set; }
        public string? CoffeTypeName { get; set; }
        public bool? Updated { get; set; }
    }
}
