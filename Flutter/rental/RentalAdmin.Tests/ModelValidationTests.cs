using System.ComponentModel.DataAnnotations;
using Rental.Models;
using Xunit;

namespace RentalAdmin.Tests;

public class ModelValidationTests
{
    private static List<ValidationResult> Validate(object model)
    {
        var results = new List<ValidationResult>();
        Validator.TryValidateObject(
            model,
            new ValidationContext(model),
            results,
            validateAllProperties: true);
        return results;
    }

    // --- Lease: Kenyan Shilling ranges (regression: range used to cap at 100k)

    [Fact]
    public void Lease_AcceptsRealisticKenyanRents()
    {
        var lease = new Lease
        {
            TenantId = 1,
            StartDate = new DateTime(2026, 1, 1),
            MonthlyRent = 950_000m,
            SecurityDeposit = 950_000m,
        };

        Assert.Empty(Validate(lease));
    }

    [Fact]
    public void Lease_RejectsNegativeRent()
    {
        var lease = new Lease { TenantId = 1, MonthlyRent = -1m };

        Assert.NotEmpty(Validate(lease));
    }

    [Fact]
    public void Lease_RejectsRentBeyondConfiguredMaximum()
    {
        var lease = new Lease { TenantId = 1, MonthlyRent = 20_000_000m };

        Assert.NotEmpty(Validate(lease));
    }

    // --- Payment

    [Fact]
    public void Payment_AcceptsLargeMpesaAmounts()
    {
        var payment = new Payment { LeaseId = 1, Amount = 85_000m };

        Assert.Empty(Validate(payment));
    }

    [Fact]
    public void Payment_RejectsNegativeAmounts()
    {
        var payment = new Payment { LeaseId = 1, Amount = -50m };

        Assert.NotEmpty(Validate(payment));
    }

    // --- Property

    [Fact]
    public void Property_RequiresAName()
    {
        var property = new Property { Address = "Wood Avenue, Kilimani" };

        Assert.NotEmpty(Validate(property));
    }

    [Fact]
    public void Property_AcceptsValidKenyanProperty()
    {
        var property = new Property
        {
            Name = "Kilimani Heights",
            Address = "Wood Avenue, Kilimani",
            City = "Nairobi",
            State = "Nairobi County",
            ZipCode = "00100",
            Units = 12,
        };

        Assert.Empty(Validate(property));
    }

    [Fact]
    public void Property_RejectsAbsurdUnitCounts()
    {
        var property = new Property
        {
            Name = "Kilimani Heights",
            Address = "Wood Avenue",
            Units = 600,
        };

        Assert.NotEmpty(Validate(property));
    }

    // --- MaintenanceRequest

    [Fact]
    public void MaintenanceRequest_RequiresTitleAndDescription()
    {
        var request = new MaintenanceRequest();

        Assert.NotEmpty(Validate(request));
    }

    [Fact]
    public void MaintenanceRequest_AcceptsKenyanMaintenanceCosts()
    {
        var request = new MaintenanceRequest
        {
            Title = "Air conditioner not cooling",
            Description = "Air conditioner runs but does not cool the apartment.",
            EstimatedCost = 25_000m,
            Priority = "High",
            Status = "In Progress",
        };

        Assert.Empty(Validate(request));
    }
}
