namespace Nation_Sacco.Controllers.Models
{
    public class Sector
    {
        public string sector_code { get; set; }
        public string sector_description { get; set; }
        public string parent_sector { get; set; }
        public int sector_level { get; set; }
        public List<Sector> sub_sectors { get; set; }


    }
}
