using AppliedBids;
using Microsoft.AspNetCore.Authorization;
using ProcurementPortal;
using ReleasedBids;
using System.Runtime.CompilerServices;
using System.ServiceModel;

namespace Eproc.Services
{
    public class Bid : Ibids
    {
        IConfiguration config { get; set; }
        public Bid(IConfiguration configuration)
        {
            config = configuration;
        }
        ReleasedBids.EProcReleasedBids_PortClient bids
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
        } AppliedBids.EProcAppliedBids_PortClient appbids
        {
            get
            {
                return new EProcAppliedBids_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(config) + "EProcAppliedBids"))
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
        } [Authorize]
        public async Task<List<EProcReleasedBids>> GetReleasedBids()
        {
           
            var p = await bids.ReadMultipleAsync(new EProcReleasedBids_Filter[] { }, null, 0);
            return p.ReadMultiple_Result1.ToList();
        }   [Authorize] public async Task<List<AppliedBids.EProcAppliedBids>> GetappliedBids(string taxno)
        {
           
            var p = await appbids.ReadMultipleAsync(new EProcAppliedBids_Filter[] { new EProcAppliedBids_Filter { Criteria = taxno, Field = EProcAppliedBids_Fields.Tax_Registration_No } }, null, 0);
            return p.ReadMultiple_Result1.ToList();
        }
        [Authorize]
        public  Task Bidsubmision(string taxRegNo, string bidNo, string categoryCode)
        {
            portal.BidSubmission(taxRegNo, bidNo, categoryCode);    
           return Task.CompletedTask;
        }

      
    }
}