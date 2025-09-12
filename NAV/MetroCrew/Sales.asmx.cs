using Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace NavWrapper
{
    /// <summary>
    /// Summary description for Sales
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class Sales : System.Web.Services.WebService
    {
        private string Response = string.Empty;

        JsonSerializerSettings dateformat = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd HH:mm:ss" };

        settings s = new settings();

        private NAV.NAV sales = new NAV.NAV(new Uri("http://paulo:213/Bandari/OData/Company('BANDARI')"));

        public Sales() {
            string path = Server.MapPath("~/sales.xml");
            s = s.loadsettings(path);
            var ss = s.navsettings;
            System.Net.NetworkCredential cd = new System.Net.NetworkCredential("HP", "Rahabgathoni2", "");
            sales.Credentials = cd;
        }

        private void SafeExecutor(Action action)
        {
            SafeExecutor(() => { action(); return 0; });
        }

        private T SafeExecutor<T>(Func<T> action)
        {
            try
            {
                return action();
            }

            catch (Exception ex)
            {
                Response = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            finally
            {
                Context.Response.Output.Write(Response);
            }

            return default(T);
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void items()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(sales.Item_Card.ToList(), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Sales_header(String data)
        {
            SafeExecutor(() =>
            {

                NAV.Sales_Invoice sale  = JsonConvert.DeserializeObject<NAV.Sales_Invoice>(data, dateformat);
                var s = sales.Sales_Invoice.Where(o => o.No == sale.No).ToList();
                if (s.Count() == 0)
                    sales.AddToSales_Invoice(sale);
                else
                    sales.UpdateObject(sale);
                sales.SaveChanges();

                Response = JsonConvert.SerializeObject(sale, dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Sales_line(String data)
        {
            SafeExecutor(() =>
            {

                NAV.Sales_InvoiceSalesLines sale  = JsonConvert.DeserializeObject<NAV.Sales_InvoiceSalesLines>(data, dateformat);
                var s = sales.Sales_Invoice.Where(o => o.No == sale.No).ToList();
                if (s.Count() == 0)
                    sales.AddToSales_InvoiceSalesLines(sale);
                else
                    sales.UpdateObject(sale);

                sales.SaveChanges();
                Response = JsonConvert.SerializeObject(sale, dateformat);
            });
        }
    }
}
