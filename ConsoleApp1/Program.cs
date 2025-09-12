// See https://aka.ms/new-console-template for more information
using members;
using System.ServiceModel;

Console.WriteLine("Hello, World!");

BasicHttpBinding navWSBinding = new BasicHttpBinding();
navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;

string baseURL = "http://DESKTOP-FEF2IQ4:9992/Bamburi/WS/Bamburi%20Wananchi%20Sacco/Page/";

Members_PortClient systemService = new Members_PortClient(navWSBinding, new EndpointAddress(baseURL + "Members"));


systemService.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
systemService.ClientCredentials.Windows.ClientCredential.UserName = "Mbranch";
systemService.ClientCredentials.Windows.ClientCredential.Password = "Mbanking12345*";

Members[] customer10000 = systemService.ReadMultiple(new Members_Filter[] { },null,10);

var dd = customer10000;