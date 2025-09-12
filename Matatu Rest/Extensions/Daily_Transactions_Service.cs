using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Matatu_Rest
{
    namespace Hires
    {
  public partial class Hires_Service
        {
            public Hires_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Hires_Hires_Service);

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
    } 
    
    namespace VehicleCrews
    {
        public partial class VehicleCrews_Service
        {
            public VehicleCrews_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_VehicleCrews_VehicleCrews_Service);

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
namespace Devices
    {
        public partial class Devices_Service
        {
            public Devices_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Devices_Devices_Service);

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
    namespace Vehicle_Daily_Collection
    {
        public partial class Vehicle_Daily_Collection_Service
        {
            public Vehicle_Daily_Collection_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Vehicle_Daily_Collection_Vehicle_Daily_Collection_Service);

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
    }  namespace Deport_n_Fuel
    {
        public partial class Deport_n_Fuel_Service
        {
            public Deport_n_Fuel_Service(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Deport_n_Fuel_Deport_n_Fuel_Service);

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
    namespace Mbranch
    {
        public partial class MBranch
        {
            public MBranch(Logging.settings s)
            {

                this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Mbranch_Mbranch);

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
}