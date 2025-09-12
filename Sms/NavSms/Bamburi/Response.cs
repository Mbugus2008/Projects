using System;
using System.Linq;

namespace RunCodunit
{
    namespace Transactions
    {
        public class Response
        {
            public Data data { get; set; }
            public string message { get; set; }
            public bool success { get; set; }
        }
    }
}
