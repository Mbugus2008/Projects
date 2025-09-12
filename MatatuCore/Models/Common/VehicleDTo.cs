namespace MatatuCore.Models.Common
{
    // Models/Common/Dtos/VehicleDto.cs
    public class VehicleDto
    {
        public string VehicleNumber { get; set; }
        public string Fleet { get; set; }
        public string Capacity { get; set; }
        public int Millage { get; set; }
        public string Driver { get; set; }
        public string Conductor { get; set; }
        public DateTime LastUpdated { get; set; }
    }

    // Models/Common/Requests/DateRangeRequest.cs
    public class DateRangeRequest
    {
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
    }
}
