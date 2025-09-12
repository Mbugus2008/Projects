using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web.Configuration;
using System.Configuration;
using System.Net;

namespace RestSharpWebApi.Models
{
    public class BCWebService
    {
        private readonly string _baseAddress;
        private readonly HttpClient _httpClient;
        public BCWebService()
        {
            //var server = WebConfigurationManager.AppSettings["server"];
            //var bcPort = WebConfigurationManager.AppSettings["BCPort"];
            int port = 0;
            var strport = WebConfigurationManager.AppSettings["port"].ToString();
            var server = WebConfigurationManager.AppSettings["server"].ToString();
            var company = WebConfigurationManager.AppSettings["company"].ToString();
            var instance = WebConfigurationManager.AppSettings["instance"].ToString();
            var username = WebConfigurationManager.AppSettings["username"].ToString();
            var password = WebConfigurationManager.AppSettings["password"].ToString();
            var domain = WebConfigurationManager.AppSettings["domain"].ToString();
            int.TryParse(strport, out port);
            CustomerLeads.CustomerLeads_Service otemplate = new CustomerLeads.CustomerLeads_Service();
            System.Net.NetworkCredential cd = new NetworkCredential(username, password, domain);
           // otemplate.Url = string.Format("http://{0}:{3}/{2}/WS/{1}/Page/FAQsList", server, company, instance, port);
             _baseAddress =string.Format("http://{0}:{3}/{2}/WS/{1}/Page/CustomerLeads", server, company, instance, port);
            otemplate.Credentials = cd;
            otemplate.PreAuthenticate = true;
           
            _httpClient = new HttpClient();
            _httpClient.DefaultRequestHeaders.Accept.Clear();
            _httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }

        public async Task<bool> AuthenticateAsync(string Identifier, string Email)
        {
            try
            {
                var requestUri = new Uri($"{_baseAddress}Page/CustomerLeads");

                var authenticationHeader = new AuthenticationHeaderValue("Basic", Convert.ToBase64String(System.Text.Encoding.ASCII.GetBytes($"{Identifier}:{Email}")));
                _httpClient.DefaultRequestHeaders.Authorization = authenticationHeader;

                var response = await _httpClient.GetAsync(requestUri);

                return response.IsSuccessStatusCode;
            }
            catch
            {
                return false;
            }
        }
    }
}