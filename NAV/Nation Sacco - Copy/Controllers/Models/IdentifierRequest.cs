namespace Nation_Sacco.Controllers.Models
{
    public class IdentifierRequest
    {
        public string Identifier_Type { get; set; } // "id_number", "passport_number", etc.
        public string Identifier { get; set; }
    }
}
