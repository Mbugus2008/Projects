using Microsoft.EntityFrameworkCore;
using ParcelAPI.Models;

namespace ParcelAPI.Data
{
    public class ParcelContext : DbContext
    {
        public ParcelContext(DbContextOptions<ParcelContext> options)
            : base(options)
        {
        }

        public DbSet<Client> Clients { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Client configuration - maps to existing Clients table
            modelBuilder.Entity<Client>(entity =>
            {
                entity.ToTable("Clients");
                entity.HasKey(e => e.Id);
                entity.Property(e => e.ClientCode).HasColumnName("Client Code").HasMaxLength(50).IsRequired();
                entity.Property(e => e.ClientName).HasColumnName("Client Name").HasMaxLength(100);
                entity.Property(e => e.LogPath).HasColumnName("Log Path");
                entity.HasIndex(e => e.ClientCode).IsUnique();
            });
        }
    }
}