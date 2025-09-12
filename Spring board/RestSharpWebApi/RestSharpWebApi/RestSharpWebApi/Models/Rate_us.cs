using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RestSharpWebApi.Models
{
    public class CustomerFeedBack
    {
        public string Customer { get; set; }
        public string FeedBack { get; set; }
        public bool Is_Anonymous { get; set; }
        public string name { get; set; }
        public string mobileNo { get; set; }
        public string email { get; set; }
        public DateTime date { get; set; }

    }
  
}