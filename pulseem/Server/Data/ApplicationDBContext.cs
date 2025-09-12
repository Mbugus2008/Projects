using Microsoft.EntityFrameworkCore;
using pulseem.Shared.Models;

namespace pulseem.Server.Data
{
    public class ApplicationDBContext:DbContext
    {
        public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options)
        {
        }
        public DbSet<Clients> Clients { get; set; }
    }
}
