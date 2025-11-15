using System.ServiceModel;
    using System;
using System.ServiceModel;
using System.ServiceModel.Channels;
namespace Nation_Sacco.Controllers.Models
{
   



public class BcWcfConnector
    {
        public static T CreateBcClient<T>(string serviceUrl, string username, string password) where T : class
        {
            var binding = new BasicHttpBinding(BasicHttpSecurityMode.TransportCredentialOnly)
            {
                Security = {
                Transport = {
                    ClientCredentialType = HttpClientCredentialType.Basic
                }
            },
                MaxReceivedMessageSize = 65536 * 10,
                ReaderQuotas = System.Xml.XmlDictionaryReaderQuotas.Max
            };

            var endpoint = new EndpointAddress(serviceUrl);

            var factory = new ChannelFactory<T>(binding, endpoint);
            factory.Credentials.UserName.UserName = username;
            factory.Credentials.UserName.Password = password;

            return factory.CreateChannel();
        }
    }
}
