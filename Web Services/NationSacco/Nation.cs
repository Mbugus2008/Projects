using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel ;
using System.Text;
using System.Threading.Tasks;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text.Json;
using MemberLoans;
using System.Diagnostics.Eventing.Reader;
using System.Text.Json.Serialization;
namespace NationSacco
{
    public class Nation
    {
        private readonly ILogger<Worker> _logger;
        private IConfiguration _configuration;
        MemberLoans.Loans_PortClient loans;
        Memberapp.Member_Application_PortClient Member_Application;
        Polaris.PolarisIntegration_PortClient polaris;
        MobileTransactions.Transactions_PortClient transactions;
        Nav? ss;

        private readonly ApiService _apiService;

        public Nation(ApiService apiService,ILogger<Worker> logger)
        {
            _logger = logger;
            _apiService = apiService;
            _configuration = new ConfigurationBuilder()
         .SetBasePath(AppContext.BaseDirectory)
         .AddJsonFile("appsettings.json")
         .Build();
            ss = setting(_configuration);
            loans = InitializeClient<MemberLoans.Loans>();
            Member_Application = InitializeClient<Memberapp.Member_Application>();
            transactions = InitializeClient<MobileTransactions.Transactions>();
            polaris = new Polaris.PolarisIntegration_PortClient( binding(), new EndpointAddress(basecodeuniturl() + "PolarisIntegration"));
            polaris.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            polaris.ClientCredentials.Windows.ClientCredential.UserName =ss.Username ;
            polaris.ClientCredentials.Windows.ClientCredential.Password = ss.pass;

        }
        public dynamic InitializeClient<T>()
        {
            string? Namespace = typeof(T).Namespace;
            string Class_Name = typeof(T).Name;

            var clientType = Type.GetType($"{Namespace}.{Class_Name}_PortClient");

            var address = new EndpointAddress(baseurl() + Class_Name);
            dynamic? client = Activator.CreateInstance(clientType, binding(), address);
            client.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            client.ClientCredentials.Windows.ClientCredential.UserName = ss.Username;
            client.ClientCredentials.Windows.ClientCredential.Password = ss.pass;
            return client;

        }
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
            return String.Format("http://{0}:{1}/{2}/WS/{3}/Page/", ss.Server, ss.Port, ss.Instance, ss.Companyname);
        }
        public string basecodeuniturl()
        {
            return String.Format("http://{0}:{1}/{2}/WS/{3}/Codeunit/", ss.Server, ss.Port, ss.Instance, ss.Companyname);
        }
        public Nav setting(IConfiguration configuration)
        {

            Nav nav = new Nav();
            nav.Server = configuration.GetValue<string>("Nav:Server");
            nav.Username = configuration.GetValue<string>("Nav:Username");
            nav.pass = configuration.GetValue<string>("Nav:Password");
            nav.Companyname = configuration.GetValue<string>("Nav:Company");
            nav.Instance = configuration.GetValue<string>("Nav:Instance");
            nav.Port = configuration.GetValue<int>("Nav:Port");

            return nav;
        }

