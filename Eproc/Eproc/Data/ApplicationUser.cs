using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace Eproc.Data
{
    // Add profile data for application users by adding properties to the ApplicationUser class
    public class ApplicationUser : IdentityUser
    {
        public string Company_Name { get; set; } = "";

        public string TaxRegistrationNO { get; set; } = "";

        public string PhoneNo { get; set; } = "";
    }
}
