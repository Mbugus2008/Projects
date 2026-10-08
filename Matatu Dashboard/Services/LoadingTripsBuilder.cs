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
///   * under <see cref="LoadedMinutes"/>   -> the bay was full, the vehicle went round
///   * at least <see cref="LoadedMinutes"/> -> the vehicle stayed long enough to load
///
/// Staying long enough is not proof on its own: a unit can park in the waiting area inside the
/// fence for twenty minutes, drive out, go round and come in again. Its load is therefore the LAST
/// long stay of the visit - the one it does not come back from - and any long stay before that is
/// counted as waiting in the bay rather than a completed trip.
/// </summary>
public static class LoadingTripsBuilder
{
    /// <summary>Dwell at or above this many minutes counts as a completed load.</summary>
    public const int LoadedMinutes = 5;

    /// <summary>Arrivals within this many minutes of the previous exit belong to the same attempt.</summary>
    public const int LoopGapMinutes = 30;

    /// <summary>
    /// A device near a fence boundary can report out/in within seconds; that is one stay, not a
    /// vehicle driving round the block. Stays separated by less than this are merged, so a
    /// "round" always means the vehicle really left and came back.
    /// </summary>
    public const int FenceFlickerMinutes = 2;

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

        var visits = BuildVisits(cycles, out var passThroughArrivals);
        var stays = Classify(visits);
        var loadedVisits = visits.Where(visit => visit.Load is not null).ToList();

        model.Trips = stays.Count(stay => stay.Kind == StayKind.Load);
        model.WentRound = stays.Count(stay => stay.Kind == StayKind.Round);
        model.WaitedInBay = stays.Count(stay => stay.Kind == StayKind.Waited);
        model.Vehicles = cycles.Select(cycle => cycle.Vehicle).Where(value => !string.IsNullOrWhiteSpace(value))
            .Distinct(StringComparer.OrdinalIgnoreCase).Count();

        // Loops are only blamed on a trip when the vehicle actually loaded at the end of them.
        // Arrivals at a fence the vehicle merely drives through are reported separately, otherwise
        // they would inflate the "rounds per trip" figure several times over.
        var roundsBeforeLoads = loadedVisits.Sum(visit => visit.RoundsBeforeLoad);

        model.PassThroughArrivals = passThroughArrivals;
        model.LoadedVisits = loadedVisits.Count;
        model.LoopsPerTrip = model.Trips == 0 ? 0 : Math.Round((double)roundsBeforeLoads / model.Trips, 2);

        // "First time" now means the unit loaded on its first arrival: no rounds at the gate and no
        // parking up inside the fence first.
        model.LoadedFirstTimePct = loadedVisits.Count == 0
            ? 0
            : Math.Round(100.0 * loadedVisits.Count(visit => visit.LoadIndex == 0) / loadedVisits.Count, 1);
        model.AverageLoadingMinutes = loadedVisits.Count == 0
            ? 0
            : Math.Round(loadedVisits.Average(visit => visit.Load!.Minutes), 1);

        model.Hours = BuildHours(stays);
        model.LoadingPointRows = BuildLoadingPoints(stays);
        model.ProblemVehicles = BuildVehicles(stays);
        model.LoadingPoints = model.LoadingPointRows.Count;

        var busiest = model.Hours.Where(hour => hour.Trips + hour.WentRound + hour.Waited >= 10).ToList();
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

