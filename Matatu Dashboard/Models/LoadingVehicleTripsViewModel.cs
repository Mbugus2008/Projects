namespace Matatu_Dashboard.Models;

/// <summary>
/// Vehicle-by-vehicle detail behind the loading screen: for each unit, every arrival at a loading
/// point and the times it happened (arrived, went round, loaded, left).
///
/// The summary page answers "how bad is the congestion"; this page answers "what did THIS vehicle
/// actually do today", which is what a supervisor needs before talking to a crew.
/// </summary>
public sealed class LoadingVehicleTripsViewModel
{
    public string Range { get; set; } = "today";
    public DateTime RetrievedAt { get; set; } = DateTime.Now;
    public string FilterDescription { get; set; } = string.Empty;
    public string? ErrorMessage { get; set; }

    /// <summary>Vehicle the page is filtered to, or null for all vehicles.</summary>
    public string? SelectedVehicle { get; set; }

    /// <summary>When true only arrivals that ended in a load are shown.</summary>
    public bool LoadsOnly { get; set; } = true;

    public int Trips { get; set; }
    public int WentRound { get; set; }

    public List<LoadingVehicleSummaryRow> Vehicles { get; set; } = [];
    public List<LoadingVehicleTripRow> TripRows { get; set; } = [];

    /// <summary>True when the range held more arrivals than could be read in one pass.</summary>
    public bool Truncated { get; set; }

    public bool HasData => TripRows.Count > 0;

    /// <summary>Day ranges show the date next to each time; single days only need the clock.</summary>
    public bool ShowDates => Range is "week" or "month";
}

/// <summary>One vehicle's totals for the period - the row you click to drill into its trips.</summary>
public sealed class LoadingVehicleSummaryRow
{
    public string Vehicle { get; set; } = string.Empty;

    /// <summary>Depot fleet number, when the vehicle is known in VehiclesBasics.</summary>
    public string? Fleet { get; set; }

    /// <summary>Visits to a loading point in scope (loads only, or every arrival).</summary>
    public int Arrivals { get; set; }

    public int Trips { get; set; }

    /// <summary>Times this vehicle arrived, found the bay full and looped back before loading.</summary>
    public int Rounds { get; set; }

    /// <summary>Arrivals where it waited inside the fence and then drove out without loading.</summary>
    public int WaitedInBay { get; set; }

    public double FirstTimePct { get; set; }
    public double AverageLoadingMinutes { get; set; }
    public DateTime? FirstArrival { get; set; }
    public DateTime? LastDeparture { get; set; }

    /// <summary>Minutes lost looping: first arrival to the moment it finally loaded.</summary>
    public double TotalWaitMinutes { get; set; }
}

/// <summary>One visit to a loading point: arrive, maybe loop, load, leave.</summary>
public sealed class LoadingVehicleTripRow
{
    public string Vehicle { get; set; } = string.Empty;

    /// <summary>Depot fleet number, when the vehicle is known in VehiclesBasics.</summary>
    public string? Fleet { get; set; }

    public string LoadingPoint { get; set; } = string.Empty;

    /// <summary>When the vehicle first reached the fence for this attempt.</summary>
    public DateTime Arrived { get; set; }

    /// <summary>When it finally got in and stayed long enough to load. Null = it never loaded.</summary>
    public DateTime? LoadedAt { get; set; }

    /// <summary>When it left the fence for the last time in this attempt.</summary>
    public DateTime Departed { get; set; }

    /// <summary>When it drove off after the successful stop (the load's own exit).</summary>
    public DateTime? LoadUntil { get; set; }

    public int Rounds { get; set; }
    public bool DidLoad => LoadedAt is not null;

    /// <summary>Arrivals where the unit waited inside the fence before driving out again.</summary>
    public int WaitedBefore { get; set; }

    /// <summary>Minutes it spent waiting inside the fence on those arrivals.</summary>
    public double WaitedMinutes { get; set; }

    /// <summary>
    /// Where the unit was next seen after it drove off. A completed load is followed by the vehicle
    /// turning up in another geofence; one that never reappears is worth checking.
    /// </summary>
    public string? MovedOnTo { get; set; }

    public DateTime? MovedOnAt { get; set; }

    public bool MovedOn => !string.IsNullOrWhiteSpace(MovedOnTo);

    /// <summary>Minutes spent loading once inside (the successful stop).</summary>
    public double MinutesInBay { get; set; }

    /// <summary>Minutes from first arrival to the successful entry - time lost to queueing.</summary>
    public double WaitMinutes { get; set; }

    /// <summary>Total minutes from first arrival to driving off, looping included.</summary>
    public double TotalMinutes => Math.Round(Math.Max(0, (Departed - Arrived).TotalMinutes), 0);

    /// <summary>The aborted rounds, in order, so the times can be read off.</summary>
    public List<LoadingRoundRow> RoundDetail { get; set; } = [];
}

/// <summary>One aborted round: in and out of the fence without loading.</summary>
public sealed class LoadingRoundRow
{
    public DateTime Enter { get; set; }
    public DateTime Exit { get; set; }
    public double Minutes { get; set; }

    /// <summary>
    /// True when the unit stayed long enough to load but came back afterwards - it was waiting in
    /// the yard, not driving round the block.
    /// </summary>
    public bool Waited { get; set; }
}
