using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using Newtonsoft.Json.Serialization;

namespace Matatu_Rest
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
               
            );
            config.MessageHandlers.Add(new Matatu_Rest.Controllers.LogRequestAndResponseHandler());
            config.Formatters.JsonFormatter.SerializerSettings.DateFormatString = "dd/MM/yyyy";
            ((DefaultContractResolver)config.Formatters.JsonFormatter
                    .SerializerSettings.ContractResolver)
                .IgnoreSerializableAttribute = true;
            

         
            
        }
    }
}
