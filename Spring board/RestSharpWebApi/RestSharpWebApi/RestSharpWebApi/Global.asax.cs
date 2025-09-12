using RestSharpWebApi.Models;
using RestSharpWebApi.Properties;
using Serilog;
using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Services.Description;


namespace RestSharpWebApi
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        public  Setting s { get; set; }
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);


            s = new Setting();

            Log.Logger = new LoggerConfiguration().WriteTo.File(string.Format("{0}/Spring-.txt", s.logpath), rollingInterval: RollingInterval.Day).CreateLogger();


        }

      
    }
}
