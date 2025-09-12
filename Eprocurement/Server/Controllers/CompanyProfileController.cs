using Microsoft.AspNetCore.Mvc;

namespace Eprocurement.Server.Controllers
{
    public class CompanyProfileController : Controller
    {

       CompanyProfile.CompanyProfile_PortClient companyprofile;
        public IActionResult Index()
        {
            return View();
        }
    }
}
