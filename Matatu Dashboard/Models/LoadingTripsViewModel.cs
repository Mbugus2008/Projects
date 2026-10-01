namespace Matatu_Dashboard.Models;

/// <summary>
/// Client-facing view of loading activity at the geofenced loading points.
///
/// The language here is deliberately plain, because the audience is the operator, not a
/// technician:
///   * a TRIP is a vehicle that got into the loading bay and actually loaded
///   * a "WENT ROUND" is a vehicle that arrived, found the bay full, drove out of the fence
///     and came back. Those short in/out cycles are real events, not tracking noise.
/// </summary>
public sealed class LoadingTripsViewModel
{
    public string Range { get; set; } = "today";
    public DateTime RetrievedAt { get; set; } = DateTime.Now;
    public string FilterDescription { get; set; } = string.Empty;
    public string? ErrorMessage { get; set; }

    /// <summary>Vehicles that loaded: an in/out cycle long enough to be a real loading stop.</summary>
    public int Trips { get; set; }

    /// <summary>Arrivals that could not load and had to go round.</summary>
    public int WentRound { get; set; }

    public int Vehicles { get; set; }
    public int LoadingPoints { get; set; }

    /// <summary>Average times a vehicle had to go round for each load it completed.</summary>
    public double LoopsPerTrip { get; set; }

    /// <summary>Share of vehicles that queued to load and got in on their first attempt.</summary>
    public double LoadedFirstTimePct { get; set; }

    /// <summary>Vehicles that queued and did load - the base for <see cref="LoadedFirstTimePct"/>.</summary>
    public int LoadedVisits { get; set; }

    /// <summary>
    /// Arrivals at a fence that never led to a load - typically a fence the vehicle drives through
    /// rather than a loading bay. Kept out of the queueing figures so they cannot inflate them.
    /// </summary>
    public int PassThroughArrivals { get; set; }

    /// <summary>Average time spent in the bay on a successful load, in minutes.</summary>
    public double AverageLoadingMinutes { get; set; }

    public string? WorstHourLabel { get; set; }
    public double WorstHourPressure { get; set; }
    public string? BestHourLabel { get; set; }
    public double BestHourPressure { get; set; }

    public List<LoadingHourRow> Hours { get; set; } = [];
    public List<LoadingVehicleRow> ProblemVehicles { get; set; } = [];
    public List<LoadingPointRow> LoadingPointRows { get; set; } = [];
    public List<string> Takeaways { get; set; } = [];

    public bool HasData => Trips > 0 || WentRound > 0;
}

/// <summary>One hour of the operating day.</summary>
public sealed class LoadingHourRow
{
    public int Hour { get; set; }
    public string Label => $"{Hour:00}:00";
    public int Trips { get; set; }
    public int WentRound { get; set; }

    /// <summary>Share of arrivals this hour that had to go round, 0-100.</summary>
    public double PressurePct { get; set; }

    public bool IsWorst { get; set; }
}

public sealed class LoadingVehicleRow
{
    public string Vehicle { get; set; } = string.Empty;
    public int Trips { get; set; }
    public int WentRound { get; set; }
    public double PressurePct { get; set; }
    public double AverageLoadingMinutes { get; set; }
}

public sealed class LoadingPointRow
{
    public string Name { get; set; } = string.Empty;
    public int Trips { get; set; }
    public int WentRound { get; set; }
    public double SuccessPct { get; set; }
}
