using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Logging;
using Matatu_Rest.Agents;
using Matatu_Rest.Devices;
using Matatu_Rest.Expenses;
using Matatu_Rest.Hires;
using Matatu_Rest.NRODefects;

namespace Matatu_Rest.Controllers
{
    public class AgentsController : ApiController
    {
        [HttpPost]
        [Route("api/agents")]
      //  [Authorize]
        public Results<Agents.Users[]> getaccounts()
        {
            try
            {
                return new Results<Agents.Users[]>()
                    { Contents = new Users_Service(my_app.Settings).ReadMultiple(null, null, 0) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Agents.Users[]>() { Code = -1, Desc = e.Message };
            }
        }   [HttpPost]
        [Route("api/expenses")]
      //  [Authorize]
        public Results<Expenses.Expenses[]> expences()
        {
            try
            {
                return new Results<Expenses.Expenses[]>()
                    { Contents = new Expenses_Service(my_app.Settings).ReadMultiple(null, null, 0) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Expenses.Expenses[]>() { Code = -1, Desc = e.Message };
            }
        } [HttpPost]
        [Route("api/NRODefects")]
      //  [Authorize]
        public Results<NRODefects.NRODefects[]> NRODefects()
        {
            try
            {
                return new Results<NRODefects.NRODefects[]>()
                    { Contents = new NRODefects_Service(my_app.Settings).ReadMultiple(null, null, 0) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<NRODefects.NRODefects[]>() { Code = -1, Desc = e.Message };
            }
        } 
        [HttpPost]
        [Route("api/Devices")]
      //  [Authorize]
        public Results<Devices.Devices> Devices( Devices.Devices devices)
        {
            try
            {
              var dev=  new Devices_Service(my_app.Settings).Read(devices.Device_id);
                if (dev == null) {
                new Devices_Service(my_app.Settings).Create(ref devices);
                }
                return new Results<Devices.Devices>()
                { Contents = dev };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Devices.Devices>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/agent")]
        public Results<Agents.Users> getaccount(string agent)
        {
            try
            {
                return new Results<Agents.Users>() { Contents = new Users_Service(my_app.Settings).Read(agent) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Agents.Users>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/Hires")]
        public Results<List< Hires.Hires>> gethires()
        {
            try
            {
                return new Results<List<Hires.Hires>>() { Contents = new Hires_Service(my_app.Settings).ReadMultiple(new Hires_Filter [] { }, null,0).ToList() };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<List<Hires.Hires>>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost]
        [Route("api/addHires")]
        public Results<Hires.Hires> addhires(Hires.Hires hire)
        {
            try
            {
                hire.Return_DateSpecified = true;
                hire.Return_TimeSpecified = true;
                hire.Start_DateSpecified = true;
                hire.Start_TimeSpecified = true;
                hire.Hire_TypeSpecified = true;
                hire.Payment_MethodsSpecified = true;
                hire.Vat_TypeSpecified = true;
                hire.ClientSpecified = true;
                hire.AmountSpecified = true;



                var hr = new Hires_Service(my_app.Settings).Read(hire.Code);

                if (hr == null)
                {
                   new Hires_Service(my_app.Settings).Create(ref hire);
                }
                else
                {
                    hire.Key = hr.Key;  
                    new Hires_Service(my_app.Settings).Update(ref hire);
                }

               

                return new Results<Hires.Hires>() { Contents = hire };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Hires.Hires>() { Code = -1, Desc = e.Message };
            }
        }
    }
}
