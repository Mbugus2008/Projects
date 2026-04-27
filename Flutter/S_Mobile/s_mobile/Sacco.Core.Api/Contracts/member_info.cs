namespace Sacco.Core.Api.Contracts;

public sealed class member
{
    public string? Key { get; set; }
    public string? Member_No { get; set; }
    public string? Phone_No { get; set; }
    public string? Phone
    {
        get => Phone_No;
        set => Phone_No = value;
    }
    public bool? Logged_In { get; set; }
}
