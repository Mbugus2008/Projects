using Rental.Models;
using Xunit;

namespace RentalAdmin.Tests;

public class SettingsTests
{
    [Fact]
    public void Defaults_AreKenyanFriendly()
    {
        var settings = new AppSettings();

        Assert.Equal(150m, settings.WaterRatePerUnit);
        Assert.Equal(500m, settings.GarbageFee);
    }

    [Fact]
    public void AcceptsRealisticValues()
    {
        var settings = new AppSettings
        {
            WaterRatePerUnit = 180m,
            GarbageFee = 700m,
        };

        Assert.Empty(Validate(settings));
    }

    [Fact]
    public void RejectsNegativeWaterRate()
    {
        var settings = new AppSettings { WaterRatePerUnit = -1m };

        Assert.NotEmpty(Validate(settings));
    }

    [Fact]
    public void RejectsAbsurdWaterRate()
    {
        var settings = new AppSettings { WaterRatePerUnit = 2_000_000m };

        Assert.NotEmpty(Validate(settings));
    }

    [Fact]
    public void RejectsNegativeGarbageFee()
    {
        var settings = new AppSettings { GarbageFee = -5m };

        Assert.NotEmpty(Validate(settings));
    }

    private static List<System.ComponentModel.DataAnnotations.ValidationResult> Validate(object model)
    {
        var results = new List<System.ComponentModel.DataAnnotations.ValidationResult>();
        System.ComponentModel.DataAnnotations.Validator.TryValidateObject(
            model,
            new System.ComponentModel.DataAnnotations.ValidationContext(model),
            results,
            validateAllProperties: true);
        return results;
    }
}
