using Microsoft.EntityFrameworkCore;

namespace Sacco.Core.Api.Data;

public sealed class MobileDbContext(DbContextOptions<MobileDbContext> options) : DbContext(options)
{
	public DbSet<LoginCredential> Logins => Set<LoginCredential>();

	protected override void OnModelCreating(ModelBuilder modelBuilder)
	{
		modelBuilder.Entity<LoginCredential>(entity =>
		{
			entity.HasNoKey();
			entity.ToTable("Login");
			entity.Property(x => x.Telephone).HasColumnName("Telephone");
			entity.Property(x => x.StartPin).HasColumnName("Start Pin");
			entity.Property(x => x.PinEncrypted).HasColumnName("PIN_Encrypted");
			entity.Property(x => x.Client).HasColumnName("Client");
			entity.Property(x => x.PinChanged).HasColumnName("Pin Changed");
		});
	}
}