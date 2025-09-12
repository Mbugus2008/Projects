using Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Matatu_Rest.Clients
{
    public interface Iclient
    {
        Results<Transactions.Transactions> SetTransactions(Transactions.Transactions trans);
       
    }
}
