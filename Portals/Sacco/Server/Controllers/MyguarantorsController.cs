
using guarantorsdata;
using Loansdata;
using Logging;
using Microsoft.AspNetCore.Mvc;
using Sacco.Shared;
using System.ServiceModel;

namespace Sacco.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class MyguarantorsController : ControllerBase
    {


        private readonly ILogger<LoansController> _logger;
        guarantorsdata.Guarantors_PortClient guarantors;
        public MyguarantorsController(ILogger<LoansController> logger, IConfiguration configuration)
        {
            guarantors = new guarantorsdata.Guarantors_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Guarantors"));


            guarantors.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            guarantors.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            guarantors.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";


            _logger = logger;


        }

        public Guarantors_PortClient Guarantors { get => guarantors; set => guarantors = value; }

        [HttpGet("{No}")]
        public IEnumerable<guarantorsdata.Guarantors> Get(string No)
        {
          
            return Guarantors.ReadMultiple(new Guarantors_Filter[] { new Guarantors_Filter { Criteria = No, Field = Guarantors_Fields.Owner_account } },null,0);

                        
        }
    }
}