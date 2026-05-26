using DeportnFuel;
using Entries;
using Loan;
using Logging;
using MatatuCore.Controllers;
using MatatuCore.Models.Database;
using MatatuCore.Services.Clients;
using Member;
using MemberAccounts;
using NRODefect;
using Parcels;
using Reversal;
using System.Security.Cryptography;
using System.ServiceModel;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;
using Vbasics;
using Vcrews;

namespace MatatuCore.Services
{
   public class Matatu_Settings  
    {
       public DateTime? WorkingDate { get; set; } 
   public Matatu_Settings(DateTime? workingDate = null)
        {
            WorkingDate = workingDate;
        }
        public override string ToString()
        {
            return WorkingDate?.ToString("MM/dd/yyyy") ?? "No Date Set";
        }
    }
    public interface Iclient
    {
        Client? client_setting { get; set; }
        Matatu_Settings? settings { get;  }
        string LogFolder { get; }
        //Client Services
        Agents.Users_PortClient user_service { get; set; }
        Trans.Transactions_PortClient transaction_service { get; set; }
        Expense.Expenses_PortClient expense_service { get; set; }
        Hire.Hires_PortClient hires_service { get; set; }
        NRODefects_PortClient nro_service { get; set; }
        Mbranch_Hd.Mbranch_Header_PortClient transheader_service { get; set; }
        Reversal.Reversals_PortClient reversal_service { get; set; }    
        Ttypes.Transtypes_PortClient types_service { get; set; }
        TransAmounts.Tamounts_PortClient tamounts_service { get; set; }
        VehicleCollection.Vehicle_Daily_Collection_PortClient vehicle_collection_service { get; set; }
        DeportnFuel.Deport_n_Fuel_PortClient deportn_fuel_service { get; set; }
        // This service is used to manage posting transactions
        Posting.MBranch_PortClient posting_service { get; set; }
        Member.Members_PortClient members_service { get; set; }    
        Vbasics.VehiclesBasics_PortClient vehicle_service { get; set; } 
        VehicleCrews_PortClient vcrew_service { get; set; }
        Parcels.Parcel_PortClient parcel_service { get; set; }
      

        ParcelDetails.Parcel_Details_PortClient parceldetails_service { get; set; }
        Location.Locations_PortClient location_service { get; set; }
       MemberAccounts. Accounts_PortClient accounts_service { get; set; }
        Loan. Loans_PortClient loans_service { get; set; }
         AccountEntries_PortClient entries_service { get; set; }



        //Methods to interact with the client services
        Agents.Users[] Users();
        Expense.Expenses[] expences();
        Hire.Hires[] hires();
        NRODefects[] nrodefects();
        Hire.Hires addhire(Hire.Hires hire);
        Member.Members addphone(Member.Members member);
        Trans.Transactions[] GetTransactions(string agent, string bookmark = null, int size = 0);
        Trans.Transactions[] GetTransactions_byDates(Request request);
        Trans.Transactions[] getvehicletransactions(Request request);
        Trans.Transactions settransactions(Trans.Transactions trans);
        Mbranch_Hd.Mbranch_Header settranheader(Mbranch_Hd.Mbranch_Header header);
        Reversal.Reversals setreversals(Reversal.Reversals request);
        Reversal.Reversals[] getreversals(string agent);
        Ttypes.Transtypes[] gettypes();
        Location.Locations[] getlocations();
        TransAmounts.Tamounts[] getamounts(ClientRequest request);
        // This method is used to get daily transactions for vehicles based on the provided request parameters.
        VehicleCollection.Vehicle_Daily_Collection[] Dailytrans(Request request);
        DeportnFuel.Deport_n_Fuel[] deportdata(Request request);
       DeportnFuel.Deport_n_Fuel setdeportdata      (Deport_n_Fuel request);
        Member.Members[] getmembers(ClientRequest request);
        // Get a single member by No, phone, or vehicle
        Member.Members getmember(ClientRequest request);
        Members updatecrew(Members members);
        VehiclesBasics[] getvehicles(ClientRequest request);
        VehicleCrews[] getvehicleCrews(ClientRequest request);
        Parcels.Parcel[] getparcels(Request request);
        Parcels.Parcel Addeditparcel(Parcel parcel);
        // Get member loans by member identifier (No, phone, or vehicle)
        Loan.Loans[] getmemberloans(ClientRequest request);
        
