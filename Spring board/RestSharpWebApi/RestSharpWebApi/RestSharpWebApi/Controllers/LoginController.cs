using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Http;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;
using System.Web.Services.Description;
using System.Web.UI.WebControls.WebParts;

using RestSharpWebApi.Models;
using RestSharpWebApi.CustomerCard;
using RestSharpWebApi.MobilitySetup;
using Twilio;
using Twilio.Rest.Api.V2010.Account;
using Twilio.Types;
using RestSharpWebApi.Loginhistory;

using Serilog;

namespace RestSharpWebApi.Controllers
{
    public partial class LoginController : ApiController//Login
    {
        private Setting s = new Setting();
        #region Register 

        [HttpGet]
        [Route("GetCustomerByNationalID/{NationalID}")]
        public Results<CustomerApplicationCard.CustomerApplicationCard> GetCustomer(string NationalID)
        {
            Results<CustomerApplicationCard.CustomerApplicationCard> results = new Results<CustomerApplicationCard.CustomerApplicationCard>();

            CustomerApplicationCard.CustomerApplicationCard_Service service = new CustomerApplicationCard.CustomerApplicationCard_Service(s);



            var c = new CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = NationalID, Field = CustomerCard.CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault();
           
            if (c != null)
            {
                results.Code = -1;
                results.Desc = "Your are already registered as a customer. Please login to proceed";
            }
            var user = service.ReadMultiple(new CustomerApplicationCard.CustomerApplicationCard_Filter[] { new CustomerApplicationCard.CustomerApplicationCard_Filter { Criteria = NationalID, Field = CustomerApplicationCard.CustomerApplicationCard_Fields.Identification_Doc_No }, new CustomerApplicationCard.CustomerApplicationCard_Filter { Criteria = "Open|Approved|Pending", Field = CustomerApplicationCard.CustomerApplicationCard_Fields.Status } }, null, 0).FirstOrDefault();

            if (user != null)
            {
                results.Contents = user;
            }

            return results;
        }
        [HttpPost]
        [Route("GetOTP")]
        public Results<Mobile_Login> getOTP(string Nationalid)
        {
            Results<Mobile_Login> result = new Results<Mobile_Login>();

            HelaEntities db = new HelaEntities(s.ConnectionString);
            int otpExpirtyInMinutes = 10;//we are picking this from the setup table

         

            CustomerCard.CustomerCard customer = new CustomerCard.CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = Nationalid, Field = CustomerCard.CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault();

            if (customer == null)
            {
                result.Code = -1;
                result.Desc = "You are yet to be a customer. Go to Join Us on home page to continue";
                return result;
            }

           // var user = omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = Nationalid, Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();

            var user = db.Mobile_Logins.Where(o=> o.Username == Nationalid).FirstOrDefault();
            if (user == null)
            {
                user = new Mobile_Login();
                user.Username = Nationalid;
                user.Customer_No = customer.No;

                try
                {
                   db.Mobile_Logins.Add(user);
                    //omobileTemplate.Create(ref user);
                } catch (Exception ex)
                {
                    result.Code = -1;
                    result.Desc = ex.Message.ToString();
                    return result;

                }


            }

            Functions func = new Functions();
            int otp = func.getRandomNumber();
            user.OTP = otp;

            DateTime newTime = DateTime.Now;
            newTime = newTime.AddMinutes(otpExpirtyInMinutes);

            user.OTP_Time = newTime;
            //user.OTP_TimeSpecified = true;
            //Update  OTP
            db.SaveChanges();   
           // omobileTemplate.Update(ref user);
            //bulk sms and email sending logic to come here
            //string firstname = customer.Name.Split(' ')[0];
            //string secondname = customer.Name.Split(' ')[1];
            //string lastname = customer.Name.Split(' ')[2];
            CreateSMS(customer.Mobile_Phone_No, customer.No, "Dear " + customer.Name + ", your verification code is " + otp.ToString() + ". Do not share the code with anyone.");
            result.Contents = user;
            return result;
        }
        private void SplitNames() 
        {
            CustomerCard.CustomerCard_Service customerCard_Service = new CustomerCard.CustomerCard_Service(s);
            CustomerCard.CustomerCard customer = new CustomerCard.CustomerCard();
        }
        private void CreateSMS(string telNo,string customerNo,string message)
        {
            SMSMessages.SMSMessages_Service _Service = new SMSMessages.SMSMessages_Service(s);
            Results<SMSMessages.SMSMessages> messageresults = new Results<SMSMessages.SMSMessages>();
            SMSMessages.SMSMessages messages = new SMSMessages.SMSMessages();
            int num = 0;
            var record = _Service.ReadMultiple(null, null, 0).LastOrDefault();
            if (record != null)
            {
                num = record.Entry_No;
            }
            num++;
            messages.Entry_No = num;
            messages.Entry_NoSpecified = true;
            messages.Telephone_No = telNo;
            messages.Account_No = customerNo;
            messages.SMS_Message = message;
            messages.Scheduled_Date = DateTime.Today;
            messages.Scheduled_Time = DateTime.Now;
            messages.Source = SMSMessages.Source.Mobile_Banking;
            messages.SourceSpecified = true;
            messages.Scheduled_DateSpecified = true;
            messages.Scheduled_TimeSpecified = true;
            try
            {
                _Service.Create(ref messages);
            }
            catch {; }
        }
        
