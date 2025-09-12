using mbranch;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Sacco.Server.Models;
using Sacco.Shared;
using System.Net;
using System.ServiceModel;
using System.Text.Json;

namespace Sacco.Server.Controllers

{  
    
    [ApiController]
    [Route("api/[controller]/[action]")]
  
    public class AuthController : ControllerBase
    {


        Data.Logins_PortClient logins;
        Memberdata.Members_PortClient member;
        Mbranch_PortClient mbranch;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public AuthController(IConfiguration configuration)
        {
            
            logins = new Data.Logins_PortClient (Setting.binding(), new  EndpointAddress(Setting.baseurl(configuration) + "Logins"));
            member = new Memberdata.Members_PortClient(Setting.binding(), new EndpointAddress(Setting.baseurl(configuration) + "Members"));
            mbranch = new  Mbranch_PortClient (Setting.binding(), new EndpointAddress(Setting.baseurl_codeunit(configuration) + "Mbranch"));
           

            logins.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            logins.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            logins.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            member.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            member.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            member.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";

            mbranch.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            mbranch.ClientCredentials.Windows.ClientCredential.UserName = Setting.setting(configuration).navsettings.Username;// "Mbranch";
            mbranch.ClientCredentials.Windows.ClientCredential.Password = Setting.setting(configuration).navsettings.pass;// "Mbanking12345*";
            
           
        }
        [HttpGet("Login")]
        public async Task<IActionResult> Login([FromBody] user request)
        {
            try
            {
                Console.WriteLine("Testing");
                var l = logins.Read(request.UserName);

                if (l == null)
                {
                    return BadRequest("Not Registered, please click on register");
                }
                else
                {
                    if (!request.Password.Equals(Logging.Encryption.DecryptString(Setting.getkey, l.Password)))
                        return BadRequest("Invalid Username/Password");
                    return Ok(member.Read(request.UserName));
                }
            }
            catch (Exception ex) {
            return Ok(ex.Message);

            }
        }
        [HttpPost]
        public async Task<IActionResult> Register(user parameters)
        {
            var m = member.Read(parameters.UserName);
            if (m == null)
                return BadRequest("Member No does not exist");


            if (string.IsNullOrEmpty(m.Mobile_Phone_No) && string.IsNullOrEmpty(m.Phone_No))
                return BadRequest("No Phone attached to this account");
            string pass = Logging.Randomize.RandomString(5);
            Data.Logins lg;
            lg = logins.Read(parameters.UserName);
           if ( lg == null)
            {   lg = new Data.Logins();
                lg.Member_No = parameters.UserName;
                logins.Create(ref lg);
            }
                lg.Password =Logging.Encryption.EncryptString(Setting.getkey,  parameters.Password);
            logins.Update(ref lg);
               
             


            return Ok("We have sent a first time use password to phone "  );
        }
        [HttpPost]
        public async Task<IActionResult> Getcode(param p)
        {
            var m = member.Read(p.No);
            if (m == null)
                return BadRequest("Member No does not exist");


            if (string.IsNullOrEmpty(m.Mobile_Phone_No) && string.IsNullOrEmpty ( m.Phone_No))
                return BadRequest("No Phone attached to this account");

            var phone = m.Phone_No;
            if (string.IsNullOrEmpty(phone))
                phone = m.Mobile_Phone_No;

            p.phone = phone;

            var otp = Logging.Randomize.RandomString(4);
            mbranch.Sendsms("Portal", phone, string.Format("Your portal registation OTP is {0}", otp),p.No);
            p.Otp = otp;
            return Ok(p);
        }
        [Authorize]
        [HttpPost]
        public async Task<IActionResult> Logout()
        {
           // await _signInManager.SignOutAsync();
            return Ok();
        }
        [HttpGet]
        public CurrentUser CurrentUserInfo()
        {
            return new CurrentUser
            {
                IsAuthenticated = User.Identity.IsAuthenticated,
                UserName = User.Identity.Name,
                Claims = User.Claims
                .ToDictionary(c => c.Type, c => c.Value)
            };
        }
    }


    // Define a middleware class to handle Method Not Allowed (405) status codes
    public class MethodNotAllowedMiddleware
    {
        // Field to store the next middleware in the pipeline
        private readonly RequestDelegate _next;

        // Constructor to initialize the next middleware
        public MethodNotAllowedMiddleware(RequestDelegate next)
        {
            _next = next; // Assign the next middleware
        }

        // Method to handle the HTTP context
        public async Task Invoke(HttpContext context)
        {
            // Invoke the next middleware in the pipeline
            await _next(context);

            // Check if the response status code is 405 Method Not Allowed
            if (context.Response.StatusCode == (int)HttpStatusCode.MethodNotAllowed)
            {
                // Set the response content type to application/json
                context.Response.ContentType = "application/json";

                // Create a custom response object with code and message
                var customResponse = new
                {
                    // Custom code field indicating the status code
                    Code = 405,
                    // Custom message field
                    Message = "HTTP Method not allowed"
                };

                // Serialize the custom response object to JSON
                var responseJson = JsonSerializer.Serialize(customResponse);

                // Write the JSON response to the HTTP response body
                await context.Response.WriteAsync(responseJson);
            }
        }
    }
}