using System;
using System.Collections.Generic;

namespace Coffee_MVP
{
    public partial class ItemVariant
    {
        public int Id { get; set; }
        public string? No { get; set; }
        public string? Code { get; set; }
        public string? Description { get; set; }
        public double? Price { get; set; }
    }
}