        public async Task Post()
        {
            try {
                polaris.Post();
            
            }
            
            catch (Exception ex) {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
            }
        
        }
        public async Task loancallbacksAsync()
        {
            try
            {
                var ls = loans.ReadMultiple(new MemberLoans.Loans_Filter[] { new MemberLoans.Loans_Filter { Criteria = "<>Application", Field = MemberLoans.Loans_Fields.Loan_Status }, new MemberLoans.Loans_Filter { Criteria = ss.Username, Field = MemberLoans.Loans_Fields.Captured_By }, new MemberLoans.Loans_Filter { Criteria = "No", Field = MemberLoans.Loans_Fields.Call_Back_updated } }, null, 20);
                _logger.LogInformation($"{ls.Length} Loans");
                foreach (var ln in ls)
                { MemberLoans.Loans l = ln;
                    if (!string.IsNullOrEmpty(ln.Call_Back_Url))
                    {                      

                        loan_callback callback = new loan_callback();
                        callback.loan_no = l.Loan_No;
                        callback.Loan_Status = l.Loan_Status;
                        callback.remarks = l.Remarks;
                        _logger.LogInformation(String.Format("Loan No {0}{1}: Sending", ln.Loan_No,ln.Loan_Status));
                        var (statusCode, response) = await _apiService.PostDataAsync(l.Call_Back_Url, callback);

                        _logger.LogInformation(statusCode,response);
                        if (statusCode == 200)
                        {
                            l.Call_Back_updated = true;
                            l.Call_Back_updatedSpecified = true;
                            loans.Update(ref l);
                        }
                        else
                        {
                            _logger.LogError(response);
                            l.Call_Back_updated = true;
                            l.Call_Back_updatedSpecified = true;
                            loans.Update(ref l);
                        }
                    }
               else
                {
                        _logger.LogInformation(String.Format("Loan No {0}: Call Back url Missing",ln.Loan_No));

                }
                }
                
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
            }
        } 
        public async Task mobilecallbacksAsync()
        {
            try
            {
                var ls = transactions.ReadMultiple(new MobileTransactions.Transactions_Filter[] {  new MobileTransactions.Transactions_Filter { Criteria = "No", Field =  MobileTransactions.Transactions_Fields.Call_Back_updated }, new MobileTransactions.Transactions_Filter { Criteria = "<>''", Field =  MobileTransactions.Transactions_Fields.Call_Back_Url }}, null, 20);
                _logger.LogInformation($"{ls.Length} Transactions");
                foreach (var ln in ls)
                { MobileTransactions.Transactions l = ln;
                    if (!string.IsNullOrEmpty(ln.Call_Back_Url))
                    {

                        mobile_callback callback = new mobile_callback();
                        callback.document_no = l.Document_No;
                        callback.Status = l.Status;
                        callback.remarks = l.Comments;
                        _logger.LogInformation(String.Format("Document No {0}-{1}: Sending", ln.Document_No,ln.Status.ToString()));
                        var (statusCode, response) = await _apiService.PostDataAsync(l.Call_Back_Url, callback);

                        _logger.LogInformation(statusCode,response);
                        if (statusCode == 200)
                        {
                            l.Call_Back_updated = true;
                            l.Call_Back_updatedSpecified = true;
                            transactions.Update(ref l);
                        }
                        else
                        {
                            _logger.LogError(response);
                            l.Call_Back_updated = true;
                            l.Call_Back_updatedSpecified = true;
                            transactions.Update(ref l);
                        }
                    }
               else
                {
                        _logger.LogInformation(String.Format("Transaction {0}: Call Back url Missing",ln.Document_No));

                }
                }
                
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
            }
        }
        public async Task applicationcallbacksAsync()
        {
            try
            {
                var ma = Member_Application.ReadMultiple([
                    new  Memberapp.Member_Application_Filter { Criteria = "<>Open", Field = Memberapp.Member_Application_Fields.Status }, 
                    new  Memberapp.Member_Application_Filter { Criteria = ss.Username, Field = Memberapp.Member_Application_Fields.Created_By }, 
                    new  Memberapp.Member_Application_Filter { Criteria = "No", Field = Memberapp.Member_Application_Fields.Call_Back_updated } 
                
                ], null, 10);
                _logger.LogInformation($"{ma.Length} Changed applications");
                foreach (var ln in ma)
                { 
                    Memberapp.Member_Application l = ln;
                    if (!string.IsNullOrEmpty(ln.Call_Back_Url)) { 
                    Application_callback callback = new ();
                    callback.MemberNO = l.No;
                    callback.Status = l.Status;
                    callback.remarks = "";
                        _logger.LogInformation(String.Format("Application No {0}-{1}: Sending", ln.No, ln.Status.ToString()));

                        var (statusCode, response) = await _apiService.PostDataAsync(l.Call_Back_Url, callback);
                        _logger.LogInformation(statusCode, response);
                        if (statusCode == 200)
                    {
                        l.Call_Back_updated = true;
                        l.Call_Back_updatedSpecified = true;
                        Member_Application.Update(ref l);
                    }
                    else
                    {
                        _logger.LogError(response);
                            l.Call_Back_updated = true;
                            l.Call_Back_updatedSpecified = true;
                            Member_Application.Update(ref l);
                        }
                }
                    else
                    {
                        _logger.LogInformation(String.Format("Application No {0}: Call Back url Missing", ln.No));
                        l.Call_Back_updated = true;
                        l.Call_Back_updatedSpecified = true;
                        Member_Application.Update(ref l);
                    }

                }
            }
            catch (Exception ex)
            {
                _logger.LogError(ex.Message);
                _logger.LogTrace(ex.StackTrace);
            }
        }
    }
    public class loan_callback
    {
        public string loan_no { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))]
        public MemberLoans.Loan_Status Loan_Status { get; set; }
        public string remarks { get; set; }

    } 
    public class mobile_callback
    {
        public string document_no { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))]
        public MobileTransactions.Status Status { get; set; }
        public string remarks { get; set; }

    }
    public class Application_callback
    {
        public string MemberNO { get; set; }
        [JsonConverter(typeof(JsonStringEnumConverter))]
        public Memberapp.Status Status { get; set; }
        public string remarks { get; set; }

    }
    public class Nav
    {
        public string? Name { get; set; }
        public string? Server { get; set; }
        public string? domain { get; set; }
        public string? Instance { get; set; }
        public string? Companyname { get; set; }
        public int Port { get; set; }
        public string? Username { get; set; }
        public string? pass { get; set; }
        public System.Net.NetworkCredential cd { get; set; }

    }


    public class ApiService
    {
        private readonly HttpClient _httpClient;

        public ApiService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<string> GetDataAsync(string url)
        {
            return await _httpClient.GetStringAsync(url);
        }
        public async Task<(int StatusCode, string ResponseContent)> PostDataAsync(string url,object data)
        {
            try
            {
                string json = JsonSerializer.Serialize(data);
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                HttpResponseMessage response = await _httpClient.PostAsync(url, content);
                string responseContent = await response.Content.ReadAsStringAsync();

                return ((int)response.StatusCode, responseContent);
            }
            catch (Exception ex)
            {
                return (0, $"Error: {ex.Message}");
            }
        }
    }

}
