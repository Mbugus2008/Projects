using System;
using System.Linq;

namespace RunCodunit
{
    public partial class BulkSm
    {
        public string partnerID { get; set; }
        public string Apikey { get; set; }
        public string Source_Id { get; set; }
        public string Phone { get; set; }

        public string Message { get; set; }
        public DateTime? Datetime { get; set; }
        public string Client { get; set; }
        public int? Balance { get; set; }
        public int? Type { get; set; }
        public string Destination_Id { get; set; }
        public int? Status { get; set; }
        public string Trace { get; set; }
        public decimal? SMSCost { get; set; }
        public bool? SMSCharged { get; set; }
        public byte[] Time_stamp { get; set; }
        public bool? Scheduled { get; set; }
        public DateTime? Scheduled_Time { get; set; }
        public string Comments { get; set; }
    }
}
