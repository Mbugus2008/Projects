using Rental.Models;
using Xunit;

namespace RentalAdmin.Tests;

public class InvoiceTests
{
    [Fact]
    public void Balance_IsTotalMinusPaid()
    {
        var invoice = new Invoice { TotalAmount = 88_000m, AmountPaid = 30_000m };

        Assert.Equal(58_000m, invoice.Balance);
    }

    [Fact]
    public void Balance_IsZeroWhenFullyPaid()
    {
        var invoice = new Invoice { TotalAmount = 88_000m, AmountPaid = 88_000m };

        Assert.Equal(0m, invoice.Balance);
    }

    [Fact]
    public void DefaultStatus_IsSent()
    {
        var invoice = new Invoice();

        Assert.Equal("Sent", invoice.Status);
    }

    [Fact]
    public void InvoiceLine_RequiresDescription()
    {
        var line = new InvoiceLine { Amount = 2500m };

        Assert.NotEmpty(Validate(line));
    }

    [Fact]
    public void InvoiceLine_RejectsNegativeAmount()
    {
        var line = new InvoiceLine { Description = "Water", Amount = -1m };

        Assert.NotEmpty(Validate(line));
    }

    [Fact]
    public void InvoiceLine_AcceptsAmenityItems()
    {
        var water = new InvoiceLine { Description = "Water", Amount = 2_500m };
        var garbage = new InvoiceLine { Description = "Garbage", Amount = 500m };

        Assert.Empty(Validate(water));
        Assert.Empty(Validate(garbage));
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
