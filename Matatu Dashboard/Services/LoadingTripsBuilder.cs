using System.Globalization;
using System.Text.Json;
using Matatu_Dashboard.Models;

namespace Matatu_Dashboard.Services;

/// <summary>
/// Turns raw geofence alarms (ProTrack_Alerts, Alarm_Type 5 = entered a fence, 6 = left it)
/// into a loading-performance picture a client can act on.
///
/// A vehicle that finds the loading bay occupied drives out of the fence and comes back, so the
/// short in/out cycles are aborted attempts rather than tracking noise. Pairing every "in" with
/// the next "out" for the same device and fence gives one cycle per arrival, and the length of
/// that cycle decides what happened:
///   * under <see cref="LoadedMinutes"/>  -> the bay was full, the vehicle went round
///   * at least <see cref="LoadedMinutes"/> -> the vehicle loaded
/// </summary>
public static class LoadingTripsBuilder
{
    /// <summary>Dwell at or above this many minutes counts as a completed load.</summary>
    public const int LoadedMinutes = 5;

    /// <summary>Arrivals within this many minutes of the previous exit belong to the same attempt.</summary>
    public const int LoopGapMinutes = 30;
    private const string EastAfricaId = "E. Africa Standard Time";

    /// <summary>Local time zone for "hour of day" reporting (tracking timestamps are UTC).</summary>
    public static TimeZoneInfo DisplayTimeZone { get; } = ResolveTimeZone();

    public static LoadingTripsViewModel Build(
        IReadOnlyCollection<JsonElement> items,
        string range,
        DateTime retrievedAt,
        string filterDescription)
    {
        var model = new LoadingTripsViewModel
        {
            Range = range,
            RetrievedAt = retrievedAt,
            FilterDescription = filterDescription
        };

        var cycles = BuildCycles(items, out var unpaired);
        if (cycles.Count == 0)
        {
            return model;
        }

        var loads = cycles.Where(cycle => cycle.IsLoad).ToList();
        var aborts = cycles.Where(cycle => !cycle.IsLoad).ToList();

        model.Trips = loads.Count;
        model.WentRound = aborts.Count;
        model.Vehicles = cycles.Select(cycle => cycle.Vehicle).Where(value => !string.IsNullOrWhiteSpace(value))
            .Distinct(StringComparer.OrdinalIgnoreCase).Count();

        // Loops are only blamed on a trip when the vehicle actually loaded at the end of them.
        // Arrivals at a fence the vehicle merely drives through are reported separately, otherwise
        // they would inflate the "rounds per trip" figure several times over.
        var visits = BuildVisits(cycles, out var passThroughArrivals);
        var loadedVisits = visits.Where(visit => visit.Load is not null).ToList();
        var roundsBeforeLoads = loadedVisits.Sum(visit => visit.RoundsBeforeLoad);

        model.PassThroughArrivals = passThroughArrivals;
        model.LoadedVisits = loadedVisits.Count;
        model.LoopsPerTrip = model.Trips == 0 ? 0 : Math.Round((double)roundsBeforeLoads / model.Trips, 2);
        model.LoadedFirstTimePct = loadedVisits.Count == 0
            ? 0
            : Math.Round(100.0 * loadedVisits.Count(visit => visit.RoundsBeforeLoad == 0) / loadedVisits.Count, 1);
        model.AverageLoadingMinutes = model.Trips == 0 ? 0 : Math.Round(loads.Average(load => load.Minutes), 1);

        model.Hours = BuildHours(cycles);
        model.LoadingPointRows = BuildLoadingPoints(cycles);
        model.ProblemVehicles = BuildVehicles(cycles);
        model.LoadingPoints = model.LoadingPointRows.Count;

        var busiest = model.Hours.Where(hour => hour.Trips + hour.WentRound >= 10).ToList();
        var worst = busiest.OrderByDescending(hour => hour.PressurePct).ThenBy(hour => hour.Hour).FirstOrDefault();
        var best = busiest.OrderBy(hour => hour.PressurePct).ThenBy(hour => hour.Hour).FirstOrDefault();

        if (worst is not null)
        {
            worst.IsWorst = true;
            model.WorstHourLabel = worst.Label;
            model.WorstHourPressure = worst.PressurePct;
        }

        if (best is not null)
        {
            model.BestHourLabel = best.Label;
            model.BestHourPressure = best.PressurePct;
        }

        model.Takeaways = BuildTakeaways(model, aborts.Count, unpaired);
        return model;
    }
    /// <summary>Group arrivals into visits, and count arrivals that never led to a load.</summary>
    private static List<Visit> BuildVisits(IReadOnlyCollection<Cycle> cycles, out int passThroughArrivals)
    {
        var visits = new List<Visit>();
        passThroughArrivals = 0;

        foreach (var group in cycles.GroupBy(cycle => $"{cycle.Imei}|{cycle.Fence}", StringComparer.OrdinalIgnoreCase))
        {
            var ordered = group.OrderBy(cycle => cycle.EnterUtc).ToList();
            var current = new List<Cycle>();
            DateTime? previousExit = null;

            foreach (var cycle in ordered)
            {
                if (previousExit is not null && (cycle.EnterUtc - previousExit.Value).TotalMinutes > LoopGapMinutes)
                {
                    visits.Add(new Visit(cycle.Imei, cycle.Fence, current));
                    current = new List<Cycle>();
                }

                current.Add(cycle);
                previousExit = cycle.ExitUtc;
            }

            if (current.Count > 0)
            {
                visits.Add(new Visit(ordered[0].Imei, ordered[0].Fence, current));
            }
        }

        foreach (var visit in visits.Where(visit => visit.Load is null))
        {
            passThroughArrivals += visit.Cycles.Count;
        }

        return visits;
    }
    // ── Pairing ────────────────────────────────────────────────────────────────

