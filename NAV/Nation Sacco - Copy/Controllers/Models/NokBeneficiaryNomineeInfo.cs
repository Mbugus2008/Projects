namespace Nation_Sacco.Controllers.Models
{
    public class NokBeneficiaryNomineeInfo
    {
        public int identification_type { get; set; }
        public string? identification_value { get; set; }
        public string? full_names { get; set; }
        public string? relationship { get; set; }
        public string? residence { get; set; }
        public DateTime date_of_birth { get; set; }
        public string? address { get; set; }
        public string? mobile_no { get; set; }
        public string? email_address { get; set; }
        public bool is_next_of_kin { get; set; }
        public bool is_beneficiary { get; set; }
        public bool is_contact_person { get; set; }
        public bool is_nominee { get; set; }
        public int allocation { get; set; }
    }
}
