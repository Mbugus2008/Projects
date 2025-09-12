using Etims.Intergrators;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.EntityClient;
using System.Data.Objects.DataClasses;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading;

namespace Etims
{
    public class EtimsService
    {Intergrators.integrator integrator;
        public bool Stopservice { get; set; } = false;
        RestClient client = new RestClient();
        private EtimsEntities entities = new EtimsEntities();
        private DbSettings Settings { get; set; }
    
        public string Baseurl { get => "https://sandbox-etims.tenzi.africa/v1/api"; }
       
        public EtimsService(DbSettings connstring)
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            this.Settings = connstring;
            entities = new EtimsEntities(ConnectionString);
            integrator = new AdvTech();
        }
        public void start()
        {

            while (true)
            {
                try
                {
                    if (!Stopservice) saveProduct();
                    if (!Stopservice) Sales();
                    
                }
                catch (Exception ex)
                {

                    logs.ReportError(ex);
                }
                Thread.Sleep(20000);
            }
        }
        public string ConnectionString
        {
            get
            {
                string providerName = "System.Data.SqlClient";
                SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
                sqlBuilder.DataSource = string.Concat(Settings.Server, @"\", Settings.Instance);
                sqlBuilder.InitialCatalog = Settings.Database;
                sqlBuilder.IntegratedSecurity = Settings.IntegratedSecurity;
                sqlBuilder.MultipleActiveResultSets = true;

                if (!Settings.IntegratedSecurity)
                {
                    sqlBuilder.UserID = Settings.Username;
                    sqlBuilder.Password = Settings.pass;
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

     
      

        public void saveProduct()
        {
            try
            {
                var itemlist = entities.Products.Where(o => o.Sync == false || o.Sync == null).ToList();
                for (int i = 0; i < itemlist.Count; i++)
                {
                    var item = itemlist[i];
                    integrator.product(sale: ref item);
                    itemlist[i] = item;
                }
                entities.SaveChanges();

                
            }
            catch (Exception ex)
            {
                logs.ReportError(ex);
                //return null;
            }
        }
        public void Sales()
        {
            try

            {
                var itemlist = entities.Sales.Where(o => o.Sync == false || o.Sync == null).ToList();
                for (int i = 0; i < itemlist.Count; i++)
                {
                    var item = itemlist[i];
                    item.itemList =  entities.Sale_Items.Where(o => o.InvoiceNumber == item.invoiceNumber).ToArray();
                    integrator.sales(sale: ref item);
                    itemlist[i] = item;
                }
                entities.SaveChanges();
            }
            catch (Exception ex)
            {
                logs.ReportError(ex);
                //    return null;
            }
        }
        
    }
    public partial class Sale
    {
        public Sale_Item[] itemList { get; set; }

    }
    public partial class Stock_in_Header
    {
        public Stock_In_Entry[] itemlist { get; set; }

    }
    public partial class EtimsEntities : DbContext
    {
        public EtimsEntities(string Connectionstring)
            : base(Connectionstring)
        {
        }
    }

}