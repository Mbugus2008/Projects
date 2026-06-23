using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace MatatuCore.Models.Database;

public partial class MatatuContext : DbContext
{
    public MatatuContext()
    {
    }

    public MatatuContext(DbContextOptions<MatatuContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<ErrorLog> ErrorLogs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {

        if (!optionsBuilder.IsConfigured)
        {
            // This is a warning to remind you to secure your connection string.
            // You should not hard-code sensitive information in your source code.
            // Instead, consider using configuration files or environment variables.
            optionsBuilder.UseSqlServer("Server=trimline.co.ke;Database=Mobile;User Id=Paul;Password=Mbanking12345*;TrustServerCertificate=True;");
        }
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.ClientCode);

            entity.Property(e => e.ClientCode)
                .HasMaxLength(50)
                .HasColumnName("Client Code");
            entity.Property(e => e.BulkAccount)
                .HasMaxLength(50)
                .HasColumnName("Bulk account");
            entity.Property(e => e.ChargeIncoming).HasColumnName("Charge Incoming");
            entity.Property(e => e.ClientName)
                .HasMaxLength(50)
                .HasColumnName("Client Name");
            entity.Property(e => e.Company).HasMaxLength(50);
            entity.Property(e => e.Contact).HasMaxLength(500);
            entity.Property(e => e.CustomerKey)
                .HasMaxLength(50)
                .HasColumnName("Customer Key");
            entity.Property(e => e.CustomerSecret)
                .HasMaxLength(50)
                .HasColumnName("Customer Secret");
            entity.Property(e => e.Email).HasMaxLength(500);
            entity.Property(e => e.EmailCc)
                .HasMaxLength(500)
                .HasColumnName("email cc");
            entity.Property(e => e.Id).ValueGeneratedOnAdd();
            entity.Property(e => e.IncomingSms).HasColumnName("Incoming sms");
            entity.Property(e => e.InitiatorName)
                .HasMaxLength(50)
                .HasColumnName("Initiator Name");
            entity.Property(e => e.Instance).HasMaxLength(50);
            entity.Property(e => e.IntervalType).HasColumnName("Interval Type");
            entity.Property(e => e.Ipaddress)
                .HasMaxLength(50)
                .HasColumnName("IPAddress");
            entity.Property(e => e.LastNotification).HasColumnName("Last Notification");
            entity.Property(e => e.LogPath)
                .HasMaxLength(50)
                .HasColumnName("Log Path");
            entity.Property(e => e.NotificationInterval)
                .HasMaxLength(50)
                .HasColumnName("Notification interval");
            entity.Property(e => e.NotificationMode).HasColumnName("Notification Mode");
            entity.Property(e => e.NotifyLowSms).HasColumnName("Notify low sms");
            entity.Property(e => e.Passkey).HasMaxLength(100);
            entity.Property(e => e.Password).HasMaxLength(50);
            entity.Property(e => e.PaybillNo)
                .HasMaxLength(50)
                .HasColumnName("Paybill No");
            entity.Property(e => e.PinRetries).HasColumnName("Pin Retries");
            entity.Property(e => e.PushCallBack)
                .HasMaxLength(100)
                .HasColumnName("Push Call Back");
            entity.Property(e => e.SecurityCrudential)
                .HasMaxLength(500)
                .HasColumnName("Security Crudential");
            entity.Property(e => e.ShowBalForOverdrawanAcc).HasColumnName("Show bal for overdrawan acc");
            entity.Property(e => e.SmsBalance).HasColumnName("Sms Balance");
            entity.Property(e => e.SmsClient)
                .HasDefaultValue(0)
                .HasColumnName("Sms Client");
            entity.Property(e => e.SmsOutlet)
                .HasMaxLength(50)
                .HasColumnName("Sms Outlet");
            entity.Property(e => e.SmsReorderLevel).HasColumnName("Sms reorder level");
            entity.Property(e => e.Url).HasMaxLength(100);
            entity.Property(e => e.UserName).HasMaxLength(50);
            entity.Property(e => e.UssdCode)
                .HasMaxLength(50)
                .HasColumnName("USSD Code");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
