using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;

namespace RunCodunit
{
    public class Advanta_Response
    {
        public List< Response> responses { get; set; }
    }
    public class Response
    {
        [JsonProperty("response-code")]
        public int resposecode { get; set; }

        [JsonProperty("response-description")]
        public string responsedescription { get; set; }
        public long mobile { get; set; }
        public int messageid { get; set; }
        public int networkid { get; set; }
    }
}
