using System;

namespace ExternalTrans;

public class Mtransactions
{
    public string? Key { get; set; }
    public string? Document_No { get; set; }
    public DateTime Transaction_Date { get; set; }
    public bool Transaction_DateSpecified { get; set; }
    public double Amount { get; set; }
    public bool AmountSpecified { get; set; }
    public string? Agent_Code { get; set; }
    public string? Vehicle_No { get; set; }
    public string? Type { get; set; }
}
