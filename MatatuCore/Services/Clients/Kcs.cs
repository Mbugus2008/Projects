using MatatuCore.Models.Database;

namespace MatatuCore.Services.Clients
{
    public class Kcs : BaseClient
    {
        public Kcs(Client client) : base(client)
        {
            client_setting = client;


        }
        public  Client? client_setting { get; set; }
        
        public override string LogFolder => "Kcs";
    }
    public class Kmos : BaseClient
    {
        public Kmos(Client client) : base(client)
        {
            client_setting = client;


        }
        public Client? client_setting { get; set; }

        public override string LogFolder => "Kmos";
    } 
    public class Remboclassic : BaseClient
    {
        public Remboclassic(Client client) : base(client)
        {
            client_setting = client;


        }
        public Client? client_setting { get; set; }

        public override string LogFolder => "Remboclassic";
    }
}
