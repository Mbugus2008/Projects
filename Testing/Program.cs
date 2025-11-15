using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace Testing
{
    class Program
    {
        static void Main(string[] args)
        {



            //new M_sacco();

            //Contabo c = new Contabo();
            //c.CreateSnapshotAsync().GetAwaiter().GetResult();


            //var client = new ApiClient("https://your-api-url");
            //var response = await client.GetSomeDataAsync();
            //Console.WriteLine(response.PropertyName);

            //ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3 | SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;


            //string password = "System@2018";
            //string currentTime = DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(); // Current time in seconds since the epoch

            //string signature = CreateEncryptedSignature(password, currentTime);
            //Console.WriteLine("Encrypted Signature: " + signature);




            //var client = new RestClient("https://dashboard.ignitepost.com/api/v1/authenticate");
            //client.Timeout = -1;
            //var request = new RestRequest(Method.GET);
            //request.AddHeader("X-TESTING", "True");
            //request.AddHeader("X-TOKEN", "5MJQndya7ZJ9Kb1oSGdpgsHtXx6fXDWdFeHrZeMI");
            //var body = @"";
            //request.AddParameter("text/plain", body, ParameterType.RequestBody);
            //IRestResponse response = client.Execute(request);
            //Console.WriteLine(response.Content);
            /*order order = new order() {

                font = "becca",
                message = "Thank you for your donation",
                image = "congratulations_01",
                insert = "starbucks_5_giftcard",
                recipient_name = "Elias Munene",
                recipient_email = "elias.munene@gmail.com",
                recipient_company_name = "MTI",
                recipient_address_one = "addreess1",
                recipient_address_two = null,
                recipient_city = "city",
                recipient_state = "AZ",
                recipient_zip = "12345",
                sender_name = "MTI TEST",
                sender_address_one = null,
                sender_address_two = null,
                sender_city = null,
                sender_state = null,
                sender_zip = null,
                send_on = null,
                letter_template_id = 3775,
                uid = null,
                metadata = null
            };
       
            var client = new RestClient("https://dashboard.ignitepost.com/api/v1/orders");
            client.Timeout = -1;
            var request = new RestRequest(Method.POST);
            request.AddHeader("X-TOKEN", "5MJQndya7ZJ9Kb1oSGdpgsHtXx6fXDWdFeHrZeMI");
            request.AddHeader("Content-Type", "application/json");

            request.AddParameter("application/json", Newtonsoft.Json.JsonConvert.SerializeObject(order)  , ParameterType.RequestBody);
           
            IRestResponse response = client.Execute(request);
            Console.WriteLine(response.Content);

*/
            //  String c = "]C1913375697C1240100410091017062020";
            //  var cc = c.Split('C');
            //  foreach (var item in cc)
            //  {
            //      string ss = item;
            //  }


            //  credits.MemberCredits_Service memberCredits_Service = new credits.MemberCredits_Service();

            //var   cd = new System.Net.NetworkCredential("Mbranch", "Mbanking12345*", "5.189.167.52");
            //  memberCredits_Service.Credentials = cd;
            //  memberCredits_Service.PreAuthenticate = true;
            //  credits.MemberCredits credits = new credits.MemberCredits();
            //  credits.Amount = 8000;
            //  credits.Document_No = "9009";
            //  credits.Posting_Date = DateTime.Now;
            //  credits.Source_Code = "7677";

            //  memberCredits_Service.Create(ref credits);



            //  Mobilesasa.sms s = new Mobilesasa.sms();
            //  var d = s.sendsms("+254710563359", "Test");

            //Kps_Sms.sms sms = new Kps_Sms.sms("http://128.0.6.1:8080/KPSMobileBanking/SMS");

            //sms.phone = "+254710563369";
            //sms.Text = "testing";
            //sms.source = "CRM";
            //sms.reference = "12344";
            //var d = sms.send(sms);



            //eod.CBS_Data m = new eod.CBS_Data();

            //Credit_AmountSpecified;
            //Debit_AmountSpecified;
            //Posting_DateSpecified;


        }
        static string CreateEncryptedSignature(string password, string currentTime)
        {
            // First MD5 hash of the password
            string hashedPassword = ComputeMd5Hash(password);

            // Concatenate the hashed password and the current time
            string concatenatedString = hashedPassword + currentTime;

            // Second MD5 hash of the concatenated string
            string encryptedSignature = ComputeMd5Hash(concatenatedString);

            return encryptedSignature;
        }

        static string ComputeMd5Hash(string input)
        {
            using (MD5 md5 = MD5.Create())
            {
                byte[] inputBytes = Encoding.ASCII.GetBytes(input);
                byte[] hashBytes = md5.ComputeHash(inputBytes);

                StringBuilder sb = new StringBuilder();
                for (int i = 0; i < hashBytes.Length; i++)
                {
                    sb.Append(hashBytes[i].ToString("x2")); // Converts to 2-character hex string
                }
                return sb.ToString();
            }
        }
    }
    public class M_sacco
    {  Msacco.MSACCO mobile = new Msacco.MSACCO();
       
        public M_sacco() {
            NetworkCredential cd = new NetworkCredential("Mbranch","Mbanking12345*", "localhost");
            mobile.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/MSACCO", "localhost", "NYALA VISION SACCO LTD", "Nyala", "1913");
            mobile.PreAuthenticate = true;
            mobile.Credentials = cd;
            var d = mobile.MsaccoDeposit("MYUYYT76674", "Deposit", "Payment received from SAMUEL MURIITHI 254723744829", DateTime.Now.Date, "200003729400", 2500, "Deposit","+254710563359");
          var res =  mobile.InsertToJournalMDeposits("MYUYYT76674", "Deposit", "Payment received from SAMUEL MURIITHI 254723744829", DateTime.Now.Date, "200003729400", 2500, "Deposit"); 
        }
    }

    public class order
    {
        public string font { get; set; }
        public string message { get; set; }
        public string image { get; set; }
        public string insert { get; set; }
        public string recipient_name { get; set; }
        public string recipient_email { get; set; }
        public string recipient_company_name { get; set; }
        public string recipient_address_one { get; set; }
        public object recipient_address_two { get; set; }
        public string recipient_city { get; set; }
        public string recipient_state { get; set; }
        public string recipient_zip { get; set; }
        public string sender_name { get; set; }
        public object sender_address_one { get; set; }
        public object sender_address_two { get; set; }
        public object sender_city { get; set; }
        public object sender_state { get; set; }
        public object sender_zip { get; set; }
        public object send_on { get; set; }
        public int letter_template_id { get; set; }
        public object uid { get; set; }
        public object metadata { get; set; }
    }
}
namespace Testing.Msacco 
{ 


}