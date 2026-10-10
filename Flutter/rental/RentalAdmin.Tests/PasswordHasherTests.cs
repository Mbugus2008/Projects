using Rental.Services;
using Xunit;

namespace RentalAdmin.Tests;

public class PasswordHasherTests
{
    [Fact]
    public void Hash_ProducesSaltDotHashFormat()
    {
        var hash = PasswordHasher.Hash("Admin123!");

        var parts = hash.Split('.');
        Assert.Equal(2, parts.Length);
        Assert.NotEmpty(parts[0]);
        Assert.NotEmpty(parts[1]);
    }

    [Fact]
    public void Hash_UsesRandomSalt_SoHashesDiffer()
    {
        var first = PasswordHasher.Hash("Admin123!");
        var second = PasswordHasher.Hash("Admin123!");

        Assert.NotEqual(first, second);
    }

    [Fact]
    public void Verify_AcceptsTheCorrectPassword()
    {
        var hash = PasswordHasher.Hash("Admin123!");

        Assert.True(PasswordHasher.Verify("Admin123!", hash));
    }

    [Fact]
    public void Verify_RejectsWrongPasswords()
    {
        var hash = PasswordHasher.Hash("Admin123!");

        Assert.False(PasswordHasher.Verify("admin123!", hash));
        Assert.False(PasswordHasher.Verify("Admin123", hash));
        Assert.False(PasswordHasher.Verify(string.Empty, hash));
    }

    [Theory]
    [InlineData("not-a-valid-hash")]
    [InlineData("only-one-part")]
    [InlineData("!!.??")]
    [InlineData("")]
    public void Verify_RejectsMalformedStoredHashes(string stored)
    {
        Assert.False(PasswordHasher.Verify("whatever", stored));
    }
}
