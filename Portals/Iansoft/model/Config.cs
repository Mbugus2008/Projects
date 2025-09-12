using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;

namespace Bandari_Sacco
{
    public class Config
    {
        //public static string dbName = "";
        //public static string source = "";
        //public static string user = "sa";
        //public static string password = "kamuye";
        //public static string companyName = "";


        public static string dbName = ConfigurationManager.AppSettings["dbName"];
        public static string source = ConfigurationManager.AppSettings["source"];
        public static string user = ConfigurationManager.AppSettings["user"];
        public static string password = ConfigurationManager.AppSettings["pwd"]; 
        public static string companyName = ConfigurationManager.AppSettings["company"];
        public static string sitePath = ConfigurationManager.AppSettings["sitePath"];
    }
}