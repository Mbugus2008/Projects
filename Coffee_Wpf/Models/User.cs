using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class User
    {
        public string Name { get; set; } = null!;
        public string? Password { get; set; }
        public DateTime? DateCreated { get; set; }
        public string? Type { get; set; }
    }
}
