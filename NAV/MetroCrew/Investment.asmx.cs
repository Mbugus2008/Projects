using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using Logging;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Threading;
using System.Diagnostics;

using Newtonsoft.Json;
using NavWrapper.Properties;

using NavWrapper.Contact;
using NavWrapper.MyProperties;
using System.Xml.Serialization;
using NavWrapper.Payment_Types;
using NavWrapper.Shares;
using NavWrapper.Accountlist;

namespace NavWrapper
{
    /// <summary>
    /// Summary description for Investment1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Investment1 : System.Web.Services.WebService
    {
        settings s = new settings();
        private string Response = string.Empty;
        JsonSerializerSettings dateformat = new JsonSerializerSettings { DateFormatString = "yyyy-MM-dd" };

        public PublishedPropertiesHeader_Service PublishedPropertiesHeader_Service1 { get; set; } = new PublishedPropertiesHeader_Service();

        [XmlElement(Namespace = "Investment")]
        public Investment_Members.Member_Service Members_Service { get; set; } = new Investment_Members.Member_Service();
        public Contact_Service Contact_Service { get; set; } = new Contact_Service();
        public Shares.ShareFloatingHeader_Service ShareFloatingHeader_Service { get; set; } = new Shares.ShareFloatingHeader_Service();
        PropertySales.PropertySales_Service PropertySales_Service { get; set; } = new PropertySales.PropertySales_Service();
        ShareFloatingLines.ShareFloatingLines_Service ShareFloatingLines_Service { get; set; } = new ShareFloatingLines.ShareFloatingLines_Service();
        Vendor_Details.Vendor_Details_Service Vendor_Details_Service { get; set; } = new Vendor_Details.Vendor_Details_Service();
        Logins.Logins_Service Logins_Service { get; set; } = new Logins.Logins_Service();
        Presales.Presales_Service Presales_Service { get; set; } = new Presales.Presales_Service();
        MyProperties_Service MyProperties_Service { get; set; } = new MyProperties_Service();
        Payment_Methods.Payment_Methods_Service Payment_Methods_Service { get; set; } = new Payment_Methods.Payment_Methods_Service();
        Payment_Types_Service Payment_Types_Service { get; set; } = new Payment_Types_Service();
        Share_Setup.Share_Setup_Service Share_Setup_Service{ get; set; } = new Share_Setup.Share_Setup_Service();
        Account_Types.Account_Types_Service Account_Types_Service { get; set; } = new Account_Types.Account_Types_Service();
        InvestmentFunctions.InvestmentFunctions InvestmentFunctions { get; set; } = new InvestmentFunctions.InvestmentFunctions();
        RealEstateFund.RealEstateFundApplication_Service RealEstate { get; set; } = new RealEstateFund.RealEstateFundApplication_Service ();

        FDTypes.FDTypes_Service FDTypes_Service { get; set; } = new FDTypes.FDTypes_Service();

        Channels.Channels Channels = new Channels.Channels();

        Mpesa.Mpesa_Service Mpesa_Service = new Mpesa.Mpesa_Service();

        Mobile_Transactions.Mobile_Transactions_Service Mobile_Transactions_Service = new Mobile_Transactions.Mobile_Transactions_Service();
        public Investment1()
        {
            string path = Server.MapPath("~/investment.xml");
            s = s.loadsettings(path);
            var ss = s.navsettings;
            System.Net.NetworkCredential cd = new System.Net.NetworkCredential(ss.Username, ss.pass, ss.domain);

            PublishedPropertiesHeader_Service1 = new PublishedPropertiesHeader_Service() { Url = geturl(s, PublishedPropertiesHeader_Service1.Url), Credentials = cd, PreAuthenticate = true };
            Members_Service = new Investment_Members.Member_Service() { Url = geturl(s, Members_Service.Url), Credentials = cd, PreAuthenticate = true };
            Contact_Service = new Contact_Service() { Url = geturl(s, Contact_Service.Url), Credentials = cd, PreAuthenticate = true };
            ShareFloatingHeader_Service = new NavWrapper.Shares.ShareFloatingHeader_Service() { Url = geturl(s, ShareFloatingHeader_Service.Url), Credentials = cd, PreAuthenticate = true };
            PropertySales_Service = new PropertySales.PropertySales_Service() { Url = geturl(s, PropertySales_Service.Url), Credentials = cd, PreAuthenticate = true };
            ShareFloatingLines_Service = new ShareFloatingLines.ShareFloatingLines_Service() { Url = geturl(s, ShareFloatingLines_Service.Url), Credentials = cd, PreAuthenticate = true };
            Vendor_Details_Service = new Vendor_Details.Vendor_Details_Service { Url = geturl(s, Vendor_Details_Service.Url), Credentials = cd, PreAuthenticate = true };
            Logins_Service = new Logins.Logins_Service { Url = geturl(s, Logins_Service.Url), Credentials = cd, PreAuthenticate = true };
            Presales_Service = new Presales.Presales_Service { Url = geturl(s, Presales_Service.Url), Credentials = cd, PreAuthenticate = true };
            MyProperties_Service = new MyProperties_Service { Url = geturl(s, MyProperties_Service.Url), Credentials = cd, PreAuthenticate = true };
            Payment_Methods_Service = new Payment_Methods.Payment_Methods_Service { Url = geturl(s, Payment_Methods_Service.Url), Credentials = cd, PreAuthenticate = true };
            Payment_Types_Service = new Payment_Types_Service { Url = geturl(s, Payment_Types_Service.Url), Credentials = cd, PreAuthenticate = true };
            Share_Setup_Service  = new Share_Setup.Share_Setup_Service { Url = geturl(s, Share_Setup_Service.Url), Credentials = cd, PreAuthenticate = true };
            Account_Types_Service  = new Account_Types.Account_Types_Service { Url = geturl(s, Account_Types_Service.Url), Credentials = cd, PreAuthenticate = true };
          
            RealEstate = new RealEstateFund.RealEstateFundApplication_Service { Url = geturl(s, RealEstate.Url), Credentials = cd, PreAuthenticate = true };

            InvestmentFunctions = new InvestmentFunctions.InvestmentFunctions { Url = geturl(s, InvestmentFunctions.Url), Credentials = cd, PreAuthenticate = true };


            Mpesa_Service  = new  Mpesa.Mpesa_Service { Url = geturl(s, Mpesa_Service.Url), Credentials = cd, PreAuthenticate = true };

            FDTypes_Service  = new FDTypes.FDTypes_Service { Url = geturl(s, FDTypes_Service.Url), Credentials = cd, PreAuthenticate = true };
            Mobile_Transactions_Service  = new Mobile_Transactions.Mobile_Transactions_Service { Url = geturl(s, Mobile_Transactions_Service.Url), Credentials = cd, PreAuthenticate = true };


            Channels  = new Channels.Channels { Url = geturl(s, Channels.Url), Credentials = cd, PreAuthenticate = true };
                    }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(settings s, string page)
        {
            var ss = s.navsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }

        private void SafeExecutor(Action action)
        {
            SafeExecutor(() => { action(); return 0; });
        }

        private T SafeExecutor<T>(Func<T> action)
        {
            try
            {
                return action();
            }

            catch (Exception ex)
            {
                Response = ex.Message;
                Logging.Logging.ReportError(ex);
            }
            finally
            {
                Context.Response.Output.Write(Response);
            }

            return default(T);
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Funds(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Investment_Members.Member  member = JsonConvert.DeserializeObject<Investment_Members.Member>(data, dateformat);
                Response = JsonConvert.SerializeObject(RealEstate.ReadMultiple(new  RealEstateFund.RealEstateFundApplication_Filter[] { new RealEstateFund.RealEstateFundApplication_Filter { Criteria = member.No, Field =  RealEstateFund.RealEstateFundApplication_Fields.Member_No } }, null, 0), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List< RealEstateFund.RealEstateFundApplication> Funds_soap(string memberno)
        {       
              
               return RealEstate.ReadMultiple(new  RealEstateFund.RealEstateFundApplication_Filter[] { new RealEstateFund.RealEstateFundApplication_Filter { Criteria = memberno, Field =  RealEstateFund.RealEstateFundApplication_Fields.Member_No } }, null, 0).ToList();
           
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void newfund(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                RealEstateFund.RealEstateFundApplication realEstate = JsonConvert.DeserializeObject<RealEstateFund.RealEstateFundApplication>(data, dateformat);
                realEstate.Fixed_AmountSpecified = true;
                realEstate.Fixed_Period_MSpecified = true;
                realEstate.Maturity_ActionSpecified = true;
             
                RealEstate.Create(ref realEstate);

                Response = JsonConvert.SerializeObject(realEstate, dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public RealEstateFund.RealEstateFundApplication newfund_soap(RealEstateFund.RealEstateFundApplication realEstate)
        {
            realEstate.Fixed_AmountSpecified = true;
            realEstate.Fixed_Period_MSpecified = true;
            realEstate.Maturity_ActionSpecified = true;
            RealEstate.Create(ref realEstate);
            return realEstate;
                    }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bookings(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Response = JsonConvert.SerializeObject(PropertySales_Service.ReadMultiple(new PropertySales.PropertySales_Filter[] { new PropertySales.PropertySales_Filter { Criteria = data, Field = PropertySales.PropertySales_Fields.Member_No } }, null, 0), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void myproperties(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Response = JsonConvert.SerializeObject(MyProperties_Service.ReadMultiple(new MyProperties_Filter[] { new MyProperties_Filter { Criteria = data, Field = MyProperties_Fields.Member_No } }, null, 0), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<MyProperties.MyProperties> myproperties_soap(string member_No)
        {

            return  MyProperties_Service.ReadMultiple(new MyProperties_Filter[] { new MyProperties_Filter { Criteria = member_No, Field = MyProperties_Fields.Member_No } }, null, 0).ToList();
         
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void book(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                PropertySales.PropertySales propertySales = JsonConvert.DeserializeObject<PropertySales.PropertySales>(data, dateformat);
                PropertySales.PropertySales propertySaleslines = propertySales;
                propertySales.Source = PropertySales.Source.App;
                propertySales.SourceSpecified = true;

                PropertySales_Service.Create(ref propertySales);
                Response = JsonConvert.SerializeObject(propertySales, dateformat);
            });
        }
        [WebMethod]

        public PropertySales.PropertySales book_soap(PropertySales.PropertySales data)
        {
            data.Source = PropertySales.Source.Ussd;
            data.SourceSpecified = true;
            PropertySales_Service.Create(ref data);
            return data;

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void bookdetails(string data)
        {
            SafeExecutor(() =>
            {
            Logging.Logging.LogEntryOnFile(data);
            Presales.Presales propertySales = JsonConvert.DeserializeObject<Presales.Presales>(data);
          
            var member = getmember(propertySales.Member_No);
                switch (propertySales.Payment_Method)
                {
                   case "MPESA":
                        MpesaApi.Cust c = new MpesaApi.Cust();
                        c.customer_key = "mcZEyYQgvIM8t1gGjp2YHZ3RxuoU5kSY";
                        c.customer_secret = "tTmiTLf5thJ0Jdkg";
                        c.ShortCode = "371888";
                        MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                        MpesaApi.stkpush r = new MpesaApi.stkpush();
                        r.passkey = "8d777e028006665355e1ee4d11a1a0e656ad53c2085f7bd63c5b0d8417e06ab9";
                        r.BusinessShortCode = "371888";
                        r.TransactionType = "CustomerPayBillOnline";
                        r.Amount =  (double) propertySales.Amount;
                        r.PartyA = String.Format("254{0}", member.Phone_No.Substring(member.Phone_No.Length - 9));// "254710563359";
                        //r.PartyA =  "254710563359";
                        r.PartyB = r.BusinessShortCode;
                        r.PhoneNumber = r.PartyA;

                        r.CallBackURL = "https://197.155.74.209:806/Deposit.svc/stkpush";
                        r.AccountReference = propertySales.Transaction_No;
                        r.TransactionDesc = "Booking fee";
                        var sp = m.Stkpush(r);

                        if (sp.httperror != null)
                        {
                            Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                            Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);
                        }
                        if (sp.ResponseCode == "0")
                        {
                            //propertySales.Refrence_No = sp.MerchantRequestID;
                            //var trans = Mpesa_Service.Read(sp.MerchantRequestID);
                            //if (trans == null)
                            //{

                            //    Mpesa.Mpesa mo = new Mpesa.Mpesa();
                            //    mo.MerchantRequestID = sp.MerchantRequestID;
                            //    mo.CheckoutRequestID = sp.CheckoutRequestID;
                            //    mo.Receipt_No = sp.MerchantRequestID;
                            //    Mpesa_Service.Create(ref mo);
                            //}
                            propertySales.Refrence_No = sp.MerchantRequestID;
                       
                        }
                        else
                        {

                            Channels.Smssend(member.Phone_No, String.Format("Mpesa push has failed. Kindly go to Mpesa Paybill Menu. Paybill account - 371888, Account No - {0}, Amount - {1}", propertySales.Transaction_No, propertySales.Amount));
                        }
                        break;
                    case "BANK":

                        Channels.Smssend(member.Phone_No, String.Format("Kenya Police Investment Cooperative Society, Co - operative Bank of Kenya A/C No.01120742036000. Reference - {0}, Amount - {1}", propertySales.Transaction_No, propertySales.Amount));
                        break;
                }
                if (propertySales.Refrence_No == "")
                    propertySales.Refrence_No = DateTime.Now.Ticks.ToString();
                Presales_Service.Create(ref propertySales);
                Response = JsonConvert.SerializeObject(propertySales, dateformat);
            });

        }
       
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Presales.Presales bookdetails_soap(Presales.Presales data)
        {
            Presales_Service.Create(ref data);
            var member = getmember(data.Member_No);
            switch (data.Payment_Method)
            {
                case "MPESA":
                    MpesaApi.Cust c = new MpesaApi.Cust();
                    c.customer_key = "mcZEyYQgvIM8t1gGjp2YHZ3RxuoU5kSY";
                    c.customer_secret = "tTmiTLf5thJ0Jdkg";
                    c.ShortCode = "371888";
                    MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                    MpesaApi.stkpush r = new MpesaApi.stkpush();
                    r.passkey = "8d777e028006665355e1ee4d11a1a0e656ad53c2085f7bd63c5b0d8417e06ab9";
                    r.BusinessShortCode = "371888";
                    r.TransactionType = "CustomerPayBillOnline";
                    r.Amount =  (double) data.Amount;
                    r.PartyA = String.Format("254{0}", member.Phone_No.Substring(member.Phone_No.Length - 9));// "254710563359";
                    r.PartyB = r.BusinessShortCode;
                    r.PhoneNumber = r.PartyA;// "254710563359";
                    r.CallBackURL = "https://197.155.74.209:806/Deposit.svc/stkpush";
                    r.AccountReference = data.Transaction_No;
                    r.TransactionDesc = "Booking fee";
                    var sp = m.Stkpush(r);

                    if (sp.httperror != null)
                    {
                        Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                        Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);
                    }
                    if (sp.ResponseCode == "0")
                    {
                        //propertySales.Refrence_No = sp.MerchantRequestID;
                        //var trans = Mpesa_Service.Read(sp.MerchantRequestID);
                        //if (trans == null)
                        //{

                        //    Mpesa.Mpesa mo = new Mpesa.Mpesa();
                        //    mo.MerchantRequestID = sp.MerchantRequestID;
                        //    mo.CheckoutRequestID = sp.CheckoutRequestID;
                        //    mo.Receipt_No = sp.MerchantRequestID;
                        //    Mpesa_Service.Create(ref mo);
                        //}
                        data.Refrence_No = sp.MerchantRequestID;
                        Presales_Service.Update(ref data);
                    }
                    else
                    {

                        Channels.Smssend(member.Phone_No, String.Format("Mpesa push has failed. Kindly go to Mpesa Paybill Menu. Paybill account - 371888, Account No - {0}, Amount - {1}", data.Transaction_No, data.Amount));
                    }
                    break;
                case "BANK":

                    Channels.Smssend(member.Phone_No, String.Format("Kenya Police Investment Cooperative Society, Co - operative Bank of Kenya A/C No.01120742036000. Reference - {0}, Amount - {1}", data.Transaction_No, data.Amount));
                    break;
            }
            return data;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void buyshares(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                ShareFloatingLines.ShareFloatingLines shareFloatingLines = JsonConvert.DeserializeObject<ShareFloatingLines.ShareFloatingLines>(data);
                shareFloatingLines.Bid_PriceSpecified = true;
                shareFloatingLines.Bid_Date = DateTime.Now.Date;
                shareFloatingLines.Bid_DateSpecified = true;
                shareFloatingLines.SourceSpecified = true;
                shareFloatingLines.Source  =  ShareFloatingLines.Source.App ;

                var s = ShareFloatingLines_Service.Read(shareFloatingLines.Document_No, shareFloatingLines.Member_No);
                if (s == null)
                    ShareFloatingLines_Service.Create(ref shareFloatingLines);
                else
                {
                    shareFloatingLines.Key = s.Key;
                    ShareFloatingLines_Service.Update(ref shareFloatingLines);
                }
                Response = JsonConvert.SerializeObject(shareFloatingLines, dateformat);
            });
        } [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ShareFloatingLines.ShareFloatingLines buyshares_soap(ShareFloatingLines.ShareFloatingLines data)
        {
            data.Bid_PriceSpecified = true;
            data.Bid_Date = DateTime.Now.Date;
            data.Bid_DateSpecified = true;
            data.Bid_DateSpecified = true;
            data.SourceSpecified = true;
            data.Bid_DateSpecified = true;
            data.Source = ShareFloatingLines.Source.Ussd;
            var s = ShareFloatingLines_Service.Read(data.Document_No, data.Member_No);
            if (s == null)
                ShareFloatingLines_Service.Create(ref data);
            else
            {
                data.Key = s.Key;
                ShareFloatingLines_Service.Update(ref data);
            }
          

            return data;

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void properties()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(PublishedPropertiesHeader_Service1.ReadMultiple(new PublishedPropertiesHeader_Filter[] { }, null, 0).ToList(), dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void paymentmethods()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Payment_Methods_Service.ReadMultiple(Array.Empty<Payment_Methods.Payment_Methods_Filter>(), null, 0).ToList(), dateformat);
            });


        }
        [WebMethod]

        public List<Payment_Methods.Payment_Methods> paymentmethods_soap()
        {

            return Payment_Methods_Service.ReadMultiple(new Payment_Methods.Payment_Methods_Filter[] { }, null, 0).ToList();


        }  
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void accounttypes()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Payment_Methods_Service.ReadMultiple(Array.Empty<Payment_Methods.Payment_Methods_Filter>(), null, 0).ToList(), dateformat);
            });
                    }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Fdtypes()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(FDTypes_Service.ReadMultiple(Array.Empty<FDTypes.FDTypes_Filter>(), null, 0).ToList(), dateformat);
            });
        }
        [WebMethod]
      
