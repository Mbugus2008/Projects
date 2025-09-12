using BDetails;
using ProcurementPortal;
using ReleasedBids;
using System.ServiceModel;

namespace Eproc.Services
{
    public class Service
    {
        IConfiguration config { get; set; }
        CompProfile.CompanyProfile_PortClient profile { get; set; }
        BDetails.BankDetails_PortClient bank
        {
            get
            {
                return new BankDetails_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "bankdetails"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        public ProcurementPortal.EProcurementPortal_PortClient portal
        {
            get
            {
                return new EProcurementPortal_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl_codeunit(config) + "EProcurementPortal"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        public ReleasedBids.EProcReleasedBids_PortClient bids
        {
            get
            {
                return new EProcReleasedBids_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "EProcReleasedBids"))
                {
                    ClientCredentials = {
                        Windows = {
                            AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation,
                            ClientCredential = {
                                UserName = Setting.setting(config).navsettings.Username,
                                Password = Setting.setting(config).navsettings.pass
                            } } }
                };
            }
        }
        public Service(IConfiguration configuration)
        {

            config = configuration;

        }

    }
}
