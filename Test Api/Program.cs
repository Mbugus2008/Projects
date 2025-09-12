using CRB;
using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Test_Api
{
    class Program
    {
        static System.Net.NetworkCredential transcd;
        static void Main(string[] args)
        {
            createxml();
   transcd = new System.Net.NetworkCredential("KEFq7NE3vz", "PnNeGUcBdx0EMJ");
        
            TransUnion.ControllerKenyaImplService transunion = new TransUnion.ControllerKenyaImplService();
     
           // transunion.Url = "";
            transunion.Credentials = transcd;
            transunion.PreAuthenticate = true;

            var p121 = transunion.getProduct121("WS_OVIGL", "[5#p4`%4b3MD", "2497", "ke123456789", "", "", "", "", "10595071", "", "", "", "", new DateTime(), false, "", "", "", "", "", "", "", "", "", 1);

            var p131 = transunion.getProduct131("WS_OVIGL", "[5#p4`%4b3MD", "2497", "ke123456789", "", "", "", "", "10595071", "", "", "", "", new DateTime(), false, "", "", "", "", "", "", "", "", "", 2,12);

            transcd = null;

            //CRB.CRB crb = new CRB.CRB("5555", "v2_1", "LhIqqixRucmllAVOyfYhzpGntzNfoX", "gMixhXgqFjfYtFzIEXVgrRivCXbsqIGwXqUeQauvLbVfGWplUMTNEbLgBMyR");
            //CRB.CRB crb = new CRB.CRB("22225", "v2_1", "XUcTDIGWVgNClJomHEOqUxoLllFyKE", "uyZCfVEuOZsRGzOuTAmzFuIRBKzlUkUoJUQqrWKgVEXCFLyyNmAtGiMJvNUp");

            // CRB.identity id = new identity();
            // id.identity_number = "24736536";
            // id.identity_number = "880000088";
            // id.identity_type = "001";
            // id.report_type = 1;

            //var i = crb.get_identity(id);


            //CRB.delinquency d = new  delinquency();
            //          d.identity_number = "880000088";
            //          d.identity_type = "001";
            //          d.report_type = 2;
            //          d.loan_amount = 10000;

            //          crb.get_Delinquency(d);



            //  CRB.identity id = new identity();
            //   id.identity_number = "880000088";
            //  id.identity_type = "001";
            //  id.report_type = 3;

            //  crb.get_metroscore(id);



            // ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12 | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls;
            // var client = new RestClient("https://uat.jengahq.io/identity/v2/token");
            // var request = new RestRequest(Method.POST);

            // request.AddHeader("Authorization", "Basic VTVBWmJ0czVxdFZKUHp0WEZHNDNhWll5dzFiaUtoY006WEdqakxBY21jcmtGSVlzcw==");
            // request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            // request.AddParameter("undefined", "username=6661537935&password=Fnm8WmexXJ1xisWn5DaDGFuLLE6IfDXJ",ParameterType.HttpHeader);
            //// request.AddBody("undefined", "username=6661537935&password=Fnm8WmexXJ1xisWn5DaDGFuLLE6IfDXJ");
            // IRestResponse response = client.Execute(request);
            // bearer bearer = new bearer();
            // if (response.IsSuccessful)
            //     bearer = JsonConvert.DeserializeObject<bearer>(response.Content);
            // 
        }
        private static void createxml()
        {

            XDocument doc = new XDocument(new XElement("root",
       new XElement("document",
       new XElement("field", new XAttribute("level", "batch"), new XAttribute("name", "ID NUMBER"), new XAttribute("value", "647644"))
       
      
                                                         )));

            var destfilename = @"D:\Samples\Docss\testing.xml";
           
            doc.Save(destfilename);

        }

    }
    class bearer
    {
        public string token_type { get; set; }
        public string issued_at { get; set; }
        public string expires_in { get; set; }
        public string access_token { get; set; }

    }

  
          
}
