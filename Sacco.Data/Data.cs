using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Logging;

namespace Sacco.Data
{
    public class Data
    {
        System.Net.NetworkCredential cd;
        public Members.Members_Service members_Service = new Members.Members_Service();
        public Logins.Logins_Service Logins = new Sacco.Data.Logins.Logins_Service();
        public Loans.Loans_Service loans_Service = new Loans.Loans_Service();

        public Data(settings settings)

        {
            cd = new System.Net.NetworkCredential(settings.navsettings.Username, settings.navsettings.pass, settings.navsettings.domain);
            members_Service = new Members.Members_Service { Url = misc.geturl(settings, members_Service.Url), Credentials = cd, PreAuthenticate = true };
            Logins = new Logins.Logins_Service { Url = Logging.misc.geturl(settings, Logins.Url), Credentials = cd, PreAuthenticate = true };
            loans_Service = new Loans.Loans_Service { Url = Logging.misc.geturl(settings, loans_Service.Url), Credentials = cd, PreAuthenticate = true };

        }
        public Loans.Loans[] GetLoans(string client)
        {

            return loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = client, Field = Loans.Loans_Fields.Client_Code } }, null, 0);
        }
    }
}
