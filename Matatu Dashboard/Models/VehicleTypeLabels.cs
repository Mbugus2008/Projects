namespace Matatu_Dashboard.Models;

/// <summary>
/// Maps the Business Central "Vehicle Type" option value to its label.
///
/// BC exposes the same code under two names: <c>Capacity</c> on the
/// Deport_n_Fuel page (what the Fuel/Dispatch pages read) and
/// <c>Vehicle_Type</c> on VehiclesBasics. The numbering is the position of the
/// option in the BC option string, so the labels below must stay in the same
/// order as <c>vehicle_type</c> / <c>vehicle_type_desc</c> in the mobile app
/// (lib/models/vehicles/vehicle.dart) - that keeps the dashboard and the app
/// showing identical wording.
/// </summary>
public static class VehicleTypeLabels
{
    private static readonly Dictionary<int, string> Labels = new()
    {
        [0] = "",
        [1] = "14 Seater",
        [2] = "33 Seater",
        [3] = "25 Seater",
        [4] = "29 Seater",
        [5] = "41 Seater",
        [6] = "26 Seater",
        [7] = "37 Seater",
        [8] = "51 Seater",
        [9] = "34 Seater",
        [10] = "38 Seater",
        [11] = "40 Seater",
        [12] = "46 Seater",
        [13] = "60 Seater",
        [14] = "35 Seater",
        [15] = "36 Seater",
        [16] = "39 Seater",
    };

    /// <summary>
    /// Returns the friendly label for a BC vehicle type code. Unknown or
    /// non-numeric values are returned unchanged so a newly added BC option
    /// shows its raw code instead of silently disappearing.
    /// </summary>
    public static string Describe(string? value)
    {
        if (string.IsNullOrWhiteSpace(value)) return string.Empty;
        var trimmed = value.Trim();
        return int.TryParse(trimmed, out var code) && Labels.TryGetValue(code, out var label)
            ? label
            : trimmed;
    }
}