        // Get member accounts by member identifier (No, phone, or vehicle)
        Accounts[] getmemberaccounts(ClientRequest request);
        AccountEntries[] getaccountentries(ClientRequest request);
        VehiclesBasics[] getmembervehicles(ClientRequest request);
        AccountEntries[] getloanentries(ClientRequest request);
    }

    public class client {
       public Iclient GetIclient(MatatuContext context, string id)
        {
            Iclient? cl = null;

            Client? client = context.Clients.Where(o => o.ClientCode == id).FirstOrDefault();
            if (client != null)
            {

                switch (id)
                {

                    case "LOPHA_SACCO":
                        cl = new Lopha(client); break;
                    case "KC-SHUTTLE":
                        cl = new Kcs(client);
                        break;
                    case "KMOS_SACCO":
                        cl = new Kmos(client);
                        break;
                    case "REMBOCLASIC":
                        cl = new Remboclassic(client);
                        break;
                    case "CITYHOPPER":
                        cl = new CityHoppa(client);
                        break;
                    default:
                        cl = new BaseClient(client);
                        break;
                }
                if (cl != null)
                {
                    cl.user_service = InitializeClient<Agents.Users>(client);
                    cl.transaction_service = InitializeClient<Trans.Transactions>(client);
                    cl.expense_service = InitializeClient<Expense.Expenses>(client);
                    cl.deportn_fuel_service = InitializeClient<DeportnFuel.Deport_n_Fuel>(client);
                    cl.nro_service = InitializeClient<NRODefect.NRODefects>(client);
                    cl.hires_service = InitializeClient<Hire.Hires>(client);
                    cl.deportn_fuel_service = InitializeClient<DeportnFuel.Deport_n_Fuel>(client);
                    cl.members_service = InitializeClient<Member.Members>(client);
                    cl.transheader_service = InitializeClient<Mbranch_Hd.Mbranch_Header>(client);
                    cl.vcrew_service = InitializeClient<Vcrews.VehicleCrews>(client);
                    cl.vehicle_collection_service = InitializeClient<VehicleCollection.Vehicle_Daily_Collection>(client);
                    cl.vehicle_service = InitializeClient<Vbasics.VehiclesBasics>(client);
                    cl.types_service = InitializeClient<Ttypes.Transtypes>(client);
                    cl.parceldetails_service = InitializeClient<ParcelDetails.Parcel_Details>(client);
                    cl.parcel_service = InitializeClient<Parcels.Parcel>(client);
                    cl.location_service = InitializeClient<Location.Locations>(client);
                    cl.tamounts_service = InitializeClient<TransAmounts.Tamounts>(client);
                    cl.loans_service = InitializeClient<Loans>(client);
                    cl.accounts_service = InitializeClient<Accounts>(client);
                    cl.entries_service = InitializeClient<AccountEntries>(client);
                    cl.reversal_service = InitializeClient<Reversals>(client);
                }
                else
                    return null;
            }
            return cl;

        }
        public dynamic InitializeClient<T>(Client cl)
        {

            string Namespace = typeof(T).Namespace;
            string Class_Name = typeof(T).Name;

            var clientType = Type.GetType($"{Namespace}.{Class_Name}_PortClient");

            var address = new EndpointAddress(baseurl(cl) + Class_Name);
            dynamic client = Activator.CreateInstance(clientType, binding(), address);
            client.ClientCredentials.Windows.AllowedImpersonationLevel = System.Security.Principal.TokenImpersonationLevel.Delegation;
            client.ClientCredentials.Windows.ClientCredential.UserName = cl.UserName;
            client.ClientCredentials.Windows.ClientCredential.Password = cl.Password;
            client.ClientCredentials.UserName.UserName = cl.UserName;
            client.ClientCredentials.UserName.Password = cl.Password;
            return client;

        }
        BasicHttpBinding binding()
        {

            BasicHttpBinding navWSBinding = new BasicHttpBinding();
            navWSBinding.SendTimeout = TimeSpan.FromMinutes(5);

            navWSBinding.Security.Mode = BasicHttpSecurityMode.TransportCredentialOnly;
            navWSBinding.Security.Transport.ClientCredentialType = HttpClientCredentialType.Windows;
            return navWSBinding;
        }
        string baseurl(Client c)
        {

            return String.Format("http://{0}:{1}/{2}/WS/{3}/Page/", c.Ipaddress, c.Port, c.Instance, c.Company);
        }

    }


public class AesEncryption
    {
        private static readonly string Key = "my32lengthsupersecretpassword123456";
        private static readonly string Iv = "1234567890abcdef";
        private byte[] keyBytes;
        public AesEncryption() {

            var configuration = new ConfigurationBuilder()
      .AddJsonFile("appsettings.json")
      .Build();

            string base64Key = configuration["Encryption:Key"];
            keyBytes = Convert.FromBase64String(base64Key);
        }
        public  string GenerateAesKey(int keySizeInBits = 256)
        {
            if (keySizeInBits != 128 && keySizeInBits != 192 && keySizeInBits != 256)
                throw new ArgumentException("Invalid key size");

            using (Aes aes = Aes.Create())
            {
                aes.KeySize = keySizeInBits;
                aes.GenerateKey();
                return Convert.ToBase64String(aes.Key);
            }
        }

