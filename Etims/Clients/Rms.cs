using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace Etims.Clients
{
    public class Rms : Clients
    {

        
        public string trigger { get => ""; }
        public DbSettings dbSettings { get; set; }

        string Clients.connectionString => throw new NotImplementedException();

        public bool connect()
        {
            try
            {
 SqlConnection connection =  new SqlConnection(connectionString());
            connection.Open();
                return true;
            }
            catch (Exception ex)
            {

                logs.LogEntryOnFile(ex.Message);
                return false;
            }
           
        }

        public string connectionString()
        {
            var s = dbSettings;
            if (s.IntegratedSecurity)
                return string.Format("Data Source={0}\\{1};Initial Catalog={2};Integrated Security={3}", s.Server, s.Instance, s.Database, s.IntegratedSecurity);
            else
                return  string.Format("Data Source={0}\\{1};Initial Catalog={2};Integrated Security={3};User id={4};Password={5}", s.Server, s.Instance, s.Database, s.IntegratedSecurity, s.Username, s.pass);
         
        }

        public bool create_trigger()
        {
            using (SqlConnection connection =
               new SqlConnection(connectionString()))
            {
                SqlCommand command = new SqlCommand(trigger, connection);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Dispose();
                    connection.Close();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
                // Console.ReadLine();
            }
        }
    }
}
