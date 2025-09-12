using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InvestorsData
{
    public class Data
    {
        private System.Net.NetworkCredential cd;
        public members.Members2_Service members2_Service = new members.Members2_Service();
        public Data(Logging.settings s) {
            try
            {
                cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);

                members2_Service = new  members.Members2_Service { Url =Logging.misc.geturl(s, members2_Service.Url), Credentials = cd, PreAuthenticate = true };
            }
            catch(Exception ex) {
                Logging.Logging.ReportError(ex);
            }
        
        }

    }
}
