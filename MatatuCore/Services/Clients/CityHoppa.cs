using DeportnFuel;
using MatatuCore.Controllers;
using MatatuCore.Models.Database;

namespace MatatuCore.Services.Clients
{
    public class CityHoppa : BaseClient
    {
        public CityHoppa(Client client) : base(client)
        {
            client_setting = client;


        }
        public  Client? client_setting { get; set; }
       
        public override string LogFolder => "Lopha";
        public virtual DeportnFuel.Deport_n_Fuel[] deportdata(Request request)
        {
            posting_service.PopulateDepot(request.date);
            return deportn_fuel_service.ReadMultiple(
                new Deport_n_Fuel_Filter[] { new Deport_n_Fuel_Filter { Criteria = request.date.ToString("MM/dd/yyyy"), Field = Deport_n_Fuel_Fields.Date } },
                request.bookmark, request.size);

        }
    }
}
