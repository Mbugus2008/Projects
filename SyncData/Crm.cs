using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;

namespace SyncData
{
    class Crm
    {
        private System.Net.NetworkCredential cd;
        public Logging.settings s = new Logging.settings();
        Crmservice.WebService1 crm ;
        crm_PropertySales.PropertySales_Service crm_properties = new crm_PropertySales.PropertySales_Service();
        crm_Contacts.Contact_Service Contact_Service = new crm_Contacts.Contact_Service();

        AccountList.Accountlist_Service Accountlist_Service;


        public Crm()
        {
            string path = AppDomain.CurrentDomain.BaseDirectory + @"\Settings.config";
            s = s.loadsettings(path);
            cd = new System.Net.NetworkCredential(s.investsettings.Username, s.investsettings.pass, s.investsettings.domain);
            crm_properties = new crm_PropertySales.PropertySales_Service { Url = geturl(s, crm_properties.Url), Credentials = cd, PreAuthenticate = true };
            Contact_Service = new crm_Contacts.Contact_Service { Url = geturl(s, Contact_Service.Url), Credentials = cd, PreAuthenticate = true };
            

        }
        public void start()
        {
            crm = new Crmservice.WebService1();
            Accountlist_Service = new AccountList.Accountlist_Service();
            Accountlist_Service = new AccountList.Accountlist_Service { Url = geturl(s, Accountlist_Service.Url), Credentials = cd, PreAuthenticate = true };

            while (Program.stop == false)
            {
                try
                {


                    Memberacounts();
                    property();
                    //  leads();

                }
                catch (Exception ex)
                {

                    Logging.Logging.ReportError(ex);
                }
                System.Threading.Thread.Sleep(s.othersettings.PostIntervalinsec * 1000);
            }

        }
        public void leads()
        {
            try
            {
                var contacts = Contact_Service.ReadMultiple(new crm_Contacts.Contact_Filter[] { new crm_Contacts.Contact_Filter { Criteria = "No", Field = crm_Contacts.Contact_Fields.Crm } }, null, 0);
                foreach (var i in contacts.ToList())
                {
                    try
                    {
                        var crmresult = crm.leadInsert(topic: "New member",
                                 firstname: i.First_Name,
                                 lastname: i.Last_Name,
                                 idtype: "100000000",
                                 idnumber: i.National_ID_No,
                                 hudumanumber: "",
                                 employmentinformation: "",
                                 mobilephone: i.Mobile_Phone_No??"",
                                 email: i.E_Mail_Address??"",
                                 dateofbirth: DateTime.Now.Date,//(DateTime)i.Date_of_Birth,
                                 nationality: "Kenyan",
                                 location: "", sex: i.Gender == crm_Contacts.Gender.Male ? "100000000" : "100000001",
                                 APIKEY: "003026bbc133714df1834b8638bb496e"

                              );

                        i.Crm = true;
                        i.CrmSpecified = true;
                        var ii = i;
                        Contact_Service.Update(ref ii);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                }


            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        public void property()
        {
            try
            {
                var properties = crm_properties.ReadMultiple(new crm_PropertySales.PropertySales_Filter[] { new crm_PropertySales.PropertySales_Filter { Criteria = "No", Field = crm_PropertySales.PropertySales_Fields.Crm } }, null, 0);

                foreach (var i in properties.Where(o => o.Profits_no != null && o.Project_Code != null).ToList())
                {
                    try
                    {
                        var p = crm.property(
                              Transaction_No: i.Transaction_No,
                              Member_No: i.Profits_no,
                              Investment_Account: i.Investment_Account,
                              Project_Name: i.Project_Name,
                              Asset_Name: i.Asset_Name,
                              Booking_Price: i.Booking_Price.ToString(),
                              Category_Name: i.Category_Name,
                              Sales_Officer_Name: i.Sales_Officer_Name,
                              Deposit_Amount: i.Deposit_Amount.ToString(),
                              Title_Deed_No: i.Title_Deed_No,
                              Plot_No: i.Plot_No,
                              Payment_Type: i.Payment_Type.ToString(),
                              Subdivision_Name: i.Subdivision_Name
                                 );
                        if (p.code == 0)
                        {
                            i.Crm = true;
                            i.CrmSpecified = true;

                        }
                        else
                            i.Comments = p.Desc;

                        var ii = i;
                        crm_properties.Update(ref ii);


                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                }


            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        public void Memberacounts()
        {
            try
            {
                var properties = Accountlist_Service.ReadMultiple(new AccountList.Accountlist_Filter[] { new AccountList.Accountlist_Filter { Criteria = "No", Field = AccountList.Accountlist_Fields.Sent } }, null, 0);
                foreach (var i in properties.ToList())
                {
                    Logging.Logging.LogEntryOnFile(string.Format("Sending Account to Crm {0} - {1}", i.No, i.Profits_Cust_Id));
                    try
                    {
                        var p = crm.InvestmentAccount(No: i.No,
                            Name: i.Name,
                            Balance: i.Balance.ToString(),
                            Share_Capital_Account: i.Share_Capital_Account.ToString(),
                            Noofshares: "",
                            Account_Type: i.Account_Type,
                            Share_Trading_Account: "",
                            Account_Status: i.Account_Status.ToString(),
                            Member_No: i.Profits_Cust_Id
                                 );
                        if (p.code == 0)
                        {
                            i.Sent = true;
                            i.SentSpecified = true;
                            
                        }
                        else
                        {
                            Logging.Logging.LogEntryOnFile(String.Format("Crm Error: {0} - {1}", i.No, p.Desc));
                            i.Sent = true;
                            i.SentSpecified = true;
                        }
                        var ii = i;
                        Accountlist_Service.Update(ref ii);
                    }
                    catch (Exception ex)
                    {
                        Logging.Logging.ReportError(ex);
                    }
                }
            }
            catch (Exception ex)
            {

                Logging.Logging.ReportError(ex);
            }
        }
        private string getpage(string url)
        {
            string t = string.Empty;
            var tt = url.Split(new char[] { '/' }, StringSplitOptions.RemoveEmptyEntries);
            return string.Format("{0}/{1}", tt[tt.Length - 2], tt[tt.Length - 1]);
        }
        private string geturl(Logging.settings s, string page)
        {
            var ss = s.investsettings;
            return string.Format("http://{0}:{3}/{2}/WS/{1}/{4}", ss.Server, ss.Companyname, ss.Instance, ss.Port, getpage(page));
        }
    }

}
