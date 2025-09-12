using System;
using System.Collections.Generic;

namespace Coffee_Wpf.Models
{
    public partial class Setting
    {
        public int Id { get; set; }
        public string? ComPort { get; set; }
        public int? BaudRate { get; set; }
        public int? CoffeType { get; set; }
        public string? Branch { get; set; }
        public string? Printer { get; set; }
        public string? ServerUrl { get; set; }
        public string? Factory { get; set; }
        public string? CurrentCrop { get; set; }
        public bool? PickFactoryFarmers { get; set; }
        public double? BagWeight { get; set; }
        public int? StoresReceiptsCopies { get; set; }
        public string? Motto { get; set; }
        public string? Email { get; set; }
        public int? NoOfSalesPerDay { get; set; }
        public bool? AllowMultipleSales { get; set; }
        public bool? ManualTare { get; set; }
        public bool? ClearKgOnPost { get; set; }
        public int? PadFarmerNo { get; set; }
        public string? FactoryName { get; set; }
        public string? Address { get; set; }
        public string? PhoneNo { get; set; }
        public bool? LoadMembersInBatches { get; set; }
        public int? BatchSize { get; set; }
        public int? SyncDataIntervalSec { get; set; }
    }
}
