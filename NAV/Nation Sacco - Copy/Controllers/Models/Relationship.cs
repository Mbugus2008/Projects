namespace Nation_Sacco.Controllers.Models
{
    public class Relationship
    {
        public string Code { get; set; }
        public string Relation { get; set; }
        public int Min_Age { get; set; }
        public int Max_Age { get; set; }
        public int Maximum_Count_Allowed { get; set; }
    }
}
