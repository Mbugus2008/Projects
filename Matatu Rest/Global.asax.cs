using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Logging;
using Microsoft.Owin.Security.OAuth;
using Microsoft.Owin;
using Owin;
using Serilog;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.Owin.Builder;

namespace Matatu_Rest
{
    public class WebApiApplication : System.Web.HttpApplication
    {
   
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //ConfigureOAuth(app => { });

            settings s = my_app.Settings;
            Log.Logger = new LoggerConfiguration().WriteTo.File(string.Format("{0}/MatatuRest/.txt", s.navsettings.logpath,s.navsettings.datetime), rollingInterval: RollingInterval.Day).CreateLogger();
        }
        private void ConfigureOAuth(Action<IAppBuilder> startup)
        {
            var app = new AppBuilder();
            startup(app);
            // Enable application to use OAuthBearer authentication
            app.UseOAuthBearerAuthentication(new OAuthBearerAuthenticationOptions());

            // Configure the OAuth authorization server
            app.UseOAuthAuthorizationServer(new OAuthAuthorizationServerOptions
            {
                AllowInsecureHttp = true, // In a production environment, set this to false

                TokenEndpointPath = new PathString("/token"),
                AccessTokenExpireTimeSpan = TimeSpan.FromMinutes(30),

                Provider = new MyAuthorizationServerProvider(), // Implement this class to validate credentials

                // You may also need to set the following for refresh tokens and other options
                // ...
            });
        }
    }
    public class MyAuthorizationServerProvider : OAuthAuthorizationServerProvider
    {
        public override Task ValidateClientAuthentication(OAuthValidateClientAuthenticationContext context)
        {
            // Your logic to validate the client
            
            context.Validated();
            return Task.CompletedTask;
        }

        public override Task GrantResourceOwnerCredentials(OAuthGrantResourceOwnerCredentialsContext context)
        {
            // Your logic to validate user credentials
            var identity = new ClaimsIdentity(context.Options.AuthenticationType);
            identity.AddClaim(new Claim(ClaimTypes.Name, context.UserName));
            context.Validated(identity);
            return Task.CompletedTask;
        }
    }
    public class my_app
    {
 public static  settings Settings
        {
            get { return new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config")); }
        }
    }
}
