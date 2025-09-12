using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace Kps_Web_Service
{
    /// <summary>
    /// Summary description for Crma
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Crm : System.Web.Services.WebService
    {
        Invest.NAV nav = new Invest.NAV(new Uri("http://5.189.167.52:1177/Investment/OData/Company('KPS-TEST')"));
        private System.Net.NetworkCredential cd, investcd;
        public Logging.settings s = new Logging.settings();
        public Crm() {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.investsettings.Username, s.investsettings.pass, s.investsettings.domain);
            nav = new Invest.NAV(new Uri(String.Format("http://{0}:{1}/{2}/OData/Company('{3}')", s.investsettings.Server, s.investsettings.Port, s.investsettings.Instance, s.investsettings.Companyname)));
            nav.Credentials = cd;
        }
        
        
        [WebMethod]
        public Invest.Account_lIst GetAccount_Balance(Invest.Account_lIst Account)
        { Invest.Account_lIst n = new Invest.Account_lIst();
            try
            {
                var nn= nav.Account_lIst.Where(o => o.No == Account.No).ToList();

                n = nn.FirstOrDefault();
            }
            catch (Exception ex) { n.code = -1;
                n.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return n;

        }
    }
}
namespace Invest
{
    public partial class Account_lIst : results
    {
        // public results results { get; set; }
    }
    public class results
    {
        public int code = 0;
        public string Desc = "Successful";
    }
}