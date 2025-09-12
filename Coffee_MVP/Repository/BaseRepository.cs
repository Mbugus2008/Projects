using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore.Design;
using System;
using System.Collections.Generic;
using System.Data.EntityClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Coffee_MVP.Repository
{
    public abstract class BaseRepository
    {
        
        protected  string ConnectionString()
        {
            // Specify the provider name, server and database.
            string providerName = "System.Data.SqlClient";
            string serverName = ".\\";
            //string databaseName = client.Db;
            // Initialize the connection string builder for the
            // underlying provider.
            SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
            // Set the properties for the data source.
            sqlBuilder.DataSource = serverName;// string.Concat(settings.s.Serverip, @"\", settings.s.Instance);
            sqlBuilder.InitialCatalog = "Autoweigh";// settings.s.database;
            sqlBuilder.IntegratedSecurity = true;// settings.s.IntegratedSecurity;
            sqlBuilder.MultipleActiveResultSets = true;

            //if (client.IntegratedSecurity == false)
            //{
            //    sqlBuilder.UserID = settings.s.Username;
            //    sqlBuilder.Password = settings.s.pass;
            //}

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
}
