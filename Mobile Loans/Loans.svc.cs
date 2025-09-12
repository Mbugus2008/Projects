using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace Mobile_Loans
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Loans : ILoans
    {
        Members.Members_Service members = new Members.Members_Service();
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        public Loans() {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);

            members = new Members.Members_Service { Url = geturl(s, members.Url), Credentials = cd, PreAuthenticate = true };
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }

     public   Members.Members getmember(string phone) {
            Members.Members m = null;
            try
            {
                m = members.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = phone, Field = Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }  
        public   Members.Members createmember(Members.Members m) {
            var me = m;
            try
            {
                var mm = members.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = me.Phone_No, Field = Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();

                if (mm == null)
                {
                    members.Create(ref me);
                }
                else
                {
                    me = mm;
                    me.Code = 1;
                    me.Desc = "Already Created";
                }
            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
                me.Code = -1;
                me.Desc = ex.Message;
            }
            return me;
        }

    }
}
