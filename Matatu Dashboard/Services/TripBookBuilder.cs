using Matatu_Dashboard.Models;

namespace Matatu_Dashboard.Services;

/// <summary>One trip line in the Trip Book.</summary>
public sealed class TripBookTrip
{
    public int TripNo { get; init; }
    public string From { get; init; } = "-";
    public string To { get; init; } = "-";
    public string Departure { get; init; } = "-";
    public string Arrival { get; init; } = "-";
    public string Received { get; init; } = "-";
    public int Pax { get; init; }
    public decimal Fare { get; init; }
    public decimal Total { get; init; }
    public decimal Expenses { get; init; }
}

/// <summary>The vehicles of the day and everything the book shows about each.</summary>
public sealed class TripBookVehicle
{
    public string Vehicle { get; init; } = string.Empty;
    public string Fleet { get; init; } = "-";
    public string Date { get; init; } = "-";
    public string Driver { get; init; } = "-";
    public string Conductor { get; init; } = "-";
    public string EntryNo { get; init; } = "-";

    /// <summary>The vehicle's management figure for the day (depot page).</summary>
    public decimal Management { get; init; }

    /// <summary>Cash recorded against the waybill.</summary>
    public decimal Cash { get; init; }

    public List<TripBookTrip> Trips { get; init; } = [];

    /// <summary>Gross of the trips - the sum of the trip totals, not a net figure.</summary>
    public decimal TotalAmount => Trips.Sum(t => t.Total);

    public decimal Account => TotalAmount - Management;

    public decimal Uncollected => TotalAmount - Cash;

    public decimal TargetBalance => Account - Cash;

    public bool HasWaybill => EntryNo != "-";
}

public sealed class TripBookReport
{
    public List<TripBookVehicle> Vehicles { get; init; } = [];
    public string Range { get; init; } = "today";
    public DateTime RetrievedAt { get; init; } = DateTime.Now;
}

public static class TripBookBuilder
{
    public static TripBookReport Build(
        DashboardSectionViewModel depot,
        DashboardSectionViewModel waybills,
        DashboardSectionViewModel? trips,
        string range,
        DateTime retrievedAt)
    {
        var tripsByEntry = (trips?.Rows ?? [])
            .GroupBy(trip => WaybillReport.Whole(trip, "Weign_Bridge_id"))
            .ToDictionary(group => group.Key, group => group.ToList());

        // One waybill per vehicle per day, so indexing by vehicle is safe.
        var waybillByVehicle = new Dictionary<string, Dictionary<string, string>>(StringComparer.OrdinalIgnoreCase);
        foreach (var waybill in waybills.Rows)
        {
            var vehicle = WaybillReport.Value(waybill, "Vehicle_No").Trim();
            if (vehicle.Length > 0)
            {
                waybillByVehicle[vehicle] = waybill;
            }
        }

        var vehicles = new List<TripBookVehicle>();
        var seen = new HashSet<string>(StringComparer.OrdinalIgnoreCase);

        // A vehicle is in the book if it has a depot page, a waybill, or both -
        // a vehicle that ran without a depot page must not go missing.
        foreach (var row in depot.Rows)
        {
            var vehicle = WaybillReport.Value(row, "Vehicle").Trim();
            if (vehicle.Length == 0 || !seen.Add(vehicle)) continue;

            waybillByVehicle.TryGetValue(vehicle, out var waybill);
            vehicles.Add(BuildVehicle(vehicle, row, waybill, tripsByEntry));
        }

        foreach (var waybill in waybills.Rows)
        {
            var vehicle = WaybillReport.Value(waybill, "Vehicle_No").Trim();
            if (vehicle.Length == 0 || !seen.Add(vehicle)) continue;

            vehicles.Add(BuildVehicle(vehicle, null, waybill, tripsByEntry));
        }

        return new TripBookReport
        {
            // Fleet is text in BC, so '99' would sort after '100' without this.
            Vehicles = vehicles
                .OrderBy(v => int.TryParse(v.Fleet.Trim(), out var fleet) ? fleet : int.MaxValue)
                .ThenBy(v => v.Fleet, StringComparer.OrdinalIgnoreCase)
                .ThenBy(v => v.Vehicle, StringComparer.OrdinalIgnoreCase)
                .ToList(),
            Range = range,
            RetrievedAt = retrievedAt
        };
    }

    private static TripBookVehicle BuildVehicle(
        string vehicle,
        Dictionary<string, string>? depotRow,
        Dictionary<string, string>? waybill,
        Dictionary<int, List<Dictionary<string, string>>> tripsByEntry)
    {
        var entry = waybill is null ? 0 : WaybillReport.Whole(waybill, "Entry_No");
        var tripRows = entry > 0 && tripsByEntry.TryGetValue(entry, out var found) ? found : [];

        // Crew come from the waybill (member numbers); the depot page only
        // carries names, so it is the fallback.
        var driver = waybill is null ? string.Empty : WaybillReport.Value(waybill, "Driver");
        var conductor = waybill is null ? string.Empty : WaybillReport.Value(waybill, "Conductor");
        if (driver.Length == 0 && depotRow is not null) driver = WaybillReport.Value(depotRow, "Driver_Name");
        if (conductor.Length == 0 && depotRow is not null) conductor = WaybillReport.Value(depotRow, "Conductor_Name");

        var fleetFallback = depotRow is null ? "-" : WaybillReport.Value(depotRow, "Fleet", "-");
        var fleetSource = waybill ?? depotRow;

        return new TripBookVehicle
        {
            Vehicle = vehicle,
            Fleet = fleetSource is null
                ? fleetFallback
                : WaybillReport.Value(fleetSource, "Fleet_No", fleetFallback),
            Date = TripBookDate(waybill, depotRow),
            Driver = driver.Length == 0 ? "-" : driver,
            Conductor = conductor.Length == 0 ? "-" : conductor,
            EntryNo = entry > 0 ? entry.ToString() : "-",
            Management = depotRow is null ? 0m : WaybillReport.Number(depotRow, "Management"),
            Cash = waybill is null ? 0m : WaybillReport.Number(waybill, "Cash"),
            Trips = tripRows
                .OrderBy(trip => WaybillReport.Whole(trip, "Trip_No"))
                .Select(trip => new TripBookTrip
                {
                    TripNo = WaybillReport.Whole(trip, "Trip_No"),
                    From = WaybillReport.Value(trip, "From", "-"),
                    To = WaybillReport.Value(trip, "To", "-"),
                    Departure = WaybillReport.Clock(WaybillReport.Value(trip, "From_Time")),
                    Arrival = WaybillReport.Clock(WaybillReport.Value(trip, "To_Time")),
                    Received = WaybillReport.Value(trip, "Amount_Received", "-"),
                    Pax = WaybillReport.Whole(trip, "Pax_No"),
                    Fare = WaybillReport.Number(trip, "Fare_Amount"),
                    Total = WaybillReport.Number(trip, "Total"),
                    Expenses = WaybillReport.Number(trip, "Expenses")
                })
                .ToList()
        };
    }

    private static string TripBookDate(
        Dictionary<string, string>? waybill,
        Dictionary<string, string>? depotRow)
    {
        var depotDate = depotRow is null ? "-" : WaybillReport.Value(depotRow, "Date", "-");
        var raw = waybill is null
            ? depotDate
            : WaybillReport.Value(waybill, "Date", depotDate);

        if (raw.Length >= 10)
        {
            return DateTime.TryParse(raw, out var parsed)
                ? parsed.ToString("dd-MMM-yyyy")
                : raw[..10];
        }

        return raw;
    }
}