        [HttpPost]
        [Route("RegisterCustomerForMobile")]
        public Results<Mobile_Login> RegisterCustomerForMobile(Mobile_Login details)
        {
            Results<Mobile_Login> result = new Results<Mobile_Login>();

            if (new CustomerCard.CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = details.Username, Field = CustomerCard.CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault() == null)//do not exist as a customer yet
            {
                result.Code = -1;
                result.Desc = "You are yet to be a customer. Go to Join Us on home page to continue";
            }
            else//check if this dude has login details
            {

           HelaEntities db = new HelaEntities(s.ConnectionString);

              // var user = omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = details.Username.ToString(), Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();

               var user = db.Mobile_Logins.Where(o=> o.Username == details.Username).FirstOrDefault();

                if (!string.IsNullOrEmpty(user.PIN))
                {
                    result.Code = -1;
                    result.Desc = "Already registered, kindly Login";
                    return result;
                }
                if (user != null)//is a customer but not yet registered for mobile
                {

                    if (user.OTP_Time.Value < DateTime.Now)
                    {
                        result.Code = -1;
                        result.Desc = "Otp Expired";
                        return result;
                    }

                    if (!user.OTP.ToString().Equals(details.Otp_entered))
                    {
                        result.Code = -1;
                        result.Desc = "Invalid Otp";
                        return result;
                    }

                    user.IsVerified = true;
                  //  details.IsVerifiedSpecified = true;
                    

                    //we need to encrypt the pin

                    user.PIN = s.Encrypt(details.PIN);
                    user.SecurityQuestion1 = details.SecurityQuestion1;
                    user.Answer1 = details.Answer1;
                    user.SecurityQuestion2 = details.SecurityQuestion2;
                    user.Answer2 = details.Answer2;

                    //details.OTPSpecified = true;

                    //send SMS
                    //details.Key = user.Key;
                    details.Otp_entered = null;
                    db.SaveChanges();
                    //omobileTemplate.Update(ref details);
                    result.Code = 0;
                    result.Desc = "";
                    result.Contents = details;
                }
                else
                {
                    result.Code = -1;
                    result.Desc = "Login Account Not found, kindly try again";
                    result.Contents = user;
                }

            }


            return result;
        }

        //[HttpPost]
        //[Route("RegisterCustomerForMobile")]
        //public Results<MobileLogin.MobileLogin> RegisterCustomerForMobile(MobileLogin.MobileLogin details)
        //{
        //    Results<MobileLogin.MobileLogin> result = new Results<MobileLogin.MobileLogin>();

        //    if (new CustomerCard.CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = details.Username, Field = CustomerCard.CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault() == null)//do not exist as a customer yet
        //    {
        //        result.Code = -1;
        //        result.Desc = "You are yet to be a customer. Go to Join Us on home page to continue";
        //    }
        //    else//check if this dude has login details
        //    {

        //        MobileLogin.MobileLogin ologin = new MobileLogin.MobileLogin();

        //        MobileLogin.MobileLogin_Service omobileTemplate = new MobileLogin.MobileLogin_Service(s);


