namespace Nation_Sacco.Controllers.Models
{
    public class BeneficiaryInfo
    {
        public int Identification_Type { get; set; }
        public string Identification_Value { get; set; }
        public string Full_Names { get; set; }
        public string Relationship { get; set; }
        public string Date_Of_Birth { get; set; }
        public string Address { get; set; }
        public string Mobile_No { get; set; }
        public string Email_Address { get; set; }
        public bool Is_Next_Of_Kin { get; set; }
        public bool Is_Beneficiary { get; set; }
        public bool Is_Contact_Person { get; set; }
        public bool Is_Nominee { get; set; }
        public int Allocation { get; set; }
    }
}
