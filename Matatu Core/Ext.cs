using System.ServiceModel.Description;
using Matatu_Core;
using Members;



namespace Members
{
    public partial class Members2_PortClient

    {
        public Members2_PortClient auth(Setting s)
        {

            ClientCredentials.Windows.AllowedImpersonationLevel =
                System.Security.Principal.TokenImpersonationLevel.Delegation;
            ClientCredentials.Windows.ClientCredential.UserName = s.Username;
            ClientCredentials.Windows.ClientCredential.Password = s.pass;
            return this;

        }


    }
}

namespace Mtransactions
{
    public partial class Transactions_PortClient

    {
        public Transactions_PortClient auth(Setting s)
        {
            ClientCredentials.Windows.AllowedImpersonationLevel =
                System.Security.Principal.TokenImpersonationLevel.Delegation;
            ClientCredentials.Windows.ClientCredential.UserName = s.Username;
            ClientCredentials.Windows.ClientCredential.Password = s.pass;
            return this;

        }
    }
}