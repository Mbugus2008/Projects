using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Logging;
using Matatu_Rest.Mbranch_Header;
using Matatu_Rest.Members;
using Matatu_Rest.Transactions;
using Matatu_Rest.Transtypes;
using Matatu_Rest.Vehicles;
using Matatu_Rest.VehiclesBasics;
using Serilog;

namespace Matatu_Rest.Controllers
{
    public class CollectionsController : ApiController
    {
        
        [HttpGet]
        [Route("api/get")]
        public Results<Transactions.Transactions[]> gettransactions(string agent, string bookmark = null, int size = 0)
        {
            try
            {
                return new Results<Transactions.Transactions[]>()
                {
                    Contents = new Transactions_Service(app.Settings).ReadMultiple(
                        new Transactions_Filter[]
                            { new Transactions_Filter() { Criteria = agent, Field = Transactions_Fields.Agent_Code } },
                        bookmark, size)
                };
            }
            catch (Exception e)
            {
                return new Results<Transactions.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/gettodayvehicletrans")]
        public Results<Transactions.Transactions[]> getvehicletransactions(Request request)
        {
            try
            {
            Log.Information(request.date.ToString());
                return new Results<Transactions.Transactions[]>()
                {
                    Contents = new Transactions_Service(app.Settings).ReadMultiple(
                        new Transactions_Filter[]
                            { new Transactions_Filter() { Criteria = request.vehicle, Field = Transactions_Fields.Loan_No } ,new Transactions_Filter() { Criteria = request.date.Date.ToString("MM/dd/yyyy"), Field = Transactions_Fields.Transaction_Date }},
                       request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                Log.Error(e,"gettodayvehtrans");
                return new Results<Transactions.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/transactions")]
        public Results<Transactions.Transactions> settransactions(Transactions.Transactions trans)
        {
            try
            {
                using (var service = new Transactions_Service(app.Settings))
                {
                    var t = service.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = trans.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = trans.OTTN, Field = Transactions_Fields.OTTN } }, null, 0).FirstOrDefault();
                    if (t == null)
                        service.Create(ref trans);

                    return new Results<Transactions.Transactions>()
                    {
                        Contents = trans
                    };
                }
            }
            catch (Exception e)
            {
                return new Results<Transactions.Transactions>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost]
        [Route("api/transheader")]
        public Results<Mbranch_Header.Mbranch_Header> settranheader(Mbranch_Header.Mbranch_Header trans)
        {
            try
            {
                using (var service = new Mbranch_Header_Service(app.Settings))
                {
                    var t = service.ReadMultiple(new Mbranch_Header_Filter[] { new Mbranch_Header_Filter { Criteria = trans.Receipt_No, Field = Mbranch_Header_Fields.Receipt_No } }, null, 0).FirstOrDefault();
                    if (t == null)
                        service.Create(ref trans);

                    return new Results<Mbranch_Header.Mbranch_Header>()
                    {
                        Contents = trans
                    };
                }
            }
            catch (Exception e)
            {
                return new Results<Mbranch_Header.Mbranch_Header>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/transtypes")]
        public Results<Transtypes.Transtypes[]> gettranstypes(ClientRequest request)
        {
            try
            {
                return new Results<Transtypes.Transtypes[]>()
                {
                    Contents = new Transtypes_Service(app.Settings).ReadMultiple(
                        new Transtypes_Filter[]
                            {  },
                        request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Transtypes.Transtypes[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/members")]
        public Results<Members.Members3[]> getmembers(ClientRequest request)
        {
            try
            {
                return new Results<Members.Members3[]>()
                {
                    Contents = new Members3_Service(app.Settings).ReadMultiple(
                        new Members3_Filter[] { }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Members.Members3[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/vehicles")]
        public Results<VehiclesBasics.VehiclesBasics[]> getvehicles(ClientRequest request)
        {
            try
            {
                return new Results<VehiclesBasics.VehiclesBasics[]>()
                {
                    Contents = new VehiclesBasics_Service(app.Settings).ReadMultiple(
                        new VehiclesBasics_Filter[] { }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<VehiclesBasics.VehiclesBasics[]>() { Code = -1, Desc = e.Message };
            }
        } [HttpPost]
        [Route("api/vehiclesstatistics")]
        public Results<Vehicles.Vehicles[]> getvehiclesstatistics(Request request)
        {
            try
            {
                return new Results<Vehicles.Vehicles[]>()
                {
                    Contents = new Vehicles_Service(app.Settings).ReadMultiple(
                        new Vehicles_Filter[] { new Vehicles_Filter { Criteria = request.vehicle,Field = Vehicles_Fields.Vehicle_Number } }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Vehicles.Vehicles[]>() { Code = -1, Desc = e.Message };
            }
        }
    }
    public partial class Request : ClientRequest
    {
        public string vehicle { get; set; }
        public DateTime date { get; set; }

    }
}
