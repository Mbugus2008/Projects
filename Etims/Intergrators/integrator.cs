using Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Etims.Intergrators
{
    public interface integrator
    {
         Results<Sale> sales(ref Sale sale);
        Results<Product> product( ref Product sale);
    }
}