        public List<FDTypes.FDTypes> Fdtypes_soap()
        {
          return  FDTypes_Service.ReadMultiple(Array.Empty<FDTypes.FDTypes_Filter>(), null, 0).ToList();
         }
       
        [WebMethod]
        public List<Account_Types.Account_Types> accounttypes_soap()
        {
            return Account_Types_Service.ReadMultiple(new Account_Types.Account_Types_Filter[] { }, null, 0).ToList();
                    }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void paymenttypes()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Payment_Types_Service.ReadMultiple(Array.Empty<Payment_Types_Filter>(), null, 0).ToList(), dateformat);
            });


        }
        [WebMethod]

        public List<Payment_Types.Payment_Types> paymenttypes_soap()
        {

            return Payment_Types_Service.ReadMultiple(new Payment_Types_Filter[] { }, null, 0).ToList();


        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void logins(string id)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Logins_Service.Read(id), dateformat);
            });

        }
        [WebMethod]
        public Logins.Logins logins_Soap(string id)
        {

            return Logins_Service.Read(id);

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void loginsadd(string data)
        {
            SafeExecutor(() =>
            {
                Logins.Logins login = JsonConvert.DeserializeObject<Logins.Logins>(data);
                var l = Logins_Service.Read(login.ID_No);
                if (l == null)
                {
                    l = login;
                    Logins_Service.Create(ref l);
                }
                l.Password = login.Password;
                l.Name = login.Name;
                Logins_Service.Update(ref l);

                Response = JsonConvert.SerializeObject(l, dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void members(string email)
        {
            SafeExecutor(() =>
            {
               
                Investment_Members.Member mm = Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = email, Field = Investment_Members.Member_Fields.National_ID_No } }, null, 0).ToList().FirstOrDefault();
                            Response = JsonConvert.SerializeObject(mm, dateformat);
                                          });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void membersfirst(string email)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(email);
                getmembers m = JsonConvert.DeserializeObject<getmembers>(email);

                Investment_Members.Member mm = Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = m.idno, Field = Investment_Members.Member_Fields.National_ID_No } }, null, 0).ToList().FirstOrDefault();
                if (mm != null)
                {
                    if (m.Firsttime)
                    {
                        var rn = Logging.Randomize.RandomString(5);
                        mm.Otp = rn;
                        Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(mm));
                        Channels.Smssend(string.Format("+254{0}", mm.Phone_No.Substring(mm.Phone_No.Length - 9)), string.Format("Dear {0}, your otp is {1}", mm.Name, rn));

                    }
                }
                else
                {
                    Logging.Logging.LogEntryOnFile("Member Not found");
                    Logging.Logging.LogEntryOnFile(Members_Service.Url);

                }
                

                Response = JsonConvert.SerializeObject(mm, dateformat);


            });

        }
        [WebMethod]

        public sms sendsms(sms s)
        {
            try
            {
                Channels.Smssend(string.Format("+254{0}", s.phone.Substring(s.phone.Length - 9)), s.text);
            }
            catch (Exception ex)
            {  Logging.Logging.ReportError(ex);
                s.code = -1;
                s.Desc = ex.Message;
              
            }
            return s;
        }
        public class sms: results {
            public string phone { get; set; }
            public string text { get; set; }
        } 

        [WebMethod]

        public Investment_Members.Member members_soap(string phone, string id)
        {
            var m = Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = id, Field = Investment_Members.Member_Fields.National_ID_No } }, null, 0).ToList();
            if (phone.Length >= 9)
            {
                foreach (var mm in m)
                {
                    if (mm.Phone_No.Contains(phone.Substring(phone.Length - 9, 9)))
                        return mm;
                }
                return null;
            }
            else return null;


        }
        public Investment_Members.Member getmember(string acc)
        {
            var m = Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = acc, Field = Investment_Members.Member_Fields.No } }, null, 0).FirstOrDefault();

            return m;


        }
        [WebMethod]

        public Investment_Members.Member members_bytelphone(string phone)

        {
            Investment_Members.Member m = null;

          m= Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria =  "*"+ phone.Substring(phone.Length-9), Field = Investment_Members.Member_Fields.Phone_No } }, null, 0).ToList().FirstOrDefault();

            Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(m));
            return m;
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void checkmembers(Members.Members email)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = email.ID_No, Field = Investment_Members.Member_Fields.National_ID_No } }, null, 0).ToList().FirstOrDefault(), dateformat);
            });

        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getcustomer(string email)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Contact_Service.ReadMultiple(new Contact_Filter[] { new Contact_Filter { Criteria = email, Field = Contact_Fields.National_ID_No } }, null, 0).ToList().FirstOrDefault(), dateformat);
            });

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Shares()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { }, null, 0).ToList(), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void my_Shares(string No)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { new ShareFloatingHeader_Filter { Criteria = No, Field = ShareFloatingHeader_Fields.Member_No } }, null, 0).ToList(), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void reverseshares(string No)
        {
            SafeExecutor(() =>
            {
                InvestmentFunctions.TakeDownShares(No);
                Response = JsonConvert.SerializeObject(ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { new ShareFloatingHeader_Filter { Criteria = No, Field = ShareFloatingHeader_Fields.Member_No } }, null, 0).ToList(), dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ShareFloatingHeader> my_Shares_soap(String No)
        {

            return ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { new ShareFloatingHeader_Filter { Criteria = No, Field = ShareFloatingHeader_Fields.Member_No } }, null, 0).ToList();
        }
         [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<ShareFloatingHeader> reverse_shares_soap(String No)
        {
            InvestmentFunctions.TakeDownShares(No);
            return ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { new ShareFloatingHeader_Filter { Criteria = No, Field = ShareFloatingHeader_Fields.Document_No } }, null, 0).ToList();
          
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SharesSetup()
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Share_Setup_Service.ReadMultiple(new Share_Setup.Share_Setup_Filter[] { }, null, 0).ToList(), dateformat);
            });
        } 
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Shares.ShareFloatingHeader> Shares_soap()
        {
        
                  return  ShareFloatingHeader_Service.ReadMultiple(new NavWrapper.Shares.ShareFloatingHeader_Filter[] { }, null, 0).ToList();
            
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Share_Setup.Share_Setup> SharesSetup_soap()
        {
          
                return Share_Setup_Service.ReadMultiple(new Share_Setup.Share_Setup_Filter[] { }, null, 0).ToList();
          
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void floatshares(String data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);

                Shares.ShareFloatingHeader f = JsonConvert.DeserializeObject<Shares.ShareFloatingHeader>(data, dateformat);
                f.Source= NavWrapper.Shares.Source.App;
                f.SourceSpecified = true;

                 if (!String.IsNullOrEmpty(f.Document_No))
                       ShareFloatingHeader_Service.Update(ref f);
                    else
                        ShareFloatingHeader_Service.Create(ref f);

                InvestmentFunctions.PostFloating(f.Document_No);

                Response = JsonConvert.SerializeObject(f, dateformat);
            });
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public ShareFloatingHeader floatshares_soap(ShareFloatingHeader f)
        {
            f.Source = NavWrapper.Shares.Source.Ussd;
            f.SourceSpecified = true;
            if (!String.IsNullOrEmpty(f.Document_No))
                ShareFloatingHeader_Service.Update(ref f);
            else
                ShareFloatingHeader_Service.Create(ref f);
            InvestmentFunctions.PostFloating(f.Document_No);

            return f;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void Vendor_Details(string account)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Vendor_Details_Service.ReadMultiple(new NavWrapper.Vendor_Details.Vendor_Details_Filter[] { new NavWrapper.Vendor_Details.Vendor_Details_Filter { Criteria = account, Field = NavWrapper.Vendor_Details.Vendor_Details_Fields.Vendor_No } }, null, 0).ToList(), dateformat);
            });
        } 
        
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public List<Vendor_Details.Vendor_Details> Vendor_Details_soap(string account)
        {
           
              return Vendor_Details_Service.ReadMultiple(new NavWrapper.Vendor_Details.Vendor_Details_Filter[] { new NavWrapper.Vendor_Details.Vendor_Details_Filter { Criteria = account, Field = NavWrapper.Vendor_Details.Vendor_Details_Fields.Vendor_No } }, null, 0).ToList();
           
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void getmemberimage(string email)
        {
            SafeExecutor(() =>
            {
                Response = JsonConvert.SerializeObject(Members_Service.ReadMultiple(new Investment_Members.Member_Filter[] { new Investment_Members.Member_Filter { Criteria = email, Field = Investment_Members.Member_Fields.E_Mail } }, null, 0).ToList(), dateformat);
            });
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void contact(string contact)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(contact);
                Contact.Contact c = JsonConvert.DeserializeObject<Contact.Contact>(contact, dateformat);

                var cc = Contact_Service.ReadMultiple(new Contact_Filter[] { new Contact_Filter { Criteria = c.National_ID_No, Field = Contact_Fields.National_ID_No } }, null, 0);

                if (cc.Count() == 0)
                {
                    c.Source = Contact.Source.Channels;
                    c.SourceSpecified = true;
                    c.Status = Contact.Status.New;
                    c.StatusSpecified = true;

                    Contact_Service.Create(ref c);
                }
                                Response = JsonConvert.SerializeObject(c, dateformat);
            });

        }
        [WebMethod]
        public List<Properties.PublishedPropertiesHeader> Getproperties()
        {

            return PublishedPropertiesHeader_Service1.ReadMultiple(new PublishedPropertiesHeader_Filter[] { }, null, 0).ToList();


        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void transaction(string data)
        {
            SafeExecutor(() =>
            {
                Logging.Logging.LogEntryOnFile(data);
                Mobile_Transactions.Mobile_Transactions trans = JsonConvert.DeserializeObject<Mobile_Transactions.Mobile_Transactions>(data, dateformat);

                trans.AmountSpecified = true;
                trans.Document_Date = DateTime.Now;
                trans.Document_DateSpecified = true;
                trans.StatusSpecified = true;
                trans.Status = Mobile_Transactions.Status.Pending;
                trans.Transaction_Time = DateTime.Now;
                trans.Transaction_TimeSpecified = true;

                var p = Mobile_Transactions_Service.ReadMultiple(new Mobile_Transactions.Mobile_Transactions_Filter[] { new Mobile_Transactions.Mobile_Transactions_Filter { Criteria = "Pending", Field = Mobile_Transactions.Mobile_Transactions_Fields.Status }, new Mobile_Transactions.Mobile_Transactions_Filter { Criteria = trans.Member_No, Field = Mobile_Transactions.Mobile_Transactions_Fields.Member_No } }, null, 0);
                if (p.Count() > 0)
                {
                    trans.Status = Mobile_Transactions.Status.Failed;
                    trans.Comments = "System is unable to process your request because a similar transaction is currently underway. Please wait while we complete your initial request. ";
                }
                if (trans.Status == Mobile_Transactions.Status.Pending)
                {
                    switch (trans.Account_No.ToLower())
                    {
                        case "mpesa":
                            try
                            {
                                trans.Source = Mobile_Transactions.Source.Mpesa;
                                trans.SourceSpecified = true;
                                MpesaApi.Cust c = new MpesaApi.Cust();
                                c.customer_key = "mcZEyYQgvIM8t1gGjp2YHZ3RxuoU5kSY";
                                c.customer_secret = "tTmiTLf5thJ0Jdkg";
                                c.ShortCode = "371888";
                                MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                                MpesaApi.stkpush r = new MpesaApi.stkpush();
                                r.passkey = "8d777e028006665355e1ee4d11a1a0e656ad53c2085f7bd63c5b0d8417e06ab9";
                                r.BusinessShortCode = "371888";
                                r.TransactionType = "CustomerPayBillOnline";
                                r.Amount = (double)trans.Amount;
                                r.PartyA = String.Format("254{0}", trans.Telephone_Number.Substring(trans.Telephone_Number.Length - 9));// "254710563359";
                                //r.PartyA = "254710563359";
                                r.PartyB = r.BusinessShortCode;
                                r.PhoneNumber = r.PartyA;// "254710563359";
                                r.CallBackURL = "https://197.155.74.209:806/Deposit.svc/stkpush";
                                r.AccountReference = trans.Reference;
                                r.TransactionDesc = trans.Transaction_Type.ToString();
                                var sp = m.Stkpush(r);

                                if (sp.httperror != null)
                                {
                                    Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                                    Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);

                                }
                                if (sp.ResponseCode == "0")
                                {

                                    trans.Document_No = sp.MerchantRequestID;

                                }
                                else
                                {

                                    trans.Comments = sp.ResponseDescription;
                                    trans.Status = Mobile_Transactions.Status.Failed;
                                }
                            }
                            catch (Exception ex)
                            {
                                trans.Status = Mobile_Transactions.Status.Failed;
                                trans.Comments = ex.Message;
                                Logging.Logging.ReportError(ex);
                            }
                            break;
                        default:
                            break;
                    }
                }
                Mobile_Transactions_Service.Create(ref trans);

                Response = JsonConvert.SerializeObject(trans, dateformat);
            });
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public Mobile_Transactions.Mobile_Transactions transaction_soap(Mobile_Transactions.Mobile_Transactions trans)
        {
            Logging.Logging.LogEntryOnFile("Soap transfer");
            Logging.Logging.LogEntryOnFile(JsonConvert.SerializeObject(trans, dateformat));
                trans.AmountSpecified = true;
                trans.Document_Date = DateTime.Now;
                trans.Document_DateSpecified = true;
                trans.StatusSpecified = true;
                if (trans.Amount == 0)
                trans.Amount =(decimal) trans.Amount2;
                trans.AmountSpecified = true;
                trans.Transaction_TypeSpecified = true;
                trans.Status = Mobile_Transactions.Status.Pending;
                trans.Transaction_Time = DateTime.Now;
                trans.Transaction_TimeSpecified = true;

                var p = Mobile_Transactions_Service.ReadMultiple(new Mobile_Transactions.Mobile_Transactions_Filter[] { new Mobile_Transactions.Mobile_Transactions_Filter { Criteria = "Pending", Field = Mobile_Transactions.Mobile_Transactions_Fields.Status }, new Mobile_Transactions.Mobile_Transactions_Filter { Criteria = trans.Member_No, Field = Mobile_Transactions.Mobile_Transactions_Fields.Member_No } }, null, 0);
                if (p.Count() > 0)
                {
                    trans.Status = Mobile_Transactions.Status.Failed;
                    trans.Comments = "System is unable to process your request because a similar transaction is currently underway. Please wait while we complete your initial request. ";
                }
                if (trans.Status == Mobile_Transactions.Status.Pending)
                {
                    switch (trans.Account_No.ToLower())
                    {
                        case "mpesa":
                        try
                        {
                            trans.Source = Mobile_Transactions.Source.Mpesa;
                            trans.SourceSpecified = true;
                            MpesaApi.Cust c = new MpesaApi.Cust();
                            c.customer_key = "mcZEyYQgvIM8t1gGjp2YHZ3RxuoU5kSY";
                            c.customer_secret = "tTmiTLf5thJ0Jdkg";
                            c.ShortCode = "371888";
                            MpesaApi.MpesaApi m = new MpesaApi.MpesaApi(c);
                            MpesaApi.stkpush r = new MpesaApi.stkpush();
                            r.passkey = "8d777e028006665355e1ee4d11a1a0e656ad53c2085f7bd63c5b0d8417e06ab9";
                            r.BusinessShortCode = "371888";
                            r.TransactionType = "CustomerPayBillOnline";

                            r.Amount = (double)trans.Amount;
                            Logging.Logging.LogEntryOnFile(r.Amount.ToString());
                            r.PartyA = String.Format("254{0}", trans.Telephone_Number.Substring(trans.Telephone_Number.Length - 9));// "254710563359";
                           // r.PartyA = "254710563359";
                            r.PartyB = r.BusinessShortCode;
                            r.PhoneNumber = r.PartyA;// "254710563359";
                            r.CallBackURL = "https://197.155.74.209:806/Deposit.svc/stkpush";
                            r.AccountReference = trans.Reference;
                            r.TransactionDesc = trans.Transaction_Type.ToString();
                            var sp = m.Stkpush(r);

                            if (sp.httperror != null)
                            {
                                Logging.Logging.LogEntryOnFile(sp.httperror.errorCode);
                                Logging.Logging.LogEntryOnFile(sp.httperror.errorMessage);

                                trans.Comments = sp.httperror.errorMessage;
                                trans.Status = Mobile_Transactions.Status.Failed;
                            }
                            if (sp.ResponseCode == "0")
                            {

                                trans.Document_No = sp.MerchantRequestID;

                            }
                            else
                            {

                                trans.Comments = sp.ResponseDescription;
                                trans.Status = Mobile_Transactions.Status.Failed;
                            }
                        }
                        catch (Exception ex)
                        {
                            trans.Status = Mobile_Transactions.Status.Failed;
                            trans.Comments = ex.Message;
                            Logging.Logging.ReportError(ex);
                        }
                            break;
                        default:
                            break;
                    }
                }
                Mobile_Transactions_Service.Create(ref trans);

            return trans;
         
        }
    }
    public class getmembers
    {
        public string idno { get; set; }
        public bool Firsttime { get; set; }
    }
}
namespace NavWrapper.Investment_Members
{
    public partial class Member
    {
        public string Otp { get; set; }

    }

}
namespace NavWrapper.Mobile_Transactions
{
    public partial class Mobile_Transactions
    {
        public double Amount2 { get; set; }
    }

}

//namespace NavWrapper.Presales
//{
//    public partial class Presales
//    {
//        public bool Mpesasent = true;
//        public string Description = string.Empty;
//    } 
//    public class mpesa
//}
