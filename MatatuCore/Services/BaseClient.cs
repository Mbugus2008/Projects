using DeportnFuel;
using Logging;
using MatatuCore.Controllers;
using MatatuCore.Models.Database;
using Member;
using NRODefect;
using Reversal;
using System.Text.Json;
using System.Text.Json.Serialization;
using TransAmounts;
using Vbasics;
using Vcrews;
using VehicleCollection;

namespace MatatuCore.Services
{
    public  class BaseClient : Iclient
    {
        public BaseClient(Client client)
        {
            client_setting = client;


        }


        // This is the base class for all client services, providing default implementations and properties.
        public virtual Matatu_Settings settings 
        {
            get
            {
                // Get the current UTC time
                DateTime utcNow = DateTime.UtcNow;

                // Define the target time zone (e.g., "East Africa Time")
                TimeZoneInfo targetTimeZone = TimeZoneInfo.FindSystemTimeZoneById("E. Africa Standard Time"); // For East Africa

                // Convert UTC to the target time zone
                DateTime targetTime = TimeZoneInfo.ConvertTimeFromUtc(utcNow, targetTimeZone);

                return new Matatu_Settings(targetTime) ;
            }
        }
        public virtual string LogFolder => "NoClient";
        public virtual Client? client_setting { get; set; }
        public virtual Agents.Users_PortClient user_service { get; set; } = new Agents.Users_PortClient();
        public virtual Trans.Transactions_PortClient transaction_service { get; set; }
        public virtual Expense.Expenses_PortClient expense_service { get; set; }
        public virtual Hire.Hires_PortClient hires_service { get; set; }
        public virtual NRODefects_PortClient nro_service { get; set; }
        public virtual Mbranch_Hd.Mbranch_Header_PortClient transheader_service { get; set; }
        public virtual Reversal.Reversals_PortClient reversal_service { get; set; }
        public virtual Ttypes.Transtypes_PortClient types_service { get; set; }
        public virtual TransAmounts.Tamounts_PortClient tamounts_service { get; set; }
        public virtual VehicleCollection.Vehicle_Daily_Collection_PortClient vehicle_collection_service { get; set; }
        // This service is used to manage deport and fuel transactions
        public virtual DeportnFuel.Deport_n_Fuel_PortClient deportn_fuel_service { get; set; }
        // This service is used to manage posting transactions  
        public virtual Posting.MBranch_PortClient posting_service { get; set; }
        public virtual Member.Members_PortClient members_service { get; set; }
        public virtual Vbasics.VehiclesBasics_PortClient vehicle_service { get; set; }
        public virtual VehicleCrews_PortClient vcrew_service { get; set; } = new VehicleCrews_PortClient();


