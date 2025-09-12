
using EtimsWorker.Models;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;

using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;

namespace EtimsWorker
{
    public class EtimsService
    {
        private readonly ILogger<Worker> _logger;
        public bool Stopservice { get; set; } = false;
        RestClient client = new RestClient();
        private EtimsContext entities = new EtimsContext();
        public Tokens Token { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Baseurl { get => "https://sandbox-etims.tenzi.africa/v1/api"; }

        public EtimsService(ILogger<Worker> logger)
        {
            this._logger = logger;
            entities = new EtimsContext();

        }
        public void start()
        {

            Username = "sandbox@dmt.co.ke";
            Password = "m#xjK9z%dMt";

            while (true)
            {
                try
                {


                    if (Token == null || Token.IsExpired)
                        Token = login();

                    if (!Stopservice) saveProduct();
                    if (!Stopservice) Sales();
                    if (!Stopservice) stocks();
                }
                catch (Exception ex)
                {

                    _logger.LogError(0, ex, "");
                }
                Thread.Sleep(1000);
            }
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
        public Tokens login()
        {

            var request = new RestRequest($"{Baseurl}/Auth/login", Method.Post);
            request.AddHeader("Authorization", $"Basic {crud}");
            var body = @"";
            request.AddParameter("text/plain", body, ParameterType.RequestBody);
            RestResponse response = client.ExecutePost(request);
            ApiResponse<Tokens> responseObject = JsonConvert.DeserializeObject<ApiResponse<Tokens>>(response.Content);

            return responseObject.Result;

        }

        public List<Product> saveProduct()
        {
            try
            {


                _logger.LogInformation("Products");
                Modifier<List<Product>> modifier = new Modifier<List<Product>>();
                modifier.modifierId = "Admin";
                modifier.modifierName = "Paul Njoroge";
                var itemlist = entities.Products.Where(o => o.Sync == false).ToList();
                modifier.itemlist = itemlist;


                var request = new RestRequest($"{Baseurl}/Product/SaveProduct", Method.Post);
                request.AddHeader("Authorization", $"Bearer  {Token.Token}");



                request.AddParameter("application/json", JsonConvert.SerializeObject(modifier), ParameterType.RequestBody);
                //request.AddJsonBody(JsonConvert.SerializeObject( modifier));
                RestResponse response = client.ExecutePost(request);
                _logger.LogInformation(response.Content.ToString());
                ApiResponse<List<Product>> responseObject = JsonConvert.DeserializeObject<ApiResponse<List<Product>>>(response.Content);
                itemlist.ForEach(item => item.Sync = true);
                entities.SaveChanges();
                return responseObject.Result.ToList();
            }
            catch (Exception ex)
            {
                _logger.LogError(0, ex, "");
                return null;
            }
        }
        public void Sales()
        {
            try
            {
                _logger.LogInformation("Sales");
                var request = new RestRequest($"{Baseurl}/Sales/AddSale", Method.Post);


                var sales = entities.Sales.Where(o => o.Sync == false || o.Sync == null).ToList();
                foreach (var sale in sales)
                {
                    try
                    {
                        sale.ModifierId = "132";
                        sale.ModifierName = "Paul Njoroge";
                        sale.itemList = entities.SaleItems.Where(o => o.InvoiceNumber == sale.InvoiceNumber).ToArray();
                        sale.itemList.ToList().ForEach(item => item.Quantity = (int)item.Quantity);

                        request = new RestRequest($"{Baseurl}/Sales/AddSale", Method.Post);
                        request.AddHeader("Authorization", $"Bearer  {Token.Token}");
                        request.AddParameter("application/json", JsonConvert.SerializeObject(sale), ParameterType.RequestBody);

                        RestResponse response = client.ExecutePost(request);
                        ApiResponse<Sale>? responseObject = JsonConvert.DeserializeObject<ApiResponse<Sale>>(response.Content);
                        sale.Sync = true;
                        //sales.ForEach(sale => sale.Sync = true);
                        entities.SaveChanges();
                    }
                    catch (Exception ex) { _logger.LogError(0, ex, ""); }
                }



            }
            catch (Exception ex)
            {
                _logger.LogError(0, ex, "");
                //    return null;
            }
        }
        public StockInHeader stocks()
        {
            try
            {
                _logger.LogInformation("Stocks");
                var request = new RestRequest($"{Baseurl}/Stock/StockIn", Method.Post);
                request.AddHeader("Authorization", $"Bearer  {Token.Token}");

                var sales = entities.StockInHeaders.ToList();
                foreach (var sale in sales)
                {

                    sale.itemlist = entities.StockInEntries.Where(o => o.StoredReleasedNo == sale.StoredReleasedNo).ToArray();
                }

                request.AddParameter("application/json", JsonConvert.SerializeObject(sales), ParameterType.RequestBody);
                //request.AddJsonBody(JsonConvert.SerializeObject( modifier));
                RestResponse response = client.ExecutePost(request);
                ApiResponse<StockInHeader>? responseObject = JsonConvert.DeserializeObject<ApiResponse<StockInHeader>>(response.Content);
                sales.ForEach(sale => sale.Sync = true); return responseObject.Result;
            }
            catch (Exception ex)
            {
                _logger.LogError(0, ex, "");
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
        public string? modifierId { get; set; }
        public string? modifierName { get; set; }
        public T? itemlist { get; set; }
    }



    namespace Models { public partial class StockInHeader
        {
            public StockInEntry[]? itemlist { get; set; }
        } public partial class Sale
        {
            public SaleItem[]? itemList { get; set; }

        }
    }


}