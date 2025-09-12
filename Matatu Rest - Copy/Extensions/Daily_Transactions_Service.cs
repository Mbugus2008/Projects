using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Matatu_Rest
{
    namespace Transactions
    {
        public partial class Transactions_Service
        {
            public Transactions_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Transactions_Daily_Transactions_Service);

                if ((this.IsLocalFileSystemWebService(this.Url) == true))
                {
                    this.UseDefaultCredentials = true;
                    this.useDefaultCredentialsSetExplicitly = false;
                }
                else
                {
                    this.useDefaultCredentialsSetExplicitly = true;
                }
                this.Credentials = s.cd;
                this.PreAuthenticate = true;
            }


        }
    }namespace Agents
    {
    }
}