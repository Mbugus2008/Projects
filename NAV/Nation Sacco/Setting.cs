using Logging;
using System.ServiceModel;
using static System.Net.WebRequestMethods;

namespace Nation_Sacco
{
    public static class Setting
    {

        private static readonly IConfiguration _configuration;
        internal static  string getkey { get { return "b14ca52a4e41433b4bce2ea2315a1916"; } }

        public static Logging.settings setting(IConfiguration configuration)
        {       
            Logging.settings s = new Logging.settings();
            Logging.nav nav = new Logging.nav();
            nav.Server = configuration.GetValue<string>("Nav:Server");
            nav.Username = configuration.GetValue<string>("Nav:Username");
            nav.pass = configuration.GetValue<string>("Nav:Password");
            nav.Companyname = configuration.GetValue<string>("Nav:Company");
            nav.Instance = configuration.GetValue<string>("Nav:Instance");
            nav.Port = configuration.GetValue<int>("Nav:Port");
            s.navsettings = nav;
          
            return s;
        }
    

        public static BasicHttpBinding binding()
        {

            BasicHttpBinding navWSBinding = new BasicHttpBinding();
            navWSBinding.SendTimeout = TimeSpan.FromMinutes(5);

            navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
            navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Ntlm;
            return navWSBinding;
        }
        public static string baseurl(IConfiguration configuration) {
        settings ss = setting(configuration);;  
            return String.Format("https://{0}:{1}/{2}/WS/{3}/Page/",ss.navsettings.Server,ss.navsettings.Port,ss.navsettings.Instance,ss.navsettings.Companyname);
        }
        public static string baseurl_codeunit(IConfiguration configuration)
        {
            settings ss = setting(configuration); ;
            return String.Format("http://{0}:{1}/{2}/WS/{3}/Codeunit/", ss.navsettings.Server, ss.navsettings.Port, ss.navsettings.Instance, ss.navsettings.Companyname);
        }
        public static string getcompany(IConfiguration configuration) {
        settings ss = setting(configuration);;  
            return ss.navsettings.Companyname;
        }
    }
}
