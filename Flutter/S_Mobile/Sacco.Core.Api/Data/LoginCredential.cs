using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace Sacco.Core.Api.Data;

[Keyless]
[Table("Login")]
public sealed class LoginCredential
{
    public string Telephone { get; set; } = string.Empty;

    [Column("Start Pin")]
    public string? StartPin { get; set; }

    [Column("PIN_Encrypted")]
    public string? PinEncrypted { get; set; }

    public string Client { get; set; } = string.Empty;

    [Column("Pin Changed")]
    public bool? PinChanged { get; set; }
}