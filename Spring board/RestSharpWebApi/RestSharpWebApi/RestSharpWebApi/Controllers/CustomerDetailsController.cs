using RestSharpWebApi.CustomerCard;
using RestSharpWebApi.DetailedCustomerLedgerEntries;
using RestSharpWebApi.Models;
using RestSharpWebApi.RatingCard;
using RestSharpWebApi.SMSMessages;
using Serilog;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Http;
using System.Windows.Forms;

namespace RestSharpWebApi.Controllers
{
    public partial class CustomerDetailsController : ApiController
    {
  
        private Setting s = new Setting();


        [HttpGet]
        [Route("waletledgerentries")]
        public Results<List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries>> ledgerentries(string account)
        {
            return new Results<List<DetailedCustomerLedgerEntries.DetailedCustomerLedgerEntries>>() { Contents = s.withrunningbal( new DetailedCustomerLedgerEntries_Service(s).ReadMultiple(new DetailedCustomerLedgerEntries_Filter[] { new DetailedCustomerLedgerEntries_Filter { Criteria = account, Field =  DetailedCustomerLedgerEntries_Fields.Customer_No },new DetailedCustomerLedgerEntries_Filter { Criteria = "Repayment_Account", Field =  DetailedCustomerLedgerEntries_Fields.Transaction_Type } }, null, 0).ToList() )};
        }


        [HttpGet]
        [Route("CompanyInfo")]
        public Results<CompanyInformation.CompanyInformation> CompanyInfo()
        {
          
            return new Results<CompanyInformation.CompanyInformation>() {Contents = new CompanyInformation.CompanyInformation_Service(s).ReadMultiple(null,null,0).FirstOrDefault() };
        }

 
        [HttpGet]
        [Route("FAQs")]
        public Results<Mobile_FAQ[]> FAQ()
        {
          return new Results<Mobile_FAQ[]>() {Contents= new HelaEntities(s.ConnectionString).Mobile_FAQs.ToArray() };
        }

