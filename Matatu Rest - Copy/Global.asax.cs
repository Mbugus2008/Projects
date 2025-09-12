using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Logging;
using Serilog;

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


            settings s = app.Settings;
            Log.Logger = new LoggerConfiguration().WriteTo.File(string.Format("{0}/MatatuRest/.txt", s.navsettings.logpath,s.navsettings.datetime), rollingInterval: RollingInterval.Day).CreateLogger();
        }
    }

    public class app
    {
 public static  settings Settings
        {
            get { return new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config")); }
        }
    }
}
