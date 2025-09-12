using RestSharpWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace RestSharpWebApi.Controllers
{
    public class SmsController : Controller
    {
        // GET: Sms
        private Setting s = new Setting();
   
      
        public ActionResult Index()
        {
            return View();
        }
    }
}