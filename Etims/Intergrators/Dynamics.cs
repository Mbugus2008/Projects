using Logging;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Etims.Intergrators
{
    public class Dynamics : Intergrators.integrator
    {
        private string Baseurl = "https://sandbox-etims.tenzi.africa/v1/api";
         RestClient client = new RestClient();
        public Tokens Token { get; set; }
        public string Username { get { return "sandbox@dmt.co.ke"; } }
        public string Password { get{ return "m#xjK9z%dMt"; }  }
        public Dynamics()
        {
            ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            if (Token == null || Token.IsExpired)
                Token = login();

        }
        public Tokens login()
        {
            var request = new RestRequest($"{Baseurl}/Auth/login");
            request.AddHeader("Authorization", $"Basic {crud}");
            var body = @"";
            request.AddParameter("text/plain", body, ParameterType.RequestBody);
            IRestResponse response = client.ExecuteAsPost(request, "POST");
            ApiResponse<Tokens> responseObject = JsonConvert.DeserializeObject<ApiResponse<Tokens>>(response.Content);
            return responseObject.Result;

        }
        string crud
        {
            get
            {
                string credentials = $"{Username}:{Password}";
                byte[] byteCredentials = Encoding.UTF8.GetBytes(credentials);

                // Encode the byte array to a Base64 string
                string base64Credentials = Convert.ToBase64String(byteCredentials);
                return base64Credentials;
            }
        }
        public Results<Product> product(ref Product product)
        {
         
            logs.LogEntryOnFile("Products"); Modifier<List<Product>> modifier = new Modifier<List<Product>>();
            modifier.modifierId = "Admin";
            modifier.modifierName = "Paul Njoroge";

            modifier.itemlist =new List<Product>() { product };
            var request = new RestRequest($"{Baseurl}/Product/SaveProduct");
            request.AddHeader("Authorization", $"Bearer  {Token.Token}");

            request.AddParameter("application/json", JsonConvert.SerializeObject(modifier), ParameterType.RequestBody);
            //request.AddJsonBody(JsonConvert.SerializeObject( modifier));
            IRestResponse response = client.ExecuteAsPost(request, "POST");
            logs.LogEntryOnFile(response.Content.ToString());
            ApiResponse<List<Product>> responseObject = JsonConvert.DeserializeObject<ApiResponse<List<Product>>>(response.Content);
            product.Sync = true;
         

            return new Results<Product> { Contents = product };

        }

        public Results<Sale> sales(ref Sale sale)
        {
            logs.LogEntryOnFile("Sales");
          

            sale.modifierId = "132";
            sale.modifierName = "Paul Njoroge";
           
            sale.itemList.ToList().ForEach(item => item.Quantity = (int)item.Quantity);

            var request = new RestRequest($"{Baseurl}/Sales/AddSale");
            request.AddHeader("Authorization", $"Bearer  {Token.Token}");
            request.AddParameter("application/json", JsonConvert.SerializeObject(sale), ParameterType.RequestBody);

            IRestResponse response = client.ExecuteAsPost(request, "POST");
            ApiResponse<Sale> responseObject = JsonConvert.DeserializeObject<ApiResponse<Sale>>(response.Content);
            sale.Sync = true;

            return new Results<Sale> { Contents = sale };
        }
        public Stock_in_Header stocks()
        {
            try
            {
                logs.LogEntryOnFile("Stocks");
                var request = new RestRequest($"{Baseurl}/Stock/StockIn");
                request.AddHeader("Authorization", $"Bearer  {Token.Token}");

                //var sales = entities.Stock_in_Headers.ToList();
                //foreach (var sale in sales)
                //{

                //    sale.itemlist = entities.Stock_In_Entries.Where(o => o.StoredReleasedNo == sale.StoredReleasedNo).ToArray();
                //}

                //request.AddParameter("application/json", JsonConvert.SerializeObject(sales), ParameterType.RequestBody);
                //request.AddJsonBody(JsonConvert.SerializeObject( modifier));
                IRestResponse response = client.ExecuteAsPost(request, "POST");
                ApiResponse<Stock_in_Header> responseObject = JsonConvert.DeserializeObject<ApiResponse<Stock_in_Header>>(response.Content);
                //sales.ForEach(sale => sale.Sync = true); 
           return responseObject.Result; 
          }  catch (Exception ex)
            {
                logs.ReportError(ex);
                return null;
            }
        }
    }
    public class ApiResponse<T>
    {
        public int StatusCode { get; set; }
        public bool Success { get; set; }
        public object Error { get; set; }
        public T Result { get; set; }
    }

    public class Tokens
    {
        public string Token { get; set; }
        public DateTime Expiry { get; set; }
        public string UserId { get; set; }

        public bool IsExpired { get { return Expiry < DateTime.Now; } }
    }
    public class Modifier<T>
    {
        public string modifierId { get; set; }
        public string modifierName { get; set; }
        public T itemlist { get; set; }
    }



    
}
