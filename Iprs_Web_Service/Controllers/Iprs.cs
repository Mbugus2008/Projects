using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.ServiceModel;

namespace Iprs_Web_Service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Iprs : ControllerBase
    {
        Iprs_services.ServiceIPRSClient client = new Iprs_services.ServiceIPRSClient();
        public Iprs()
        {

            
        }
        [HttpPost]
     public Iprs_services.HumanInfoFromIDCard GetIDCard( idrequest req)
        {
            client.Endpoint.Address= new EndpointAddress(req.url);
            Iprs_services.GetDataByIdCardRequest getDataById = new Iprs_services.GetDataByIdCardRequest();
            getDataById.id_number =req. idno;
            getDataById.log =req. Username;
            getDataById.pass =req. password;
            return client.GetDataByIdCard(getDataById).GetDataByIdCardResult;

        }
        
    }
    public class idrequest {
       public string url { get; set; }
        public string Username { get; set; }
        public string password { get; set; }
        public string idno { get; set; }
    }
   
}
