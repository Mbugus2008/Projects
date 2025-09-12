using RestSharpWebApi.Models;
using RestSharpWebApi.TransactionCharges;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using RestSharpWebApi.RateUs;
using RestSharpWebApi.SMSMessages;
using Twilio.TwiML.Voice;
using RestSharpWebApi.CustomerCard;
using Microsoft.Graph.Models;
using System.Security.Policy;
using Twilio.TwiML.Fax;

namespace RestSharpWebApi.Controllers
{
    public class CustomerRequestsController : ApiController
    {
        Setting s =  new Setting();
 [HttpPost]
        [Route("UpdateCustomerNotifications")]
        public Results<CustomerCard.CustomerCard> UpdateCustomerNotifications(string customerNo, bool enableEmail, bool enableSMS)
        {
            Results<CustomerCard.CustomerCard> result = new Results<CustomerCard.CustomerCard>();
            CustomerCard.CustomerCard_Service otemplate = new CustomerCard.CustomerCard_Service(s);

            try
            {
                CustomerCard.CustomerCard customer = otemplate.Read(customerNo);
                if (customer != null)
                {
                    customer.Enable_Email = enableEmail;
                    customer.Enable_SMS = enableSMS;
                    customer.Enable_EmailSpecified = true;
                    customer.Enable_SMSSpecified = true;

                    otemplate.Update(ref customer);

                    result.Contents = customer;
                }
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpGet]
        [Route("requestcharges")]
        public Results<List<TransactionCharges.Transactioncharges>> requestcharges()
        {
            Results<List<TransactionCharges.Transactioncharges>> result = new Results<List<TransactionCharges.Transactioncharges>>();

            Transactioncharges_Service _Service = new Transactioncharges_Service(s);


            try
            {
                result.Contents = _Service.ReadMultiple(null, null, 0).ToList();
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpGet]
        [Route("Pdcheques")]
        public Results<List<PDChequesHold.PDChequesHold>> Pdcheques(string customerNo)
        {
            Results<List<PDChequesHold.PDChequesHold>> result = new Results<List<PDChequesHold.PDChequesHold>>();

            PDChequesHold.PDChequesHold_Service _Service = new PDChequesHold.PDChequesHold_Service(s);
            try
            {
                result.Contents = _Service.ReadMultiple(new PDChequesHold.PDChequesHold_Filter[] { new PDChequesHold.PDChequesHold_Filter { Criteria = customerNo, Field = PDChequesHold.PDChequesHold_Fields.Customer_No }, new PDChequesHold.PDChequesHold_Filter { Field = PDChequesHold.PDChequesHold_Fields.Due_Date, Criteria = string.Format(">{0}", DateTime.Today.ToString()) } }, null, 0).OrderBy(o=> o.Due_Date).ToList();
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }
        [HttpPost]
        [Route("CustomerFeedBack")]
        public Results<RateUs.RateUs> CustomerFeedBack(CustomerFeedBack feedBack)
        {
            DateTime datetime = DateTime.Now;
            Results<RateUs.RateUs> result = new Results<RateUs.RateUs>();
            RateUs.RateUs_Service otemplate = new RateUs.RateUs_Service(s);
                    try
            {
                //var customer = otemplate.ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = feedBack.Customer, Field = CustomerCard.CustomerCard_Fields.No } }, null, 0).FirstOrDefault();
                var newfeedback = new RateUs.RateUs();
                if (feedBack != null)
                {
                    newfeedback.Is_Anonymous = feedBack.Is_Anonymous;
                    newfeedback.Is_AnonymousSpecified = true;

                    if (newfeedback.Is_Anonymous == true)
                    {
                        newfeedback.CustomerNo = null;
                        newfeedback.Customer_Name = null;
                        
                    }
                    else
                    {
                        newfeedback.CustomerNo = feedBack.Customer;
                    }
                    newfeedback.Customer_Name = feedBack.name;
                    newfeedback.Mobile = feedBack.mobileNo;
                    newfeedback.Email = feedBack.email;
                    newfeedback.Description = feedBack.FeedBack;
                    newfeedback.Date__Time = datetime;
                    newfeedback.Date__TimeSpecified = true;
                    newfeedback.Is_Anonymous = feedBack.Is_Anonymous;
                    newfeedback.Is_AnonymousSpecified = true;
                    otemplate.Create(ref newfeedback);
                    result.Desc = "";
                    result.Contents = newfeedback;
                }
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }

        [HttpGet]
        [Route("GetCustomerRatingFeedBack")]
        public Results<RatingCard.RatingCard> GetCustomerRatingFeedBack(string customerNo)
        {
            Results<RatingCard.RatingCard> result = new Results<RatingCard.RatingCard>();
           RatingCard. RatingCard_Service otemplate = new RatingCard.RatingCard_Service(s);

            try
            {
                RatingCard.RatingCard templates = otemplate.ReadMultiple(
       new RatingCard.RatingCard_Filter[]
       {
            new RatingCard.RatingCard_Filter
            {
                Field = RatingCard.RatingCard_Fields.Customer_No,
                Criteria = customerNo
            }
       },
       null,
       0).OrderByDescending(o => o.Log_ID).FirstOrDefault();

                result.Contents = templates;
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
               
                Log.Error(ex, "Feedback");
            }
            return result;
        }
        [HttpPost]
        [Route("SetCustomerRatingFeedBack")]
        public Results<RateUs.RateUs> SetCustomerRatingFeedBack(string customerNo, int rating,string description, bool isanonymous)
        {
            Results<RateUs.RateUs> result = new Results<RateUs.RateUs>();
            RateUs.RateUs_Service otemplate = new RateUs.RateUs_Service(s);
            
            var existingRating = otemplate.ReadMultiple(new RateUs.RateUs_Filter[] { new RateUs.RateUs_Filter { Field = RateUs.RateUs_Fields.CustomerNo, Criteria = customerNo }, new RateUs.RateUs_Filter { Field = RateUs.RateUs_Fields.Rating, Criteria = rating.ToString() } }, null, 0).FirstOrDefault();
            try
            {
               
                if (existingRating != null)
                {
                    existingRating.Rating = rating;
                    existingRating.Description = description;
                    existingRating.RatingSpecified = true;
                    existingRating.Date__Time = DateTime.Now;
                    existingRating.Date__TimeSpecified = true;

                    otemplate.Update(ref existingRating);
                    result.Contents = existingRating;
                }
                else
                {
                    RateUs.RateUs r = new RateUs.RateUs();
                    r.Is_Anonymous = isanonymous;
                    r.Is_AnonymousSpecified = true;
                    r.Rating = rating;
                    r.RatingSpecified = true;
                    if (r.Is_Anonymous == true)
                    {
                        r.CustomerNo = null;
                        r.Customer_Name = null;
                    }
                    else
                    {
                        r.CustomerNo = customerNo;
                    }
                    r.Description = description;
                    r.Date__Time = DateTime.Now;
                    r.Date__TimeSpecified = true;
                    otemplate.Create(ref r);
                    result.Contents = r;
                }
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }

            return result;
        }
        /* [HttpPost]
         [Route("SetCustomerRatingFeedBack")]
         public Results<CustomerRating.CustomerRating> SetCustomerRatingFeedBack(string customerNo,int rating)
         {
             Results<CustomerRating.CustomerRating> result = new Results<CustomerRating.CustomerRating>();
             CustomerRating.CustomerRating_Service otemplate = new CustomerRating.CustomerRating_Service(s);
             var existingRating = otemplate.ReadMultiple(new CustomerRating.CustomerRating_Filter[] { new CustomerRating.CustomerRating_Filter { Field = CustomerRating.CustomerRating_Fields.Customer_No, Criteria = customerNo }, new CustomerRating.CustomerRating_Filter { Field = CustomerRating.CustomerRating_Fields.Rating, Criteria = rating.ToString() } }, null, 0).FirstOrDefault();
             try
             {
                 if (existingRating != null)
                 {
                     existingRating.Rating = rating;
                     existingRating.RatingSpecified = true;
                     existingRating.Date__Time = DateTime.Now;
                     existingRating.Date__TimeSpecified = true;

                     otemplate.Update(ref existingRating);
                     result.Contents = existingRating;
                 }
                 else 
                 {
                 CustomerRating.CustomerRating r = new CustomerRating.CustomerRating();
                 r.Rating = rating;
                 r.RatingSpecified = true;
                 r.Customer_No = customerNo;
                 r.Date__Time = DateTime.Now;
                 r.Date__TimeSpecified = true;
                 otemplate.Create(ref r);
                 result.Contents = r;
                 }
             }
             catch (Exception ex)
             {
                 result.Desc = ex.Message.ToString();
                 result.Code = -1;
             }

             return result;
         } */
        [HttpPost]
        [Route("ServiceRequest")]
        public Results<ProfileServiceRequest.ProfileServiceRequest> CreateServiceRequest(ProfileServiceRequest.ProfileServiceRequest service)
        {
            DateTime datetime = DateTime.Now;
            Results<ProfileServiceRequest.ProfileServiceRequest> result = new Results<ProfileServiceRequest.ProfileServiceRequest>();
            ProfileServiceRequest.ProfileServiceRequest_Service _Service = new ProfileServiceRequest.ProfileServiceRequest_Service(s);


            try
            {

            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }

        [HttpPost]
        [Route("customerServiceRequest")]
        public Results<CustomerRequest.CustomerRequest> CreatecustomerRequest(CustomerRequest.CustomerRequest service)
        {
            Results<CustomerRequest.CustomerRequest> result = new Results<CustomerRequest.CustomerRequest>();
            CustomerRequest.CustomerRequest_Service _Service = new CustomerRequest.CustomerRequest_Service(s);

            try
            {
                service.Request_Date = DateTime.Today;
                service.Effective_DateSpecified = true;
                service.Payment_ModeSpecified = true;
                service.Request_DateSpecified = true;
                service.Request_TypeSpecified = true;
                service.C_StatusSpecified = true;
                service.Old_ValueSpecified = true;
                service.New_ValueSpecified = true;
                var r = _Service.ReadMultiple(new CustomerRequest.CustomerRequest_Filter[] { new CustomerRequest.CustomerRequest_Filter { Criteria = service.Cheque_No, Field = CustomerRequest.CustomerRequest_Fields.Cheque_No }, new CustomerRequest.CustomerRequest_Filter { Criteria = service.Customer_No, Field = CustomerRequest.CustomerRequest_Fields.Customer_No }, new CustomerRequest.CustomerRequest_Filter { Criteria = "Applied", Field = CustomerRequest.CustomerRequest_Fields.C_Status } }, null, 0);
                if (r != null)
                {
                    var m = new CustomerCard_Service(s).Read(service.Customer_No);
_Service.Create(ref service);
                    string sms;

                    switch (service.Request_Type)
                    {
                      
                        case CustomerRequest.Request_Type.Hold_Cheque:
                           sms= string.Format(new SmsTemplate.SMSTemplates_Service(s).Read("102").Message, m.Name, service.Payment_Mode.ToString(), service.Request_Date.Date.ToString(), service.Effective_Date.Date.ToString());
                            
                            break;
                        default:
  sms= string.Format(new SmsTemplate.SMSTemplates_Service(s).Read("103").Message, m.Name, service.Payment_Mode.ToString(), service.Request_Date.Date.ToString(), service.Effective_Date.Date.ToString());
                            break;
                    }
                    //Dear { 0}, Your request to hold a { 1}
                    //of { 2}
                    //has been received to be banked on { 3}. To pay clear your balance kindly use Paybill 976950.Thank you for your continued support.
                   
                    SMSMessages.SMSMessages smsmessages = new SMSMessages.SMSMessages()
                    {
                        Entry_No = new SBCSERVICE.SBCSERVICE(s).lastsmsno() + 1,
                        Entry_NoSpecified = true,
                        Source = Source.Mobile_Banking,
                        SourceSpecified = true,
                        Account_No = service.Customer_No,
                        Date_Entered = DateTime.Today,
                        Date_EnteredSpecified = true,
                        SMS_Message = sms,
                        Sent_To_Server = Sent_To_Server.No,
                        Sent_To_ServerSpecified = true,
                        Telephone_No = m.Mobile_Phone_No,
                        Scheduled_Date = DateTime.Today,
                        Scheduled_DateSpecified = true,
                        Scheduled_Time = DateTime.Now,
                        Scheduled_TimeSpecified = true
                    };
                    new SMSMessages_Service(s).Create(ref smsmessages);

                    



                }
                else
                { result.Code = -1; result.Desc = "You have a pending request, kindly try again later"; }
                result.Contents = service;
            }
            catch (Exception ex)
            {
                result.Desc = ex.Message.ToString();
                result.Code = -1;
            }
            return result;
        }

    }
}
