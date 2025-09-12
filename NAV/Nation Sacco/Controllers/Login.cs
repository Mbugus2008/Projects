namespace Nation_Sacco.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.IdentityModel.JsonWebTokens;
    using Microsoft.IdentityModel.Tokens;
    using System.IdentityModel.Tokens;
    using System.Security.Claims;
    using System.Security.Cryptography;
    using System.Text;
    using SymmetricSecurityKey = Microsoft.IdentityModel.Tokens.SymmetricSecurityKey;

    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        string? secretKey;
                string? issuer ;
                string? audience ;
                string? User;
                string? pass ;

        public AuthController()
        {
            //var key = Convert.ToBase64String(RandomNumberGenerator.GetBytes(32));

            var configuration = new ConfigurationManager();
                configuration.AddJsonFile("appsettings.json");

                 secretKey = configuration["JwtSettings:SecretKey"];
                 issuer = configuration["JwtSettings:Issuer"];
                 audience = configuration["JwtSettings:Audience"];
                 User = configuration["JwtSettings:User"];
                 pass = configuration["JwtSettings:Pass"];


        }
       
        [HttpPost("token")]
        public IActionResult GenerateToken([FromBody] LoginRequest request)
        {
            if (IsValidUser(request))
            {
                // Define claims (you can add more if needed)
                var claims = new[]
                {
                new Claim(JwtRegisteredClaimNames.Sub, request.Username),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim("role", "User") // Add custom claims as needed
            };
               
                // Create a key and credentials
                var key =new  SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey)); // Use a strong secret key
                var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

                // Create the token
                var token = new System.IdentityModel.Tokens.Jwt.JwtSecurityToken (
                    issuer: issuer,
                    audience: audience,
                    claims: claims,
                    expires: DateTime.Now.AddHours(5),
                    signingCredentials: creds);

                // Return the token
                return Ok(new
                {
                    token = new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler().WriteToken(token)
                });
            }

            return Unauthorized();
        }

        private bool IsValidUser(LoginRequest request)
        {
            // Replace this with your user validation logic
            return request.Username == User && request.Password == pass;
        }
    }

    public class LoginRequest
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

}
