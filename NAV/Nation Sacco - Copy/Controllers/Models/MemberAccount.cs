using System.Diagnostics.Eventing.Reader;

namespace Nation_Sacco.Controllers.Models
{
    public class MemberAccount
    {
        public string account_number { get; set; }
        public string product_name { get; set; }
        public string status { get; set; }
        public string branch { get; set; }
        public string account_name { get; set; }
        public string member_no { get; set; }
        public double balance { get; set; }
        public double Net_Salary { get; set; }
        public double Net_Salaryx4ave { get; set; }
        public bool has_sacco_link { get; set; }
        public bool atm_Enabled { get; set; }
        public DateTime opened_at { get; set; }
    }
}
