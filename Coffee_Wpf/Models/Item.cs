using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class Item
    {
        public string No { get; set; } = null!;
        public string? Description { get; set; }
        public string? BaseUnitOfMeasure { get; set; }
        public double? LastDirectCost { get; set; }
        public double? UnitCost { get; set; }
        public double? UnitPrice { get; set; }
        public double? Inventory { get; set; }
        public int? PreventNegativeInventory { get; set; }
    }
}