        [HttpGet]
        [Route("getsetup")]
        public Results<MobilitySetup.MobilitySetup> getsetup()
        {
           
            try
            {
                var setup = new MobilitySetup.MobilitySetup_Service(s).ReadMultiple(null, null, 0).FirstOrDefault();
               
                return new Results<MobilitySetup.MobilitySetup>()
                {
                    Contents = new MobilitySetup.MobilitySetup_Service(s).ReadMultiple(null, null, 0).FirstOrDefault()
                   
                };
                   
            }
            catch (Exception ex)
            {
                Log.Error(ex,"Setup");
                return new Results<MobilitySetup.MobilitySetup>() { Contents = null, Code = -1 };
            }
            
        }
        [HttpGet]
        [Route("InviteLink")]
        public string GetInviteLink()
        {
            string strLink = "";
            try
            {
                MobilitySetup.MobilitySetup_Service otemplate = new MobilitySetup.MobilitySetup_Service(s);
                
                var oSetup = otemplate.ReadMultiple(null, null, 0).FirstOrDefault();
             

                if (oSetup != null)
                {
                    strLink = oSetup.Invite_Link;
                }
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
            return strLink;
        }





        [HttpPost]
        [Route("CustomerLeads")]
        public Results<CustomerApplicationCard.CustomerApplicationCard> CreateCustomerLeads(CustomerApplicationCard.CustomerApplicationCard leads)
        {
            DateTime datetime = DateTime.Now;
            Results<CustomerApplicationCard.CustomerApplicationCard> result = new Results<CustomerApplicationCard.CustomerApplicationCard>();
            CustomerApplicationCard.CustomerApplicationCard_Service otemplate = new CustomerApplicationCard.CustomerApplicationCard_Service(s);
            try
            {

                leads.Date_of_BirthSpecified = true;
                leads.GenderSpecified = true;
                leads.SecuritySpecified = true;
                leads.Identification_Doc_TypeSpecified = true;

                var lead = otemplate.ReadMultiple(new CustomerApplicationCard.CustomerApplicationCard_Filter[] { new CustomerApplicationCard.CustomerApplicationCard_Filter { Criteria = leads.Identification_Doc_No, Field = CustomerApplicationCard.CustomerApplicationCard_Fields.Identification_Doc_No }, new CustomerApplicationCard.CustomerApplicationCard_Filter { Criteria = "Open", Field = CustomerApplicationCard.CustomerApplicationCard_Fields.Status } }, null, 0).FirstOrDefault();

                if (lead != null)
                {
                    leads.Key = lead.Key;
                    leads.Source_Of_CustomerSpecified = true;
                    leads.Posting_Group = "LOANS";
                    otemplate.Update(ref leads);
 SMSMessages.SMSMessages smsmessages = new SMSMessages.SMSMessages()
                    {
                        Entry_No = new SBCSERVICE.SBCSERVICE(s).lastsmsno() + 1,
                        Entry_NoSpecified=true,                      
                        Source = Source.Mobile_Banking,
                        SourceSpecified = true,
                        Account_No = leads.Mobile_Phone_No,
                        Date_Entered = DateTime.Today,
                        Date_EnteredSpecified = true,
                        SMS_Message = string.Format(new SmsTemplate.SMSTemplates_Service(s).Read("101").Message, leads.Name),
                        Sent_To_Server = Sent_To_Server.No,
                        Sent_To_ServerSpecified = true,
                        Telephone_No = leads.Mobile_Phone_No,Scheduled_Date = DateTime.Today,Scheduled_DateSpecified = true,Scheduled_Time=DateTime.Now,Scheduled_TimeSpecified = true
                    };
                    new SMSMessages_Service(s).Create(ref smsmessages);

                }
                else
                {
                    leads.Source_Of_CustomerSpecified = true;
                    leads.Posting_Group = "LOANS";
                    otemplate.Create(ref leads);
                    SMSMessages.SMSMessages smsmessages = new SMSMessages.SMSMessages()
                    {
                        Entry_No = new SBCSERVICE.SBCSERVICE(s).lastsmsno() + 1,
                        Entry_NoSpecified=true,                      
                        Source = Source.Mobile_Banking,
                        SourceSpecified = true,
                        Account_No = leads.Mobile_Phone_No,
                        Date_Entered = DateTime.Today,
                        Date_EnteredSpecified = true,
                        SMS_Message = string.Format(new SmsTemplate.SMSTemplates_Service(s).Read("101").Message, leads.Name),
                        Sent_To_Server = Sent_To_Server.No,
                        Sent_To_ServerSpecified = true,
                        Telephone_No = leads.Mobile_Phone_No,Scheduled_Date = DateTime.Today,Scheduled_DateSpecified = true,Scheduled_Time=DateTime.Now,Scheduled_TimeSpecified = true
                    };
                    new SMSMessages_Service(s).Create(ref smsmessages);
                   
                    result.Contents = leads;
                }
            }
            catch (Exception ex)
            {
                Log.Error(ex, "Leads");

                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }

       
        [HttpGet]
        [Route("banner")]
        public IHttpActionResult Banner()
        {
           
            SpringTV.SpringTV_Service otemplate = new SpringTV.SpringTV_Service(s);
            SpringTV.SpringTV[] templates = otemplate.ReadMultiple(new SpringTV.SpringTV_Filter[] { new SpringTV.SpringTV_Filter { Criteria = $">={DateTime.Today.ToString()}", Field = SpringTV.SpringTV_Fields.Expiry_Date } }, null, 0).OrderBy(o => o.Sequence).ToArray();

            return Ok(templates);
        }
             

    }

    public class Results<T>
    {
        public int Code { get; set; } = 0;
        public string Desc { get; set; }
        public T Contents { get; set; }
    }
}