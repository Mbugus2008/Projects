using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace S_Ussd
{
    [Serializable()]
    public class resp
    {
        public string RESPCODE { get; set; }
        public string RESPDESC { get; set; }
        public string MEMBERS { get; set; }
        public List<list_Member> member { get; set; }
        

    }

    [JsonObject(ItemNullValueHandling = NullValueHandling.Ignore)]
    [Serializable()]
    public class list_Member:Agent
    {
     
        public string SEARCHSTRING { get; set; }
        public string SEARCHBY { get; set; }
        public string CITY { get; set; }
        public string REGMOBNO { get; set; }
     
        public string DOB { get; set; }
        public string ID { get; set; }
        public string NAME { get; set; }
        public string ACCTYPE { get; set; }
        public string ACCOUNTS { get; set; }
        public List<List_Accounts> accounts;
        public List<List_Accounts> accounts_2;
    }

    [JsonObject(ItemNullValueHandling = NullValueHandling.Ignore)]
    [Serializable()]
    public class Agent:resp
    {
        public string IMEINO { get; set; } = "7029a8224a31b6s";
        public string AGENTCD { get; set; }
        public string BCCODE { get; set; } = "42";
        public string SACCOCODE { get; set; } = "6";
        public string MOBILENO { get; set; }
        public string MEMBERID { get; set; }
        public string AGENTNAME { get; set; }
        public string PASSWORD { get; set; }
        public string MACHINETYPE { get; set; } = "U";
        public string SIMNO { get; set; } = "111111111111";   
        public string WEBSERVICEURL { get; set; }
        public string SESSIONTIMEOUT { get; set; } 
        public string OTPREF { get; set; }
        public string AGNMEMBERID { get; set; }
        public string FLOATAMOUT { get; set; }
    }


    [Serializable()]
    public class listrequest
    {
        public string phone { get; set; }
        public string session { get; set; }
        public string agentcode { get; set; }
        public string agencycode { get; set; }
       
        public List<requests> requests;
        public List<Core_requests> core_requests;
      
        public Agent agent { get; set; }
        public list_Member member { get; set; }
        public list_Member Bn_member { get; set; }
        public Otp otp { get; set; }
        public Trans trans { get; set; }
        public double amount { get; set; }
        public List<List_Menu> menu { get; set; }


    }
    [Serializable()]
    public class List_Menu
    {
        public int Id { get; set; }
        public string name { get; set; }
        public bool selected { get; set; }
    }
    [Serializable()]
    public class requests
    {
        public string text { get; set; }
        public DateTime datetime { get; set; }=DateTime.Now;
        public String response { get; set; }

    }
    [Serializable()]
    public class Core_requests
    {
       
        public DateTime datetime { get; set; } =DateTime.Now;
        public string request { get; set; }
        public String response { get; set; }

    }
    [Serializable()]
    public class List_Accounts:Agent
    {
        public string INSTLMNTAMT { get; set; }
        public string ACCNO { get; set; }
        public string ACC { get; set; }
        public double CURBAL { get; set; }
        public string REGMOBNO { get; set; }
        public double OVERDUEAMT { get; set; }
        public string ACCTYPE { get; set; }
        public string ACCDESC { get; set; }
        public bool selected { get; set; }
        public int id { get; set; }
        public string ACCNAME { get;  set; }
    }
   
    [Serializable()]
    public class Otp : Agent
    {

        public string MESSAGE { get; set; }
        public string FROMACTIVITY { get; set; }
        public string REQSTATUS { get; set; }
        public string MEMBERID { get; set; }
        public string REMMEMBERID { get; set; }
        public string OTPREF { get; set; }

    }
    [Serializable()]
    public class Trans:Agent
    {
        public string MEMBERID { get; set; }
        public string TRANID { get; set; }
        public string ACCOUNTNO { get; set; }
        public string AMOUNT { get; set; }
     
        public string AGNMEMBERID { get; set; }
        public string OTP { get; set; }
        public string OTPREF { get; set; }
        public string AGNMOBNO { get; set; }
        public string MEMBERNM { get; set; }
        public string NARRATION { get; set; }
    
    
       
      
        public string ACCTYPE { get; set; } 
        public string REQSTATUS { get; set; }
        
        public string FUNCTIONCD { get; set; }
        public string FROMACTIVITY { get; set; }

        public string REMMEMBERID { get; set; }
        public string BNFMEMBERID { get; set; }
        public string REMMEMBERNM { get; set; }
        public string BNFMEMBERNM { get; set; }
        public string REMACCOUNTNO { get; set; }
        public string BNFACCOUNTNO { get; set; }
    }
    
}