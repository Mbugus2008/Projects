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
}namespace Matatu_Rest.Transtypes
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
}namespace Matatu_Rest.Members
{
    public partial class Members3_Service
    {
        public Members3_Service(Logging.settings s)
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