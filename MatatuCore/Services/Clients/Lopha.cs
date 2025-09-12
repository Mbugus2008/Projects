using MatatuCore.Models.Database;

namespace MatatuCore.Services.Clients
{
    public class Lopha : BaseClient
    {
        public Lopha(Client client) : base(client)
        {
            client_setting = client;
        }
        public  Client? client_setting { get; set; }
        
        public override string LogFolder => "Lopha";
    }
}
