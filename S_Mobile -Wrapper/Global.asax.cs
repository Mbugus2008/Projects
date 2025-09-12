using Newtonsoft.Json;
using Serilog;
using System;
using System.IO;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace S_Mobile
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        private System.Net.NetworkCredential cd { get; set; }
        public static Logging.settings s { get; set; }
        public static Logging.settings s2 { get; set; }
        public static Logging.nav currentclient { get; set; }
        public static string client { get; set; }

        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = new Logging.settings().loadsettings(path);

            path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settingnew.xml");
            s2 = new Logging.settings().loadsettings(path);

            //var json = GlobalConfiguration.Configuration.Formatters.JsonFormatter;
            //json.SerializerSettings.NullValueHandling = NullValueHandling.Ignore;
            //json.SerializerSettings.DateFormatString = "MM-dd-yyyy";  // your format
            

            Log.Logger = new Serilog.LoggerConfiguration()
       .MinimumLevel.Debug()
       .WriteTo.File(Path.Combine(s.othersettings.logpath, DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + ".txt"), rollingInterval: RollingInterval.Day)
       .CreateLogger();
        }
    }
}