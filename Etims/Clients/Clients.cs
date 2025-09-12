using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Etims.Clients
{
    public interface Clients
    {
        DbSettings dbSettings { set; get; }   
        string connectionString { get; }
        bool connect();
        bool create_trigger();

        string trigger { get; }
    }
}