    private sealed record Cycle(string Imei, string Vehicle, string Fence, DateTime EnterUtc, DateTime ExitUtc)
    {
        public double Minutes => Math.Max(0, (ExitUtc - EnterUtc).TotalMinutes);
        public bool IsLoad => Minutes >= LoadedMinutes;
        public DateTime EnterLocal => TimeZoneInfo.ConvertTimeFromUtc(EnterUtc, DisplayTimeZone);
    }

    /// <summary>
    /// One stay at one fence: the arrivals that belong to the same attempt to load. A vehicle that
    /// goes round and comes straight back (within <see cref="LoopGapMinutes"/>) is still in the same
    /// visit, so the loops in front of its successful load can be counted against that load.
    /// </summary>
    private sealed record Visit(string Imei, string Fence, List<Cycle> Cycles)
    {
        public Cycle? Load => Cycles.FirstOrDefault(cycle => cycle.IsLoad);

        /// <summary>Loops this vehicle made before it finally loaded.</summary>
        public int RoundsBeforeLoad => Cycles.FindIndex(cycle => cycle.IsLoad) switch
        {
            var index when index > 0 => index,
            _ => 0
        };
    }

    private static List<Cycle> BuildCycles(IReadOnlyCollection<JsonElement> items, out int unpaired)
    {
        unpaired = 0;
        var cycles = new List<Cycle>();

        var rows = new List<(string Imei, string Fence, string Vehicle, int Type, DateTime TimeUtc)>();
        foreach (var item in items)
        {
            var imei = ReadString(item, "IMEI");
            var fence = ReadString(item, "Geofence_Name");
            var time = ReadDate(item, "GPS_Date_Time");
            var type = ReadInt(item, "Alarm_Type");

            if (string.IsNullOrWhiteSpace(imei) || string.IsNullOrWhiteSpace(fence) || time is null || type is null)
            {
                continue;
            }

            rows.Add((imei, fence, ReadString(item, "Vehicle_No") ?? string.Empty, type.Value, time.Value));
        }

        foreach (var group in rows.GroupBy(row => $"{row.Imei}|{row.Fence}", StringComparer.OrdinalIgnoreCase))
        {
            var sequence = group.OrderBy(row => row.TimeUtc).ToList();

            for (var i = 1; i < sequence.Count; i++)
            {
                if (sequence[i - 1].Type != 5 || sequence[i].Type != 6)
                {
                    // A missing partner: the vehicle entered and never left, or the exit arrived
                    // without its entry. Worth surfacing rather than silently dropping.
                    unpaired++;
                    continue;
                }

                cycles.Add(new Cycle(sequence[i].Imei, sequence[i].Vehicle, sequence[i].Fence, sequence[i - 1].TimeUtc, sequence[i].TimeUtc));
            }
        }

        return cycles;
    }

