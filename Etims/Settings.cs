using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Serialization;

namespace Etims
{
    public class Settings
    {DbSettings dbSettings { get; set; }
        public DbSettings client { get; set; }
        public DbSettings etims { get; set; }
        public Settings load(string file)
        {

            XmlSerializer xs = new XmlSerializer(typeof(Settings));
            using (var sr = new StreamReader(file))
            {
            
                return (Settings)xs.Deserialize(sr);
            }

        }
        public string ConnectionString(Settings s)
        {
            string providerName = "System.Data.SqlClient";
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            sqlBuilder.DataSource = string.Concat(s.etims.Server, @"\", s.etims.Instance);
            sqlBuilder.InitialCatalog = s.etims.Database;
            sqlBuilder.IntegratedSecurity = s.etims.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;

            if (!s.etims.IntegratedSecurity)
            {
                sqlBuilder.UserID = s.etims.Username;
                sqlBuilder.Password = s.etims.pass;
            }


            string providerString = sqlBuilder.ToString();
            // Initialize the EntityConnectionStringBuilder.
            EntityConnectionStringBuilder entityBuilder = new EntityConnectionStringBuilder();
            //Set the provider name.
            entityBuilder.Provider = providerName;

            // Set the provider-specific connection string.
            entityBuilder.ProviderConnectionString = providerString;
            // Set the Metadata location.
            entityBuilder.Metadata = "res://*/";
            return entityBuilder.ToString();

        }
    }

    public class DbSettings
    {
        public string Database { get; set; } = string.Empty;
        public string Server { get; set; } = string.Empty;
        public bool IntegratedSecurity { get; set; } = true;
        public string Username { get; set; } = string.Empty;
        public string pass { get; set; } = string.Empty;
        public string Instance { get; set; } = string.Empty;
    }

    public static class logs {
        public static string logpath { set; get; } = string.Empty;
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
            File.AppendAllText(LogFileName, string.Format("{0}:{1}\n",DateTime.Now, clientRequest ));
        }
        catch (Exception ex)
        {
        }
        }
        public static void ReportError(Exception ex)
        {
            // throw ex;
            try
            {

                LogEntryOnFile($"{ex.StackTrace}");
                LogEntryOnFile($"{ex.Source}");
                LogEntryOnFile($"{ex.Message}");
                if (ex.InnerException != null)
                {
                    LogEntryOnFile($"{ex.InnerException.Message}");
                    LogEntryOnFile($"{ex.InnerException.StackTrace}");
                    if (ex.InnerException.InnerException != null)
                    {
                        LogEntryOnFile($"{ex.InnerException.InnerException.Message}");
                        LogEntryOnFile($"{ex.InnerException.InnerException.StackTrace}");
                    }

                    //if (ex.InnerException.InnerException.InnerException != null)
                    //{
                    //    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.InnerException.Message}");
                    //    LogEntryOnFile($"{DateTime.Now}:{ex.InnerException.InnerException.InnerException.StackTrace}");
                    //}
                }

                LogEntryOnFile($"{ex.StackTrace}");
                LogEntryOnFile($"{ex.Source}");
            }
           

            catch (Exception e)
            {
            }

        }

    }

}
