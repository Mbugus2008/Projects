using DeportnFuel;
using Entries;
using ExternalTrans;
using Loan;
using LoanShedules;
using Logging;
using Mtransaction;
using VehicleExpenses;
using MatatuCore.Controllers;
using MatatuCore.Models.Database;
using Member;
using MemberAccounts;
using NRODefect;
using ParcelDetails;
using Reversal;
using System.Text.Json;
using System.Text.Json.Serialization;
using TransAmounts;
using Vbasics;
using Vcrews;
using VehicleCollection;

namespace MatatuCore.Services
{
    public class BaseClient : Iclient
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

                return new Matatu_Settings(targetTime);
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
        public virtual Parcels.Parcel_PortClient parcel_service { get; set; }
        public virtual Parcel_Details_PortClient parceldetails_service { get; set; }
        public virtual VehicleCrews_PortClient vcrew_service { get; set; } = new VehicleCrews_PortClient();
        public virtual Loan.Loans_PortClient loans_service { get; set; } = new Loan.Loans_PortClient();
        public virtual Accounts_PortClient accounts_service { get; set; } = new Accounts_PortClient();

        public virtual Entries.AccountEntries_PortClient entries_service { get; set; }

        public virtual Mtransaction.Mtransactions_PortClient mtransaction_service { get; set; }

        public virtual Vehicle_Expenses_PortClient vehicle_expenses_service { get; set; }

