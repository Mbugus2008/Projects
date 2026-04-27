namespace Sacco.Core.Api.Contracts;

public sealed class LoginRequest
{
    public string? Phone { get; set; }
    public string? Pin { get; set; }
    public string? Password { get; set; }
    public string? Client { get; set; }
}