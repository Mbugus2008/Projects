using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Mobileloans_Rest.Controllers
{
    public class ClientController : ApiController
    {

        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        public ClientController()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
        }

      

    }
}