        public virtual Location.Locations_PortClient location_service { get; set; }

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
        public virtual Location.Locations[] getlocations()
        {
            return location_service.ReadMultiple(null, null, 0);
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
        public virtual Member.Members addphone(Member.Members member)
        {

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

        public virtual Trans.Transactions[] GetTransactions_byDates(Request request)
        {

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
            return types_service.ReadMultiple(new Ttypes.Transtypes_Filter[] { new Ttypes.Transtypes_Filter { Field = Ttypes.Transtypes_Fields.Active, Criteria = "Yes" } }, null, 0);
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
        public virtual VehicleCollection.Vehicle_Daily_Collection[] Dailyvehtrans(Request request)
        {

            String dat = request.date.ToString("MM/dd/yyyy");
            return vehicle_collection_service.ReadMultiple(
                            new Vehicle_Daily_Collection_Filter[]
                                { new Vehicle_Daily_Collection_Filter{ Criteria = dat, Field = Vehicle_Daily_Collection_Fields.Date_Filter} ,
                                 new Vehicle_Daily_Collection_Filter{ Criteria = dat, Field = Vehicle_Daily_Collection_Fields.Vehicle_Number} },
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
        public virtual Member.Members getmember(ClientRequest request)
        {
            Member.Members member = null;
            string searchValue = request.No;

            // If search value is empty, return null
            if (string.IsNullOrEmpty(searchValue))
            {
                return null;
            }

            // First, try search by member number (pad to 5 characters if numeric and short)
            string memberNo = searchValue;
            if (searchValue.All(char.IsDigit) && searchValue.Length < 5)
            {
                memberNo = searchValue.PadLeft(5, '0');
            }

            member = members_service.Read(memberNo);

            if (member != null)
            {
                return member;
            }

            // If not found, try search by phone number
            string formattedPhone = searchValue.Replace(" ", "");
            if (formattedPhone.Length >= 9)
            {
                formattedPhone = string.Format("*{0}", formattedPhone.Substring(formattedPhone.Length - 9));
            }

            member = members_service.ReadMultiple(
                new Members_Filter[] { new Members_Filter { Criteria = formattedPhone, Field = Members_Fields.Phone_No } },
                null, 0).FirstOrDefault();

            if (member != null)
            {
                return member;
            }

            // If still not found, try search by vehicle number
            var vehicles = vehicle_service.ReadMultiple(
                new VehiclesBasics_Filter[] { new VehiclesBasics_Filter { Criteria = searchValue, Field = VehiclesBasics_Fields.Vehicle_Number } },
                null, 0);

            if (vehicles != null && vehicles.Length > 0)
            {
                // Get the owner/member of the first vehicle found
                var vehicle = vehicles.FirstOrDefault();
                if (vehicle != null && !string.IsNullOrEmpty(vehicle.Code))
                {
                    member = members_service.Read(vehicle.Code);
                }
            }

            return member;
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
        public virtual Parcels.Parcel[] getparcels(Request request)
        {
            var filters = parcel_service.ReadMultiple(
                new Parcels.Parcel_Filter[] { },
                request.bookmark, request.size);
            foreach (var parcel in filters)
            {
                parcel.getparceldetails(parceldetails_service);
            }
            return filters;
        }

        public virtual Parcels.Parcel Addeditparcel(Parcels.Parcel parcel)
        {
            Parcel_Details[]? pdetails = parcel.parcelDetails;

            parcel.Amount_PaidSpecified = true;
            parcel.Date_CollectedSpecified = true;
            parcel.Date_DeliveredSpecified = true;
            parcel.Date_sentSpecified = true;
            parcel.PaidSpecified = true;
            parcel.StatusSpecified = true;
            parcel.Who_to_PaySpecified = true;
            parcel.parcelDetails = null;
            var pcs = parcel_service.Read(parcel.Document_No);
            if (pcs == null)
                parcel_service.Create(ref parcel);
            else
            {
                parcel.Key = pcs.Key;
                parcel_service.Update(ref parcel);
            }
            var updatedList = new List<ParcelDetails.Parcel_Details>();
            foreach (var item in pdetails)
            {
                ParcelDetails.Parcel_Details pdd = item;
                var pd = parceldetails_service.Read(item.Document_No, item.Description);
                if (pd == null)
                    parceldetails_service.Create(ref pdd);
                else
                {
                    pdd.Key = pd.Key;
                    parceldetails_service.Update(ref pdd);

                }
                updatedList.Add(pdd);
            }
            parcel.parcelDetails = updatedList.ToArray();
            return parcel;
        }


        public Loan.Loans[] getmemberloans(ClientRequest request)
        {
            // Get member first to get the member number
            if (request == null)
            {
                return Array.Empty<Loans>();
            }
            if (!string.IsNullOrEmpty(request.Member))
            {
                if (vehicle_service == null)
                {
                    return Array.Empty<Loans>();
                }

                // Check if loans service is available
                if (loans_service == null)
                {
                    return Array.Empty<Loans>();
                }

                try
                {
                    // Query loans by member number using Client_Code filter
                    var loans = loans_service.ReadMultiple(
                        new Loans_Filter[]
                        {
                        new Loans_Filter
                        {
                            Criteria = request.Member,
                            Field = Loans_Fields.Member_No
                        }
                        },
                        null,
                        0);

                    return loans ?? Array.Empty<Loans>();
                }
                catch (Exception)
                {
                    // Return empty array if service call fails
                    return Array.Empty<Loans>();
                }
                
            }
            return Array.Empty<Loans>();
        }

        public virtual Accounts[] getmemberaccounts(ClientRequest request)
        {
            // If specific account is requested, return that account
            if (!string.IsNullOrEmpty(request.Member))
            {
                if (accounts_service == null)
                {
                    return Array.Empty<Accounts>();
                }

                try
                {
                    var accounts = accounts_service.ReadMultiple(
                        new Accounts_Filter[]
                        {
                            new Accounts_Filter
                            {
                                Criteria = request.Member,
                                Field = Accounts_Fields.Member_No
                            }
                        }, null, 500);

                    return accounts ?? Array.Empty<Accounts>();
                }
                catch (Exception)
                {
                    return Array.Empty<Accounts>();
                }
            }



            return Array.Empty<Accounts>();
        }
        public virtual AccountEntries[] getaccountentries(ClientRequest request)
        {
            if (request == null)
            {
                return Array.Empty<AccountEntries>();
            }

            // If specific account is requested, return that account
            if (!string.IsNullOrEmpty(request.Account))
            {
                if (entries_service == null)
                {
                    return Array.Empty<AccountEntries>();
                }

                try
                {
                    List<AccountEntries_Filter> f = new List<AccountEntries_Filter>();

                    var filters =
                        new AccountEntries_Filter
                        {
                            Criteria = request.Account,
                            Field = AccountEntries_Fields.Vendor_No
                        };
                    
                    f.Add(filters);

                    if (!string.IsNullOrEmpty(request.loanNo))
                    {
                        f.Add(new AccountEntries_Filter
                        {
                            Criteria = request.loanNo,
                            Field = AccountEntries_Fields.Loan_No
                        });
                        
                    }
                    if (request.bookmark == "")
                        request.bookmark = null;
                    var accounts = entries_service.ReadMultiple(
                        f.ToArray(), request.bookmark, request.size);

                    return accounts ?? Array.Empty<AccountEntries>();
                }
                catch (Exception)
                {
                    return Array.Empty<AccountEntries>();
                }
            }


            return Array.Empty<AccountEntries>();
        }

        public virtual VehiclesBasics[] getmembervehicles(ClientRequest request)
        {
            if (request == null)
            {
                return Array.Empty<VehiclesBasics>();
            }
            if (!string.IsNullOrEmpty(request.Member))
            {
                if (vehicle_service == null)
                {
                    return Array.Empty<VehiclesBasics>();
                }

                try
                {
                    var accounts = vehicle_service.ReadMultiple(
                        new VehiclesBasics_Filter[]
                        {
                            new VehiclesBasics_Filter
                            {
                                Criteria = request.Member,
                                Field = VehiclesBasics_Fields.Code
                            }
                        }, null, 500);

                    return accounts ?? Array.Empty<VehiclesBasics>();
                }
                catch (Exception)
                {
                    return Array.Empty<VehiclesBasics>();
                }
            }
            return Array.Empty<VehiclesBasics>();
        }

        public virtual AccountEntries[] getloanentries(ClientRequest request)
        {
            if (request == null)
            {
                return Array.Empty<AccountEntries>();
            }

            // Check if entries service is available
            if (entries_service == null)
            {
                return Array.Empty<AccountEntries>();
            }

            // If specific loan number is provided, filter by loan number
            if (!string.IsNullOrEmpty(request.loanNo))
            {
                try
                {
                    List<AccountEntries_Filter> filters = new List<AccountEntries_Filter>();

                    // Add loan number filter
                    filters.Add(new AccountEntries_Filter
                    {
                        Criteria = request.loanNo,
                        Field = AccountEntries_Fields.Loan_No
                    });

                    // Optionally filter by member/account if provided
                    if (!string.IsNullOrEmpty(request.Account))
                    {
                        filters.Add(new AccountEntries_Filter
                        {
                            Criteria = request.Account,
                            Field = AccountEntries_Fields.Vendor_No
                        });
                    }

                    // Handle bookmark for pagination
                    if (request.bookmark == "")
                        request.bookmark = null;

                    var entries = entries_service.ReadMultiple(
                        filters.ToArray(),
                        request.bookmark,
                        request.size);

                    return entries ?? Array.Empty<AccountEntries>();
                }
                catch (Exception)
                {
                    return Array.Empty<AccountEntries>();
                }
            }

            // If no loan number provided but member/account is specified, try to get member's loans first
            if (!string.IsNullOrEmpty(request.Member) || !string.IsNullOrEmpty(request.Account))
            {
                try
                {
                    // Get all loans for the member
                    var loans = getmemberloans(request);

                    if (loans != null && loans.Length > 0)
                    {
                        // Get the first loan's number
                        var loanNo = loans[0].Loan_No;

                        if (!string.IsNullOrEmpty(loanNo))
                        {
                            var filter = new AccountEntries_Filter
                            {
                                Criteria = loanNo,
                                Field = AccountEntries_Fields.Loan_No
                            };

                            if (request.bookmark == "")
                                request.bookmark = null;

                            var entries = entries_service.ReadMultiple(
                                new[] { filter },
                                request.bookmark,
                                request.size);

                            return entries ?? Array.Empty<AccountEntries>();
                        }
                    }
                }
                catch (Exception)
                {
                    return Array.Empty<AccountEntries>();
                }
            }

            return Array.Empty<AccountEntries>();
        }

        public virtual LoanSchedule[] getloanschedules(ClientRequest request)
        {
            // Loan schedules are retrieved from the NAV system.
            // This requires a dedicated LoanSchedules_PortClient connected service.
            // Returning empty for base implementation; override in specific client if needed.
            return Array.Empty<LoanSchedule>();
        }

        public virtual Agents.Users changepassword(Agents.Users user)
        {
            if (string.IsNullOrEmpty(user.Agent_Code))
                throw new Exception("Agent Code is required.");

            var existing = user_service.Read(user.Agent_Code);
            if (existing == null)
                throw new Exception("User not found.");

            existing.Password = user.Password;
            user_service.Update(ref existing);
            return existing;
        }

        public virtual VehicleExpenses.Vehicle_Expenses[] getvehicleexpenses()
        {
            return vehicle_expenses_service.ReadMultiple(
                new Vehicle_Expenses_Filter[] { },
                null, 0);
        }

        public virtual VehicleExpenses.Vehicle_Expenses setvehicleexpenses(VehicleExpenses.Vehicle_Expenses expense)
        {
            if (string.IsNullOrEmpty(expense.Code))
                throw new Exception("Code is required.");

            expense.DateSpecified = true;
            expense.AmountSpecified = true;

            var existing = vehicle_expenses_service.ReadMultiple(
                new Vehicle_Expenses_Filter[]
                {
                    new Vehicle_Expenses_Filter
                    {
                        Criteria = expense.Code,
                        Field = Vehicle_Expenses_Fields.Code
                    }
                }, null, 0).FirstOrDefault();

            if (existing == null)
            {
                vehicle_expenses_service.Create(ref expense);
            }
            else
            {
                expense.Key = existing.Key;
                vehicle_expenses_service.Update(ref expense);
            }

            return expense;
        }

        public virtual Mtransaction.Mtransactions setmtransactions(Mtransaction.Mtransactions trans)
        {
            if (string.IsNullOrEmpty(trans.Document_No))
                throw new Exception("Document No is required.");

            trans.Transaction_DateSpecified = true;
            trans.AmountSpecified = true;

            var existing = mtransaction_service.ReadMultiple(
                new Mtransaction.Mtransactions_Filter[]
                {
                    new Mtransaction.Mtransactions_Filter
                    {
                        Criteria = trans.Document_No,
                        Field = Mtransaction.Mtransactions_Fields.Document_No
                    }
                }, null, 0).FirstOrDefault();

            if (existing == null)
            {
                mtransaction_service.Create(ref trans);
            }
            else
            {
                trans.Key = existing.Key;
                mtransaction_service.Update(ref trans);
            }

            return trans;
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
namespace Parcels
{

    public partial class Parcel
    {
        public void getparceldetails(ParcelDetails.Parcel_Details_PortClient port)
        {
            parcelDetails = port.ReadMultiple(new ParcelDetails.Parcel_Details_Filter[] { new ParcelDetails.Parcel_Details_Filter { Criteria = this.Document_No, Field = ParcelDetails.Parcel_Details_Fields.Document_No } }, null, 0);
        }
        [System.Xml.Serialization.XmlElementAttribute(Order = 30)]
        public ParcelDetails.Parcel_Details[]? parcelDetails { get; set; }

    }


}


