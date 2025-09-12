using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Logging;
using Nav;
using System.Linq;
using System.Collections.Generic;
using System.ServiceModel;
using System.Security.Principal;

namespace NyalaSacco.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Sacco : ControllerBase
    {
        //string baseURL = "http://192.168.0.46:7047/DynamicsNAV90/WS/NYALA VISION SACCO LTD";
        string baseURL = "http://192.168.1.74:4446/Mobile/WS/kssl";
        WSHttpBinding myBinding = new WSHttpBinding();
        
        private  Loans_mobile_PortClient loans = new Loans_mobile_PortClient();
        private  Nav.Accounts.Accounts_PortClient accounts = new Nav.Accounts.Accounts_PortClient();
       
        
        public Sacco()
        {
           
            loans = new Loans_mobile_PortClient(Loans_mobile_PortClient.EndpointConfiguration.Loans_mobile_Port, baseURL + "/Page/Loans_mobile");
loans.ClientCredentials.UserName.UserName = "Navtest";
            loans.ClientCredentials.UserName.Password = "Sacco123#";

            //accounts = new Nav.Accounts.Accounts_PortClient(Nav.Accounts.Accounts_PortClient.EndpointConfiguration.Accounts_Port, baseURL + "Accounts");

            BasicHttpBinding basicHttpBinding = new BasicHttpBinding();
            basicHttpBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
            basicHttpBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;

            //WSHttpBinding

            string endPointAddr = baseURL + "/Page/Loans_mobile";
            EndpointAddress endpointAddress = new EndpointAddress(endPointAddr);
            accounts  = new  Nav.Accounts.Accounts_PortClient(basicHttpBinding, endpointAddress);
            accounts.ClientCredentials.Windows.AllowedImpersonationLevel = TokenImpersonationLevel.Impersonation;

            WSHttpBinding myBinding = new WSHttpBinding();
            myBinding.Security.Mode = SecurityMode.Message;
            myBinding.Security.Transport.ClientCredentialType =
                HttpClientCredentialType.Ntlm;

            Nav.Accounts.Accounts_PortClient c = new Nav.Accounts.Accounts_PortClient(basicHttpBinding, endpointAddress);
            c.ClientCredentials.UserName.UserName = "Navtest";
            c.ClientCredentials.UserName.Password = "Sacco123#";
            c.ClientCredentials.ServiceCertificate.Authentication.CertificateValidationMode = System.ServiceModel.Security.X509CertificateValidationMode.PeerOrChainTrust;
            var d = c.ReadMultiple(new Nav.Accounts.Accounts_Filter[] { }, null, 1);
           
        }
        
        /// <summary>
        /// Get Accounts service
        /// </summary>
        /// <param name="Phone">Customer phone No. Should start with +254</param>
       ///<returns></returns>
        [HttpPost]
        [Route("accounts")]
        public Results<List<Nav.Accounts.Accounts>> Accounts(string Phone)
        {

           Results <List<Nav.Accounts.Accounts>> r = new Results<List<Nav.Accounts.Accounts>>();
            
           r.Contents  = accounts.ReadMultiple(new Nav.Accounts.Accounts_Filter[] { new Nav.Accounts.Accounts_Filter { Criteria = Phone, Field = Nav.Accounts.Accounts_Fields.MPESA_Mobile_No } }, null, 0).ToList();
            return  r; 
        }

        //private  Nav.Accounts.Accounts_PortClient accountchannel()
        //{
        //    var mode = BasicHttpSecurityMode.TransportCredentialOnly;
        //    var binding = new BasicHttpBinding(mode);
        //    binding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Ntlm;
        //    var address = new EndpointAddress(baseURL + "Accounts");
        //    ChannelFactory<Nav.Accounts.Accounts_PortChannel> channel = new ChannelFactory<Nav.Accounts.Accounts_PortChannel>(binding, address);
        //    channel.Credentials.Windows.ClientCredential.UserName = "Navtest";
        //    channel.Credentials.Windows.ClientCredential.Password = "Sacco123#";
        //    channel.Credentials.Windows.ClientCredential.Domain = "";
        //    return channel.CreateChannel();
        //}

        [HttpPost]
        [Route("Loans")]
        public Results Loans(string Phone)
        {
            
            var d = loans.ReadMultiple(new ReadMultiple(new Loans_mobile_Filter[] {},null,0));
     
           
            
            return new Logging.Results(); 
        }
    }
}
namespace Logging
{
    public partial class Results<T>
    {
        /// <summary>
        /// O = successfull
        /// -1 = Unsucessful
        /// </summary>
        public int Code { set; get; } = 0;

        /// <summary>
        /// Error Description if code is -1
        /// </summary>
        public string Desc { set; get; } = "Successful";
        public T Contents { get; set; }
    }
}