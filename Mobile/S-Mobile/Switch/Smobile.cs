using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Entity.Core.EntityClient;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.ServiceProcess;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Serialization;

namespace S_Mobile
{
    public partial class Smobile : ServiceBase
    {
        private settings ss = new settings();
        private S_Mobile_Data.MobileEntities _dbContext;
        public Smobile()
        {
            string path = Path.GetDirectoryName(System.Reflection.Assembly.GetEntryAssembly().Location) + "\\Settings.config";
            ss = ss.loadsettings(path);

            _dbContext = new S_Mobile_Data.MobileEntities(ConnectionString(ss));

            InitializeComponent();
        }
        public void test()
        { new init(_dbContext).Start(); }
        protected override void OnStart(string[] args)
        {



            new init(_dbContext).Start();

        }

        protected override void OnStop()
        {
            _dbContext.Dispose();
            init.close = true;
        }
        public static string ConnectionString(settings s)
        {
            // Specify the provider name, server and database.
            string providerName = "System.Data.SqlClient";
            //string serverName = "Server\\sql2008";
            //string databaseName = client.Db;
            // Initialize the connection string builder for the
            // underlying provider.
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            // Set the properties for the data source.
            sqlBuilder.DataSource = string.Concat(s.Serverip, @"\", s.Instance);
            sqlBuilder.InitialCatalog = s.database;
            sqlBuilder.IntegratedSecurity = s.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;

            if (!s.IntegratedSecurity)
            {
                sqlBuilder.UserID = s.Username;
                sqlBuilder.Password = s.pass;
            }

            // Build the SqlConnection connection string.
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
    public class settings
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
        public int PostIntervalinsec { get; set; } = 2;
        public int Reconnectintervalinsec { get; set; } = 10;
        public string logpath { get; set; } = string.Empty;

        public settings loadsettings(string file)
        {
            settings ss = new settings();
            try
            {

                XmlSerializer xs = new XmlSerializer(typeof(settings));
                using (var sr = new StreamReader(file))
                {
                    ss = (settings)xs.Deserialize(sr);
                    Logging.Logging.logpath = ss.logpath;
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.logpath = @"C:\Logs\";
                Logging.Logging.ReportError(ex);
                throw;
            }


            return ss;
        }
    }
}