    // ── Aggregations ───────────────────────────────────────────────────────────

    private static List<LoadingHourRow> BuildHours(IReadOnlyCollection<Cycle> cycles)
    {
        var rows = new List<LoadingHourRow>();

        foreach (var hour in cycles.GroupBy(cycle => cycle.EnterLocal.Hour).OrderBy(group => group.Key))
        {
            var trips = hour.Count(cycle => cycle.IsLoad);
            var wentRound = hour.Count() - trips;
            var total = hour.Count();

            rows.Add(new LoadingHourRow
            {
                Hour = hour.Key,
                Trips = trips,
                WentRound = wentRound,
                PressurePct = total == 0 ? 0 : Math.Round(100.0 * wentRound / total, 0)
            });
        }

        return rows;
    }

    private static List<LoadingPointRow> BuildLoadingPoints(IReadOnlyCollection<Cycle> cycles)
    {
        return cycles
            .GroupBy(cycle => cycle.Fence, StringComparer.OrdinalIgnoreCase)
            .Select(group =>
            {
                var trips = group.Count(cycle => cycle.IsLoad);
                var total = group.Count();
                return new LoadingPointRow
                {
                    Name = group.Key,
                    Trips = trips,
                    WentRound = total - trips,
                    SuccessPct = total == 0 ? 0 : Math.Round(100.0 * trips / total, 0)
                };
            })
            .OrderByDescending(row => row.Trips)
            .ToList();
    }

    private static List<LoadingVehicleRow> BuildVehicles(IReadOnlyCollection<Cycle> cycles)
    {
        return cycles
            .Where(cycle => !string.IsNullOrWhiteSpace(cycle.Vehicle))
            .GroupBy(cycle => cycle.Vehicle, StringComparer.OrdinalIgnoreCase)
            .Where(group => group.Count() >= 5)
            .Select(group =>
            {
                var loads = group.Where(cycle => cycle.IsLoad).ToList();
                var total = group.Count();
                return new LoadingVehicleRow
                {
                    Vehicle = group.Key,
                    Trips = loads.Count,
                    WentRound = total - loads.Count,
                    PressurePct = total == 0 ? 0 : Math.Round(100.0 * (total - loads.Count) / total, 0),
                    AverageLoadingMinutes = loads.Count == 0 ? 0 : Math.Round(loads.Average(load => load.Minutes), 1)
                };
            })
            .OrderByDescending(row => row.PressurePct)
            .ThenByDescending(row => row.WentRound)
            .Take(10)
            .ToList();
    }

    // ── Plain-language findings ────────────────────────────────────────────────

