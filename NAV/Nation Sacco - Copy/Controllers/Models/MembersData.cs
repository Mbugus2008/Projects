namespace Nation_Sacco.Controllers.Models
{
    public class MembersData : error
    {
        public string member_number { get; set; }
        public string id_number { get; set; }
        public string kra_pin { get; set; }
        public string passport_number { get; set; }
        public string huduma_number { get; set; }
        public string citizenship { get; set; }
        public string language { get; set; }
        public string full_name { get; set; }
        public DateTime date_of_birth { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string tsc_or_pf_number { get; set; }
        public string staff_number { get; set; }
        public string employer_code { get; set; }
        public string employer_name { get; set; }
        public string po_box_code { get; set; }
        public string po_box_town { get; set; }
        public string status { get; set; }
        public string sub_flag { get; set; }
        public bool MloanStatus { get; set; }
        public bool selfguaranteed { get; set; }
        public double selfguaranteedAmount { get; set; }
        public DateTime onboarded_at { get; set; }
        public List<NokBeneficiaryNomineeInfo> nok_beneficiary_nominee_info { get; set; }
        public string member_type { get; internal set; }
    }
}
