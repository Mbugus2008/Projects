using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Threading.Tasks;

namespace KpsImprest
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Imprest" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Imprest.svc or Imprest.svc.cs at the Solution Explorer and start debugging.
    public class Imprest : IWcfForward
    {
        Imprests.Imprest_Profits_Service Imprest_Profits_Service = new Imprests.Imprest_Profits_Service();
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        public Imprest()
        {
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
                        cd = new System.Net.NetworkCredential(s.erpsettings.Username, s.erpsettings.pass, s.erpsettings.domain);

            Imprest_Profits_Service = new Imprests.Imprest_Profits_Service   { Url = geturl(s, Imprest_Profits_Service.Url), Credentials = cd, PreAuthenticate = true };
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.erpsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
        public ProfitsForwardCallResponse ProfitsForwardCall(ProfitsForwardCallRequest request)
        {
            ProfitsForwardCallResponse profits = new ProfitsForwardCallResponse();
            Dictionary<string, string> openWith = new Dictionary<string, string>();
            try
            {
                var i = Imprest_Profits_Service.ReadMultiple(new Imprests.Imprest_Profits_Filter[] { new Imprests.Imprest_Profits_Filter { Criteria = request.parameters.FirstOrDefault().Value, Field = Imprests.Imprest_Profits_Fields.Imprest_No } }, null, 0).FirstOrDefault();
                if (i == null)
                {
                    //openWith.Add("PROFITS_MSG_STATUS", "INVALID");
                    openWith.Add("IMPREST_NO ", request.parameters.FirstOrDefault().Value);
                    openWith.Add("CUSTOMER_ERROR ", "401");
                    openWith.Add("CUSTOMER_ERROR_DESCRIPTION ", "Record not found");

                }
                else
                {
                    //openWith.Add("PROFITS_MSG_STATUS", "VALID");
                    openWith.Add("IMPREST_NO ", request.parameters.FirstOrDefault().Value);
                    openWith.Add("OUTSTANDING_BAL", i.Amount.ToString());
                    openWith.Add("CUSTOMER_ERROR", "");
                    openWith.Add("CUSTOMER_ERROR_DESCRIPTION", "");

                }

                //[PROFITS_COMMUNICATION_ERROR,]
                //[PROFITS_MSG_STATUS, VALID]
                //[AREA, Others]
                //[CUST_NAME, BPGZPAEHZLRJ]
                //[CUSTOMER_ERROR, NONE]
                //[CUSTREF, 10810001]
                //[OUTSTANDING_BAL, 7468352]
            }
            catch (Exception ex)
            {
                openWith.Add("PROFITS_MSG_STATUS", "INVALID");
                openWith.Add("IMPREST_NO ", request.parameters.FirstOrDefault().Value);
                openWith.Add("CUSTOMER_ERROR ", ex.Message);
            }
            profits.ProfitsForwardCallResult = openWith;

            return profits;
        }

        public ProfitsForwardXmlCallResponse ProfitsForwardXmlCall(ProfitsForwardXmlCallRequest request)
        {
            throw new NotImplementedException();
        }

      

        public ProfitsForwardXmlListCallResponse ProfitsForwardXmlListCall(ProfitsForwardXmlListCallRequest request)
        {
            throw new NotImplementedException();
        }
    }
}
