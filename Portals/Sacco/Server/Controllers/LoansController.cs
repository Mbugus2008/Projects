using Job_Planning;
using Loansdata;
using Logging;
using Microsoft.AspNetCore.Mvc;

using Sacco.Shared;
using System.ServiceModel;

namespace Sacco.Server.Controllers
{
    [ApiController]
    [Route("api/[controller]/[action]")]
    public class LoansController : ControllerBase
    {
        LoanProducts.Loan_Products_PortClient Loan_Products;

        private readonly ILogger<LoansController> _logger;
        Loans_PortClient loans;

        Job_Planning.Job_Planning_Lines_PortClient jb;
        public LoansController(ILogger<LoansController> logger, IConfiguration configuration)
        {
            loans = new Loans_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Loans"));
            Loan_Products = new LoanProducts.Loan_Products_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Loan_Products"));

            loans.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            loans.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            loans.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            Loan_Products.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            Loan_Products.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            Loan_Products.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            _logger = logger;
            //Instant
            jb = new Job_Planning.Job_Planning_Lines_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Job_Planning_Lines"));
            jb.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            jb.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            jb.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

        }

        [HttpGet("{No}")]
        public IEnumerable<Loansdata.Loans> Get(string No)
        {
          
              return loans.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = No, Field = Loans_Fields.Client_Code } },null,0);
            
        }
[HttpPost]
        public Results<Loansdata.Loans>  Save(Loansdata.Loans No)
        {
            try
            {
                if (String.IsNullOrEmpty(No.Loan_No))
                {
                    var ln = loans.ReadMultiple(new Loans_Filter[] {

                    new Loans_Filter { Criteria = No.Loan_Product_Type,Field =Loans_Fields.Loan_Product_Type },
                    new Loans_Filter { Criteria = No.Client_Code,Field =Loans_Fields.Client_Code },

                }, null, 0);
                    if (ln.Any())
                    {
                        var rn = ln.FirstOrDefault(o => o.Outstanding_Balance > 0);
                        if (rn != null) throw new Exception("You have an existing loan, kindly Pay the loan to qualify for another");
                        rn = ln.FirstOrDefault(o => o.Loan_Status  == Loan_Status.Application);
                        if (rn != null) throw new Exception("You have a pending loan, kindly Until the loan is processed");
                    }
                    else
                        loans.Create(ref No);
                }
                else
                    loans.Update(ref No);
                return new Results<Loans>() { Contents = No };
            }
            catch (Exception ex )
            {

                return new Results<Loans>() { Code = -1, Desc = ex.Message };
            }
          
            
        }
        [HttpPost]
        public Results<Loansdata.Loans>  Delete(Loansdata.Loans No)
        {
            try
            {
                var ln = loans.Read(No.Loan_No);
                if (ln != null)
                loans.Delete( ln.Key);
                return new Results<Loans>() 
                { 
                    Contents = No 
                };
            }
            catch (Exception ex )
            {

                return new Results<Loans>() { Code = -1, Desc = ex.Message };
            }
          
            
        }
        [HttpGet("{No}")]
        public IEnumerable<Loansdata.Loans> Getloanapps(string No)
        {

            var l =   loans.ReadMultiple(new Loans_Filter[] { 
                new Loans_Filter { Criteria = No, Field = Loans_Fields.Client_Code },
                new Loans_Filter { Criteria = Loansdata.Loan_Status.Application.ToString(), Field = Loans_Fields.Loan_Status }
            
            
            }, null, 0);
            return l;

        }

        [HttpGet]
        public IEnumerable<LoanProducts.Loan_Products> loanproducts()
        {
            return Loan_Products.ReadMultiple(new LoanProducts.Loan_Products_Filter[] {}
            , null, 0).Where(o=> o.Available_On_Mobile == true);

        }
    }
 
   
}