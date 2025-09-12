using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Coffee_Wpf.Models
{
    public partial class AutoweighContext : DbContext
    {
        public AutoweighContext()
        {
        }

        public AutoweighContext(DbContextOptions<AutoweighContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Crop> Crops { get; set; } = null!;
        public virtual DbSet<DailyCollectionsDetail> DailyCollectionsDetails { get; set; } = null!;
        public virtual DbSet<Farmer> Farmers { get; set; } = null!;
        public virtual DbSet<Item> Items { get; set; } = null!;
        public virtual DbSet<ItemVariant> ItemVariants { get; set; } = null!;
        public virtual DbSet<MwiruaStore> MwiruaStores { get; set; } = null!;
        public virtual DbSet<Route> Routes { get; set; } = null!;
        public virtual DbSet<Setting> Settings { get; set; } = null!;
        public virtual DbSet<Stock> Stocks { get; set; } = null!;
        public virtual DbSet<Store> Stores { get; set; } = null!;
        public virtual DbSet<StoresHeader> StoresHeaders { get; set; } = null!;
        public virtual DbSet<User> Users { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseSqlServer("Server=.\\;User ID=Autoweigh;Password=Mbanking12345*;Database=Autoweigh;Trusted_Connection=False;TrustServerCertificate=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Crop>(entity =>
            {
                entity.HasKey(e => e.CropName);

                entity.Property(e => e.CropName)
                    .HasMaxLength(50)
                    .HasColumnName("Crop Name");

                entity.Property(e => e.CloseDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Close Date");

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.OpenDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Open Date");
            });

            modelBuilder.Entity<DailyCollectionsDetail>(entity =>
            {
                entity.HasKey(e => e.CollectionNumber);

                entity.ToTable("Daily Collections Details");

                entity.Property(e => e.CollectionNumber)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Collection Number");

                entity.Property(e => e.Can)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.Cancelled).HasMaxLength(50);

                entity.Property(e => e.CoffeTypeName)
                    .HasMaxLength(50)
                    .HasColumnName("Coffe Type Name");

                entity.Property(e => e.CoffeeType)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Coffee Type");

                entity.Property(e => e.CollectType)
                    .HasMaxLength(50)
                    .HasColumnName("Collect type");

                entity.Property(e => e.CollectionTime)
                    .HasColumnType("datetime")
                    .HasColumnName("Collection time");

                entity.Property(e => e.CollectionsDate)
                    .HasColumnType("datetime")
                    .HasColumnName("Collections Date");

                entity.Property(e => e.Comments).HasMaxLength(200);

                entity.Property(e => e.Crop).HasMaxLength(50);

                entity.Property(e => e.DeliveredBy)
                    .HasMaxLength(50)
                    .HasColumnName("Delivered By");

                entity.Property(e => e.Factory)
                    .HasMaxLength(30)
                    .IsUnicode(false);

                entity.Property(e => e.FarmersName)
                    .HasMaxLength(60)
                    .IsUnicode(false)
                    .HasColumnName("Farmers Name");

                entity.Property(e => e.FarmersNumber)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("Farmers Number");

                entity.Property(e => e.IdNumber)
                    .HasMaxLength(30)
                    .IsUnicode(false)
                    .HasColumnName("ID Number");

                entity.Property(e => e.KgCollected).HasColumnName("Kg_ Collected");

                entity.Property(e => e.No)
                    .ValueGeneratedOnAdd()
                    .HasColumnName("No_");

                entity.Property(e => e.NoOfBags).HasColumnName("No of Bags");

                entity.Property(e => e.User).HasMaxLength(50);
            });

            modelBuilder.Entity<Farmer>(entity =>
            {
                entity.HasKey(e => e.No);

                entity.Property(e => e.No).HasMaxLength(50);

                entity.Property(e => e.AccountCategory).HasColumnName("Account Category");

                entity.Property(e => e.Bank).HasMaxLength(50);

                entity.Property(e => e.BankAccount)
                    .HasMaxLength(50)
                    .HasColumnName("Bank Account");

                entity.Property(e => e.Comments).HasMaxLength(100);

                entity.Property(e => e.CumCherry).HasColumnName("Cum Cherry");

                entity.Property(e => e.CumMbuni).HasColumnName("Cum Mbuni");

                entity.Property(e => e.CurrentCropCollection).HasColumnName("Current_Crop_collection");

                entity.Property(e => e.CurrentCropCollectionCherry1).HasColumnName("Current_Crop_collection Cherry 1");

                entity.Property(e => e.CurrentCropCollectionCherry2).HasColumnName("Current_Crop_collection Cherry 2");

                entity.Property(e => e.Factory).HasMaxLength(50);

                entity.Property(e => e.IdNo)
                    .HasMaxLength(50)
                    .HasColumnName("ID No");

                entity.Property(e => e.LimitPercentage).HasColumnName("Limit_percentage");

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.NoOfTrees).HasColumnName("No of Trees");

                entity.Property(e => e.OtherLoans).HasColumnName("Other Loans");

                entity.Property(e => e.Phone).HasMaxLength(50);

                entity.Property(e => e.PreviousCropCollection).HasColumnName("Previous_Crop_collection");

                entity.Property(e => e.TotalStores).HasColumnName("Total_Stores");
            });

            modelBuilder.Entity<Item>(entity =>
            {
                entity.HasKey(e => e.No);

                entity.Property(e => e.No).HasMaxLength(50);

                entity.Property(e => e.BaseUnitOfMeasure)
                    .HasMaxLength(50)
                    .HasColumnName("Base Unit of Measure");

                entity.Property(e => e.Description).HasMaxLength(50);

                entity.Property(e => e.LastDirectCost).HasColumnName("Last Direct Cost");

                entity.Property(e => e.PreventNegativeInventory).HasColumnName("Prevent_Negative_Inventory");

                entity.Property(e => e.UnitCost).HasColumnName("Unit Cost");

                entity.Property(e => e.UnitPrice).HasColumnName("Unit Price");
            });

            modelBuilder.Entity<ItemVariant>(entity =>
            {
                entity.ToTable("Item Variants");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Code).HasMaxLength(50);

                entity.Property(e => e.Description).HasMaxLength(50);

                entity.Property(e => e.No).HasMaxLength(50);
            });

            modelBuilder.Entity<MwiruaStore>(entity =>
            {
                entity.HasNoKey();

                entity.ToTable("Mwirua stores");

                entity.Property(e => e.Activityname)
                    .HasMaxLength(255)
                    .HasColumnName("activityname");

                entity.Property(e => e.AutoNo)
                    .HasMaxLength(255)
                    .HasColumnName("auto_no");

                entity.Property(e => e.Batchno)
                    .HasMaxLength(255)
                    .HasColumnName("batchno");

                entity.Property(e => e.CreditAcc).HasColumnName("creditAcc");

                entity.Property(e => e.Cropyear).HasColumnName("cropyear");

                entity.Property(e => e.Cropyearname)
                    .HasMaxLength(255)
                    .HasColumnName("cropyearname");

                entity.Property(e => e.Date).HasColumnName("date");

                entity.Property(e => e.Datedsc)
                    .HasMaxLength(255)
                    .HasColumnName("datedsc");

                entity.Property(e => e.DebitAcc).HasColumnName("debitAcc");

                entity.Property(e => e.Invno)
                    .HasMaxLength(255)
                    .HasColumnName("invno");

                entity.Property(e => e.Ledgerid).HasColumnName("ledgerid");

                entity.Property(e => e.Loanno)
                    .HasMaxLength(255)
                    .HasColumnName("loanno");

                entity.Property(e => e.Memname)
                    .HasMaxLength(255)
                    .HasColumnName("memname");

                entity.Property(e => e.Memno).HasColumnName("memno");

                entity.Property(e => e.Memo).HasColumnName("memo");

                entity.Property(e => e.Paid)
                    .HasMaxLength(255)
                    .HasColumnName("paid");

                entity.Property(e => e.Pcrnumber)
                    .HasMaxLength(255)
                    .HasColumnName("pcrnumber");

                entity.Property(e => e.PcrnumberMbuni)
                    .HasMaxLength(255)
                    .HasColumnName("pcrnumber_Mbuni");

                entity.Property(e => e.Userid)
                    .HasMaxLength(255)
                    .HasColumnName("userid");
            });

            modelBuilder.Entity<Route>(entity =>
            {
                entity.HasKey(e => e.Route1);

                entity.Property(e => e.Route1)
                    .HasMaxLength(50)
                    .HasColumnName("Route");

                entity.Property(e => e.Name).HasMaxLength(50);
            });

            modelBuilder.Entity<Setting>(entity =>
            {
                entity.Property(e => e.Address).HasMaxLength(50);

                entity.Property(e => e.AllowMultipleSales).HasColumnName("Allow Multiple sales");

                entity.Property(e => e.BagWeight).HasColumnName("Bag weight");

                entity.Property(e => e.BatchSize).HasColumnName("Batch size");

                entity.Property(e => e.Branch).HasMaxLength(50);

                entity.Property(e => e.ClearKgOnPost).HasColumnName("Clear Kg on Post");

                entity.Property(e => e.CoffeType).HasColumnName("Coffe type");

                entity.Property(e => e.ComPort)
                    .HasMaxLength(50)
                    .HasColumnName("Com Port");

                entity.Property(e => e.CurrentCrop)
                    .HasMaxLength(50)
                    .HasColumnName("Current crop");

                entity.Property(e => e.Email).HasMaxLength(50);

                entity.Property(e => e.Factory).HasMaxLength(50);

                entity.Property(e => e.FactoryName)
                    .HasMaxLength(50)
                    .HasColumnName("Factory Name");

                entity.Property(e => e.LoadMembersInBatches).HasColumnName("Load Members in Batches");

                entity.Property(e => e.ManualTare).HasColumnName("Manual tare");

                entity.Property(e => e.Motto).HasMaxLength(50);

                entity.Property(e => e.NoOfSalesPerDay).HasColumnName("No of sales per day");

                entity.Property(e => e.PadFarmerNo).HasColumnName("Pad farmer no");

                entity.Property(e => e.PhoneNo)
                    .HasMaxLength(50)
                    .HasColumnName("Phone No.");

                entity.Property(e => e.PickFactoryFarmers).HasColumnName("Pick factory farmers");

                entity.Property(e => e.Printer).HasMaxLength(50);

                entity.Property(e => e.ServerUrl)
                    .HasMaxLength(100)
                    .HasColumnName("Server url");

                entity.Property(e => e.StoresReceiptsCopies).HasColumnName("Stores receipts copies");

                entity.Property(e => e.SyncDataIntervalSec).HasColumnName("Sync data interval(sec)");
            });

            modelBuilder.Entity<Stock>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.DateAdded)
                    .HasColumnType("date")
                    .HasColumnName("Date Added");

                entity.Property(e => e.DocumentNo)
                    .HasMaxLength(50)
                    .HasColumnName("Document No");

                entity.Property(e => e.Item).HasMaxLength(50);

                entity.Property(e => e.UnitPrice).HasColumnName("Unit Price");

                entity.Property(e => e.Variant).HasMaxLength(50);
            });

            modelBuilder.Entity<Store>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AmountPaid).HasColumnName("Amount Paid");

                entity.Property(e => e.Client).HasMaxLength(50);

                entity.Property(e => e.Crop).HasMaxLength(50);

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.Entry).HasMaxLength(50);

                entity.Property(e => e.Factory).HasMaxLength(50);

                entity.Property(e => e.Item).HasMaxLength(50);

                entity.Property(e => e.LineTotal).HasColumnName("Line total");

                entity.Property(e => e.ServedBy)
                    .HasMaxLength(50)
                    .HasColumnName("Served By");

                entity.Property(e => e.Status).HasMaxLength(50);

                entity.Property(e => e.Stock).HasMaxLength(50);

                entity.Property(e => e.Time).HasColumnType("datetime");

                entity.Property(e => e.Variant).HasMaxLength(50);
            });

            modelBuilder.Entity<StoresHeader>(entity =>
            {
                entity.ToTable("Stores header");

                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.AmountPaid).HasColumnName("Amount Paid");

                entity.Property(e => e.Client).HasMaxLength(50);

                entity.Property(e => e.Collector).HasMaxLength(50);

                entity.Property(e => e.CollectorIsMember).HasColumnName("Collector is Member");

                entity.Property(e => e.CollectorNo)
                    .HasMaxLength(50)
                    .HasColumnName("Collector No");

                entity.Property(e => e.Comments).HasMaxLength(100);

                entity.Property(e => e.CreditAmount).HasColumnName("Credit Amount");

                entity.Property(e => e.CropYear)
                    .HasMaxLength(50)
                    .HasColumnName("Crop Year");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.Entry).HasMaxLength(50);

                entity.Property(e => e.Factory).HasMaxLength(10);

                entity.Property(e => e.FactoryName)
                    .HasMaxLength(50)
                    .HasColumnName("Factory Name");

                entity.Property(e => e.LimitAvailable).HasColumnName("Limit Available");

                entity.Property(e => e.MemberName)
                    .HasMaxLength(100)
                    .HasColumnName("Member Name");

                entity.Property(e => e.MpesaCode)
                    .HasMaxLength(50)
                    .HasColumnName("Mpesa Code");

                entity.Property(e => e.MpesaName)
                    .HasMaxLength(50)
                    .HasColumnName("Mpesa Name");

                entity.Property(e => e.MpesaNo)
                    .HasMaxLength(50)
                    .HasColumnName("Mpesa No");

                entity.Property(e => e.ServedBy)
                    .HasMaxLength(50)
                    .HasColumnName("Served By");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Name);

                entity.Property(e => e.Name).HasMaxLength(50);

                entity.Property(e => e.DateCreated)
                    .HasColumnType("datetime")
                    .HasColumnName("Date Created");

                entity.Property(e => e.Password).HasMaxLength(50);

                entity.Property(e => e.Type).HasMaxLength(50);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
