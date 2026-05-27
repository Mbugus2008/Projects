using Investors.Accounts;
using Investors.AccountEntries;
using Investors.ledgerenties;
using Investors.LoanSchedule;
using Investors.Members;
using Investors.Transactions;
using Investors.Vehicle_details;
using Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Investors.Controllers
{
    public class InvenstorController : ApiController
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        Members.Members3_Service Members2_Service = new Members.Members3_Service();
        Statistics.Statistics_Service Statistics_Service = new Statistics.Statistics_Service();
        Loans.Loans_Service Loans_Service = new Loans.Loans_Service();
        Vehicle_details.Vehicle_details_Service vehicle_Details_Service = new Vehicle_details.Vehicle_details_Service();
        Accounts.Accounts_Service Accounts_Service = new Accounts.Accounts_Service();
        AccountEntries.AccountEntries_Service AccountEntries_Service = new AccountEntries.AccountEntries_Service();
        LoanSchedule.LoanSchedule_Service LoanSchedule_Service = new LoanSchedule.LoanSchedule_Service();
        MBranch.MBranch mbranch = new MBranch.MBranch();
        public InvenstorController()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config");
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);
            Members2_Service = new Members.Members3_Service { Url = misc.geturl(s, Members2_Service.Url), Credentials = cd, PreAuthenticate = true };
            Statistics_Service = new Statistics.Statistics_Service { Url = misc.geturl(s, Statistics_Service.Url), Credentials = cd, PreAuthenticate = true };
            Loans_Service = new Loans.Loans_Service { Url = misc.geturl(s, Loans_Service.Url), Credentials = cd, PreAuthenticate = true };
            vehicle_Details_Service = new Vehicle_details_Service { Url = misc.geturl(s, vehicle_Details_Service.Url), Credentials = cd, PreAuthenticate = true };
            Accounts_Service = new Accounts.Accounts_Service { Url = misc.geturl(s, Accounts_Service.Url), Credentials = cd, PreAuthenticate = true };
            AccountEntries_Service = new AccountEntries.AccountEntries_Service { Url = misc.geturl(s, AccountEntries_Service.Url), Credentials = cd, PreAuthenticate = true };
            LoanSchedule_Service = new LoanSchedule.LoanSchedule_Service { Url = misc.geturl(s, LoanSchedule_Service.Url), Credentials = cd, PreAuthenticate = true };
            mbranch = new MBranch.MBranch { Url = misc.geturl(s, mbranch.Url), Credentials = cd, PreAuthenticate = true };
        }

        // Helper to extract identifier from various request shapes
        private string GetIdentifier(ClientRequest request)
        {
            var id = request.body?.ToString();
            if (!string.IsNullOrWhiteSpace(id)) return id.Trim().Replace(" ", "");
            id = request.No;
            if (!string.IsNullOrWhiteSpace(id)) return id.Trim().Replace(" ", "");
            id = request.Member;
            if (!string.IsNullOrWhiteSpace(id)) return id.Trim().Replace(" ", "");
            return string.Empty;
        }

        [HttpPost]
        [Route("api/member")]
        [Route("Members/GetMember")]
        public Results<Members.Members3> member(ClientRequest request)
        {
            var phone = GetIdentifier(request);
            Results<Members.Members3> r = new Results<Members.Members3>();
            try
            {
                if (phone.Length > 8)
                    phone = string.Format("+254{0}", phone.Substring(phone.Length - 9));
                Members.Members3 members2 = new Members.Members3();

                members2 = Members2_Service.ReadMultiple(new Members3_Filter[] { new Members3_Filter { Criteria = phone, Field = Members3_Fields.Phone_No } }, null, 0).FirstOrDefault();
                Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(r.Contents));
                if (members2 == null)
                {
                    members2 = Members2_Service.ReadMultiple(new Members3_Filter[] { new Members3_Filter { Criteria = phone, Field = Members3_Fields.No } }, null, 0).FirstOrDefault();
                    if (members2 == null)
                    {
                        var v = vehicle_Details_Service.Read(phone);
                        if (v != null)
                        {
                            members2 = Members2_Service.ReadMultiple(new Members3_Filter[] { new Members3_Filter { Criteria = v.Code, Field = Members3_Fields.No } }, null, 0).FirstOrDefault();
                        }
                    }
                }
                if (members2 != null)
                {
                    var vd = vehicle_Details_Service.ReadMultiple(new Vehicle_details_Filter[] { new Vehicle_details_Filter { Criteria = members2.No, Field = Vehicle_details_Fields.Code } }, null, 0);
                    members2.vehicles = vd;

                    var loans = Loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = members2.No, Field = Loans.Loans_Fields.Client_Code } }, null, 0);
                    members2.loans = loans;

                    var stats = Statistics_Service.Read(members2.No);
                    members2.statistics = stats;
                }

                r.Contents = members2;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/memberupdate")]
        [Route("memberupdate")]
        public Results<Members.Members3> memberupdate(Members.Members3 member)
        {
            Results<Members.Members3> r = new Results<Members.Members3>();
            try
            {
                var m = Members2_Service.Read(member.No);
                if (m != null)
                {
                    m.Logged_In = true;
                    m.Password = member.Password;
                    Members2_Service.Update(ref m);
                }
                r.Contents = member;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/changepassword")]
        public Results<Members.Members3> changepassword(ChangePasswordRequest request)
        {
            Results<Members.Members3> r = new Results<Members.Members3>();
            try
            {
                var m = Members2_Service.Read(request.Member);
                if (m != null)
                {
                    m.Password = request.password;
                    if (!request.reset)
                    {
                        m.Password_Changed = true;
                        m.Password_ChangedSpecified = true;
                    }
                    Members2_Service.Update(ref m);
                    r.Contents = m;
                }
                else
                {
                    r.Code = -1;
                    r.Desc = "Member not found";
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/statistics")]
        [Route("Members/GetMemberStatistics")]
        public Results<Statistics.Statistics> member_statistics(ClientRequest request)
        {
            var phone = GetIdentifier(request);
            Results<Statistics.Statistics> r = new Results<Statistics.Statistics>();
            try
            {
                r.Contents = Statistics_Service.Read(phone);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/ledgerentries")]
        [Route("Members/GetLedgerEntries")]
        public Results<List<ledgerenties.ledger_entries>> Ledgerentries(ClientRequest request)
        {
            var phone = GetIdentifier(request);
            Results<List<ledgerenties.ledger_entries>> r = new Results<List<ledgerenties.ledger_entries>>();
            try
            {
                r.Contents = new ledger_entries_Service(s).ReadMultiple(new ledger_entries_Filter[] { new ledger_entries_Filter { Criteria = phone, Field = ledger_entries_Fields.Customer_No } }, request.bookmark, request.size).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/ledgerentries_bytype")]
        [Route("ledgerentries_bytype")]
        [Route("Members/GetLedgerEntriesByType")]
        public Results<List<ledgerenties.ledger_entries>> Ledgerentries_bytype(ledger_request request)
        {
            Results<List<ledgerenties.ledger_entries>> r = new Results<List<ledgerenties.ledger_entries>>();
            try
            {
                string f = string.Join("|", request.TType);
                Logging.Logging.LogEntryOnFile(f);
                r.Contents = new ledger_entries_Service(s).ReadMultiple(new ledger_entries_Filter[] { new ledger_entries_Filter { Criteria = request.body.ToString(), Field = ledger_entries_Fields.Customer_No }, new ledger_entries_Filter { Criteria = f, Field = ledger_entries_Fields.Transaction_Type } }, request.bookmark, request.size).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/collections")]
        [Route("collections")]
        [Route("Members/GetCollections")]
        public Results<List<Transactions.Transactions>> collections(trequest request)
        {
            Results<List<Transactions.Transactions>> r = new Results<List<Transactions.Transactions>>();
            try
            {
                r.Contents = new Transactions_Service(s).ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = request.Account.ToString(), Field = Transactions_Fields.Account_No }, new Transactions_Filter { Criteria = request.vehicle, Field = Transactions_Fields.Loan_No } }, request.bookmark, request.size).ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/loans")]
        [Route("Members/GetMemberLoans")]
        public Results<Loans.Loans[]> member_Loans(ClientRequest request)
        {
            var phone = GetIdentifier(request);
            Results<Loans.Loans[]> r = new Results<Loans.Loans[]>();
            try
            {
                r.Contents = Loans_Service.ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = phone, Field = Loans.Loans_Fields.Client_Code } }, null, 0);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/Otp")]
        [Route("Members/sendsms")]
        public Results<int> Otp(request request)
        {
            Results<int> r = new Results<int>();
            try
            {
                string message = !string.IsNullOrEmpty(request.Otp_message) ? request.Otp_message : request.message;
                string phone = request.phone?.ToString() ?? string.Empty;
                mbranch.Sendsms("Mobile", phone, message, phone);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/GetMemberVehicles")]
        public Results<Vehicle_details[]> GetMemberVehicles(ClientRequest request)
        {
            var memberNo = GetIdentifier(request);
            Results<Vehicle_details[]> r = new Results<Vehicle_details[]>();
            try
            {
                r.Contents = vehicle_Details_Service.ReadMultiple(
                    new Vehicle_details_Filter[] { new Vehicle_details_Filter { Criteria = memberNo, Field = Vehicle_details_Fields.Code } },
                    null, 0);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/GetMemberAccounts")]
        public Results<List<Accounts.Accounts>> GetMemberAccounts(ClientRequest request)
        {
            var memberNo = GetIdentifier(request);
            Results<List<Accounts.Accounts>> r = new Results<List<Accounts.Accounts>>();
            try
            {
                var results = Accounts_Service.ReadMultiple(
                    new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = memberNo, Field = Accounts.Accounts_Fields.Member_No } },
                    request.bookmark, request.size);
                r.Contents = results.ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/GetAccountEntries")]
        public Results<List<AccountEntries.AccountEntries>> GetAccountEntries(ClientRequest request)
        {
            Results<List<AccountEntries.AccountEntries>> r = new Results<List<AccountEntries.AccountEntries>>();
            try
            {
                var accountNo = request.Account ?? GetIdentifier(request);
                var results = AccountEntries_Service.ReadMultiple(
                    new AccountEntries.AccountEntries_Filter[] { new AccountEntries.AccountEntries_Filter { Criteria = accountNo, Field = AccountEntries.AccountEntries_Fields.Vendor_No } },
                    request.bookmark, request.size);
                r.Contents = results.ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/GetLoanEntries")]
        public Results<List<LoanEntry>> GetLoanEntries(ClientRequest request)
        {
            Results<List<LoanEntry>> r = new Results<List<LoanEntry>>();
            try
            {
                // TODO: Wire up to actual loan entries service when available
                r.Contents = new List<LoanEntry>();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/GetLoanSchedules")]
        public Results<List<LoanSchedule.LoanSchedule>> GetLoanSchedules(ClientRequest request)
        {
            Results<List<LoanSchedule.LoanSchedule>> r = new Results<List<LoanSchedule.LoanSchedule>>();
            try
            {
                var loanNo = request.loanNo ?? GetIdentifier(request);
                var results = LoanSchedule_Service.ReadMultiple(
                    new LoanSchedule.LoanSchedule_Filter[] { new LoanSchedule.LoanSchedule_Filter { Criteria = loanNo, Field = LoanSchedule.LoanSchedule_Fields.Loan_No } },
                    request.bookmark, request.size);
                r.Contents = results.ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/custoemersecurity")]
        public Results<List<CustomerSecurity>> GetCustomerSecurity(ClientRequest request)
        {
            var memberNo = GetIdentifier(request);
            Results<List<CustomerSecurity>> r = new Results<List<CustomerSecurity>>();
            try
            {
                // TODO: Wire up to actual security questions service when available
                r.Contents = new List<CustomerSecurity>();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("Members/addcustomersecurity")]
        public Results<List<CustomerSecurity>> AddCustomerSecurity(List<CustomerSecurity> request)
        {
            Results<List<CustomerSecurity>> r = new Results<List<CustomerSecurity>>();
            try
            {
                // TODO: Wire up to actual security questions service when available
                r.Contents = request ?? new List<CustomerSecurity>();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
    }
}

namespace Investors.Transactions
{
    public partial class Transactions_Service
    {
        public Transactions_Service(Logging.settings ss)
        {
            Logging.settings s = new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config"));
            this.Url = s.geturl(global::Investors.Properties.Settings.Default.Investors_Transactions_Transactions_Service);

            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }

    }
    public class trequest : ClientRequest
    {
        public String Account { get; set; }
        public String vehicle { get; set; }
    }
}

namespace Investors.ledgerenties
{
    public partial class ledger_entries_Service
    {
        public ledger_entries_Service(Logging.settings ss)
        {
            Logging.settings s = new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config"));
            this.Url = s.geturl(global::Investors.Properties.Settings.Default.Investors_ledgerenties_ledger_entries_Service);

            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = s.cd;
            this.PreAuthenticate = true;
        }
    }
    public class ledger_request : ClientRequest
    {
        public Transaction_Type[] TType { get; set; }
    }
    public partial class ledger_entries
    {
        public string TransactionType
        {
            get { return Transaction_Type.ToString().Replace("_", " "); }
        }
    }
}

namespace Investors.Members
{
    public partial class Members3
    {
        public Vehicle_details.Vehicle_details[] vehicles { get; set; }
        public Loans.Loans[] loans { get; set; }
        public Statistics.Statistics statistics { get; set; }
    }
}

namespace Logging
{
    public partial class request : ClientRequest
    {
        public string Otp { get; set; }
        public string phone { get; set; }
        public string Otp_message { set; get; }
        public string message { set; get; }
    }
}

// Request/response models for endpoints not backed by NAV services
namespace Investors.Controllers
{
    public class ChangePasswordRequest
    {
        public string Member { get; set; }
        public string message { get; set; }
        public string password { get; set; }
        public bool reset { get; set; }
    }

    // AccountEntriesRequest, LoanEntriesRequest, LoanScheduleRequest
    // all map to ClientRequest which already has Account, loanNo, bookmark, size fields

    public class LoanEntry
    {
        public string Key { get; set; }
        public string Posting_Date { get; set; }
        public bool Posting_DateSpecified { get; set; }
        public int Entry_Type { get; set; }
        public bool Entry_TypeSpecified { get; set; }
        public int Document_Type { get; set; }
        public bool Document_TypeSpecified { get; set; }
        public string Document_No { get; set; }
        public string Vendor_No { get; set; }
        public string Initial_Entry_Global_Dim_1 { get; set; }
        public string Initial_Entry_Global_Dim_2 { get; set; }
        public string Currency_Code { get; set; }
        public decimal Amount { get; set; }
        public bool AmountSpecified { get; set; }
        public decimal Amount_LCY { get; set; }
        public bool Amount_LCYSpecified { get; set; }
        public decimal Debit_Amount { get; set; }
        public bool Debit_AmountSpecified { get; set; }
        public decimal Debit_Amount_LCY { get; set; }
        public bool Debit_Amount_LCYSpecified { get; set; }
        public decimal Credit_Amount { get; set; }
        public bool Credit_AmountSpecified { get; set; }
        public decimal Credit_Amount_LCY { get; set; }
        public bool Credit_Amount_LCYSpecified { get; set; }
        public string Initial_Entry_Due_Date { get; set; }
        public bool Initial_Entry_Due_DateSpecified { get; set; }
        public string User_ID { get; set; }
        public string Source_Code { get; set; }
        public string Reason_Code { get; set; }
        public bool Unapplied { get; set; }
        public bool UnappliedSpecified { get; set; }
        public int Unapplied_by_Entry_No { get; set; }
        public bool Unapplied_by_Entry_NoSpecified { get; set; }
        public int Vendor_Ledger_Entry_No { get; set; }
        public bool Vendor_Ledger_Entry_NoSpecified { get; set; }
        public string Member_No { get; set; }
        public string Loan_No { get; set; }
        public string Motorvehicle_Code { get; set; }
        public int Posting_Type { get; set; }
        public bool Posting_TypeSpecified { get; set; }
        public int Transaction_Type { get; set; }
        public bool Transaction_TypeSpecified { get; set; }
        public int Entry_No { get; set; }
        public bool Entry_NoSpecified { get; set; }
        public string Month { get; set; }
        public bool Reversed { get; set; }
        public bool ReversedSpecified { get; set; }
        public string Description { get; set; }
    }

    public class CustomerSecurity
    {
        public string Client { get; set; }
        public string Customer { get; set; }
        public string Security { get; set; }
        public string Answer { get; set; }
    }
}
