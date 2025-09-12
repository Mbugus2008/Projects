using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ClientApi
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