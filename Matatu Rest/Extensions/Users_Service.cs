namespace Matatu_Rest.Agents
{
    public partial class Users_Service
    {
        public Users_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Agents_Users_Service);

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
}namespace Matatu_Rest.Expenses
{
    public partial class Expenses_Service
    {
        public Expenses_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Expenses_Expenses_Service);

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
}
namespace Matatu_Rest.NRODefects
{
    public partial class NRODefects_Service
    {
        public NRODefects_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_NRODefects_NRODefects_Service);

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
}
namespace Matatu_Rest.Mbranch_Header
{
    public partial class Mbranch_Header_Service
    {
        public Mbranch_Header_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Mbranch_Header_Mbranch_Header_Service);

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

}
namespace Matatu_Rest.Reversals
{
    public partial class Reversals_Service
    {
        public Reversals_Service(Logging.settings s)
        {
            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Reversals_Reversals_Service);

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
}
namespace Matatu_Rest.Transtypes
{
    public partial class Transtypes_Service
    {
        public Transtypes_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Transtypes_Transtypes_Service);

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
}

namespace Matatu_Rest.Account_Types
{
    public partial class Account_Types_Service
    {
        public Account_Types_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Account_Types_Account_Types_Service);

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
}

namespace Matatu_Rest.Tamounts{
    public partial class Tamounts_Service
    {
        public Tamounts_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Tamounts_Tamounts_Service);

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
}namespace Matatu_Rest.Members
{
    public partial class Members_Service
    {
        public Members_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Members_Members3_Service);

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
}namespace Matatu_Rest.Vehicles
{
    public partial class Vehicles_Service
    {
        public Vehicles_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Vehicles_Vehicles_Service);

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
}namespace Matatu_Rest.VehiclesBasics
{
    public partial class VehiclesBasics_Service
    {
        public VehiclesBasics_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_VehiclesBasics_VehiclesBasics_Service);

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
}
namespace Matatu_Rest.Vehicle_Expenses
{
    public partial class Vehicle_Expenses_Service
    {
        public Vehicle_Expenses_Service(Logging.settings s)
        {
            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Vehicle_Expenses_Vehicle_Expenses_Service);
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
}