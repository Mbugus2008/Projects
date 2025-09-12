using entriesdata;
using Loansdata;
using Logging;
using mbranch;
using Memberdata;
using Microsoft.AspNetCore.Mvc;
using Sacco.Shared;
using System.ServiceModel;
using Microsoft.AspNetCore.Hosting;
namespace Sacco.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class HomeController : ControllerBase
    {

        private IWebHostEnvironment Environment;
        private readonly ILogger<LoansController> _logger;
        Loans_PortClient loans;
        Members_PortClient member;
        Mbranch_PortClient mbranch;
        IConfiguration config;
        public HomeController(ILogger<LoansController> logger, IConfiguration configuration, IWebHostEnvironment _environment)
        {

            Environment = _environment;

            config = configuration;

            loans = new Loans_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Loans"));
            member   = new Members_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Members"));
            mbranch = new Mbranch_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl_codeunit(configuration) + "Mbranch"));

            loans.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            loans.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            loans.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            member.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            member.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            member.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            mbranch.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            mbranch.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            mbranch.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            _logger = logger;

            
        }

        [HttpGet("{No}")]
        public Memberdata.Members Get(String No)
        {
            Console.WriteLine(No);
            return member.Read( No);
                       
        }


        [HttpGet]
        public String Getcompany() => Setting.getcompany(config);
        [HttpGet]
        public String getid() => Setting.getkey;

        [HttpPost]
        public param getstatement(param pa)
        {
            try
            {
                Console.WriteLine(Environment.WebRootPath);
                pa.Statementpath = mbranch.Exportstatement(pa.No, (DateTime)pa.Datefrom, (DateTime)pa.DateTo, pa.folder);
            }
            catch { }
            return pa;

        }
    }
}