using System;
using System.Collections.Generic;

namespace Coffee_MVP
{
    public partial class Crop
    {
        public int Id { get; set; }
        public string CropName { get; set; } = null!;
        public DateTime? OpenDate { get; set; }
        public DateTime? CloseDate { get; set; }
    }
}
