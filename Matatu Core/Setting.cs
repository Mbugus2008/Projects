using Logging;
using System.ServiceModel;
using static System.Net.WebRequestMethods;

namespace Matatu_Core
{
    public  class Setting
    {

        private  readonly IConfiguration _configuration;
       

        public string? Server { get; set; } = string.Empty;
        public string? domain { get; set; } = string.Empty;
        public string? Instance { get; set; } = string.Empty;
        public string? Companyname { get; set; } = string.Empty;
        public int Port { get; set; } = 0;
        public string? Username { get; set; } = string.Empty;
        public string? pass { get; set; } = string.Empty;

        public  Setting(IConfiguration configuration)
        {       

        
            Server = configuration.GetValue<string>("Nav:Server");
            Username = configuration.GetValue<string>("Nav:Username");
            pass = configuration.GetValue<string>("Nav:Password");
            Companyname = configuration.GetValue<string>("Nav:Company");
            Instance = configuration.GetValue<string>("Nav:Instance");
            Port = configuration.GetValue<int>("Nav:Port");
           
          
           
        }
        public BasicHttpBinding binding {
            get
            {

                BasicHttpBinding navWSBinding = new BasicHttpBinding();
                navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;
                return navWSBinding;
            }
        }


        public string baseurl => $"http://{Server}:{Port}/{Instance}/WS/{Companyname}/Page/";

        public string baseurl_codeunit => $"http://{Server}:{Port}/{Instance}/WS/{Companyname}/Codeunit/";

        public  string getcompany => Companyname;
    }
}
