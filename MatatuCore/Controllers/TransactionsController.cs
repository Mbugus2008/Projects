using DeportnFuel;
using ExternalTrans;
using Logging;
using MatatuCore.Helpers;
using Member;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Mtransaction;
using Vbasics;
using Vcrews;
using VehicleCollection;
using VehicleExpenses;

namespace MatatuCore.Controllers
{public partial class Request : ClientRequest
        {
        public string? vehicle { get; set; }
        public string? Agent { get; set; }
        public DateTime date { get; set; } = DateTime.Now;
        public string? datefilter { get; set; } 
     
        public string? Otp { get; set; }
        public string? phone { get; set; }
        public string? Otp_message { get; set; }
  
    }

     public partial class MatatuController : ControllerBase
    {
        
        [HttpGet("get")]
      
        public Results<Trans.Transactions[]> gettransactions(string agent, string bookmark = null, int size = 0)
        {
            try
            {
                return new Results<Trans.Transactions[]>()
                {
                    Contents = client.GetTransactions(agent, bookmark, size)
                };
            }
            catch (Exception e)
            {
                return new Results<Trans.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("gettodayvehicletrans")]
        
        public Results<Trans.Transactions[]> getvehicletransactions(Request request)
        {
            try
            {

                return new Results<Trans.Transactions[]>()
                {
                    Contents = client.getvehicletransactions(request)
                };
            }
            catch (Exception e)
            {
               
                return new Results<Trans.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("gettransactionsbydate")]

        public Results<Trans.Transactions[]> gettransactionsbydate(Request request)
        {
            try
            {

                return new Results<Trans.Transactions[]>()
                {
                    Contents = client.GetTransactions_byDates(request)
                };
            }
            catch (Exception e)
            {

                return new Results<Trans.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("getvehicletrans")]
        public Results<Trans.Transactions[]> getvehtransactions(Request request)
        {
            try
            {
                return new Results<Trans.Transactions[]>()
                {
                    Contents = client.getvehicletransactions(request)
                };
            }
            catch (Exception e)
            {

                return new Results<Trans.Transactions[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("transactions")]
      
        public Results<Trans.Transactions> settransactions(Trans.Transactions trans)
        {
            try
            {

                return new Results<Trans.Transactions>()
                {
                    Contents = client.settransactions(trans)
                };
            }
            catch (Exception e)
            {
                logger.LogError(e, "Error in settransactions");
                return new Results<Trans.Transactions>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("transheader")]
        
        public Results< Mbranch_Hd.Mbranch_Header> settranheader(Mbranch_Hd.Mbranch_Header trans)
        {
            try
            {
                return new Results<Mbranch_Hd.Mbranch_Header>()
                {
                    Contents = client.settranheader(trans)
                };
            }
            catch (Exception e)
            {
                return new Results<Mbranch_Hd.Mbranch_Header>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("transtypes")]
        
        public Results<Ttypes.Transtypes[]> gettranstypes()
        {
            try
            {
                return new Results<Ttypes.Transtypes[]>()
                {
                    Contents = client.gettypes()
                };
            }
            catch (Exception e)
            {
                return new Results<Ttypes.Transtypes[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("Reversals")]
        
        public Results<Reversal.Reversals> setreversals(Reversal.Reversals request)
        {
            try
            {
               return new Results<Reversal.Reversals> { Contents = client.setreversals(request) };


            }
            catch (Exception e)
            {
                return new Results<Reversal.Reversals>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("GetReversals")]
      
        public Results<Reversal.Reversals[]> getReversals(Request request)
        {
            try
            {
                return new Results<Reversal.Reversals[]>()
                {
                    Contents = client.getreversals(request.Agent)
                };
            }
            catch (Exception e)
            {
                return new Results<Reversal.Reversals[]>() { Code = -1, Desc = e.Message };
            }
        }
        //[HttpPost]
        //[Route("api/accounttypes")]
        //public Results<Account_Types.Account_Types[]> getaccounttypes(ClientRequest request)
        //{
        //    try
        //    {
        //        return new Results<Account_Types.Account_Types[]>()
        //        {
        //            Contents = new Account_Types_Service(my_app.Settings).ReadMultiple(
        //                new Account_Types_Filter[]
        //                    {  },
        //                request.bookmark, request.size)
        //        };
        //    }
        //    catch (Exception e)
        //    {
        //        return new Results<Account_Types.Account_Types[]>() { Code = -1, Desc = e.Message };
        //    }
        //}
        [HttpPost("transtypesamounts")]
       
        public Results<TransAmounts.Tamounts[]> gettranstypesamounts(ClientRequest request)
        {
            try
            {
                return new Results<TransAmounts.Tamounts[]>()
                {
                    Contents = client.getamounts(request)
                };
            }
            catch (Exception e)
            {
                return new Results<TransAmounts.Tamounts[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("Dailytrans")]
        
        public Results<Vehicle_Daily_Collection[]> Dailytrans(Request request)
        {
            try
            {
                String dat = request.date.ToString("MM/dd/yyyy");

                return new Results<Vehicle_Daily_Collection[]>()
                {
                    Contents = client.Dailytrans(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Vehicle_Daily_Collection[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("getdepotdata")]
        
        public Results<Deport_n_Fuel[]> deportdata(Request request)
        {
            try
            {
                
               
                var list = client.deportdata(request);
                return new Results<Deport_n_Fuel[]>()
                {
                    Contents = list
                };
            }
            catch (Exception e)
            {
                return new Results<Deport_n_Fuel[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("setdepotdata")]
      
        public Results<Deport_n_Fuel> setdeportdata(Deport_n_Fuel request)
        {
            try
            {

            return new Results<Deport_n_Fuel>() { Contents = client.setdeportdata(request) };
            }
            catch (Exception e)
            {
                Logging.Logging.ReportError(e);
                return new Results<Deport_n_Fuel>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("members")]
        
        public Results<Members[]> getmembers(ClientRequest request)
        {
            try
            {
                return new Results<Members[]>()
                {
                    Contents =client.getmembers(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Members[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("updatephone")]

        public Results<Members> updatephone(Members request)
        {
            try
            {
                return new Results<Members>()
                {
                    Contents = client.addphone(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Members>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("updatecrew")]
       
        public Results<Members> updatecrew(Members request)
        {
            try
            {
              
                return new Results<Members>()
                {
                    Contents = client.updatecrew(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Members>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("vehicles")]
        
        public Results<VehiclesBasics[]> getvehicles(ClientRequest request)
        {
            try
            {
                return new Results<VehiclesBasics[]>()
                {
                    Contents = client.getvehicles(request)
                };
            }
            catch (Exception e)
            {
                return new Results<VehiclesBasics[]>() { Code = -1, Desc = e.Message };
            }
        }
        [HttpPost("vehiclecrew")]
        
        public Results<VehicleCrews[]> getvehicleCrews(ClientRequest request)
        {
            try
            {
                return new Results<VehicleCrews[]>()
                {
                    Contents = client.getvehicleCrews(request)
                };
            }
            catch (Exception e)
            {
                return new Results<VehicleCrews[]>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("vehiclesstatistics")]
   
        public Results<VehiclesBasics[]> getvehiclesstatistics(Request request)
        {
            try
            {
                return new Results<VehiclesBasics[]>()
                {
                    Contents = client.getvehicles(request)
                };
            }
            catch (Exception e)
            {
                return new Results<VehiclesBasics[]>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("getexpenses")]
        public Results<VehicleExpenses.Vehicle_Expenses[]> getexpenses()
        {
            try
            {
                return new Results<VehicleExpenses.Vehicle_Expenses[]>()
                {
                    Contents = client.getvehicleexpenses()
                };
            }
            catch (Exception e)
            {
                return new Results<VehicleExpenses.Vehicle_Expenses[]>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("setexpenses")]
        public Results<VehicleExpenses.Vehicle_Expenses> setexpenses(VehicleExpenses.Vehicle_Expenses request)
        {
            try
            {
                return new Results<VehicleExpenses.Vehicle_Expenses>()
                {
                    Contents = client.setvehicleexpenses(request)
                };
            }
            catch (Exception e)
            {
                return new Results<VehicleExpenses.Vehicle_Expenses>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("mtransactions")]
        [Authorize(Policy = "ApiKey")]
        public Results<Mtransaction.Mtransactions> setmtransactions(Mtransaction.Mtransactions request)
        {
            try
            {
                return new Results<Mtransaction.Mtransactions>()
                {
                    Contents = client.setmtransactions(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Mtransaction.Mtransactions>() { Code = -1, Desc = e.Message };
            }
        }

        [HttpPost("vehiclecollection")]
        public Results<Vehicle_Daily_Collection[]> vehiclecollection(Request request)
        {
            try
            {
                return new Results<Vehicle_Daily_Collection[]>()
                {
                    Contents = client.Dailytrans(request)
                };
            }
            catch (Exception e)
            {
                return new Results<Vehicle_Daily_Collection[]>() { Code = -1, Desc = e.Message };
            }
        }

    }
}
