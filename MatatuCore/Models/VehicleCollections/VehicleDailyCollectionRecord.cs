using System;

namespace MatatuCore.Models.VehicleCollections;

public class VehicleDailyCollectionRecord
{
    public string? Key { get; set; }
    public string? Vehicle_Number { get; set; }
    public string? Fleet_No { get; set; }
    public int Vehicle_Type { get; set; }
    public bool Vehicle_TypeSpecified { get; set; }
    public double Daily_Contribution { get; set; }
    public bool Daily_ContributionSpecified { get; set; }
    public double Offload { get; set; }
    public bool OffloadSpecified { get; set; }
    public double Management { get; set; }
    public bool ManagementSpecified { get; set; }
    public DateTime Date_Filter { get; set; }
    public bool Date_FilterSpecified { get; set; }
    public double Mpesa { get; set; }
    public bool MpesaSpecified { get; set; }
    public double Cash { get; set; }
    public bool CashSpecified { get; set; }
    public double Operation { get; set; }
    public bool OperationSpecified { get; set; }
    public double Wadge_5 { get; set; }
    public bool Wadge_5Specified { get; set; }
}
