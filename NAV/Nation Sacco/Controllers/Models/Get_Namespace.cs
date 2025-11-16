using Microsoft.Extensions.Configuration;
using System.Net.Http.Headers;
using System.ServiceModel;
using System.Text;

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
            var binding = bin();
            var address = new EndpointAddress(Setting.baseurl(configuration) + Class_Name);
            dynamic client = Activator.CreateInstance(clientType, binding, address);

           
            //var byteArray = Encoding.ASCII.GetBytes($"{Setting.setting(configuration).navsettings.Username}:{Setting.setting(configuration).navsettings.pass}");
            //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(byteArray));

            client.ClientCredentials.UserName.UserName = Setting.setting(configuration).navsettings.Username;
            client.ClientCredentials.UserName.Password = Setting.setting(configuration).navsettings.pass;

            //client.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            //client.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;
            //client.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;
            return client;

        }

        public  BasicHttpBinding bin()
        {
            BasicHttpBinding navWSBinding = new BasicHttpBinding();

            navWSBinding.SendTimeout = TimeSpan.FromMinutes(5);
            navWSBinding.Security.Mode = BasicHttpSecurityMode.Transport;
            navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Basic;

            return navWSBinding;
        }
    }

}