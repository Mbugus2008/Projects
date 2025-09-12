using Microsoft.AspNetCore.Mvc;

namespace Trimline_sms.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class Trimline_sms : ControllerBase
    {
    

        private readonly ILogger<Trimline_sms> _logger;

        public Trimline_sms(ILogger<Trimline_sms> logger)
        {
            _logger = logger;
        }

     
        [HttpPost(Name = "Sendsms")]
        public SmsService.sms sendsms( )
        {
            send.IService1 d
            send.Service1Client smss  =  new  send.Service1Client(send.Service1Client.EndpointConfiguration.BasicHttpBinding_IService1,"") ;
                                       return   smss.Sendsms(sms);
     

        }
    }

}