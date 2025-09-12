
using RestSharpWebApi.Branches;
using RestSharpWebApi.DetailedCustomerLedgerEntries;
using RestSharpWebApi.Loginhistory;
using RestSharpWebApi.MemberStatistics;
using RestSharpWebApi.Models;
using RestSharpWebApi.Properties;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Data.EntityClient;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;

namespace RestSharpWebApi
{
    namespace Models
    {
        
        public class Setting
        {

            public int port { get; set; }

            public string server { get; set; }
            public string company { get; set; }
            public string instance { get; set; }
            public string username { get; set; }
            public string password { get; set; }
            public string domain { get; set; }
            public string logpath { get; set; }
            public System.Net.NetworkCredential cd { get; set; }

            public string Hela_server { get; set; }
            public string Hela_instance { get; set; }
            public string Hela_db { get; set; }
            public string Hela_username { get; set; }
            public string Hela_pass { get; set; }


            public Setting()
            {

                var strport = ConfigurationManager.AppSettings["port"].ToString();
                server = ConfigurationManager.AppSettings["server"].ToString();
                company = ConfigurationManager.AppSettings["company"].ToString();
                instance = ConfigurationManager.AppSettings["instance"].ToString();
                username = ConfigurationManager.AppSettings["username"].ToString();
                password = ConfigurationManager.AppSettings["password"].ToString();
                domain = ConfigurationManager.AppSettings["domain"].ToString();
                logpath = ConfigurationManager.AppSettings["logpath"].ToString();


                Hela_server = ConfigurationManager.AppSettings["Hela_server"].ToString();
                Hela_instance = ConfigurationManager.AppSettings["Hela_instance"].ToString();
                Hela_db = ConfigurationManager.AppSettings["Hela_db"].ToString();
                Hela_username = ConfigurationManager.AppSettings["Hela_username"].ToString();
                Hela_pass = ConfigurationManager.AppSettings["Hela_pass"].ToString();


                int ports;
                int.TryParse(strport, out ports);
                port = ports;
                cd = new NetworkCredential(username, password, domain);

            }

