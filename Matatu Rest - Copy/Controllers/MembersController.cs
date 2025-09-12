using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Logging;

namespace Matatu_Rest.Controllers
{
    public class MembersController : ApiController
    {
        private settings s = new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config"));

      
    }
}
