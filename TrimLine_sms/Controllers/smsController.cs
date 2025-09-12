using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TrimLine_sms.Controllers
{
    public class smsController : ApiController
    {
        smsservice.Service1 smss = new smsservice.Service1();
        public smsController() {
            Logging.Logging.logpath = @"D:\Mobile\Logs\sms\";
        }

        [HttpPost]
        [Route("api/sendsms")]
        public smsservice.sms sendsms([FromBody] smsservice.sms sms) {
          
           
           return smss.Sendsms(sms); 
        }
        
        
    }
}
