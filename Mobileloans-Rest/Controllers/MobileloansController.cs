using CRB;
using Mobileloans_Rest.Loan_Products;
using Mobileloans_Rest.Loans;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web.Http;

namespace Mobileloans_Rest.Controllers
{
    public class MobileloansController : ApiController
    {
        private System.Net.NetworkCredential cd;
        private System.Net.NetworkCredential transcd;
        public Logging.settings s = new Logging.settings();
        Members.Members_Service Members_Service = new Members.Members_Service();
        Applications.Applications_Service applications_Service = new Applications.Applications_Service();
        Alternate.Alternate alternate = new Alternate.Alternate();

        Loans.Loan_Service Loans_Service = new Loans.Loan_Service();
        Loan_Products.Loan_Products_Service Loan_Products_Service = new Loan_Products.Loan_Products_Service();
                Id_nos.ID_Nos_Service iD_Nos_Service = new Id_nos.ID_Nos_Service();
        CRB.CRB crb;
        Transunion.ControllerKenyaImplService transunion = new Transunion.ControllerKenyaImplService();

   
        public MobileloansController()
        { 
     ServicePointManager.Expect100Continue = true;
ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls
                   | SecurityProtocolType.Tls11
                   | SecurityProtocolType.Tls12
                   | SecurityProtocolType.Ssl3;
            string path = System.Web.Hosting.HostingEnvironment.MapPath("~/Settings.xml");
            s = s.loadsettings(path);
            try
            {
                cd = new System.Net.NetworkCredential(s.navsettings.Username, s.navsettings.pass, s.navsettings.domain);

                transcd = new System.Net.NetworkCredential(s.transunion.url_username, s.transunion.url_password);

                Members_Service = new Members.Members_Service { Url = Logging.misc.geturl(s, Members_Service.Url), Credentials = cd, PreAuthenticate = true };
                applications_Service = new Applications.Applications_Service { Url = Logging.misc.geturl(s, applications_Service.Url), Credentials = cd, PreAuthenticate = true };
                Loans_Service = new Loans.Loan_Service { Url = Logging.misc.geturl(s, Loans_Service.Url), Credentials = cd, PreAuthenticate = true };
                alternate = new Alternate.Alternate { Url = Logging.misc.geturl(s, alternate.Url), Credentials = cd, PreAuthenticate = true };
                Loan_Products_Service = new Loan_Products.Loan_Products_Service { Url = Logging.misc.geturl(s, Loan_Products_Service.Url), Credentials = cd, PreAuthenticate = true };
                iD_Nos_Service = new Id_nos.ID_Nos_Service { Url = Logging.misc.geturl(s, iD_Nos_Service.Url), Credentials = cd, PreAuthenticate = true };
                crb = new CRB.CRB("22225", "v2_1", "XUcTDIGWVgNClJomHEOqUxoLllFyKE", "uyZCfVEuOZsRGzOuTAmzFuIRBKzlUkUoJUQqrWKgVEXCFLyyNmAtGiMJvNUp");
 transunion.Url = s.transunion.url;
                Uri uri = new Uri(transunion.Url);
                ICredentials credentials = transcd.GetCredential(uri, "Basic");
               
                transunion.Credentials = credentials;
                transunion.PreAuthenticate = true;
            
            }
            catch (Exception ex) {
                Logging.Logging.ReportError(ex);
            }


        }
        [HttpPost]
        [Route("api/member")]
        public Results member(member phone)
        {
          //var j =  JsonConvert.DeserializeObject<otp>(phone.ToString());
            Results r = new Results();
            try
            {
                phone.phone = phone.phone.Replace(" ", "");
                phone.phone = string.Format("254{0}", phone.phone.Substring(phone.phone.Length - 9));

                Logging.Logging.LogEntryOnFile(phone.phone);

                r.content = Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = phone.phone, Field = Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();
           
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        [HttpPost]
        [Route("api/resetpass")]
        public Results resetpass(member phone)
        {
            //var j =  JsonConvert.DeserializeObject<otp>(phone.ToString());
            Results r = new Results();
            try
            {
                phone.phone = phone.phone.Replace(" ", "");
                phone.phone = string.Format("254{0}", phone.phone.Substring(phone.phone.Length - 9));
                Logging.Logging.LogEntryOnFile(phone.phone);
                var member = Members_Service.ReadMultiple(new Members.Members_Filter[] {new Members.Members_Filter { Criteria = phone.Id_No,Field = Members.Members_Fields.ID_No} },null,0).FirstOrDefault();
                if (member == null)
                {
                    throw new response(1, "Account not found");
                }
                if (!member.Phone_No .Equals(phone.phone))
                    throw new response(1, "Account not found");

                otp otp = new otp();
                otp.message = "Your pin has been reset, your new pin is " + phone.pin;
                otp.phone = phone.phone;
                Otp(otp);
                member.Password = phone.pin;
                member.Pin_changed = false;
                Members_Service.Update(ref member);
                r.content = member;
            }
            catch (response res)
            {
                Logging.Logging.ReportError(res);
                r.Code = res.code;
                r.Desc = res.desc;

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }

        private int matchnames(string name1,string iprs) {

            var n1 = name1.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            var n2 = iprs.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            List<string> result = n2.Where(item =>
    n1.Any(category => category.Equals(item))).ToList();
            return result.Count();
        }


        [HttpPost]
        [Route("api/createmember")]
        public Results Createmember(Members.Members m)
        {
            Results r = new Results();
            Applications.Applications app = new Applications.Applications();

            //throw new response(1, "Service unavailable, try again later");
            r.content = m;
            try
            {
                m.Phone_No = m.Phone_No.Replace(" ", "");
                m.Phone_No = string.Format("254{0}", m.Phone_No.Substring(m.Phone_No.Length - 9));
                m.Eloan_Limit = 200;
                m.Eloan_LimitSpecified = true;
                m.Registration_Date = DateTime.Today;
                m.Registration_DateSpecified = true;
                m.Comment2 = m.Name;


                app.Name = m.Name;
                app.Phone_No = m.Phone_No;
                app.ID_No = m.ID_No;
                app.Status = Applications.Status.Approved;
                app.StatusSpecified = true;
                applications_Service.Create(ref app);


                if (m.Ref_1.Length < 9)
                {
                    app.Status = Applications.Status.Rejected;
                    app.StatusSpecified = true;
                    app.Name_2 = m.Name;
                    app.Comments = "Invalid referee phone Number 1";
                    applications_Service.Update(ref app);
                    throw new response(1, "Please enter a valid referee phone Number 1");
                }
                if (m.Ref_2.Length < 9)
                {
                    app.Name_2 = m.Name;
                    app.Comments = "Invalid referee phone Number 2";
                    applications_Service.Update(ref app);
                    throw new response(1, "Please enter a valid referee phone Number 2");
                }
                var mm = Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = m.Phone_No, Field = Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();

                if (mm == null)
                {
                    var mb = Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = m.ID_No, Field = Members.Members_Fields.ID_No } }, null, 0).FirstOrDefault();
                    if (mb == null)
                    {
                        //var regid = iD_Nos_Service.Read(m.ID_No);
                        //if (regid != null)
                        //{
                        //    m.Name = string.Format("{0} {1} {2}", regid.First_Name, regid.Last_Name, regid.Other_Name);
                        //    m.Date_of_Birth = regid.DoB;
                        //    m.Date_of_BirthSpecified = true;
                        //    if (matchnames(m.Comment2, m.Name) >= 2)
                        //    {
                        //        app.Status = Applications.Status.Rejected;
                        //        app.StatusSpecified = true;
                        //        app.Name_2 = m.Name;
                        //        app.Comments = "Name Mismatch";
                        //        applications_Service.Update(ref app);
                        //        throw new response(1, "Name entered does not match you ID Name, Kindly check the name and make sure it is exactly as it appears in your ID");
                        //    }
                        var id = iD_Nos_Service.Read(m.ID_No);
                        if (id == null)
                        {
                            var tran121 = transunion.getProduct121(s.transunion.username, s.transunion.password, s.transunion.code, s.transunion.infinityCode, "Surname ", "", "", "", m.ID_No, "", "", "", "", new DateTime(), false, "", "", "", "", "", "", "", "", "", 1);
                            Logging.Logging.CreateXML(tran121);
                            if (tran121.responseCode == 200)
                            {
                                id = new Id_nos.ID_Nos();
                                id.No = mm.ID_No;

                                id.First_Name = tran121.personalProfile.surname;
                                id.Other_Name = tran121.personalProfile.otherNames;
                                id.DoB = tran121.personalProfile.dateOfBirth;
                                id.DoBSpecified = true;
                                id.Credit_Active = tran121.summary.creditActive;
                                id.Credit_ActiveSpecified = true;
                                iD_Nos_Service.Create(ref id);

                                m.Name = String.Join(" ", id.First_Name, id.Other_Name);
                            }
                        }
                        else
                            m.Name = String.Join(" ", id.First_Name, id.Other_Name);


                        Members_Service.Create(ref m);
                        r.content = m;
                        //}
                        //else
                        //{


                        //    CRB.identity iid = new identity();
                        //    iid.identity_number = m.ID_No;

                        //    iid.identity_type = "001";
                        //    iid.report_type = 1;

                        //    var i = crb.get_identity(iid);
                        //    Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(i));
                        //    if (i.has_error == false)
                        //    {

                        //        Id_nos.ID_Nos ids = new Id_nos.ID_Nos();
                        //        ids.No = m.ID_No;
                        //        ids.First_Name = i.first_name;
                        //        ids.Last_Name = i.last_name;
                        //        ids.Other_Name = i.other_name;
                        //        try
                        //        {
                        //            var dob = i.dob.Split(new char[] { '-' }, StringSplitOptions.None);
                        //            ids.DoB = new DateTime(Convert.ToInt32(dob[0]), Convert.ToInt32(dob[1]), Convert.ToInt32(dob[2]));
                        //            ids.DoBSpecified = true;
                        //        }
                        //        catch (Exception ee)
                        //        {
                        //            Logging.Logging.ReportError(ee);
                        //        }


                        //        iD_Nos_Service.Create(ref ids);

                        //        m.Name = string.Format("{0} {1} {2}", ids.First_Name, ids.Last_Name, ids.Other_Name);
                        //        m.Date_of_Birth = ids.DoB;
                        //        m.Date_of_BirthSpecified = true;
                        //        app.Name_2 = m.Name;
                        //        applications_Service.Update(ref app);
                        //        if (matchnames(m.Comment2, m.Name) >= 2)
                        //        {
                        //            app.Status = Applications.Status.Rejected;
                        //            app.StatusSpecified = true;
                        //            app.Name_2 = m.Name;
                        //            app.Comments = "Name Mismatch";
                        //            applications_Service.Update(ref app);
                        //            throw new response(1, "Name entered does not match you ID Name, Kindly check the name and make sure it is exactly as it appears in your ID");
                        //        }
                        //        Members_Service.Create(ref m);
                        //        r.content = m;

                        //    }
                        //    else
                        //    {
                        //        Logging.Logging.LogEntryOnFile(i.api_code_description);
                        //        r.Code = 1;
                        //        r.Desc = "Unable to verify your ID NO";
                        //    }
                        //}

                    }
                    else
                    {
                        r.Code = 1;
                        r.Desc = "Customer already Exist.";
                    }
                }
                else
                {
                    r.Code = 1;
                    r.Desc = "Customer already Exist."; ;
                }
            }
            catch (response res)
            {
                Logging.Logging.ReportError(res);
                r.Code = res.code;
                r.Desc = res.desc;

            }
            catch (Exception ex)
            {   
                Logging.Logging.ReportError(ex);
               // app.Comments = ex.Message.Substring(0, 50);
                app.Status = Applications.Status.Rejected;
                app.StatusSpecified = true;
                applications_Service.Update(ref app);
           
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;

        }
        [HttpPost]
        [Route("api/changepass")]
        public Results changepass(Members.Members m)
        {
            Results r = new Results();
            r.content = m;
            try
            {
                m.Phone_No = m.Phone_No.Replace(" ", "");
                m.Phone_No = string.Format("254{0}", m.Phone_No.Substring(m.Phone_No.Length - 9));
               

                var mm = Members_Service.ReadMultiple(new Members.Members_Filter[] { new Members.Members_Filter { Criteria = m.Phone_No, Field = Members.Members_Fields.Phone_No } }, null, 0).FirstOrDefault();

                if (mm != null)
                {
                    mm.Password = m.Password;
                    Members_Service.Update(ref mm);
                }
                else
                {
                    r.Code = 1;
                    r.Desc = "Record does not Exist."; ;
                }
            }
            catch (response res)
            {
                Logging.Logging.ReportError(res);
                r.Code = res.code;
                r.Desc = res.desc;

            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;

        }
        [HttpPost]
        [Route("api/otp")]
        public Results Otp(otp data)
        {
            
            Results r = new Results();
            try
            {
                // 
                if (data.message.Contains("Your loan application otp"))
                {
                    var loans = Loans_Service.ReadMultiple(new Loan_Filter[] { new Loan_Filter { Criteria = data.phone, Field = Loan_Fields.Mobile } }, null, 0);

                    var l = loans.Where(o => o.Status == Status.Application ||
                    o.Status == Status.Appraisal ||
                    o.Status == Status.Approved ||
                    o.Status == Status.Sending_Money);
                    if (l.Any())
                        throw new response(1, "Your previous loan is still under processing, Kindly wait");
                }
                alternate.SendSms("Mobile", data.phone, data.message, false, data.phone);
                  r.content = data;
                //r.Code = -1;
                //r.Desc = "Service is currently under maintenance, Please try again later";
            }
            catch (response res)
            {
                Logging.Logging.ReportError(res);
                r.Code = res.code;
                r.Desc = res.desc;

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/Loans")]
        public Results loans(Loans.Loan data)
        {

            Results r = new Results();
            try
            {
                var mm = Members_Service.Read(data.Client_Code);
                if (mm == null)
                    throw new response(1, "Account misssing");
                if (mm.Eligibility > 0)
                    if (data.Requested_Amount > mm.Eligibility)
                        throw new response(1,String.Format("Amount Applied Exceeds your limit of Kes {0}",mm.Eligibility));

                var lp = Loan_Products_Service.Read("L01");
                if (lp == null)
                    throw new response(1, "Loan setup not found");
                if (lp.Blocked == true)
                    throw new response(1, "Service is currently unavailable");
                if (mm.Eligibility == 0)
                    if (data.Requested_Amount != lp.Min_Loan_Amount)
                        throw new response(1, String.Format("Amount Applied is below minimum of Kes {0} ",lp.Min_Loan_Amount));

                var loans = Loans_Service.ReadMultiple(new Loan_Filter[] { new Loan_Filter { Criteria = data.Client_Code, Field = Loan_Fields.Client_Code } }, null, 0);

                var l = loans.Where(o => o.Status == Status.Application ||
                o.Status == Status.Appraisal ||
                o.Status == Status.Approved ||
                o.Status == Status.Sending_Money);
                if (l.Any())
                    throw new response(1, "Your previous loan is still under processing, Kindly wait");


                //CRB.identity id = new identity();
                //id.identity_number = mm.ID_No;
                //id.identity_type = "001";
                //id.report_type = 3;
                //var score = crb.get_metroscore(id);
                //if (score.has_error == true)
                //{
                //    Logging.Logging.LogEntryOnFile(score.res);
                //    throw new response(-1, score.api_code_description);
                //}
                //Logging.Logging.LogEntryOnFile(string.Format("{0} {1}", mm.ID_No, score.credit_score));

                //if (score.credit_score < 400)
                //    throw new response(1, "Loan failed due to credit history");

                data.Approved_Amount = data.Requested_Amount;
                data.Requested_AmountSpecified = true;
                data.Approved_AmountSpecified = true;
                data.Application_DateSpecified = true;
                data.Status = Status.Application;
                data.StatusSpecified = true;
                data.Posted = false;
                data.PostedSpecified = true;

                var id = iD_Nos_Service.Read(mm.ID_No);
                if (id == null)
                {
                    id = new Id_nos.ID_Nos();
                    id.No = mm.ID_No;   
                    iD_Nos_Service.Create(ref id);
                    Logging.Logging.LogEntryOnFile(mm.ID_No);
                    Logging.Logging.LogEntryOnFile(s.transunion.infinityCode);
                    var tran121 = transunion.getProduct121(s.transunion.username, s.transunion.password, s.transunion.code, s.transunion.infinityCode, "Surname " + mm.Name, "", "", "", mm.ID_No, "", "", "", "", new DateTime(), false, "", "", "", "", "", "", "", "", "", 1);
                    Logging.Logging.CreateXML(tran121);
                    if (tran121.responseCode == 200)
                    {

                        id.First_Name = tran121.personalProfile.surname;
                        id.Other_Name = tran121.personalProfile.otherNames;
                        id.DoB = tran121.personalProfile.dateOfBirth;
                        id.DoBSpecified = true;
                        id.Credit_Active = tran121.summary.creditActive;
                        id.Credit_ActiveSpecified = true;
                        id.Error_Code = tran121.responseCode;
                        id.Error_Description = alternate.Getcode(tran121.responseCode);
                    }
                    else
                    {
                        id.Error_Code = tran121.responseCode;
                        id.Error_Description = alternate.Getcode(tran121.responseCode);
                    }
                    iD_Nos_Service.Update(ref id);
                }
                if (string.IsNullOrEmpty(id.Band))
                {
                    var tranu = transunion.getProduct131(s.transunion.username, s.transunion.password, s.transunion.code, s.transunion.infinityCode, "Surname " + id.First_Name, "Othernames " + id.Other_Name, "", "", id.No, "", "", "", "", new DateTime(), false, "", "", "", "", "", "", "", "", "", 2, 2);
                    Logging.Logging.CreateXML(tranu);
                    if (tranu.responseCode == 200)
                    {
                        id.Score = Convert.ToInt32(tranu.scoreOutput.mobiLoansScore);
                        id.ScoreSpecified = true;
                        id.Band = tranu.scoreOutput.grade;
                        id.Last_Credit_update = DateTime.Now;
                        id.Last_Credit_updateSpecified = true;
                        id.Error_Code = tranu.responseCode;
                        id.Error_Description = alternate.Getcode(tranu.responseCode);
                    }
                    else
                    {
                        id.Error_Code = tranu.responseCode;
                        id.Error_Description = alternate.Getcode(tranu.responseCode);
                    }
                    iD_Nos_Service.Update(ref id);
                }
             
                if (id.Disbursement== Id_nos.Disbursement.Auto )
                {
                    data.Status = Status.Approved;
                    data.StatusSpecified = true;
                    data.Posted = false;
                    data.PostedSpecified = true;
                    Loans_Service.Create(ref data);
                    
                }
                if (id.Disbursement == Id_nos.Disbursement.Manual) {
                Loans_Service.Create(ref data);
                    throw new response(1, id.Wait_sms);
                }
                if (id.Disbursement == Id_nos.Disbursement.Reject)
                {
                    data.Rejection_Reason = id.Wait_sms;
                    data.Status = Status.Rejected;
                    data.StatusSpecified = true;
                    data.Posted = false;
                    data.PostedSpecified = true;
                    Loans_Service.Create(ref data);
                    throw new response(1, id.Wait_sms);
                }
                
              //  Loans_Service.Create(ref data);
                r.content = data;
            }

            catch (response res)
            {
                Logging.Logging.ReportError(res);
                r.Code = res.code;
                r.Desc = res.desc;
                r.content = data;
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
        [HttpPost]
        [Route("api/Repayment")]
        public Results Repayment(Repayment data)
        {
            Results r = new Results();
            try
            {
                if (data.loan == null) throw new Exception("Loan object not found");
                if (data.Amounttopay<=0 ) throw new Exception("InvalidAmount");
                if (string.IsNullOrEmpty(data.loan.Client_Code)) throw new Exception("Client Code Missing");
                var loan =Loans_Service.Read(data.loan.Loan_No);
                data.loan = loan;
                if (String.IsNullOrEmpty(data.loan.Mobile)) throw new Exception("Invalid Mobile No");
                switch (data.source)
                {
                    case Source.Mpesa:
                        {
                            MpesaApi.Cust c = new MpesaApi.Cust();
                            c.customer_key = "jgd2eEV4o7mAjK9fZirLGZnhgRe5UDP3";
                            c.customer_secret = "zzn092BYeKgyGaZT";
                            c.ShortCode = "4018311";
                            MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                            MpesaApi.stkpush rr = new MpesaApi.stkpush();
                            rr.passkey = "b5ffc1d4e3af18db10b213219b71c528b244eeb4fe9c91db4b93bc9cc7606a68";
                            rr.BusinessShortCode = "4018311";
                            rr.TransactionType = "CustomerPayBillOnline";
                            rr.Amount = data.Amounttopay;// 10;// (double) propertySales.Amount;
                            var phone = data.loan.Mobile.Replace(" ", "");
                            rr.PartyA = String.Format("254{0}", phone.Substring(phone.Length - 9));// "254710563359";
                            rr.PartyB = rr.BusinessShortCode;
                            rr.PhoneNumber = rr.PartyA;// "254710563359";
                            rr.CallBackURL = "https://167.86.120.230:855/Deposit.svc/stkpush";
                            rr.AccountReference = data.loan.Loan_No;
                            rr.TransactionDesc = "Booking fee";
                            var sp = m.Stkpush(rr);

                            if (sp.httperror != null)
                            {
                                Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                                Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);
                                throw new Exception(sp.httperror.errorMessage);

                            }
                            if (sp.ResponseCode == "0")
                            {
                                loan.Mpesa_Reference_Repay = sp.MerchantRequestID;
                                Loans_Service.Update(ref loan);

                                break;
                            }
                            else
                            {

                                Logging.Logging.LogEntryOnFile(sp.ResponseCode);
                                Logging.Logging.LogEntryOnFile(sp.ResponseDescription);
                                throw new Exception(sp.ResponseDescription);
                            }
                                
                        }
                    default:
                        throw new Exception("Source invalid");
                }

                r.content = data;

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                r.Code = -1;
                r.Desc = ex.Message;
            }
            return r;
        }
    }
 
}
