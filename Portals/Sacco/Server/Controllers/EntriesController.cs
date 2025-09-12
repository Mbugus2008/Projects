using entriesdata;
using Loansdata;
using Logging;
using Memberdata;
using Microsoft.AspNetCore.Mvc;
using Sacco.Shared;
using System.Collections.Generic;
using System.ServiceModel;

namespace Sacco.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class EntriesController : ControllerBase
    {


        private readonly ILogger<LoansController> _logger;
        entriesdata.Entries_PortClient entries;

        IConfiguration config;
        public EntriesController(ILogger<LoansController> logger, IConfiguration configuration)
        {
            config = configuration;
            entries = new Entries_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Entries"));



            entries.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            entries.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            entries.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";




            _logger = logger;


        }

        [HttpGet("{No}")]
        public IEnumerable<entriesdata.Entries> Get(String No)
        {
            Console.WriteLine(No);
          
            return entries.ReadMultiple(new Entries_Filter[] { new Entries_Filter { Criteria = No, Field = Entries_Fields.Customer_No } }, null, 100).OrderByDescending(o => o.Entry_No);
           

        } 
        [HttpGet("{No}")]
        public IEnumerable<entriesdata.Entries> Getbytype(String No, [FromQuery] int? entryType)
        {
            Console.WriteLine(No);
          
            return entries.ReadMultiple(new Entries_Filter[] {
                new Entries_Filter { Criteria = No, Field = Entries_Fields.Customer_No },
                new Entries_Filter { Criteria = entryType.ToString(), Field = Entries_Fields.Transaction_Type }
            
            }, null, 100).OrderByDescending(o => o.Entry_No);
           

        }
        [HttpPost]
        public Results<IEnumerable<entriesdata.Entries>> Getfilter(param p)
        {
            Results<IEnumerable<entriesdata.Entries>> ent = new Results<IEnumerable<Entries>>();
            try
            {
                Entries_Fields f = (Entries_Fields)System.Enum.Parse(typeof(Entries_Fields), p.filtercolumn);
                if (p.filterstring != null)
                {
                    ent.Contents = entries.ReadMultiple(new Entries_Filter[] { new Entries_Filter { Criteria = p.filterstring, Field = f }, new Entries_Filter { Criteria = p.No, Field = Entries_Fields.Customer_No } }, null, 100);
                }
                else
                {   ent.Contents = entries.ReadMultiple(new Entries_Filter[] {  new Entries_Filter { Criteria = p.No, Field = Entries_Fields.Customer_No } }, null, 100); }
            }
            catch (Exception ex)
            {
                ent.Code = -1;
                ent.Desc = ex.Message;
                Console.WriteLine(ex.Message);
            }
            return ent;
        }
    }
}