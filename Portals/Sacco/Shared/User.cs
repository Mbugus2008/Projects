using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace Sacco.Shared
{
    public class user
    {
        [Required]
        public string UserName { get; set; }
        [Required]
       
        public string Password { get; set; }
       // [Required]
      //  [Compare(nameof(Password), ErrorMessage = "Passwords do not match!")]
       // public string PasswordConfirm { get; set; }
        public bool RememberMe { get; set; }
    } 
    public class register
    {
        [Required]
        public string UserName { get; set; }
        [Required]
       
        public string Password { get; set; }
        [Required]
        public string Otp { get; set; }
        [Required]
        [Compare(nameof(Password), ErrorMessage = "Passwords do not match!")]
        public string PasswordConfirm { get; set; }
        public bool RememberMe { get; set; }

    }
    public class param
    {

        public string? No { get; set; }
        public string? phone { get; set; }
        public string? Otp { get; set; }
        
        public string? filterstring { get;set; }
        public string? filtercolumn { get; set; }

        public DateTime? Datefrom { get; set;}
        public DateTime? DateTo { get; set;}
        public string? Statementpath { get; set; }
        public string? folder { get; set; }
    }
}
