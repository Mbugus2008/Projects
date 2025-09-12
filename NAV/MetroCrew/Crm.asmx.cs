using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;

namespace NavWrapper
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
        NavWrapper.Accountlist.Accountlist_Service Accountlist_Service = new NavWrapper.Accountlist.Accountlist_Service();
       
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        public Crm() {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\Settings.xml";
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.investsettings.Username, s.investsettings.pass, s.investsettings.domain);
            Accountlist_Service = new Accountlist.Accountlist_Service { Url = geturl(s, Accountlist_Service.Url), Credentials = cd, PreAuthenticate = true };
        }

        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.investsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        [WebMethod]
        public Accountlist.Accountlist GetAccount_Balance(Accountlist.Accountlist Account)
        {
            Accountlist.Accountlist n = new Accountlist.Accountlist();
            try
            {
                if(Account !=null)
                n=Accountlist_Service.Read(Account.No);

                
            }
            catch (Exception ex) { 
                n.code = -1;
                n.Desc = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            return n;

        }
    }
}
namespace NavWrapper.Accountlist
{
    public partial class Accountlist : results
    {
        // public results results { get; set; }
    }
    public class results
    {
        public int code = 0;
        public string Desc = "Successful";
    }
}