        public virtual Agents.Users[] Users()
                    {

            var aes = new AesEncryption();
        // var key=    aes.GenerateAesKey(256);

            var userss = user_service.ReadMultiple(new Agents.Users_Filter[] { }, null, 0);
            foreach (var user in userss)
            {
                user.Password = aes.Encrypt(user.Password);
            }

            return userss;
        }
        public virtual Expense.Expenses[] expences()
        {
            return expense_service.ReadMultiple(new Expense.Expenses_Filter[] { }, null, 0);
        }
        public virtual Hire.Hires[] hires()
        {
            return hires_service.ReadMultiple(new Hire.Hires_Filter[] { }, null, 0);
        }
        public virtual NRODefects[] nrodefects()
        {
            return nro_service.ReadMultiple(new NRODefects_Filter[] { }, null, 0);
        }
        public virtual Hire.Hires addhire(Hire.Hires hire)
        {
            hire.Hire_TypeSpecified = true;
            hire.Payment_MethodsSpecified = true;
            hire.Vat_TypeSpecified = true;
            hire.ClientSpecified = true;
            hire.AmountSpecified = true;
            var hr = hires_service.Read(hire.Code);
            if (hr == null)
            {
                hires_service.Create(ref hire);
            }
            else
            {
                hire.Key = hr.Key;
                hires_service.Update(ref hire);
            }
            return hire;
        }
        public virtual Member.Members addphone(Member.Members member) { 

        var m = members_service.Read(member.No);
            if (member == null) { throw new Exception("Member Not Found"); }
            m.Phone_No = member.Phone_No;
            members_service.Update(ref m);

            return m;
        }
        public virtual Mbranch_Hd.Mbranch_Header settranheader(Mbranch_Hd.Mbranch_Header header)
        {
           
            header.DateSpecified = true; 
            header.ReversalSpecified = true;
            header.Time_CreatedSpecified = true;  
            header.TransSpecified = true;
            header.ReversalSpecified = true;
            header.TransSpecified = true;
            header.Total_AmountSpecified = true;
        
            var t = transheader_service.ReadMultiple(new Mbranch_Hd.Mbranch_Header_Filter[] { new Mbranch_Hd.Mbranch_Header_Filter { Criteria = header.Receipt_No, Field = Mbranch_Hd.Mbranch_Header_Fields.Receipt_No } }, null, 0).FirstOrDefault();
            if (t == null)
                transheader_service.Create(ref header);
            else header = t;
            return header;



        }
        public virtual Trans.Transactions settransactions(Trans.Transactions trans)
        {
            if (string.IsNullOrEmpty(trans.Document_No)) { throw new Exception("Document No Required"); }
            if (trans.Amount == 0) { throw new Exception("Amount must have a Value"); }
            if (string.IsNullOrEmpty(trans.Type)) { throw new Exception("Type Required"); }
            if (string.IsNullOrEmpty(trans.Agent_Code)) { throw new Exception("Agent Code Required"); }

            trans.Transaction_DateSpecified = true;
            trans.AmountSpecified = true;
            trans.Transaction_Time = new DateTime(trans.Transaction_Date.Year, trans.Transaction_Date.Month, trans.Transaction_Date.Day, trans.Transaction_Time.Hour, trans.Transaction_Time.Minute, trans.Transaction_Time.Second);
            trans.Creation_time = trans.Transaction_Time;
            trans.Creation_timeSpecified = true;
            trans.Transaction_TimeSpecified = true;
            var t = transaction_service.ReadMultiple(new Trans.Transactions_Filter[] { new Trans.Transactions_Filter { Criteria = trans.Document_No, Field = Trans.Transactions_Fields.Document_No }, new Trans.Transactions_Filter { Criteria = trans.OTTN, Field = Trans.Transactions_Fields.OTTN } }, null, 0).FirstOrDefault();
            if (t == null)
                transaction_service.Create(ref trans);
            else
                return t;

            return trans;

        }
        public virtual Trans.Transactions[] GetTransactions(string agent, string bookmark = null, int size = 0)
        {
            var filters = new Trans.Transactions_Filter[]
{
        new() { Field = Trans.Transactions_Fields.Agent_Code, Criteria = agent }

};
            return GetFilteredTransactions(
              filters: filters,

              bookmark: bookmark,
              size: size
          );
        }

        public virtual Trans.Transactions[] GetTransactions_byDates(Request request) {
        
        var filters = new Trans.Transactions_Filter[]
{
        new() { Field = Trans.Transactions_Fields.Transaction_Date, Criteria = request.datefilter }

};
            return GetFilteredTransactions(
              filters: filters,

              bookmark: request.bookmark,
              size: request.size
          );
        }


