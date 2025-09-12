using Members;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ServiceModel;
using Logging;
using Microsoft.AspNetCore.Http.HttpResults;
using Mtransactions;


namespace Matatu_Core.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class memberController : ControllerBase
    {
        private readonly IConfiguration _configuration;

        private Setting s;
        private readonly ILogger<memberController> _logger;

        public memberController(IConfiguration configuration, ILogger<memberController> logger)
        {
            _configuration = configuration;
            s = new Setting(_configuration);
            _logger = logger;

        }

        [HttpGet]
        [Route("members")]
        public Results<Members2[]> GetMembers(string bookmark = null, int size=0)
        {
            try
            {
                return new Results<Members2[]>
                {
                    Contents = new Members2_PortClient(s.binding, new EndpointAddress(s.baseurl + "Members2")).auth(s)
                        .ReadMultiple(
                            new[]
                                { new Members2_Filter() { Criteria = "", Field = Members2_Fields.No } },
                            bookmark, size)
                };
            }
            catch (Exception e)
            {
                _logger.LogError("Error", e);
                return new Results<Members2[]>() { Code = 1, Desc = e.Message };
            }

        }
        [HttpGet]
        [Route("gettransactions")]
        public Results<Mtransactions.Transactions[]> Gettransactions(string user,string bookmark = null, int size = 0)
        {
            try
            {
                return new Results<Mtransactions.Transactions[]>
                {
                    Contents = new Mtransactions. Transactions_PortClient(s.binding, new EndpointAddress(s.baseurl + "Transactions")).auth(s)
                         .ReadMultiple(
                            new[]
                                { new Mtransactions. Transactions_Filter { Criteria =user , Field = Transactions_Fields.Agent_Code } },
                            bookmark, size)
                };
            }
            catch (Exception e)
            {
                _logger.LogError("Error", e);
                return new Results<Mtransactions.Transactions[]> { Code = 1, Desc = e.Message };
            }

        }
    }
}
