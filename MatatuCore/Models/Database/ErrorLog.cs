using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace MatatuCore.Models.Database;

public enum ErrorStatus
{
    New = 0,
    Acknowledged = 1,
    Investigating = 2,
    Resolved = 3,
    Ignored = 4,
    Reopened = 5
}

public partial class ErrorLog
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public int Id { get; set; }

    [MaxLength(50)]
    public string? ClientId { get; set; }

    public DateTime Timestamp { get; set; } = DateTime.UtcNow;

    [MaxLength(20)]
    public string? Level { get; set; }

    public string? Message { get; set; }

    [MaxLength(200)]
    public string? ExceptionType { get; set; }

    public string? StackTrace { get; set; }

    [MaxLength(100)]
    public string? Screen { get; set; }

    [MaxLength(100)]
    public string? Action { get; set; }

    [MaxLength(200)]
    public string? Endpoint { get; set; }

    public int? HttpStatusCode { get; set; }

    public string? Extra { get; set; }

    [MaxLength(50)]
    public string? DeviceId { get; set; }

    [MaxLength(100)]
    public string? DeviceModel { get; set; }

    [MaxLength(50)]
    public string? OsVersion { get; set; }

    [MaxLength(50)]
    public string? AppVersion { get; set; }

    [MaxLength(50)]
    public string? AgentCode { get; set; }

    [MaxLength(100)]
    public string? AgentName { get; set; }

    public ErrorStatus Status { get; set; } = ErrorStatus.New;

    public string? ResolutionComments { get; set; }

    [MaxLength(50)]
    public string? ResolvedBy { get; set; }

    public DateTime? ResolvedAt { get; set; }

    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
