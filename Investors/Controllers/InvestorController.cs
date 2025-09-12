using Investors.ledgerenties;
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
            mbranch = new MBranch.MBranch { Url = misc.geturl(s, mbranch.Url), Credentials = cd, PreAuthenticate = true };
        }
        [HttpPost]
        [Route("api/member")]
        public Results<Members.Members3> member(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results<Members.Members3> r = new Results<Members.Members3>();
            try
            {
                phone = phone.Replace(" ", "");
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
        public Results<Members.Members3> memberupdate(Members.Members3 member)
        {
            
            Results<Members.Members3> r = new Results<Members.Members3>();
            try
            {
              
                var m = Members2_Service.Read(member.No);
                if (m != null)
                {
                    m.Logged_In= true;
                    m.Password =member.Password;
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
        [Route("api/statistics")]
        public Results<Statistics.Statistics> member_statistics(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results<Statistics.Statistics> r = new Results<Statistics.Statistics>();
            try
            {
                phone = phone.Replace(" ", "");
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
        public Results<List<ledgerenties.ledger_entries>> Ledgerentries(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results < List < ledgerenties.ledger_entries >> r = new Results<List<ledgerenties.ledger_entries>>();
           try
            {  r.Contents = new ledger_entries_Service(s).ReadMultiple(new ledger_entries_Filter[] {new ledger_entries_Filter { Criteria = request.body.ToString(),Field =  ledger_entries_Fields.Customer_No} } , request.bookmark,request.size).ToList();
                         
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
        public Results<List<Transactions.Transactions >>collections(trequest request)
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
        public Results<Loans.Loans[]> member_Loans(ClientRequest request)
        {
            var phone = request.body.ToString();
            Results<Loans.Loans[]> r = new Results<Loans.Loans[]>();
            try
            {
                phone = phone.Replace(" ", "");
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
        public Results<int> Otp(request request)
        {

            Results<int> r = new Results<int>();
            try
            {
                mbranch.Sendsms("Mobile", request.phone.ToString() , request.Otp_message, request.phone.ToString());
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
    public Transactions_Service(Logging.settings ss) { 
         Logging.settings s = new settings(System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.config"));
           // Logging.Logging.LogEntryOnFile(Investors.Properties.Settings.Default.Investors_ledgerenties_ledger_entries_Service);
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
       
    } public class trequest : ClientRequest
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
           // Logging.Logging.LogEntryOnFile(Investors.Properties.Settings.Default.Investors_ledgerenties_ledger_entries_Service);
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
namespace Investors.Members {

    public partial class Members3
    {
        public Vehicle_details.Vehicle_details[] vehicles { get; set; }
        public Loans.Loans[] loans { get; set; }
        public Statistics.Statistics statistics { get; set; }
    }
}
namespace Logging
{
    public partial class request: ClientRequest
    {
        public string Otp { get; set; }
        public string phone { get; set; }
        public string Otp_message { set; get; }
    }
}