    private static List<string> BuildTakeaways(LoadingTripsViewModel model, int abortCount, int unpaired)
    {
        var notes = new List<string>();
        var arrivals = model.Trips + model.WentRound;

        if (arrivals > 0)
        {
            notes.Add($"Vehicles found the loading bay full on {100 - 100.0 * model.Trips / arrivals:0.#}% of arrivals " +
                      $"({model.WentRound:N0} of {arrivals:N0}); {model.Trips:N0} trips loaded normally.");
        }

        if (model.WorstHourLabel is not null && model.BestHourLabel is not null &&
            model.WorstHourPressure - model.BestHourPressure >= 10)
        {
            notes.Add($"Worst time to load is around {model.WorstHourLabel} ({model.WorstHourPressure:0}% full) " +
                      $"versus {model.BestHourLabel} ({model.BestHourPressure:0}% full) - shift work towards the quieter window.");
        }
        else if (model.WorstHourLabel is not null)
        {
            notes.Add($"Loading pressure is fairly even across the day; highest around {model.WorstHourLabel} ({model.WorstHourPressure:0}%).");
        }

        if (model.LoadedVisits > 0)
        {
            notes.Add($"Of {model.LoadedVisits:N0} vehicles that queued to load, {model.LoadedFirstTimePct:0.#}% got in on their first attempt; " +
                      $"the rest needed {model.LoopsPerTrip:0.##} extra round(s) on average, about {model.LoopsPerTrip * 5:0} minutes of extra driving per trip.");
        }

        if (model.PassThroughArrivals > 0)
        {
            notes.Add($"A further {model.PassThroughArrivals:N0} arrivals never loaded at all - those are vehicles passing through a fence, " +
                      "not vehicles kept waiting, and they are excluded from the queueing figures above.");
        }

        if (model.AverageLoadingMinutes > 0)
        {
            notes.Add($"Once in the bay, average loading time is {model.AverageLoadingMinutes:0.#} minutes.");
        }

        var heaviest = model.ProblemVehicles.FirstOrDefault();
        if (heaviest is not null && heaviest.PressurePct >= 70)
        {
            var offenders = model.ProblemVehicles.Count(row => row.PressurePct >= 70);
            notes.Add($"{offenders} vehicle(s) go round on at least 70% of arrivals - {heaviest.Vehicle} is worst at {heaviest.PressurePct:0}%. " +
                      "Check whether their route timing lands them at the bay at peak time.");
        }

        var busiestPoint = model.LoadingPointRows.FirstOrDefault();
        var weakestPoint = model.LoadingPointRows.OrderBy(row => row.SuccessPct).FirstOrDefault();
        if (busiestPoint is not null && weakestPoint is not null && !ReferenceEquals(busiestPoint, weakestPoint) && weakestPoint.SuccessPct < 25)
        {
            notes.Add($"Only {weakestPoint.SuccessPct:0}% of vehicles entering {weakestPoint.Name} actually load there - " +
                      $"it behaves like a passing-through point rather than a loading bay, so its numbers inflate the 'went round' total.");
        }

        if (unpaired > 0)
        {
            notes.Add($"{unpaired:N0} fence entries had no matching exit (device offline or fence edge cases) and were excluded.");
        }

        return notes;
    }

    // ── JSON helpers ───────────────────────────────────────────────────────────

    private static string? ReadString(JsonElement item, string property)
    {
        if (!item.TryGetProperty(property, out var value))
        {
            return null;
        }

        var text = value.ValueKind == JsonValueKind.String ? value.GetString() : value.ToString();
        return string.IsNullOrWhiteSpace(text) ? null : text;
    }

    private static int? ReadInt(JsonElement item, string property)
    {
        if (!item.TryGetProperty(property, out var value))
        {
            return null;
        }

        if (value.ValueKind == JsonValueKind.Number && value.TryGetInt32(out var number))
        {
            return number;
        }

        return int.TryParse(value.ToString(), NumberStyles.Any, CultureInfo.InvariantCulture, out var parsed) ? parsed : null;
    }

    private static DateTime? ReadDate(JsonElement item, string property)
    {
        var raw = ReadString(item, property);
        if (raw is null)
        {
            return null;
        }

        if (!DateTime.TryParse(raw, CultureInfo.InvariantCulture, DateTimeStyles.AdjustToUniversal | DateTimeStyles.AssumeUniversal, out var parsed))
        {
            return null;
        }

        return DateTime.SpecifyKind(parsed, DateTimeKind.Utc);
    }

    private static TimeZoneInfo ResolveTimeZone()
    {
        try
        {
            return TimeZoneInfo.FindSystemTimeZoneById(EastAfricaId);
        }
        catch (TimeZoneNotFoundException)
        {
            return TimeZoneInfo.Local;
        }
        catch (InvalidTimeZoneException)
        {
            return TimeZoneInfo.Local;
        }
    }
}
