using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;

namespace Client_Service
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
            config.MessageHandlers.Add(new Controllers.LogRequestAndResponseHandler());

            ((DefaultContractResolver)config.Formatters.JsonFormatter
 .SerializerSettings.ContractResolver)
   .IgnoreSerializableAttribute = true;
            config.Formatters.JsonFormatter.SerializerSettings.Converters.Add(
       new IsoDateTimeConverter());
            config.Formatters.JsonFormatter.SerializerSettings.Converters.Add(
                 new JsonDateConverter());
        }
    }
    class JsonDateConverter : IsoDateTimeConverter
    {
        public JsonDateConverter()
        {
            DateTimeFormat = "yyyy-MM-dd";
        }
    }
}