        public virtual Trans.Transactions[] getvehicletransactions(Request request)
        {
            var filters = new Trans.Transactions_Filter[]
    {
        new() { Field = Trans.Transactions_Fields.Loan_No, Criteria = request.vehicle },
        new() { Field = Trans.Transactions_Fields.Transaction_Date, Criteria = $"{request.date:MM/dd/yyyy}" }
    };
            return GetFilteredTransactions(
        filters: filters,

        bookmark: null,
        size: 0
    );
        }
        public virtual Reversal.Reversals[] getreversals(string agent)
        {
            return reversal_service.ReadMultiple(new Reversal.Reversals_Filter[] { new Reversal.Reversals_Filter { Criteria = agent, Field = Reversal.Reversals_Fields.Created_By } }, null, 0);
        }
        public virtual Ttypes.Transtypes[] gettypes()
        {
            return types_service.ReadMultiple(new Ttypes.Transtypes_Filter[] { new Ttypes.Transtypes_Filter { Field = Ttypes.Transtypes_Fields.Active,Criteria = "Yes" } }, null, 0);
        }
        public virtual Reversal.Reversals setreversals(Reversal.Reversals request)
        {
            request.DateSpecified = true;
            request.StatusSpecified = true;
            request.Total_AmountSpecified = true;
            request.Total_TransSpecified = true;
            request.Transction_DateSpecified = true;
            var rev = reversal_service.ReadMultiple(
                    new Reversals_Filter[]
                        {
                                new Reversals_Filter { Criteria = request.Agent, Field = Reversals_Fields.Created_By } ,
                                new Reversals_Filter { Criteria = request.Receipt_No, Field = Reversals_Fields.Receipt_No } },
                    null, 0).FirstOrDefault();
            if (rev == null)
            {
                rev = request;
                reversal_service.Create(ref rev);
                return rev
                 ;
            }
            else
            {

                request.Key = rev.Key;
                reversal_service.Update(ref request);
                return request
                ;
            }

        }
        protected virtual Trans.Transactions[] GetFilteredTransactions(Trans.Transactions_Filter[] filters, string bookmark = null, int size = 0)
        {

            return transaction_service.ReadMultiple(filters, bookmark, size);
        }
        public virtual TransAmounts.Tamounts[] getamounts(ClientRequest request)
        {
            return tamounts_service.ReadMultiple(
                            Array.Empty<Tamounts_Filter>(),
                            request.bookmark, request.size);
        }
        public virtual VehicleCollection.Vehicle_Daily_Collection[] Dailytrans(Request request)
        {

            String dat = request.date.ToString("MM/dd/yyyy");
            return vehicle_collection_service.ReadMultiple(
                            new Vehicle_Daily_Collection_Filter[]
                                { new Vehicle_Daily_Collection_Filter{ Criteria = dat, Field = Vehicle_Daily_Collection_Fields.Date_Filter} },
                            request.bookmark, request.size);


        }
        // This method is used to get daily transactions for vehicles based on the provided request parameters.
        public virtual DeportnFuel.Deport_n_Fuel[] deportdata(Request request)
        {

            return deportn_fuel_service.ReadMultiple(
                new Deport_n_Fuel_Filter[] { new Deport_n_Fuel_Filter { Criteria = request.date.ToString("MM/dd/yyyy"), Field = Deport_n_Fuel_Fields.Date } },
                request.bookmark, request.size);

        }
        public virtual DeportnFuel.Deport_n_Fuel setdeportdata(Deport_n_Fuel request)
        {
            request.Amount_PaidSpecified = true;
            request.FuelSpecified = true;
            request.On_routeSpecified = true;
            request.Total_LitresSpecified = true;
            request.BalanceSpecified = true;
            request.Net_OffloadSpecified = true;
            request.Run_BackSpecified = true;

            var dep = deportn_fuel_service.ReadMultiple(
                new Deport_n_Fuel_Filter[] { new Deport_n_Fuel_Filter { Criteria = request.Vehicle, Field = Deport_n_Fuel_Fields.Vehicle }, new Deport_n_Fuel_Filter { Criteria = request.Date.ToString("MM/dd/yyyy"), Field = Deport_n_Fuel_Fields.Date } },
                null, 0).FirstOrDefault();
            if (dep == null)
            {
                deportn_fuel_service.Create(ref request);
                return request;
            }
            else
            {
                request.Key = dep.Key;
                deportn_fuel_service.Update(ref request);
                return request;
            }


        }

        public virtual Member.Members[] getmembers(ClientRequest request)
        {
            
            return members_service.ReadMultiple(
                new Members_Filter[] { },
                request.bookmark, request.size);
        }
        public virtual Members updatecrew(Members request)
        {
            Members m = members_service.Read(request.No);
            if (m != null)
            {
                //request.Key = m.Key;
                m.Vehicle = request.Vehicle;

                //request.Crew_TypeSpecified = true;
                members_service.Update(ref m);
            }
            return request;
        }
        public virtual Vbasics.VehiclesBasics[] getvehicles(ClientRequest request)
        {
            return vehicle_service.ReadMultiple(
                new VehiclesBasics_Filter[] { },
                request.bookmark, request.size);
        }

        public virtual VehicleCrews[] getvehicleCrews(ClientRequest request)
        {
            return vcrew_service.ReadMultiple(
                new VehicleCrews_Filter[] { },
                request.bookmark, request.size);
        }
    }


public class DateTimeConverterUsingDateTimeParse : JsonConverter<DateTime>
    {
        private readonly string _format;
        public DateTimeConverterUsingDateTimeParse(string format)
        {
            _format = format;
        }

        public override DateTime Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
            => DateTime.Parse(reader.GetString());

        public override void Write(Utf8JsonWriter writer, DateTime value, JsonSerializerOptions options)
            => writer.WriteStringValue(value.ToString(_format));
    }
}
