using Logging;
using Matatu_Rest.Account_Types;
using Matatu_Rest.Clients;
using Matatu_Rest.Deport_n_Fuel;
using Matatu_Rest.Mbranch_Header;
using Matatu_Rest.Members;
using Matatu_Rest.Reversals;
using Matatu_Rest.Tamounts;
using Matatu_Rest.Transactions;
using Matatu_Rest.Transtypes;
using Matatu_Rest.Vehicle_Daily_Collection;
using Matatu_Rest.VehicleCrews;
using Matatu_Rest.Vehicles;
using Matatu_Rest.VehiclesBasics;
using Serilog;
using System;
using System.Linq;
using System.Web.Http;

namespace Matatu_Rest.Controllers
{
    public class CollectionsController : ApiController
    {

        Iclient client = new Metro();

        [HttpGet]
        [Route("api/get")]
        public Results<Transactions.Transactions[]> gettransactions(string agent, string bookmark = null, int size = 0)
        {
            try
            {
                return new Results<Transactions.Transactions[]>()
                {
                    Contents = new Transactions_Service(my_app.Settings).ReadMultiple(
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
                    Contents = new Transactions_Service(my_app.Settings).ReadMultiple(
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
        }  [HttpPost]
        [Route("api/getvehicletrans")]
        public Results<Transactions.Transactions[]> getvehtransactions(Request request)
        {
            try
            {
                Log.Information(request.date.ToString());
                return new Results<Transactions.Transactions[]>()
                {
                    Contents = new Transactions_Service(my_app.Settings).ReadMultiple(
                        new Transactions_Filter[]
                            { new Transactions_Filter() { Criteria = request.vehicle, Field = Transactions_Fields.Loan_No } ,
new Transactions_Filter() { Criteria = request.date.Date.ToString("MM/dd/yyyy"), Field = Transactions_Fields.Transaction_Date },
new Transactions_Filter() { Criteria = request.vehicle, Field = Transactions_Fields.Loan_No }
                    }, request.bookmark, request.size)
                                    };
            }
            catch (Exception e)
            {
                Log.Error(e, "gettodayvehtrans");
                return new Results<Transactions.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/transactions")]
        public Results<Transactions.Transactions> settransactions(Transactions.Transactions trans)
        {
            try
            {
               //return client.settransactions(trans);
                using (var service = new Transactions_Service(my_app.Settings))
                {
                    if (string.IsNullOrEmpty(trans.Document_No)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Document No Required" }; }
                    //if (string.IsNullOrEmpty(trans.Loan_No )) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Vehicle No Required" }; }
                    if (trans.Amount == 0) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Amount must have a Value" }; }
                    if (string.IsNullOrEmpty(trans.Type)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Type Required" }; }

                    //if (trans.Transaction_Date < DateTime.Now.AddDays(-2)) { trans.Transaction_Date = DateTime.Today.Date; }// return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Date Required" }; }
                    if (string.IsNullOrEmpty(trans.Agent_Code)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Agent Code Required" }; }
                    //if (trans.Transaction_Time < DateTime.Now.AddDays(-2)) { return new Results<Transactions.Transactions>() { Code = -1, Desc = "Transaction Time Required" }; }
                    trans.Transaction_DateSpecified = true;
                    trans.AmountSpecified = true;
                    trans.Transaction_Time =new DateTime(trans.Transaction_Date.Year, trans.Transaction_Date.Month, trans.Transaction_Date.Day,trans.Transaction_Time.Hour,trans.Transaction_Time.Minute,trans.Transaction_Time.Second);
                    trans.Creation_time = trans.Transaction_Time;
                    trans.Creation_timeSpecified = true;
                    trans.Transaction_TimeSpecified = true;
                    var t = service.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = trans.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = trans.OTTN, Field = Transactions_Fields.OTTN } }, null, 0).FirstOrDefault();
                    if (t == null)
                        service.Create(ref trans);
                    else 
                        return new Results<Transactions.Transactions>() { Contents= t };

                    return new Results<Transactions.Transactions>()
                    {
                        Contents = trans
                    };
                }
            }
            catch (Exception e)
            {
                Log.Error(e, "transactions");
                return new Results<Transactions.Transactions>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost]
        [Route("api/transheader")]
        public Results<Mbranch_Header.Mbranch_Header> settranheader(Mbranch_Header.Mbranch_Header trans)
        {
            try
            {
                using (var service = new Mbranch_Header_Service(my_app.Settings))
                {
                    var t = service.ReadMultiple(new Mbranch_Header_Filter[] { new Mbranch_Header_Filter { Criteria = trans.Receipt_No, Field = Mbranch_Header_Fields.Receipt_No } }, null, 0).FirstOrDefault();
                    if (t == null)
                        service.Create(ref trans);
                    else trans = t;
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
                    Contents = new Transtypes_Service(my_app.Settings).ReadMultiple(
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
        [Route("api/Reversals")]
        public Results<Reversals.Reversals> getreversals(Reversals.Reversals request)
        {
            try
            {
                request.DateSpecified = true;
                request.StatusSpecified = true;
                request.Total_AmountSpecified = true;
                request.Total_TransSpecified = true;
                request.Transction_DateSpecified = true;
                var rev = new Reversals_Service(my_app.Settings).ReadMultiple(
                        new Reversals_Filter[]
                            {
                                new Reversals_Filter { Criteria = request.Agent, Field = Reversals_Fields.Created_By } ,
                                new Reversals_Filter { Criteria = request.Receipt_No, Field = Reversals_Fields.Receipt_No } },
                        null, 0).FirstOrDefault();
                if (rev == null)
                {
                    rev = request;
                    new Reversals_Service(my_app.Settings).Create(ref rev);
                    return new Results<Reversals.Reversals>()
                    {
                        Contents = rev
                    };
                }
                else
                {

                    request.Key = rev.Key;
                    new Reversals_Service(my_app.Settings).Update(ref request);
                    return new Results<Reversals.Reversals>()
                    {
                        Contents = request
                    };
                }


            }
            catch (Exception e)
            {
                return new Results<Reversals.Reversals>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/GetReversals")]
        public Results<Reversals.Reversals[]> getReversals(Request request)
        {
            try
            {
                return new Results<Reversals.Reversals[]>()
                {
                    Contents = new Reversals.Reversals_Service(my_app.Settings).ReadMultiple(
                        new  Reversals_Filter[]
                            {  new Reversals_Filter { Criteria = request.Agent, Field = Reversals_Fields.Created_By } },
                        request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Reversals.Reversals[]>() { Code = -1, Desc = e.Message };
            }
        } 
   [HttpPost]
        [Route("api/accounttypes")]
        public Results<Account_Types.Account_Types[]> getaccounttypes(ClientRequest request)
        {
            try
            {
                return new Results<Account_Types.Account_Types[]>()
                {
                    Contents = new Account_Types_Service(my_app.Settings).ReadMultiple(
                        new Account_Types_Filter[]
                            {  },
                        request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Account_Types.Account_Types[]>() { Code = -1, Desc = e.Message };
            }
        } 
        [HttpPost][Route("api/transtypesamounts")]
        public Results<Tamounts.Tamounts[]> gettranstypesamounts(ClientRequest request)
        {
            try
            {
                return new Results<Tamounts.Tamounts[]>()
                {
                    Contents = new Tamounts_Service(my_app.Settings).ReadMultiple(
                        new Tamounts_Filter[]
                            {  },
                        request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Tamounts.Tamounts[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/Dailytrans")]
        public Results<Vehicle_Daily_Collection.Vehicle_Daily_Collection[]> Dailytrans(Request request)
        {
            try
            {
                String dat = request.date.ToString("MM/dd/yyyy");

                return new Results<Vehicle_Daily_Collection.Vehicle_Daily_Collection[]>()
                {
                    Contents = new Vehicle_Daily_Collection.Vehicle_Daily_Collection_Service(my_app.Settings).ReadMultiple(
                        new Vehicle_Daily_Collection_Filter[]
                            { new Vehicle_Daily_Collection_Filter{ Criteria = dat, Field = Vehicle_Daily_Collection_Fields.Date_Filter} },
                        request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Vehicle_Daily_Collection.Vehicle_Daily_Collection[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/getdepotdata")]
        public Results<Deport_n_Fuel.Deport_n_Fuel[]> deportdata(Request request)
        {
            try
            {
                String dat = request.date.ToString("MM/dd/yyyy");new Mbranch.MBranch(my_app.Settings).PopulateDepot(request.date);
                var list = new Deport_n_Fuel_Service(my_app.Settings).ReadMultiple(
                        new Deport_n_Fuel_Filter[]
                            { new Deport_n_Fuel_Filter{ Criteria = dat, Field = Deport_n_Fuel_Fields.Date} },
                        request.bookmark, request.size);
                return new Results<Deport_n_Fuel.Deport_n_Fuel[]>()
                {
                    Contents = list
                };
            }
            catch (Exception e)
            {
                return new Results<Deport_n_Fuel.Deport_n_Fuel[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/setdepotdata")]
        public Results<Deport_n_Fuel.Deport_n_Fuel> setdeportdata(Deport_n_Fuel.Deport_n_Fuel request)
        {
            try
            {

                request.Amount_PaidSpecified = true;
                request.FuelSpecified = true;
                request.On_routeSpecified = true;
                request.Total_LitresSpecified = true;
               request.BalanceSpecified = true;
                request.Net_OffloadSpecified = true;
                request.Run_BackSpecified = true;
                
                var d = new Deport_n_Fuel_Service(my_app.Settings).ReadMultiple(new Deport_n_Fuel_Filter[] { new Deport_n_Fuel_Filter { Criteria = request.Vehicle, Field = Deport_n_Fuel_Fields.Vehicle }, new Deport_n_Fuel_Filter { Criteria = request.Date.ToString(), Field = Deport_n_Fuel_Fields.Date } }, null, 0).FirstOrDefault(); ;
                if (d != null) { request.Key = d.Key; }
                new Deport_n_Fuel_Service(my_app.Settings).Update(ref request);
                return new Results<Deport_n_Fuel.Deport_n_Fuel>()
                {
                    Contents = request
                };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Deport_n_Fuel.Deport_n_Fuel>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/members")]
        public Results<Members.Members[]> getmembers(ClientRequest request)
        {
            try
            {
                return new Results<Members.Members[]>()
                {
                    Contents = new Members_Service(my_app.Settings).ReadMultiple(
                        new Members_Filter[] { }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<Members.Members[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost]
        [Route("api/updatecrew")]
        public Results<Members.Members> updatecrew(Members.Members request)
        {
            try
            {
                Members.Members m = new Members_Service(my_app.Settings).Read(request.No);
                if (m != null)
                {
                    request.Key = m.Key;
                    request.Crew_TypeSpecified = true;
                    new Members_Service(my_app.Settings).Update(ref request);
                }
                return new Results<Members.Members>()
                {
                    Contents = request
                };
            }
            catch (Exception e)
            {
                return new Results<Members.Members>() { Code = -1, Desc = e.Message };
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
                    Contents = new VehiclesBasics_Service(my_app.Settings).ReadMultiple(
                        new VehiclesBasics_Filter[] { }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<VehiclesBasics.VehiclesBasics[]>() { Code = -1, Desc = e.Message };
            }
        }
            [HttpPost]
        [Route("api/vehiclecrew")]
        public Results<VehicleCrews.VehicleCrews[]> getvehicleCrews(ClientRequest request)
        {
            try
            {
                return new Results<VehicleCrews.VehicleCrews[]>()
                {
                    Contents = new VehicleCrews_Service(my_app.Settings).ReadMultiple(
                        new VehicleCrews_Filter[] { }, request.bookmark, request.size)
                };
            }
            catch (Exception e)
            {
                return new Results<VehicleCrews.VehicleCrews[]>() { Code = -1, Desc = e.Message };
            }
        }
        
        [HttpPost]
        [Route("api/vehiclesstatistics")]
        public Results<Vehicles.Vehicles[]> getvehiclesstatistics(Request request)
        {
            try
            {
                return new Results<Vehicles.Vehicles[]>()
                {
                    Contents = new Vehicles_Service(my_app.Settings).ReadMultiple(
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
        public string Agent { get; set; }
        public DateTime date { get; set; } = DateTime.Now;

    }
   
    public class TokenController : ApiController
    {
       
    }
}
