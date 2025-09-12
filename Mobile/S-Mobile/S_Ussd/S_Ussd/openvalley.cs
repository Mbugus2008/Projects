using Newtonsoft.Json;
using RestSharp;
using RestSharp.Serialization.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace S_Ussd
{
    public class openvalley
    {
        private static RestClient client = new       RestClient("http://167.86.120.230:854/api/");
        StringBuilder s = new StringBuilder();
        public static Mobileloans_Rest.Members.Members member(string phone)
        {
            Mobileloans_Rest.Members.Members members = null;

            var m =new Mobileloans_Rest.member ();
            m.phone = phone;

            RestRequest request = new RestRequest("member",Method.POST);
            request.AddJsonBody(m);
            IRestResponse<Mobileloans_Rest.Results> response =            client.Execute<Mobileloans_Rest.Results>(request);
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                var d = JsonConvert.DeserializeObject<Mobileloans_Rest.Results>(response.Content);
            if (d.Code == 0)
                {
                    if (d.content !=null)
                    members = JsonConvert.DeserializeObject<Mobileloans_Rest.Members.Members>(d.content.ToString());
                }
            }

            return members;
        }
     
        public static string Register( string text)
        {
            StringBuilder s = new StringBuilder();
            var text1 = text.Split(new char[] { '*' });
            switch (text1.Length)
            {
                case 0:

                    s.Append(string.Format("Welcome To Africash, unique mobile money lending service. Lets get to know you{0}", Request.newline));
                    s.Append(string.Format("Enter your names as they appear on your ID", Request.newline));
                    break;
                case 1:
                      s.Append(string.Format("Enter your ID No", Request.newline)); 
                    break; 
            }
            
            return s.ToString();
          

        }
        public static string Menu(string text, Mobileloans_Rest.Members.Members member)
        { StringBuilder s = new StringBuilder();
            if (member == null)
            {
               
                if ((member.Loans_Mobile.Count() > 0) && (member.Loans_Mobile.Sum(o => o.Outstanding_Balance) > 0 || member.Loans_Mobile.Sum(o => o.Outstanding_Interest) > 0))
                {
                    var l = member.Loans_Mobile.Where(o => o.Outstanding_Balance > 0 || o.Outstanding_Interest > 0).OrderByDescending(o => o.Loan_No);
                    s.Append(string.Format("Hi {0}, Your have an outstanding loan of KES {1}. The loan is due on {2}{3}Enter amount to pay", member.Name, member.Loans_Mobile.Sum(o => o.Outstanding_Balance) + member.Loans_Mobile.Sum(o => o.Outstanding_Interest), l.ToList()[0].Due_Date, Request.newline));

                }
                else
                {
                    s.Append(string.Format("Hi {0}, You are eligible for KES {1}{2} Enter amount to Request", member.Name, member.Eligibility, Request.newline));

                }
            }
            return s.ToString();


        }
    }

    
   
}