            private string getpage(string url)
            {
                string t = string.Empty;
                var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
                return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
            }
            public string geturl(string page)
            {

                return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", server, company, instance, port, getpage(page));
            }
            public string ConnectionString
            {
                get
                {
                    {

                        // Specify the provider name, server and database.
                        string providerName = "System.Data.SqlClient";
                        //string serverName = "Server\\sql2008";
                        //string databaseName = client.Db;
                        // Initialize the connection string builder for the
                        // underlying provider.
                        SqlConnectionStringBuilder sqlBuilder = new SqlConnectionStringBuilder();
                        // Set the properties for the data source.
                        sqlBuilder.DataSource = string.Concat(Hela_server, @"\", Hela_instance);
                        sqlBuilder.InitialCatalog = Hela_db;
                        sqlBuilder.IntegratedSecurity = false;
                        sqlBuilder.MultipleActiveResultSets = true;


                        sqlBuilder.UserID = Hela_username;
                        sqlBuilder.Password = Hela_pass;


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

            //static


            private readonly string PasswordHash = "P@@Sw0rd";
            private readonly string SaltKey = "S@LT&KEY";
            private readonly string VIKey = "@1B2c3D4e5F6g7H8";

            public string Encrypt(string plainText)
            {
                byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

                byte[] keyBytes = new Rfc2898DeriveBytes(PasswordHash, Encoding.ASCII.GetBytes(SaltKey)).GetBytes(256 / 8);
                var symmetricKey = new RijndaelManaged() { Mode = CipherMode.CBC, Padding = PaddingMode.Zeros };
                var encryptor = symmetricKey.CreateEncryptor(keyBytes, Encoding.ASCII.GetBytes(VIKey));

                byte[] cipherTextBytes;

                using (var memoryStream = new MemoryStream())
                {
                    using (var cryptoStream = new CryptoStream(memoryStream, encryptor, CryptoStreamMode.Write))
                    {
                        cryptoStream.Write(plainTextBytes, 0, plainTextBytes.Length);
                        cryptoStream.FlushFinalBlock();
                        cipherTextBytes = memoryStream.ToArray();
                        cryptoStream.Close();
                    }
                    memoryStream.Close();
                }
                return Convert.ToBase64String(cipherTextBytes);
            }


            public List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries> withrunningbal(List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries> inlist)
            {
                double balance = 0;
                foreach (var DetailedCustomerLedgerEntries in inlist.OrderBy(o => o.Entry_No))
                {
                    balance += (double)DetailedCustomerLedgerEntries.Absolute_Amount;
                    DetailedCustomerLedgerEntries.Balance = balance;

                }
                return inlist;

            }

        }

    }
    namespace Models
    {
        public partial class HelaEntities : DbContext
        {
            public HelaEntities(string Connectionstring)
                : base(Connectionstring)
            {
            }
        }
    }
    namespace Models
    {


        public partial class Mobile_Login
        {
            public string Otp_entered { get; set; }
            public string Profile_Picture { get; set; }
        }
    }
    namespace LoanListMobile
    {
        public partial class LoanListMobile
        {
            public LoanProductTypesList.LoanProductTypesList Product_type_detail
            {
                get
                {
                    LoanProductTypesList.LoanProductTypesList ll=  new LoanProductTypesList.LoanProductTypesList_Service(new Setting()).Read(Loan_Product_Type);
                    return ll; 
                }
            }
            public string LoanProductType { get; set; }
        }
    }
    namespace MemberStatistics
    {
        public partial class MemberStatistics_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            /// <remarks/>
            public MemberStatistics_Service(Setting s)
            {

                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_MemberStatistics_MemberStatistics_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
        public partial class MemberStatistics
        {


            // public List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries> repayment_account_entries {
            //get {
            //         Setting s = new Setting();
            //         return s.withrunningbal( new DetailedCustomerLedgerEntries_Service(s).ReadMultiple(new DetailedCustomerLedgerEntries_Filter[] {new DetailedCustomerLedgerEntries_Filter { Criteria = No, Field = DetailedCustomerLedgerEntries_Fields.Customer_No},  new DetailedCustomerLedgerEntries_Filter { Criteria = "Repayment_Account", Field = DetailedCustomerLedgerEntries_Fields.Transaction_Type }, }, null, 0).ToList()); 
            // }
            //}


        }
    }
    namespace LoanProductTypesList
    {

        public partial class LoanProductTypesList_Service
        {

            public LoanProductTypesList_Service(Setting s)
            {

                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_LoanProductTypesList_LoanProductTypesList_Service);

                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }

        }
        public partial class LoanProductTypesList
        {
            public string Frequency { get { return Repayment_Frequency.ToString(); } }
            public string Repayment_Method { get { return Interest_Calculation_Method.ToString(); } }

        }


    }
    namespace CustomerCard
    {
        public partial class CustomerCard_Service
        {


            public CustomerCard_Service(Setting s)
            {

                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_CustomerCard_CustomerCard_Service);

                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }

        }
      /*  public partial class CustomerCard
        {
            public Mobile_Login login { get; set; }

            public MemberStatistics.MemberStatistics Statistics
            {
                get
                {
                    Setting s = new Setting();
                    decimal totalarreas = 0.0m;
                    decimal totalpayoff = 0.0m;
                    decimal Net_Pay_off = 0.0m;
                    
                    return new MemberStatistics_Service(s).ReadMultiple(Net_Pay_off, new MemberStatistics_Filter[] {new MemberStatistics_Filter { Criteria =No,Field = MemberStatistics_Fields.No} },null,0).FirstOrDefault();
                }
            }*/
            public partial class CustomerCard
            {
                public Mobile_Login login { get; set; }

                public MemberStatistics.MemberStatistics Statistics
                {
                    get
                    {
                        Setting s = new Setting();
                        decimal totalarreas = 0.0m;
                        decimal totalpayoff = 0.0m;
                        decimal Net_Pay_off = 0.0m;

                        MemberStatistics_Filter filter = new MemberStatistics_Filter
                        {
                            Criteria = No,
                            Field = MemberStatistics_Fields.No
                        };

                        return new MemberStatistics_Service(s).ReadMultiple(0, 0, new MemberStatistics_Filter[] { filter }, null, 1).FirstOrDefault();
                    }
                }
            

            public Login_History[] loginhistory
            {
                get
                {
                    Setting s = new Setting();
                    return new HelaEntities(s.ConnectionString).Login_Histories.Where(o => o.Customer_No == Identification_Doc_No).ToArray();
                }
            }
        }
    }
    namespace SBCSERVICE
    {

        public partial class SBCSERVICE : System.Web.Services.Protocols.SoapHttpClientProtocol
        {            /// <remarks/>
            public SBCSERVICE(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_SBCSERVICE_SBCSERVICE);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace Hela
    {

        public partial class Hela : System.Web.Services.Protocols.SoapHttpClientProtocol
        {            /// <remarks/>
            public Hela(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Hela_Hela);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }


    namespace LoanGuarantors
    {

        public partial class LoanGuarantors_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public LoanGuarantors_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_LoanGuarantors_LoanGuarantors_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }

    }
    namespace Loantopup
    {
        public partial class Loantopup_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public Loantopup_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Loantopup_Loantopup_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace CustomerApplicationCard
    {
        public partial class CustomerApplicationCard_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public CustomerApplicationCard_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_CustomerApplicationCard_CustomerApplicationCard_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace MemberApplicationList
    {
        public partial class MemberApplicationList_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public MemberApplicationList_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_MemberApplicationList_MemberApplicationList_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace DetailedCustomerLedgerEntries
    {
        public partial class DetailedCustomerLedgerEntries_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public DetailedCustomerLedgerEntries_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_DetailedCustomerLedgerEntries_DetailedCustomerLedgerEntries_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }


        }
        public partial class DetailedCustomerLedgerEntries
        {

            public double Balance { get; set; }
            public decimal Absolute_Amount { get { return Amount_LCY; } }
            public string Description_2 { get { return string.Format("{0} {1}", Description, Transaction_Type.ToString()); } }
            public string Trans_Type { get { return Transaction_Type.ToString().Replace("_", " "); } }

        }
    }
    namespace CompanyInformation
    {
        public partial class CompanyInformation_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public CompanyInformation_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_CompanyInformation_CompanyInformation_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
        public partial class CompanyInformation
        {
            public Branches.Branches[] Branches
            {
                get
                {
                    Setting s = new Setting();
                    return new Branches_Service(s).ReadMultiple(null, null, 0);

                }
            }


        }
    }
    namespace Branches
    {
        public partial class Branches_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {
            public Branches_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Branches_Branches_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace FAQs
    {
        public partial class FAQs_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public FAQs_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_FAQs_FAQs_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace Feeback
    {
        public partial class Feeback_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public Feeback_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Feeback_Feeback_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace SecurityQuestions
    {
        public partial class SecurityQuestions_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public SecurityQuestions_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_SecurityQuestions_SecurityQuestions_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace MobilitySetup
    {
        public partial class MobilitySetup_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public MobilitySetup_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_MobilitySetup_MobilitySetup_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace PDChequesHold
    {
        public partial class PDChequesHold_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public PDChequesHold_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_PDChequesHold_PDChequesHold_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace ProfileServiceRequest
    {
        public partial class ProfileServiceRequest_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public ProfileServiceRequest_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_ProfileServiceRequest_ProfileServiceRequest_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace CustomerRequest
    {
        public partial class CustomerRequest_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public CustomerRequest_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_CustomerRequest_CustomerRequest_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace SpringTV
    {
        public partial class SpringTV_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public SpringTV_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_SpringTV_SpringTV_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace RatingCard
    {
        public partial class RatingCard_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public RatingCard_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_RatingCard_RatingCard_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace CustomerRating
    {
        public partial class CustomerRating_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public CustomerRating_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_CustomerRating_CustomerRating_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace RateUs
    {
        public partial class RateUs_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public RateUs_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_RateUs_Rateus_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }

    namespace LoanListMobile
    {
        public partial class LoanListMobile_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public LoanListMobile_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_LoanListMobile_LoanListMobile_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }

    namespace MobileLoanRequests
    {
        public partial class MobileLoanRequests_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public MobileLoanRequests_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_MobileLoanRequests_MobileLoanRequests_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace SMSMessages
    {
        public partial class SMSMessages_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public SMSMessages_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_SMSMessages_SMSMessages_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }

    namespace Loanschedule
    {
        public partial class Loanschedule_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public Loanschedule_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Loanschedule_Loanschedule_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace TransactionCharges
    {
        public partial class Transactioncharges_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public Transactioncharges_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_TransactionCharges_TransactionCharges_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
        public partial class Transactioncharges
        {
            public string Charge_Category { get { return Transaction_Charge_Category.ToString().Replace("_", " "); } }
            public string DisbursementMode { get { return Disbursement_Mode.ToString().Replace("_", " "); } }

        }
    }
    namespace LoanProductRequirements
    {
        public partial class LoanProductRequirements_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public LoanProductRequirements_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_LoanProductRequirements_LoanProductRequirements_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace Loginhistory
    {
        public partial class Loginhistory_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public Loginhistory_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_Loginhistory_Loginhistory_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
    namespace SmsTemplate
    {
        public partial class SMSTemplates_Service : System.Web.Services.Protocols.SoapHttpClientProtocol
        {

            public SMSTemplates_Service(Setting s)
            {
                this.Url = s.geturl(global::RestSharpWebApi.Properties.Settings.Default.RestSharpWebApi_SmsTemplate_SmsTemplate_Service);
                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }
        }
    }
}