using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Aps.smstemplates
{
    public partial class SmsTemplates_Service
    {
        public SmsTemplates_Service(settings.NAV s)
        {
            this.Url = s.geturl( global::Aps.Properties.Settings.Default.RunCodunit_smstemplatess_SmsTemplates_Service);
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

namespace Aps.Loanschedule
{
    public partial class Loanschedule_Service
    {
        public Loanschedule_Service(settings.NAV s)
        {
            this.Url = s.geturl(global::Aps.Properties.Settings.Default.RunCodunit_Loanschedule_Loanschedule_Service);
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