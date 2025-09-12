using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace pulseem.Shared.Models
{
    public class Clients
    {
        [Key]
        [Required]
        public string Email { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
     
        [phonevalidation(ErrorMessage ="Invalid phone No")]
        public string CellPhone { get; set; }
        public status EmailStatus { get; set; }
        public status SmsStatus { get; set; }

    }
    public enum status
    { active,Removed }

    class phonevalidation : ValidationAttribute
    {
        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            if (value.ToString().ToLower().StartsWith("05"))
            {
                if (value.ToString().Length !=10)
                return new ValidationResult("Invalid Phone no",
                new[] { validationContext.MemberName }); ;
            }
else if (value.ToString().ToLower().StartsWith("9725"))
            {
                if (value.ToString().Length !=12)
                return new ValidationResult("Invalid Phone no",
                new[] { validationContext.MemberName }); ;
            }
            else
                return new ValidationResult("Invalid Phone no",
               new[] { validationContext.MemberName }); ;

            return null;
        }
    }
}
