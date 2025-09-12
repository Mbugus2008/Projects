using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NavWrapper
{
    /// <summary>
    /// Summary description for Investment
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Investment : System.Web.Services.WebService
    {
        Invest.NAV nav = new Invest.NAV(new Uri("http://5.189.167.52:1177/Investment/OData/Company('KPS-TEST')"));
        [WebMethod]
        public Invest.Member_Edit Update(Invest.Member_Edit member)
        {
            var m = nav.Member_Edit.Where(o => o.Member_No ==  member.Member_No).FirstOrDefault();
            if (m != null)
            { 
            
            }
            return member;
        }
        [WebMethod]
        public Invest.Member_Edit Deregister(Invest.Member_Edit member)
        {
            var m = nav.Member_Edit.Where(o => o.Member_No ==  member.Member_No).FirstOrDefault();
            if (m != null)
            { 
      
            }
            return member;
        }
    }
}
