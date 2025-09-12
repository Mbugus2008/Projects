using RestSharpWebApi.CustomerCard;
using RestSharpWebApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;


namespace RestSharpWebApi.Controllers
{
    public class TestController : ApiController
    {
        Setting s = new Setting();
        // GET: Test
        [HttpGet]
        [Route("cust")]
        public Results<CustomerCard.CustomerCard> cust(string nationalID)
        {

            return new Results<CustomerCard.CustomerCard>() { Contents = new CustomerCard_Service(s).ReadMultiple(new CustomerCard_Filter[] { new CustomerCard_Filter { Criteria = nationalID, Field = CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault() };
        }
        }
}