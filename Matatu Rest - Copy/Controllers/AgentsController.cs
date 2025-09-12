using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Logging;
using Matatu_Rest.Agents;

namespace Matatu_Rest.Controllers
{
    public class AgentsController : ApiController
    {
        [HttpPost]
        [Route("api/agents")]
        public Results<Agents.Users[]> getaccounts()
        {
            try
            {
                return new Results<Agents.Users[]>()
                    { Contents = new Users_Service(app.Settings).ReadMultiple(null, null, 0) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Agents.Users[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/agent")]
        public Results<Agents.Users> getaccount(string agent)
        {
            try
            {
                return new Results<Agents.Users>() { Contents = new Users_Service(app.Settings).Read(agent) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Agents.Users>() { Code = -1, Desc = e.Message };
            }
        }
    }
}
