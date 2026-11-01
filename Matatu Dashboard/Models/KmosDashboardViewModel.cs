namespace Matatu_Dashboard.Models;

/// <summary>
/// Everything the KMOS dashboard screen shows.
///
/// KMOS is a separate Dynamics NAV instance (KmoService / company KMO) from the CityServices
/// BC that feeds the other dashboard pages, so this model is deliberately standalone - none of
/// the BusinessCentral* types are reused.
/// </summary>
public sealed class KmosDashboardViewModel
{
    public string Range { get; set; } = "today";
    public string RangeLabel { get; set; } = "Today";
    public DateTime RangeStart { get; set; }
    public DateTime RangeEnd { get; set; }
    public DateTime RetrievedAt { get; set; } = DateTime.Now;
    public string ServiceUrl { get; set; } = string.Empty;
    public string? ErrorMessage { get; set; }

    /// <summary>Set when a range holds more rows than the service is allowed to read in one pass.</summary>
    public bool Truncated { get; set; }

    public List<KmosTileViewModel> Tiles { get; set; } = [];

    /// <summary>Collections per hour (single day) or per day (multi-day range).</summary>
    public List<KmosBarViewModel> CollectionsTrend { get; set; } = [];
    public string CollectionsTrendTitle { get; set; } = "Collections";

    /// <summary>Amount collected per day over the last seven days, whatever period is selected.</summary>
    public List<KmosBarViewModel> WeeklyCollections { get; set; } = [];

    public List<KmosTypeViewModel> TypeMix { get; set; } = [];
    public List<KmosBarViewModel> MemberStatuses { get; set; } = [];
    public List<KmosBarViewModel> VehicleTypes { get; set; } = [];
    public List<KmosBarViewModel> LoanTypes { get; set; } = [];
    public List<KmosButtonViewModel> TranstypeLegend { get; set; } = [];

    public List<KmosRankViewModel> TopAgents { get; set; } = [];
    public List<KmosRankViewModel> TopVehicles { get; set; } = [];
    public List<KmosDebtorViewModel> TopDebtors { get; set; } = [];
    public List<KmosVehicleRowViewModel> VehicleArrears { get; set; } = [];
    public List<KmosTransactionRowViewModel> RecentTransactions { get; set; } = [];
    public List<KmosSmsRowViewModel> RecentSms { get; set; } = [];

    public int MemberCount { get; set; }
    public int ActiveMemberCount { get; set; }

    /// <summary>Members who posted at least one transaction in the selected period.</summary>
    public int MembersWithActivity { get; set; }

    public int VehicleCount { get; set; }

    /// <summary>Vehicles named on at least one transaction in the selected period.</summary>
    public int VehiclesWithActivity { get; set; }
    public int CreditCount { get; set; }
    public int SmsCount { get; set; }
    public int TransactionCount { get; set; }
    public int AgentCount { get; set; }
    public int TranstypeCount { get; set; }
    public int ReversedCount { get; set; }
    public decimal CollectedTotal { get; set; }
    public decimal LoanArrearsTotal { get; set; }
    public decimal VehicleArrearsTotal { get; set; }
    public decimal VehiclePenaltyTotal { get; set; }
    public decimal PenaltyTotal { get; set; }
    public decimal DailyRepaymentTotal { get; set; }
    public decimal SavingsTotal { get; set; }
    public decimal XmasTotal { get; set; }

    public bool HasData => Tiles.Count > 0 && string.IsNullOrWhiteSpace(ErrorMessage);
}

public sealed record KmosTileViewModel(string Label, string Value, string Note, string Tone = "neutral");

public sealed record KmosBarViewModel(string Label, double Value, string Display, string Note = "");

public sealed record KmosTypeViewModel(string Code, string Name, int Count, decimal Amount, double Share);

public sealed record KmosButtonViewModel(string Code, string Name, bool Active);

public sealed record KmosRankViewModel(string Key, string Name, int Count, decimal Amount);

public sealed record KmosDebtorViewModel(
    string No,
    string Name,
    string Phone,
    string Status,
    decimal LoanArrears,
    decimal Penalty,
    decimal DailyRepayment,
    int Transactions);

public sealed record KmosVehicleRowViewModel(
    string Number,
    string Type,
    decimal Arrears,
    decimal Penalty,
    decimal DailyContribution,
    int Transactions);

public sealed record KmosTransactionRowViewModel(
    string DocumentNo,
    DateTime? Date,
    string Time,
    string Type,
    string AccountName,
    string Vehicle,
    string Agent,
    decimal Amount,
    bool Reversed);

public sealed record KmosSmsRowViewModel(int EntryNo, DateTime? Date, string Phone, string Message, string Sent);
