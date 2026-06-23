using MatatuCore.Models.Database;
using System;
using System.Collections.Generic;

namespace MatatuCore.Controllers;

public class DeviceInfo
{
    public string? DeviceId { get; set; }
    public string? DeviceModel { get; set; }
    public string? OsVersion { get; set; }
    public string? AppVersion { get; set; }
    public string? ClientId { get; set; }
}

public class UserInfo
{
    public string? AgentCode { get; set; }
    public string? AgentName { get; set; }
}

public class ErrorDetail
{
    public DateTime? Timestamp { get; set; }
    public string? Level { get; set; }
    public string? Message { get; set; }
    public string? ExceptionType { get; set; }
    public string? StackTrace { get; set; }
    public string? Screen { get; set; }
    public string? Action { get; set; }
    public string? Endpoint { get; set; }
    public int? HttpStatusCode { get; set; }
    public Dictionary<string, object>? Extra { get; set; }
}

public class ErrorLogRequest
{
    public DeviceInfo? Device { get; set; }
    public UserInfo? User { get; set; }
    public List<ErrorDetail>? Errors { get; set; }
}

public class ResolveErrorRequest
{
    public ErrorStatus Status { get; set; }
    public string? Comments { get; set; }
    public string? ResolvedBy { get; set; }
}

public class BulkResolveRequest
{
    public List<int>? Ids { get; set; }
    public ErrorStatus Status { get; set; }
    public string? Comments { get; set; }
    public string? ResolvedBy { get; set; }
}

public class ErrorLogSummary
{
    public int Total { get; set; }
    public int New { get; set; }
    public int Acknowledged { get; set; }
    public int Investigating { get; set; }
    public int Resolved { get; set; }
    public int Ignored { get; set; }
    public int Reopened { get; set; }
}
