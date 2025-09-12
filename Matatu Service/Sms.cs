using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
//using Sendsms;
namespace Collection
{
    public class Sms
    {
        public string client { get; set; }
        public int balance { get; set; }
        public int SentToday { get; set; }

    }
    public class results {
        public int code = 0;
        public string desc =string.Empty ;
    }
}