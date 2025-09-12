namespace Matatu_Rest.Teller_Transactions
{
    public partial class Teller_Transactions_Service
    {
        public Teller_Transactions_Service(Logging.settings s)
        {

            this.Url = s.geturl(global::Matatu_Rest.Properties.Settings.Default.Matatu_Rest_Teller_Transactions_Teller_Transactions_Service);

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