        model.Takeaways = BuildTakeaways(model, model.WentRound + model.WaitedInBay, unpaired);
        return model;
    }

    /// <summary>What a stay turned out to be, once the whole visit is known.</summary>
    private enum StayKind
    {
        /// <summary>The stop the vehicle loaded at - the last long stay of the visit.</summary>
        Load,

        /// <summary>Turned away at the gate: in and out again without staying.</summary>
        Round,

        /// <summary>Long enough to load, but the vehicle left and came back, so it was queueing inside.</summary>
        Waited
    }

    /// <summary>A stay plus its verdict, so the aggregations never re-do the visit reasoning.</summary>
    private sealed record ClassifiedStay(Cycle Cycle, StayKind Kind);

    /// <summary>Splits every stay into load, round or wait for the visit it belongs to.</summary>
    private static List<ClassifiedStay> Classify(IEnumerable<Visit> visits)
    {
        var stays = new List<ClassifiedStay>();

        foreach (var visit in visits)
        {
            var loadIndex = visit.LoadIndex;

            for (var i = 0; i < visit.Cycles.Count; i++)
            {
                var cycle = visit.Cycles[i];
                var kind = i == loadIndex
                    ? StayKind.Load
                    : cycle.IsLoad ? StayKind.Waited : StayKind.Round;

                stays.Add(new ClassifiedStay(cycle, kind));
            }
        }

        return stays;
    }

    /// <summary>
    /// Vehicle-by-vehicle detail: every arrival at a loading point with the times it happened, so a
    /// supervisor can follow one vehicle through the day instead of reading aggregate percentages.
    /// Pass-through arrivals (a fence the unit only drives through) are dropped unless the caller
    /// asks for every arrival.
    /// </summary>
    public static LoadingVehicleTripsViewModel BuildVehicleTrips(
        IReadOnlyCollection<JsonElement> items,
        string range,
        DateTime retrievedAt,
        string filterDescription,
        string? vehicleFilter,
        bool loadsOnly)
    {
        var model = new LoadingVehicleTripsViewModel
        {
            Range = range,
            RetrievedAt = retrievedAt,
            FilterDescription = filterDescription,
            SelectedVehicle = string.IsNullOrWhiteSpace(vehicleFilter) ? null : vehicleFilter.Trim(),
            LoadsOnly = loadsOnly
        };

        var cycles = BuildCycles(items, out _);
        if (cycles.Count == 0)
        {
            return model;
        }

        var visits = BuildVisits(cycles, out _)
            .Where(visit => !string.IsNullOrWhiteSpace(visit.Vehicle))
            .ToList();

        if (loadsOnly)
        {
            visits = visits.Where(visit => visit.Load is not null).ToList();
        }

        model.Trips = visits.Count(visit => visit.Load is not null);
        model.WentRound = visits.Sum(visit => visit.Aborts);

        // Summary is always every vehicle in scope, so the picker and the table stay complete even
        // while the page is filtered down to one unit.
        foreach (var group in visits.GroupBy(visit => visit.Vehicle, StringComparer.OrdinalIgnoreCase))
        {
            var ordered = group.OrderBy(visit => visit.FirstEnterUtc).ToList();
            var loaded = ordered.Where(visit => visit.Load is not null).ToList();

            model.Vehicles.Add(new LoadingVehicleSummaryRow
            {
                Vehicle = group.Key,
                Arrivals = ordered.Count,
                Trips = loaded.Count,
                Rounds = ordered.Sum(visit => visit.Rounds),
                WaitedInBay = ordered.Sum(visit => visit.Waited),
                FirstTimePct = loaded.Count == 0
                    ? 0
                    : Math.Round(100.0 * loaded.Count(visit => visit.LoadIndex == 0) / loaded.Count, 0),
                AverageLoadingMinutes = loaded.Count == 0
                    ? 0
                    : Math.Round(loaded.Average(visit => visit.Load!.Minutes), 1),
                FirstArrival = ToLocal(ordered[0].FirstEnterUtc),
                LastDeparture = ToLocal(ordered[^1].LastExitUtc),
                TotalWaitMinutes = Math.Round(ordered.Sum(visit => visit.WaitMinutes + visit.WaitedMinutes), 0)
            });
        }

        model.Vehicles = model.Vehicles
            .OrderBy(row => row.Vehicle, StringComparer.OrdinalIgnoreCase)
            .ToList();

        var scoped = model.SelectedVehicle is null
            ? visits
            : visits.Where(visit => string.Equals(visit.Vehicle, model.SelectedVehicle, StringComparison.OrdinalIgnoreCase)).ToList();

        // Every stay of every device, keyed by device, so a trip can see what the unit did next -
        // the rule is that a load is followed by the unit turning up in another geofence.
        var byImei = visits
            .SelectMany(visit => visit.Cycles)
            .GroupBy(cycle => cycle.Imei, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(group => group.Key, group => group.OrderBy(cycle => cycle.EnterUtc).ToList(), StringComparer.OrdinalIgnoreCase);

        model.TripRows = scoped
            .OrderBy(visit => visit.Vehicle, StringComparer.OrdinalIgnoreCase)
            .ThenBy(visit => visit.FirstEnterUtc)
            .Select(visit => ToTripRow(visit, byImei))
            .ToList();

        return model;
    }

    /// <summary>One visit turned into the row the detail table renders.</summary>
    private static LoadingVehicleTripRow ToTripRow(Visit visit, IReadOnlyDictionary<string, List<Cycle>> byImei)
    {
        var load = visit.Load;
        var row = new LoadingVehicleTripRow
        {
            Vehicle = visit.Vehicle,
            LoadingPoint = visit.Fence,
            Arrived = ToLocal(visit.FirstEnterUtc),
            Departed = ToLocal(visit.LastExitUtc),
            Rounds = visit.Rounds,
            WaitedBefore = visit.Waited,
            WaitedMinutes = Math.Round(visit.WaitedMinutes, 0),
            LoadedAt = load is null ? null : ToLocal(load.EnterUtc)
        };

        if (load is not null)
        {
            row.MinutesInBay = Math.Round(load.Minutes, 1);
            row.LoadUntil = ToLocal(load.ExitUtc);
            row.WaitMinutes = Math.Round(Math.Max(0, (load.EnterUtc - visit.FirstEnterUtc).TotalMinutes), 0);

            // "Seen through other geofences": a completed load is followed by the unit turning up at
            // a DIFFERENT fence. Coming straight back into the same one would have made this stay a
            // wait rather than the load, so only other fences count as the confirmation.
            if (byImei.TryGetValue(visit.Imei, out var deviceCycles))
            {
                var next = deviceCycles.FirstOrDefault(cycle =>
                    cycle.EnterUtc > load.ExitUtc &&
                    !string.Equals(cycle.Fence, visit.Fence, StringComparison.OrdinalIgnoreCase));

                if (next is not null)
                {
                    row.MovedOnTo = next.Fence;
                    row.MovedOnAt = ToLocal(next.EnterUtc);
                }
            }
        }

        row.RoundDetail = visit.Cycles
            .Take(visit.LoadIndex >= 0 ? visit.LoadIndex : visit.Cycles.Count)
            .Select(cycle => new LoadingRoundRow
            {
                Enter = ToLocal(cycle.EnterUtc),
                Exit = ToLocal(cycle.ExitUtc),
                Minutes = Math.Round(cycle.Minutes, 0),
                Waited = cycle.IsLoad
            })
            .ToList();

        return row;
    }

    private static DateTime ToLocal(DateTime utc) => TimeZoneInfo.ConvertTimeFromUtc(utc, DisplayTimeZone);

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
        public DateTime ExitLocal => TimeZoneInfo.ConvertTimeFromUtc(ExitUtc, DisplayTimeZone);
    }

    /// <summary>
    /// One stay at one fence: the arrivals that belong to the same attempt to load. A vehicle that
    /// goes round and comes straight back (within <see cref="LoopGapMinutes"/>) is still in the same
    /// visit, so the loops in front of its successful load can be counted against that load.
    /// </summary>
    private sealed record Visit(string Imei, string Fence, List<Cycle> Cycles)
    {
        /// <summary>The vehicle this attempt belongs to (the raw rows carry the plate mapping).</summary>
        public string Vehicle => Cycles.Count == 0 ? string.Empty : Cycles[0].Vehicle;

        /// <summary>
        /// Where the load sits in the sequence, or -1 when the unit never loaded. This is the LAST
        /// stay long enough to load: if the unit stays long, drives out and comes back, that first
        /// stay was queueing inside the yard rather than a completed trip.
        /// </summary>
        public int LoadIndex => Cycles.FindLastIndex(cycle => cycle.IsLoad);

        public Cycle? Load => LoadIndex >= 0 ? Cycles[LoadIndex] : null;

        /// <summary>Stays examined before the load - every stay when nothing loaded.</summary>
        private int BeforeLoad => LoadIndex >= 0 ? LoadIndex : Cycles.Count;

        /// <summary>Arrivals where the unit was turned away at the gate and left again quickly.</summary>
        public int Rounds => Cycles.Take(BeforeLoad).Count(cycle => !cycle.IsLoad);

        /// <summary>Arrivals where it waited inside the fence and then drove out instead of loading.</summary>
        public int Waited => Cycles.Take(BeforeLoad).Count(cycle => cycle.IsLoad);

        /// <summary>Minutes spent sitting inside the fence before the load (or instead of one).</summary>
        public double WaitedMinutes => Cycles.Take(BeforeLoad).Where(cycle => cycle.IsLoad).Sum(cycle => cycle.Minutes);

        /// <summary>Loops this vehicle made before it finally loaded.</summary>
        public int RoundsBeforeLoad => Rounds;

        /// <summary>Every arrival that did not end in this visit's load.</summary>
        public int Aborts => Rounds + Waited;

        public DateTime FirstEnterUtc => Cycles[0].EnterUtc;
        public DateTime LastExitUtc => Cycles[^1].ExitUtc;

        /// <summary>Minutes lost queueing: first arrival to the successful entry.</summary>
        public double WaitMinutes => Load is null
            ? 0
            : Math.Max(0, (Load.EnterUtc - FirstEnterUtc).TotalMinutes);
    }

    private static List<Cycle> BuildCycles(IReadOnlyCollection<JsonElement> items, out int unpaired)
    {
        unpaired = 0;
        var cycles = new List<Cycle>();

        var rows = new List<(string Imei, string Fence, string Vehicle, int Type, DateTime TimeUtc)>();

        // The staging table has carried duplicate rows before (one import per poll), so the same
        // event seen twice must not be counted twice here.
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

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

            if (!seen.Add($"{imei}|{type.Value}|{time.Value.Ticks}"))
            {
                continue;
            }

            rows.Add((imei, fence, ReadString(item, "Vehicle_No") ?? string.Empty, type.Value, time.Value));
        }

        foreach (var group in rows.GroupBy(row => $"{row.Imei}|{row.Fence}", StringComparer.OrdinalIgnoreCase))
        {
            var sequence = group.OrderBy(row => row.TimeUtc).ToList();
            var paired = new List<Cycle>();

            for (var i = 1; i < sequence.Count; i++)
            {
                if (sequence[i - 1].Type != 5 || sequence[i].Type != 6)
                {
                    // A missing partner: the vehicle entered and never left, or the exit arrived
                    // without its entry. Worth surfacing rather than silently dropping.
                    unpaired++;
                    continue;
                }

                paired.Add(new Cycle(sequence[i].Imei, sequence[i].Vehicle, sequence[i].Fence, sequence[i - 1].TimeUtc, sequence[i].TimeUtc));
            }

            cycles.AddRange(MergeFlickers(paired));
        }

        return cycles;
    }

    /// <summary>
    /// Joins stays that are only seconds or a minute apart into one. Without this a unit sitting
    /// on a boundary shows up as several "arrivals", and each one would be counted as a round.
    /// </summary>
    private static List<Cycle> MergeFlickers(List<Cycle> cycles)
    {
        var merged = new List<Cycle>();

        foreach (var cycle in cycles.OrderBy(cycle => cycle.EnterUtc))
        {
            if (merged.Count > 0 && (cycle.EnterUtc - merged[^1].ExitUtc).TotalMinutes < FenceFlickerMinutes)
            {
                merged[^1] = merged[^1] with { ExitUtc = cycle.ExitUtc };
                continue;
            }

            merged.Add(cycle);
        }

        return merged;
    }

    // ── Aggregations ───────────────────────────────────────────────────────────

    private static List<LoadingHourRow> BuildHours(IReadOnlyCollection<ClassifiedStay> stays)
    {
        var rows = new List<LoadingHourRow>();

        foreach (var hour in stays.GroupBy(stay => stay.Cycle.EnterLocal.Hour).OrderBy(group => group.Key))
        {
            var trips = hour.Count(stay => stay.Kind == StayKind.Load);
            var wentRound = hour.Count(stay => stay.Kind == StayKind.Round);
            var waited = hour.Count(stay => stay.Kind == StayKind.Waited);
            var total = hour.Count();
            var missed = wentRound + waited;

            rows.Add(new LoadingHourRow
            {
                Hour = hour.Key,
                Trips = trips,
                WentRound = wentRound,
                Waited = waited,
                PressurePct = total == 0 ? 0 : Math.Round(100.0 * missed / total, 0)
            });
        }

        return rows;
    }

    private static List<LoadingPointRow> BuildLoadingPoints(IReadOnlyCollection<ClassifiedStay> stays)
    {
        return stays
            .GroupBy(stay => stay.Cycle.Fence, StringComparer.OrdinalIgnoreCase)
            .Select(group =>
            {
                var trips = group.Count(stay => stay.Kind == StayKind.Load);
                var waited = group.Count(stay => stay.Kind == StayKind.Waited);
                var total = group.Count();
                return new LoadingPointRow
                {
                    Name = group.Key,
                    Trips = trips,
                    WentRound = total - trips - waited,
                    Waited = waited,
                    SuccessPct = total == 0 ? 0 : Math.Round(100.0 * trips / total, 0)
                };
            })
            .OrderByDescending(row => row.Trips)
            .ToList();
    }

    private static List<LoadingVehicleRow> BuildVehicles(IReadOnlyCollection<ClassifiedStay> stays)
    {
        return stays
            .Where(stay => !string.IsNullOrWhiteSpace(stay.Cycle.Vehicle))
            .GroupBy(stay => stay.Cycle.Vehicle, StringComparer.OrdinalIgnoreCase)
            .Where(group => group.Count() >= 5)
            .Select(group =>
            {
                var loads = group.Where(stay => stay.Kind == StayKind.Load).ToList();
                var rounds = group.Count(stay => stay.Kind == StayKind.Round);
                var waited = group.Count(stay => stay.Kind == StayKind.Waited);
                var total = group.Count();
                return new LoadingVehicleRow
                {
                    Vehicle = group.Key,
                    Trips = loads.Count,
                    WentRound = rounds,
                    WaitedInBay = waited,
                    PressurePct = total == 0 ? 0 : Math.Round(100.0 * (rounds + waited) / total, 0),
                    AverageLoadingMinutes = loads.Count == 0 ? 0 : Math.Round(loads.Average(stay => stay.Cycle.Minutes), 1)
                };
            })
            .OrderByDescending(row => row.PressurePct)
            .ThenByDescending(row => row.WentRound)
            .Take(10)
            .ToList();
    }

    // ── Plain-language findings ────────────────────────────────────────────────

    private static List<string> BuildTakeaways(LoadingTripsViewModel model, int missedStays, int unpaired)
    {
        var notes = new List<string>();
        var arrivals = model.Trips + missedStays;

        if (arrivals > 0)
        {
            notes.Add($"Vehicles did not load on {100 - 100.0 * model.Trips / arrivals:0.#}% of arrivals " +
                      $"({missedStays:N0} of {arrivals:N0}); {model.Trips:N0} trips loaded normally.");

            if (model.WaitedInBay > 0)
            {
                notes.Add($"Of those, {model.WaitedInBay:N0} arrivals sat inside the fence for more than " +
                          $"{LoadedMinutes} minutes and then drove out again - queueing in the yard rather than a " +
                          "completed trip, so they are not counted as loads.");
            }
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
            var straightIn = model.WentRound == 0 && model.WaitedInBay == 0
                ? "no round was needed"
                : $"the rest needed {model.LoopsPerTrip:0.##} extra round(s) on average, about {model.LoopsPerTrip * 5:0} minutes of extra driving per trip";

            notes.Add($"Of {model.LoadedVisits:N0} arrivals that queued to load, {model.LoadedFirstTimePct:0.#}% loaded on their first attempt; {straightIn}.");
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
            notes.Add($"{offenders} vehicle(s) fail to load on at least 70% of arrivals - {heaviest.Vehicle} is worst at {heaviest.PressurePct:0}%. " +
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