        public  string Encrypt(string plainText)
        {
            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = keyBytes;
                aesAlg.IV = Encoding.UTF8.GetBytes(Iv);
                aesAlg.Mode = CipherMode.CBC;
                aesAlg.Padding = PaddingMode.PKCS7;

                ICryptoTransform encryptor = aesAlg.CreateEncryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msEncrypt = new MemoryStream())
                {
                    using (CryptoStream csEncrypt = new CryptoStream(msEncrypt, encryptor, CryptoStreamMode.Write))
                    {
                        using (StreamWriter swEncrypt = new StreamWriter(csEncrypt))
                        {
                            swEncrypt.Write(plainText);
                        }
                        return Convert.ToBase64String(msEncrypt.ToArray());
                    }
                }
            }
        }

        public  string Decrypt(string cipherText)
        {
            byte[] buffer = Convert.FromBase64String(cipherText);

            using (Aes aesAlg = Aes.Create())
            {
                aesAlg.Key = Encoding.UTF8.GetBytes(Key);
                aesAlg.IV = Encoding.UTF8.GetBytes(Iv);
                aesAlg.Mode = CipherMode.CBC;
                aesAlg.Padding = PaddingMode.PKCS7;

                ICryptoTransform decryptor = aesAlg.CreateDecryptor(aesAlg.Key, aesAlg.IV);

                using (MemoryStream msDecrypt = new MemoryStream(buffer))
                {
                    using (CryptoStream csDecrypt = new CryptoStream(msDecrypt, decryptor, CryptoStreamMode.Read))
                    {
                        using (StreamReader srDecrypt = new StreamReader(csDecrypt))
                        {
                            return srDecrypt.ReadToEnd();
                        }
                    }
                }
            }
        }
    }

    public class CustomDateTimeConverter : JsonConverter<DateTime>
    {
        private readonly string _format;

        public CustomDateTimeConverter(string format = "MM/dd/yyyy HH:mm:ss")
        {
            _format = format;
        }

        public override DateTime Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            if (reader.TokenType == JsonTokenType.Null)
            {
                return default;
            }

            var value = reader.GetString();
            if (string.IsNullOrWhiteSpace(value))
            {
                return default;
            }

            if (DateTime.TryParseExact(value, _format, null, System.Globalization.DateTimeStyles.None, out var parsedExact))
            {
                return parsedExact;
            }

            if (DateTime.TryParse(value, out var parsed))
            {
                return parsed;
            }

            throw new JsonException($"Invalid DateTime value '{value}'.");
        }

        public override void Write(Utf8JsonWriter writer, DateTime value, JsonSerializerOptions options)
        {
            writer.WriteStringValue(value.ToString(_format));
        }
    }


}
