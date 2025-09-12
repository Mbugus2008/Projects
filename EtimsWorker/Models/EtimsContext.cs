using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace EtimsWorker.Models;

public partial class EtimsContext : DbContext
{
    public EtimsContext()
    {
    }

    public EtimsContext(DbContextOptions<EtimsContext> options)
        : base(options)
    {
    }

    public virtual DbSet<CreditNote> CreditNotes { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Sale> Sales { get; set; }

    public virtual DbSet<SaleItem> SaleItems { get; set; }

    public virtual DbSet<StockInEntry> StockInEntries { get; set; }

    public virtual DbSet<StockInHeader> StockInHeaders { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see https://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseSqlServer("Server=localhost\\SQL2014;Database=Etims;Integrated Security=true;Trusted_Connection=True;TrustServerCertificate=true");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<CreditNote>(entity =>
        {
            entity.HasKey(e => e.InvoiceNumber);

            entity.ToTable("CreditNote");

            entity.Property(e => e.InvoiceNumber)
                .HasMaxLength(50)
                .HasColumnName("invoiceNumber");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(50)
                .HasColumnName("customerName");
            entity.Property(e => e.CustomerPin)
                .HasMaxLength(50)
                .HasColumnName("customerPin");
            entity.Property(e => e.ModifierId)
                .HasMaxLength(50)
                .HasColumnName("modifierId");
            entity.Property(e => e.ModifierName)
                .HasMaxLength(50)
                .HasColumnName("modifierName");
            entity.Property(e => e.PaymentTypeCode)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("paymentTypeCode");
            entity.Property(e => e.SaleDate).HasColumnName("saleDate");
            entity.Property(e => e.TotalAmount).HasColumnName("totalAmount");
            entity.Property(e => e.TotalTaxAmount).HasColumnName("totalTaxAmount");
            entity.Property(e => e.TotalTaxableAmount).HasColumnName("totalTaxableAmount");
        });

        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasKey(e => e.ItemCode);

            entity.ToTable("Product");

            entity.Property(e => e.ItemCode)
                .HasMaxLength(50)
                .HasColumnName("itemCode");
            entity.Property(e => e.BarCode)
                .HasMaxLength(50)
                .HasColumnName("barCode");
            entity.Property(e => e.BatchNumber)
                .HasMaxLength(50)
                .HasColumnName("batchNumber");
            entity.Property(e => e.DefaultPrice).HasColumnName("defaultPrice");
            entity.Property(e => e.ItemClassificationCode)
                .HasMaxLength(50)
                .HasColumnName("itemClassificationCode");
            entity.Property(e => e.ItemName)
                .HasMaxLength(50)
                .HasColumnName("itemName");
            entity.Property(e => e.ItemTypeCode)
                .HasMaxLength(50)
                .HasColumnName("itemTypeCode");
            entity.Property(e => e.OriginCode)
                .HasMaxLength(50)
                .HasColumnName("originCode");
            entity.Property(e => e.TaxationTypeCode)
                .HasMaxLength(50)
                .HasColumnName("taxationTypeCode");
        });

        modelBuilder.Entity<Sale>(entity =>
        {
            entity.HasKey(e => e.InvoiceNumber);

            entity.ToTable("Sale");

            entity.Property(e => e.InvoiceNumber)
                .HasMaxLength(50)
                .HasColumnName("invoiceNumber");
            entity.Property(e => e.CustomerName)
                .HasMaxLength(50)
                .HasColumnName("customerName");
            entity.Property(e => e.CustomerPin)
                .HasMaxLength(50)
                .HasColumnName("customerPin");
            entity.Property(e => e.ModifierId)
                .HasMaxLength(50)
                .HasColumnName("modifierId");
            entity.Property(e => e.ModifierName)
                .HasMaxLength(50)
                .HasColumnName("modifierName");
            entity.Property(e => e.PaymentTypeCode)
                .HasMaxLength(10)
                .IsFixedLength()
                .HasColumnName("paymentTypeCode");
            entity.Property(e => e.SaleDate).HasColumnName("saleDate");
            entity.Property(e => e.TotalAmount).HasColumnName("totalAmount");
            entity.Property(e => e.TotalTaxAmount).HasColumnName("totalTaxAmount");
            entity.Property(e => e.TotalTaxableAmount).HasColumnName("totalTaxableAmount");
        });

        modelBuilder.Entity<SaleItem>(entity =>
        {
            entity.HasKey(e => new { e.ItemCode, e.InvoiceNumber });

            entity.ToTable("Sale Item");

            entity.Property(e => e.ItemCode).HasMaxLength(50);
            entity.Property(e => e.InvoiceNumber).HasMaxLength(50);
            entity.Property(e => e.ItemClassificationCode).HasMaxLength(50);
            entity.Property(e => e.ItemName).HasMaxLength(50);
            entity.Property(e => e.ModifierId)
                .HasMaxLength(50)
                .HasColumnName("Modifier Id");
            entity.Property(e => e.ModifierName)
                .HasMaxLength(50)
                .HasColumnName("Modifier Name");
            entity.Property(e => e.TaxationTypeCode).HasMaxLength(50);
        });

        modelBuilder.Entity<StockInEntry>(entity =>
        {
            entity.HasKey(e => new { e.ItemCode, e.StoredReleasedNo });

            entity.ToTable("Stock In Entry");

            entity.Property(e => e.ItemCode).HasMaxLength(50);
            entity.Property(e => e.BarCode).HasMaxLength(50);
            entity.Property(e => e.ItemClassificationCode).HasMaxLength(50);
            entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 0)");
            entity.Property(e => e.TaxationTypeCode).HasMaxLength(50);
            entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 0)");
        });

        modelBuilder.Entity<StockInHeader>(entity =>
        {
            entity.HasKey(e => e.StoredReleasedNo);

            entity.ToTable("Stock in Header");

            entity.Property(e => e.StoredReleasedNo).ValueGeneratedNever();
            entity.Property(e => e.BranchId).HasMaxLength(50);
            entity.Property(e => e.CreatedBy).HasMaxLength(50);
            entity.Property(e => e.Pin).HasMaxLength(50);
            entity.Property(e => e.Remark).HasMaxLength(50);
            entity.Property(e => e.StockIoTypeCode).HasMaxLength(50);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
