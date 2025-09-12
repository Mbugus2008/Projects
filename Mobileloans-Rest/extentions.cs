using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mobileloans_Rest
{
    public class extentions
    {
    }
    public class Results
    {
        public int Code = 0;
        public string Desc = "Successfull";
        public object content = null;
    } 
 
    public class member {
        public string phone { get; set; }
        public string DeviceID { get; set; }
        public string Id_No { get; set; }
        public string pin { get; set; }
    }
  
    public class otp { 
        public string phone { get; set; }
        public string message { get; set; }
    }
    public class Repayment
    {
        public Loans.Loan loan { get; set; }
        public Double Amounttopay { get; set; }
        public Source source { get; set; }
    }public enum Source { Mpesa, }
    public class response : Exception
    {
        public int code;
        public string desc;

        public response(int c, string d)
        {
            code = c;
            desc = d;
          
        }
    

    }
}