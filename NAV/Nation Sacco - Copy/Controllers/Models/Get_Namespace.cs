using Microsoft.Extensions.Configuration;
using System.ServiceModel;

namespace Nation_Sacco.Controllers.Models
{

    public class Get_Namespace
    {
        private IConfiguration configuration;

        public string Namespace { get; set; }
        public string Class_Name { get; set; }
        public Get_Namespace(IConfiguration _configuration)
        {

            configuration = _configuration;

        }
        public Get_Namespace()
        {
        }




        public dynamic InitializeClient<T>()
        {
            Namespace = typeof(T).Namespace;
            Class_Name = typeof(T).Name;

            var clientType = Type.GetType($"{Namespace}.{Class_Name}_PortClient");
            var binding = Setting.binding();
            var address = new EndpointAddress(Setting.baseurl(configuration) + Class_Name);
            dynamic client = Activator.CreateInstance(clientType, binding, address);
            client.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            client.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            client.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;
            return client;

        }
    }

}