using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ClientApi.Controllers
{
    public class ClientController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();

        MobileApplications.MobileApplications_Service MobileApplications_Service = new MobileApplications.MobileApplications_Service();
        public ClientController()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);


            MobileApplications_Service = new MobileApplications.MobileApplications_Service { Url = Logging.misc.geturl(s, MobileApplications_Service.Url), Credentials = cd, PreAuthenticate = true };

        }

        [HttpPost]
        [Route("api/member")]
        public Results member(string phone)
        {
            //var j =  JsonConvert.DeserializeObject<otp>(phone.ToString());
            Results r = new Results();
            try
            {
                r.content = MobileApplications_Service.ReadMultiple(new MobileApplications.MobileApplications_Filter[] { new MobileApplications.MobileApplications_Filter { Criteria = string.Format("*{0}", phone.Substring(phone.Length - 9)),Field = MobileApplications.MobileApplications_Fields.MPESA_Mobile_No }, }, null, 0);

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
    }
}
