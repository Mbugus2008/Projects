using RestSharp;
using System;

namespace Iprs
{
    public class Iprs
    {
   
        public string username;
        public string password;
        public Iprs(string _username,string _password)
        {
            this.username = _username;
            this.password = _password;
        }

        //public Iprs_services.HumanInfoFromIDCard getid(string url, string Username, string password, string idno)
        //{

        //    var client = new RestClient("https://account.mobilesasa.com/oauth/token");
        //    var request = new RestRequest(Method.GET);
        //    request.AddHeader("Content-Type", "application/json");
        //    request.AddParameter("undefined", "{\n              \"grant_type\":\"client_credentials\",\n              \"client_secret\":\"iwO845qhJdMhKNLvzg2e0Bwg34ElL5R1CX0k9ujg\",\n              \"client_id\":\"19c154a0-2ada-11e9-bbb6-171d99e571c8\"\n     }", ParameterType.RequestBody);
        //    response = client.Execute(request);
        //}

    }
}