        //       var user = omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = details.Username.ToString(), Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();


        //        if (!string.IsNullOrEmpty(user.PIN))
        //        {
        //            result.Code = -1;
        //            result.Desc = "Already registered, kindly Login";
        //            return result;
        //        }
        //        if (user != null)//is a customer but not yet registered for mobile
        //        {

        //            if (user.OTP_Time.AddHours(3) < DateTime.Now)
        //            {
        //                result.Code = -1;
        //                result.Desc = "Otp Expired";
        //                return result;
        //            }

        //            if (!user.OTP.ToString().Equals(details.Otp_entered))
        //            {
        //                result.Code = -1;
        //                result.Desc = "Invalid Otp";
        //                return result;
        //            }

        //            details.IsVerified = true;
        //            details.IsVerifiedSpecified = true;


        //            //we need to encrypt the pin

        //            details.PIN = s.Encrypt(details.PIN);

        //            details.OTPSpecified = true;

        //            //send SMS
        //            details.Key = user.Key;
        //            details.Otp_entered = null;
        //            omobileTemplate.Update(ref details);
        //            result.Code = 0;
        //            result.Desc = "";
        //            result.Contents = details;
        //        }
        //        else
        //        {
        //            result.Code = -1;
        //            result.Desc = "Login Account Not found, kindly try again";
        //            result.Contents = user;
        //        }

        //    }


        //    return result;
        //}

