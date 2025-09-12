
using System.IO;
using System;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.Management.Instrumentation;
using System.Web.Services.Description;
using System.Net;

namespace Aps
{
    public class settings
    {       
        
        public class NAV
        {

            public string Serverip { get; set; } = string.Empty;
            public string domain { get; set; } = string.Empty;
            public string Instance { get; set; } = string.Empty;
            public int Port { get; set; } = 0;
            public string database { get; set; } = string.Empty;
            public bool IntegratedSecurity { get; set; } = true;
            public string Username { get; set; } = string.Empty;
            public string pass { get; set; } = string.Empty;
            public string Companyname { get; set; } = string.Empty;
            public int PostIntervalinsec{ get; set; } = 2;
            public int Reconnectintervalinsec { get; set; } = 10;
            public string logpath { get; set; } = string.Empty;
            public string certpath { get; set; } = string.Empty;
            public string client { get; set; } = string.Empty;
            public string clientcode { get; set; } = string.Empty;

           

            private string getpage(string url)
            {
                string t = string.Empty;
                var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
            }
            public string geturl(string page)
            {

                return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", Serverip, Companyname, Instance, Port, getpage(page));
            }

            public NetworkCredential cd { get { return new NetworkCredential(Username, pass, domain); } }
        }
        public List<NAV> nav;

        public settings loadsettings(string file)
        {                    
            settings s = new settings();
            try
            {
                XmlSerializer xs = new XmlSerializer(typeof(settings));
                using (var sr = new StreamReader(file))
                {
                    s = (settings)xs.Deserialize(sr);
                 }
            }
            catch (Exception ex)
            {
                Logging.Logging.logpath = @"C:\Logs\";
                Logging.Logging.ReportError(ex);
                throw;
            }

            return s;
        }
        
    }
}