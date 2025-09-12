using System;
using System.Linq;

namespace RunCodunit
{
    public interface Ismsrepository
    {
        Logging.Results<BulkSm> sendsms(ref BulkSm sms);


    }
}
