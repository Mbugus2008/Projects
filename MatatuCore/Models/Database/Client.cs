using System;
using System.Collections.Generic;

namespace MatatuCore.Models.Database;

public partial class Client
{
    public int Id { get; set; }

    public string ClientCode { get; set; } = null!;

    public string? ClientName { get; set; }

    public bool? Active { get; set; }

    public int? PinRetries { get; set; }

    public bool? ShowBalForOverdrawanAcc { get; set; }

    public string? Url { get; set; }

    public string? SmsOutlet { get; set; }

    public double? SmsBalance { get; set; }

    public string? SecurityCrudential { get; set; }

    public string? CustomerKey { get; set; }

    public string? CustomerSecret { get; set; }

    public string? BulkAccount { get; set; }

    public string? InitiatorName { get; set; }

    public string? PaybillNo { get; set; }

    public string? Passkey { get; set; }

    public string? PushCallBack { get; set; }

    public bool? NotifyLowSms { get; set; }

    public int? SmsReorderLevel { get; set; }

    public string? NotificationInterval { get; set; }

    public string? Email { get; set; }

    public string? Contact { get; set; }

    public int? IntervalType { get; set; }

    public string? EmailCc { get; set; }

    public bool? IncomingSms { get; set; }

    public bool? ChargeIncoming { get; set; }

    public string? UssdCode { get; set; }

    public int? SmsClient { get; set; }

    public DateOnly? LastNotification { get; set; }

    public int? NotificationMode { get; set; }

    public string? UserName { get; set; }

    public string? Password { get; set; }

    public string? Instance { get; set; }

    public int? Port { get; set; }

    public string? Company { get; set; }

    public string? Ipaddress { get; set; }

    public string? LogPath { get; set; }
}
