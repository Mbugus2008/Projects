using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using System.Diagnostics.CodeAnalysis;

namespace Eproc.Services
{
    public class Profilesstates
    {
        [Inject]
        public Icprofile profile { get; set; }

        public int index { get; set; }
        public string name { get; set; }
        public bool current { get; set; }
        public object  hasdata { get; set; }
        public string taxno { get; set; }
        public Profilesstates() { profile = new Cprofile(GetConfiguration()); }

        public async Task<List<Profilesstates>> getstates(string taxno)
        {
            List<Profilesstates> profilesList =new List<Profilesstates> {
            new Profilesstates() {index =0, name = "General Infomation", current = false,  hasdata = await profile.getprofile(taxno)  } ,
            new Profilesstates() {index =1, name = "Contacts", current = false, hasdata = await profile.getcontacts(taxno) } ,
            new Profilesstates() {index =2, name = "Key Personnel", current = false, hasdata = false } ,
            new Profilesstates() {index =3, name = "Bank Details", current = false, hasdata = false } ,

        };
            return profilesList;
        }

        private IConfiguration GetConfiguration()
        {
            // Logic to get IConfiguration from your application configuration
            // This could be from appsettings.json, environment variables, etc.
            // For example:
            IConfigurationBuilder builder = new ConfigurationBuilder()
                .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);

            return builder.Build();
        }
    }
}
