using Sms;
using System.ServiceModel;

namespace NavData
{

    public class NavData
    {
        public Sms.Smses_PortClient sms
        {
            get
            {
                return new Smses_PortClient(binding, new EndpointAddress(baseurl + "bankdetails"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = settings.navsettings.Username,
                                Password = settings.navsettings.pass
                            } } }
                };
            }
        }
        private string baseurl
        {
            get
            {
                return String.Format("http://{0}:{1}/{2}/WS/{3}/Page/", settings.navsettings.Server, settings.navsettings.Port, settings.navsettings.Instance, settings.navsettings.Companyname);
            }
        }
        Logging.settings settings;
        public NavData(Logging.settings s) { settings = s; }
        public BasicHttpBinding binding
        {
            get
            {

                BasicHttpBinding navWSBinding = new BasicHttpBinding();
                navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
                navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;
                return navWSBinding;
            }
        }


    }
}