        [HttpPost]
        [Route("Forgotpin")]
        public Results<Mobile_Login> Forgotpin(Mobile_Login details)
        {
            Results<Mobile_Login> result = new Results<Mobile_Login>();



            if (new CustomerCard.CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = details.Username, Field = CustomerCard.CustomerCard_Fields.Identification_Doc_No } }, null, 0).FirstOrDefault() == null)//do not exist as a customer yet
            {
                result.Code = -1;
                result.Desc = "You are yet to be a customer. Go to Join Us on home page to continue";
            }
            else//check if this dude has login details
            {
                HelaEntities db = new HelaEntities(s.ConnectionString);
              


                var user = db.Mobile_Logins.Where(o => o.Username == details.Username).FirstOrDefault()     ;//  omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = details.Username.ToString(), Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();

               
                if (user != null)//is a customer but not yet registered for mobile
                {

                    if (user.OTP_Time < DateTime.Now)
                    {
                        result.Code = -1;
                        result.Desc = "Otp Expired";
                        return result;
                    }

                    if (!user.OTP.ToString().Equals(details.Otp_entered))
                    {
                        result.Code = -1;
                        result.Desc = "Invalid Otp";
                        return result;
                    }

                    user.IsVerified = true;
                    //details.IsVerifiedSpecified = true;

                    //we need to encrypt the pin

                    user.PIN = s.Encrypt(details.PIN);

                    //details.OTPSpecified = true;

                    //send SMS
                  //  details.Key = user.Key;
                    details.Otp_entered = null;
                    db.SaveChanges();   
                    //omobileTemplate.Update(ref details);
                    result.Code = 0;
                    result.Desc = "";
                    result.Contents = details;
                }
                else
                {
                    result.Code = -1;
                    result.Desc = "Login Account Not found, kindly try again";
                    result.Contents = user;
                }

            }


            return result;
        }

        #endregion

        #region login

        [HttpPost]
        [Route("ChangePIN")]
        public Results<Mobile_Login> ChangePIN(string Nationalid, string PIN, string NewPIN, int OTP)
        {
            HelaEntities db = new HelaEntities(s.ConnectionString);

            Results<Mobile_Login> result = new Results<Mobile_Login>();
            //int otpExpirtyInMinutes = 10;//we are picking this from the setup table
            if (PIN.Equals(NewPIN))
            {
                result.Code = -1;
                result.Desc = "The Old PIN cannot be the same as the new PIN";
                return result;

            }
           
            try
            {
               // MobileLogin.MobileLogin oMobLogin = otemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = Nationalid, Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();
                Mobile_Login oMobLogin  = db.Mobile_Logins.Where(o=> o.Username == Nationalid ).FirstOrDefault();
                if (oMobLogin != null)
                {
                    if (OTP != oMobLogin.OTP)
                    {
                        result.Code = -1;
                        result.Desc = "Invalid OTP";
                        return result;
                    }
                    if (oMobLogin.OTP_Time < DateTime.Now)
                    {
                        result.Code = -1;
                        result.Desc = "Sorry but the OTP has expired";
                        return result;
                    }

                    if (s.Encrypt(PIN) == oMobLogin.PIN)

                    {

                        oMobLogin.PIN = s.Encrypt(NewPIN);
                        db.SaveChanges();
                        //otemplate.Update(ref oMobLogin);
                        result.Desc = "";
                        result.Contents = oMobLogin;


                    }
                    else
                    {
                        result.Code = -1;
                        result.Desc = "Invalid old PIN";
                    }

                }
                else
                {
                    result.Code = -1;
                    result.Desc = "Invalid Customer Details";
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
        [Route("Login")]
        public Results<CustomerCard.CustomerCard> Login(string nationalID, string pin)
        {
            
            Results<CustomerCard.CustomerCard> results = new Results<CustomerCard.CustomerCard>();
            // Retrieve National ID from CustomerCard page
            HelaEntities db = new HelaEntities(s.ConnectionString);
            CustomerCard_Service otemplate = new CustomerCard_Service(s);
            var user = otemplate.ReadMultiple(new  CustomerCard_Filter[]{new  CustomerCard_Filter{Field = CustomerCard_Fields.Identification_Doc_No,Criteria = nationalID}}, null, 0).FirstOrDefault();

            try
            {
                if (user != null)
                {
                    // Verify PIN using MobileLogin page
                    //MobileLogin.MobileLogin_Service omobileTemplate = new MobileLogin.MobileLogin_Service(s);
                    //var mobileUser = omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[]
                    //{
                    //    new MobileLogin.MobileLogin_Filter
                    //    {
                    //        Field = MobileLogin.MobileLogin_Fields.Username,
                    //        Criteria = nationalID
                    //    }
                    //}, null, 0).FirstOrDefault();

                    var mobileUser = db.Mobile_Logins.Where(o=> o.Username == nationalID).FirstOrDefault();

                    if ((mobileUser != null))
                    {
                        
                        if (  (bool) (mobileUser.IsDisabled == null ? false: mobileUser.IsDisabled ))
                        {
                            results.Code = -1;
                            results.Desc = "Your Account is disabled. Please contact customer care for assistance";
                            Login_History lh = new Login_History() { Customer_No = nationalID, Login_Time = DateTime.Now,  Status = 1,  Comment = results.Desc };
                            db.Login_Histories.Add(lh);
                            return results;
                        }

                    }

                    if (mobileUser != null ) { 
                        if (s.Encrypt(pin).Equals(mobileUser.PIN))
                    {
                        mobileUser.Last_Login_Time = DateTime.Now;
                        //mobileUser.Last_Login_TimeSpecified = true;
                        mobileUser.Login_Attempts = 0;
                        //mobileUser._Login_AttemptsSpecified = true;
                       // omobileTemplate.Update(ref mobileUser);
                       db.SaveChanges();
                        user.login = mobileUser;
                        mobileUser.Profile_Picture = user.Profile_Picture;
                        results.Contents = user;
                        Login_History lh = new Login_History() { Customer_No = nationalID, Login_Time = DateTime.Now,  Status = 0 };
                        db.Login_Histories.Add(lh);

                    }
                    else
                    {
                        results.Code = -1;

                        mobileUser.Login_Attempts += 1;
                        //mobileUser._Login_AttemptsSpecified = true;

                        var setup = new MobilitySetup_Service(s).ReadMultiple(null, null, 0).FirstOrDefault();

                        results.Desc =
                            $"Invalid PIN, Your have {setup.Mobile_Login_Attempts - (mobileUser.Login_Attempts ==null ?0:mobileUser.Login_Attempts )} More login attempts";
                       
                        Login_History lh = new Login_History() { Customer_No = nationalID, Login_Time = DateTime.Now,  Status = 1,  Comment = results.Desc };
                        db.Login_Histories.Add(lh   );


                        if (mobileUser.Login_Attempts >= setup.Mobile_Login_Attempts)
                        {
                            mobileUser.IsDisabled = true;
                            //mobileUser.IsDisabledSpecified = true;
                        }
                        db.SaveChanges() ;  
                        //omobileTemplate.Update(ref mobileUser);
                    }}
                else
                {
                    results.Code = -1;
                    results.Desc = "Invalid Credentials";
                }
                }
                else
                {
                    results.Code = -1;
                    results.Desc = "Invalid Credentials";
                }
            }
            catch (Exception exe)
            {
                Log.Error(exe,"Login");
                results.Code = -1;
                results.Desc = exe.Message;
            }

            return results;
        }

        [HttpGet]
        [Route("securityquestions")]
        public Results<List<SecurityQuestions.SecurityQuestions>> GetSecurityQuestions()
        {
            Results<List<SecurityQuestions.SecurityQuestions>> results = new Results<List<SecurityQuestions.SecurityQuestions>>();
            SecurityQuestions.SecurityQuestions_Service otemplate = new SecurityQuestions.SecurityQuestions_Service(s);

            try
            {
                var templates = otemplate.ReadMultiple(null, null, 0);
                results.Desc = "Security questions retrieved successfully";
                results.Contents = templates.ToList();
            }
            catch (Exception ex)
            {
                results.Code = -1;
                results.Desc = "Security questions list not found";
            }

            return results; ;
        }

        [HttpPost]
        [Route("UpdateSecurityQuestionsandAnswers")]
        public Results<Mobile_Login> UpdateSecurityQuestionsandAnswers(string customerNo, string NewSecurityquestion1, string NewSecurityquestion2, string NewAnswer1, string NewAnswer2,int OTP)
        {
            HelaEntities db = new HelaEntities(s.ConnectionString);
            //int otpExpirtyInMinutes = 10;//we are picking this from the setup table
            // string  Securityquestion1="", NewSecurityquestion1="", Answer1="", NewAnswer1="", Securityquestion2="", Answer2="", NewSecurityquestion2="", NewAnswer2="";
            Results<Mobile_Login> result = new Results<Mobile_Login>();
         
            CustomerCard.CustomerCard customer = new CustomerCard.CustomerCard_Service(s).ReadMultiple(new CustomerCard.CustomerCard_Filter[] { new CustomerCard.CustomerCard_Filter { Criteria = customerNo, Field = CustomerCard.CustomerCard_Fields.No } }, null, 0).FirstOrDefault();

            Mobile_Login oMobLogin = db.Mobile_Logins.Where(o=> o.Customer_No == customerNo).FirstOrDefault() ;
            try
            {
                if (oMobLogin != null)
                {
                    if (OTP != oMobLogin.OTP)
                    {
                        result.Code = -1;
                        result.Desc = "Invalid OTP";
                        return result;
                    }
                    if (oMobLogin.OTP_Time < DateTime.Now)
                    {
                        result.Code = -1;
                        result.Desc = "Sorry but the OTP has expired";
                        return result;
                    }

                    oMobLogin.SecurityQuestion1 = NewSecurityquestion1;
                    oMobLogin.Answer1 = NewAnswer1;
                    oMobLogin.SecurityQuestion2 = NewSecurityquestion2;
                    oMobLogin.Answer2 = NewAnswer2;
                    db.SaveChanges();   
                    //otemplate.Update(ref oMobLogin);
                    result.Desc = "";
                    result.Contents = oMobLogin;
                   
                }
                else
                {
                    result.Code = -1;
                    result.Desc = "Invalid Customer Details";
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
        [Route("GetMemberLogin")]
        public Results<Mobile_Login> GetMemberLogin(string Nationalid)
        {
            Results<Mobile_Login> result = new Results<Mobile_Login>();


            HelaEntities db = new HelaEntities(s.ConnectionString);



            var user = db.Mobile_Logins.Where(o => o.Username == Nationalid).FirstOrDefault();// omobileTemplate.ReadMultiple(new MobileLogin.MobileLogin_Filter[] { new MobileLogin.MobileLogin_Filter { Criteria = Nationalid, Field = MobileLogin.MobileLogin_Fields.Username } }, null, 0).FirstOrDefault();


            if (user == null)
            {
                result.Code = -1;
                result.Desc = "Member login info not found";
                return result;
            }


            result.Contents = user;


            return result;
        }
        #endregion
    }
}