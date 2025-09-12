using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Threading;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Xml.Serialization;
using System.Xml;
using System.Text;

namespace Logging
{
    public static class Logging
    {
        static Collection<string> logs = new Collection<string>();
        public static string logpath;

        public static string LogFileName
        {
            get
            {
                if (!Directory.Exists(logpath))
                    Directory.CreateDirectory(logpath);
                return logpath + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + ".txt";
            }
        }

        public static void LogEntryOnFile(string clientRequest)
        {
            try
            {
                File.AppendAllText(LogFileName, clientRequest + "\n");
            }
            catch (Exception ex)
            {
            }
        }

        public static void CreateXML(Object YourClassObject)
        {
            XmlDocument xmlDoc = new XmlDocument();
            try
            {
                //Represents an XML document, 
                // Initializes a new instance of the XmlDocument class.          
                XmlSerializer xmlSerializer = new XmlSerializer(YourClassObject.GetType());
                // Creates a stream whose backing store is memory. 
                using (MemoryStream xmlStream = new MemoryStream())
                {
                    xmlSerializer.Serialize(xmlStream, YourClassObject);
                    xmlStream.Position = 0;
                    //Loads the XML document from the specified string.
                    xmlDoc.Load(xmlStream);

                }
                LogEntryOnFile(xmlDoc.InnerXml);
            }
            catch (Exception ex)
            {
                LogEntryOnFile(ex.Message);
                LogEntryOnFile(ex.StackTrace);
            }

        }
        public static void ReportError(Exception ex)
        {
            // throw ex;
            try
            {
                LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.StackTrace));
                LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.Source));
                LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.Message));
                if (ex.InnerException != null)
                {
                    LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.InnerException.Message));
                    LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.InnerException.StackTrace));
                    if (ex.InnerException.InnerException != null)
                    {
                        LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.InnerException.InnerException.Message));
                        LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.InnerException.InnerException.StackTrace));
                    }
                }
                try
                {
                    throw ex;

                }
                catch (DbEntityValidationException ee)
                {
                    foreach (var eve in ee.EntityValidationErrors)
                    {
                        LogEntryOnFile(string.Format("Entity of type {0} in state {1} has the following validation errors:",
                             eve.Entry.Entity.GetType().Name, eve.Entry.State));
                        foreach (var ve in eve.ValidationErrors)
                        {
                            LogEntryOnFile(string.Format("- Property: {0}, Error: {1}",
                                ve.PropertyName, ve.ErrorMessage));
                        }
                    }

                }


                LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.StackTrace));
                LogEntryOnFile(String.Format("{0}:{1}", DateTime.Now, ex.Source));
            }


            catch (Exception e) { }

        }
        public static void ReportError(Exception ex, string client)
        {
            try
            {
                LogEntryOnFile(String.Format("{0}:{1}:{2}", DateTime.Now, client, ex.Message));
                if (ex.InnerException != null)
                    LogEntryOnFile(String.Format("{0}:{1}:{2}", DateTime.Now, client, ex.InnerException.Message));
                LogEntryOnFile(String.Format("{0}:{1}:{2}", DateTime.Now, client, ex.StackTrace));
                LogEntryOnFile(String.Format("{0}:{1}:{2}", DateTime.Now, client, ex.Source));
            }
            catch (Exception e) { }

        }
    }

    public static class Randomize
    {

        public static string RandomString(int size, bool lowerCase = false)
        {
            StringBuilder builder = new StringBuilder();
            Random random = new Random();
            char ch;
            for (int i = 0; i < size; i++)
            {
                ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                builder.Append(ch);
            }
            if (lowerCase)
                return builder.ToString().ToLower();
            return builder.ToString();
        }
    }
    public partial class settings
    {
        public nav navsettings;
        public investment investsettings;
        public db dbsettings;
        public other othersettings;
        public erp erpsettings;
        public ada adasettings;
        public profits profits;


        public settings loadsettings(string file)
        {
            settings s = new settings();
            XmlSerializer xs = new XmlSerializer(typeof(settings));
            using (var sr = new StreamReader(file))
            {
                s = (settings)xs.Deserialize(sr);
                Logging.logpath = s.othersettings.logpath;
            }

            return s;
        }
    }
    public class nav : other
    {
        public string Server = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public string Companyname = string.Empty;
        public int Port = 0;
        public string Username = string.Empty;
        public string pass = string.Empty;
    }
    public class profits : other
    {
        public string url = string.Empty;

    }
    public class investment : other
    {
        public string Server = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public string Companyname = string.Empty;
        public int Port = 0;
        public string Username = string.Empty;
        public string pass = string.Empty;
    }
    public class erp : other
    {
        public string Server = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public string Companyname = string.Empty;
        public int Port = 0;
        public string Username = string.Empty;
        public string pass = string.Empty;
    }
    public class ada : other
    {
        public string Username = string.Empty;
        public string pass = string.Empty;
        public string baseurl = string.Empty;

    }
    public class db : other
    {
        public string database = string.Empty;
        public bool IntegratedSecurity = true;
        public string EUsername = string.Empty;
        public string Epass = string.Empty;
    }
    public class other
    {
        public int PostIntervalinsec = 2;
        public int Reconnectintervalinsec = 10;
        public string logpath = string.Empty;
    }

    public static class misc
    {
        public static string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        public static string geturl(settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }

    }
}

