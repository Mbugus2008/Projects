using System;
using System.IO;
using System.Collections.ObjectModel;
using System.Threading;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Xml.Serialization;
using System.Xml;
using System.Text;
using Microsoft.SqlServer.Server;
using System.Security.Cryptography;
using System.Net;
using Logging;
using System.Collections.Generic;
using System.ServiceModel;

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
                return logpath + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() +
                       DateTime.Now.Day.ToString() + ".txt";
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

        public static void LogEntry(string path, string filename, string clientRequest)
        {
            try
            {
                if (!Directory.Exists(path))
                    Directory.CreateDirectory(path);
                string lp = path + filename;

                File.AppendAllText(lp, clientRequest + "\n");
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

                LogEntryOnFile($"{DateTime.Now}:{ex.StackTrace}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Source}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Message}");
                if (ex.InnerException != null)
                {
                    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.Message}");
                    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.StackTrace}");
                    if (ex.InnerException.InnerException != null)
                    {
                        LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.Message}");
                        LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.StackTrace}");
                    }

                    //if (ex.InnerException.InnerException.InnerException != null)
                    //{
                    //    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.InnerException.Message}");
                    //    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.InnerException.StackTrace}");
                    //}
                }

                LogEntryOnFile($"{DateTime.Now}:{ex.StackTrace}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Source}");
            }
            catch (DbEntityValidationException ee)
            {
                foreach (var eve in ee.EntityValidationErrors)
                {
                    LogEntryOnFile(
                        $"Entity of type {eve.Entry.Entity.GetType().Name} in state {eve.Entry.State} has the following validation errors:");
                    foreach (var ve in eve.ValidationErrors)
                    {
                        LogEntryOnFile($"- Property: {ve.PropertyName}, Error: {ve.ErrorMessage}");
                    }
                }
            }

            catch (Exception e)
            {
            }

        }

        public static void ReportError(Exception ex, string client)
        {
            try
            {
                LogEntryOnFile($"{DateTime.Now}:{client}:{ex.Message}");
                if (ex.InnerException != null)
                    LogEntryOnFile($"{DateTime.Now}:{client}:{ex.InnerException.Message}");
                LogEntryOnFile($"{DateTime.Now}:{client}:{ex.StackTrace}");
                LogEntryOnFile($"{DateTime.Now}:{client}:{ex.Source}");
            }
            catch (Exception e)
            {
            }

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

    public class Encryption
    {
        public static string EncryptString(string key, string plainText)
        {
            byte[] iv = new byte[16];
            byte[] array;

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;

                ICryptoTransform encryptor = aes.CreateEncryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream())
                {
                    using (CryptoStream cryptoStream =
                           new CryptoStream((Stream)memoryStream, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter streamWriter = new StreamWriter((Stream)cryptoStream))
                        {
                            streamWriter.Write(plainText);
                        }

                        array = memoryStream.ToArray();
                    }
                }
            }

            return Convert.ToBase64String(array);
        }

        public static string DecryptString(string key, string cipherText)
        {
            byte[] iv = new byte[16];
            byte[] buffer = Convert.FromBase64String(cipherText);

            using (Aes aes = Aes.Create())
            {
                aes.Key = Encoding.UTF8.GetBytes(key);
                aes.IV = iv;
                ICryptoTransform decryptor = aes.CreateDecryptor(aes.Key, aes.IV);

                using (MemoryStream memoryStream = new MemoryStream(buffer))
                {
                    using (CryptoStream cryptoStream =
                           new CryptoStream((Stream)memoryStream, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader streamReader = new StreamReader((Stream)cryptoStream))
                        {
                            return streamReader.ReadToEnd();
                        }
                    }
                }
            }
        }
    }

    public partial class Results
    {
        public int Code { set; get; } = 0;
        public string Desc { set; get; } = "Successful";
        public object content { set; get; } = null;
    }

    public partial class Results<T>
    {
        /// <inheritdoc/>
        /// <summary>
        /// O = successfull
        /// -1 = Unsucessful
        /// </summary>
        public int Code { set; get; } = 0;

        /// <inheritdoc/>
        /// <summary>
        /// Error Description if code is -1
        /// </summary>
        public string Desc { set; get; } = "Successful";

        public T Contents { get; set; }
    }

    public partial class Header
    {
        public string Userid { get; set; }
        public string Password { get; set; }

    }

    public partial class ClientRequest
    {
        public Header header { get; set; }
        public Object body { get; set; }
        public string bookmark { get; set; }
        public int size { set; get; } = 0;      

    }

    public partial class EligibilityRequest
    {
        public Header header { get; set; }
        public Body body { get; set; }

    }

    public partial class Body
    {
        public string phone { get; set; }
        public string loantype { get; set; }
        public string Code { get; set; }
    }
   
    public partial class settings
    {        
        public nav navsettings { get; set; }
        public other othersettings { get; set; }
        public nav kanisa { get; set; }
        public Transunion transunion { get; set; }
        public System.Net.NetworkCredential cd { get; set; }
        public List<nav> nav;
         public settings(string file)
        {

            XmlSerializer xs = new XmlSerializer(typeof(settings));
            using (var sr = new StreamReader(file))
            {
                settings s = (settings)xs.Deserialize(sr);

                navsettings = s.navsettings;
                othersettings = s.othersettings;
                transunion = s.transunion;
                Logging.logpath = othersettings.logpath;
                cd = new NetworkCredential(navsettings.Username, navsettings.pass, navsettings.domain );
            }

        }
     
        public settings()
        {

        }

        public settings loadsettings(string file)
        {
            settings s = new settings();
            XmlSerializer xs = new XmlSerializer(typeof(settings));
            using (var sr = new StreamReader(file))
            {
                s = (settings)xs.Deserialize(sr);
                if (s.othersettings != null)
                    Logging.logpath = s.othersettings.logpath;
            }
            return s;
        }
        public static string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return $"{tt[tt.Length - 2]}/{tt[tt.Length - 1]}";
        }
        public static string geturl(settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port,
                getpage(page));
        }
        private string get_page(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return $"{tt[tt.Length - 2]}/{tt[tt.Length - 1]}";
        }
        public string geturl(string page)
        {
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", navsettings. Server, navsettings.Companyname, navsettings.Instance, navsettings.Port, getpage(page));
        } 
        public string geturl(string page,nav n)
        {
            Logging.logpath = n.logpath;
            cd = new NetworkCredential(n.Username, n.pass, n.domain);
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", n. Server, n.Companyname, n.Instance, n.Port, getpage(page));
        }public string geturl(string page,ref nav n)
        {
            Logging.logpath = n.logpath;
            n.cd = new NetworkCredential(n.Username, n.pass, n.domain);
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", n. Server, n.Companyname, n.Instance, n.Port, getpage(page));
        }
     
    }
    public class nav : other
    {
        public string Name { get; set; }
        public string Server  { get; set; }
        public string domain { get; set; }
        public string Instance { get; set; }
        public string Companyname { get; set; }
        public int Port { get; set; }
        public string Username { get; set; }
        public string pass { get; set; }
        public System.Net.NetworkCredential cd { get; set; }
        public BasicHttpBinding binding()
        {

            BasicHttpBinding navWSBinding = new BasicHttpBinding();
            navWSBinding.SendTimeout = TimeSpan.FromMinutes(5);

            navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
            navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Ntlm;
            return navWSBinding;
        }
        public string baseurl()
        {
            return String.Format("http://{0}:{1}/{2}/WS/{3}/Page/", Server, Port, Instance, Companyname);
        }
        public string baseurl_codeunit()
        {
            return String.Format("http://{0}:{1}/{2}/WS/{3}/Codeunit/", Server, Port, Instance, Companyname);
        }
    }

    public class Transunion : other
    {
        public string url = string.Empty;
        public string url_username = string.Empty;
        public string url_password = string.Empty;
        public string username = string.Empty;
        public string password = string.Empty;
        public string code = string.Empty;
        public string infinityCode = string.Empty;
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
        public bool active = true;
        public string datetime { get { return String.Concat(new String[] { DateTime.Now.Year.ToString(), DateTime.Now.Month.ToString(), DateTime.Now.Day.ToString() }); } }
    }

    public class logs
    {
        public string logpath;

        public string LogFileName
        {
            get
            {
                if (!Directory.Exists(logpath))
                    Directory.CreateDirectory(logpath);
                return logpath + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() +
                       DateTime.Now.Day.ToString() + ".txt";
            }
        }

        public void LogEntryOnFile(string clientRequest)
        {
            try
            {
                File.AppendAllText(LogFileName, clientRequest + "\n");
            }
            catch (Exception ex)
            {
            }
        }

        public void ReportError(Exception ex)
        {
            // throw ex;
            try
            {
                LogEntryOnFile($"{DateTime.Now}:{ex.StackTrace}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Source}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Message}");
                if (ex.InnerException != null)
                {
                    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.Message}");
                    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.StackTrace}");
                    if (ex.InnerException.InnerException != null)
                    {
                        LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.Message}");
                        LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.StackTrace}");
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
                        LogEntryOnFile(
                            $"Entity of type {eve.Entry.Entity.GetType().Name} in state {eve.Entry.State} has the following validation errors:");
                        foreach (var ve in eve.ValidationErrors)
                        {
                            LogEntryOnFile($"- Property: {ve.PropertyName}, Error: {ve.ErrorMessage}");
                        }
                    }
                }

                LogEntryOnFile($"{DateTime.Now}:{ex.StackTrace}");
                LogEntryOnFile($"{DateTime.Now}:{ex.Source}");
            }
            catch (Exception e)
            {
            }
        }
    }

    public static class misc
    {
        public static string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return $"{tt[tt.Length - 2]}/{tt[tt.Length - 1]}";
        }

        public static string geturl(settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port,
                getpage(page));
        }  
          public static string geturl(nav ss, string page)
        {
         
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port,
                getpage(page));
        }
        public static DateTime Getdatetime(long date)
        {




            return new DateTime();
        }
    }
}

