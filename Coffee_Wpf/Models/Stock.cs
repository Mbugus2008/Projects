using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class Stock
    {
        public long Id { get; set; }
        public string? DocumentNo { get; set; }
        public string? Item { get; set; }
        public string? Variant { get; set; }
        public DateTime? DateAdded { get; set; }
        public double? Quantity { get; set; }
        public double? UnitPrice { get; set; }
    }
}
