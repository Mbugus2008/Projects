using System;
using System.Collections.Generic;

namespace Coffee_MVP
{
    public partial class Farmer
    {
        public string No { get; set; } = null!;
        public string? Name { get; set; }
        public string? Phone { get; set; }
        public string? IdNo { get; set; }
        public double? CumCherry { get; set; }
        public double? CumMbuni { get; set; }
        public bool? Updated { get; set; }
        public int? AccountCategory { get; set; }
        public string? Factory { get; set; }
        public string? Comments { get; set; }
        public bool? Gender { get; set; }
        public string? Bank { get; set; }
        public string? BankAccount { get; set; }
        public double? Acreage { get; set; }
        public int? NoOfTrees { get; set; }
        public double? OtherLoans { get; set; }
        public double? PreviousCropCollection { get; set; }
        public double? LimitPercentage { get; set; }
        public double? Limit { get; set; }
        public double? TotalStores { get; set; }
        public double? CurrentCropCollectionCherry1 { get; set; }
        public double? CurrentCropCollectionCherry2 { get; set; }
        public double? CurrentCropCollection { get; set; }
    }
}
