using Client;
using Client.Loans;
using Client.Sms;
using Client.Transactions;
using System;
using System.Collections.Generic;
using System.IO;

using System.Linq;
using System.Net;
using System.Runtime.Serialization;
using System.Security.Cryptography.X509Certificates;
using System.ServiceModel;
using System.ServiceModel.Activation;

using System.Web;
using System.Xml;
using System.Xml.Serialization;

namespace Client
{
   
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    [AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]
    public class Client : Mobile
    {        settings s = new settings();
        NetworkCredential cd;
        public Client()
        {
            s = s.loadsettings(HttpContext.Current.Server.MapPath("~/Settings.config"));
            // if (s.t > s.tt)
            //  s.setup(ref s);
            if (s.usewindowsauth)
                loadsettings();
            else
                loadsettingswithcertificate();
        }
        private void loadsettings()
        {
            try
            {
                s = s.loadsettings(HttpContext.Current.Server.MapPath("~/Settings.config"));
                cd = new NetworkCredential(s.Username, s.pass, s.domain);

                Trans.trservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transactions", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.trservice.PreAuthenticate = true;
                Trans.trservice.Credentials = cd;

                Trans.sASRA_Sectors_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/SASRA_Sectors", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.sASRA_Sectors_Service.PreAuthenticate = true;
                Trans.sASRA_Sectors_Service.Credentials = cd;

          Trans.MobileLoanTopup_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/MobileLoanTopup", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.MobileLoanTopup_Service.PreAuthenticate = true;
                Trans.MobileLoanTopup_Service.Credentials = cd;

                Trans.Accentriesservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Account_Entries", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.Accentriesservice.PreAuthenticate = true;
                Trans.Accentriesservice.Credentials = cd;

                Trans.account_Types_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Account_Types", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.account_Types_Service.PreAuthenticate = true;
                Trans.account_Types_Service.Credentials = cd;

                Trans.Accservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Accounts", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.Accservice.PreAuthenticate = true;
                Trans.Accservice.Credentials = cd;

                Trans.mobile_charges.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Mobile_Charges", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.mobile_charges.PreAuthenticate = true;
                Trans.mobile_charges.Credentials = cd;

                //System.Net.CredentialCache myCredentials = new System.Net.CredentialCache();
                //NetworkCredential netCred = new NetworkCredential(s.Username,  s.pass);
                //Trans.Accservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(@"D:\Projects\mobile.cer"));
                ////Trans.Accservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));

                //myCredentials.Add(new Uri(Trans.Accservice.Url), "Basic", netCred);
                //Trans.Accservice.Credentials = myCredentials;



                Trans.s_mobile.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/Mobile", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.s_mobile.PreAuthenticate = true;
                Trans.s_mobile.Credentials = cd;


                Applications.appservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Applications", s.Serverip, s.Companyname, s.Instance, s.Port);
                Applications.appservice.PreAuthenticate = true;
                Applications.appservice.Credentials = cd;


                Trans.setupservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Setup", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.setupservice.PreAuthenticate = true;
                Trans.setupservice.Credentials = cd;

                Members.Memberservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Member", s.Serverip, s.Companyname, s.Instance, s.Port);
                Members.Memberservice.PreAuthenticate = true;
                Members.Memberservice.Credentials = cd;

                loan.loanservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans_mobile", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.loanservice.PreAuthenticate = true;
                loan.loanservice.Credentials = cd;

                loan.Eligibility_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Eligibility", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.Eligibility_Service.PreAuthenticate = true;
                loan.Eligibility_Service.Credentials = cd;

                loan.Products_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Products", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.Products_Service.PreAuthenticate = true;
                loan.Products_Service.Credentials = cd;

                loan.guarantors_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Guarantors", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.guarantors_Service.PreAuthenticate = true;
                loan.guarantors_Service.Credentials = cd;

                loan.loans_Eligibility_.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans_Eligibility", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.loans_Eligibility_.PreAuthenticate = true;
                loan.loans_Eligibility_.Credentials = cd;

                loan.loan_Guarantor_Eligibility_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loan_guarantor_eligibility", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.loan_Guarantor_Eligibility_Service.PreAuthenticate = true;
                loan.loan_Guarantor_Eligibility_Service.Credentials = cd;





                //Smss.smsservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Sms", s.Serverip, s.Companyname, s.Instance, s.Port);
                //Smss.smsservice.PreAuthenticate = true;
                //Smss.smsservice.Credentials = cd;

                Trans.setup = Trans.setupservice.
                    Read(1);
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
        }
       private void loadsettingswithcertificate()
        {
            try
            {
                NetworkCredential networkCredential = new NetworkCredential(s.Username, s.pass);
                CredentialCache credentialCaches = new CredentialCache();
                Trans.trservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Transactions", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.trservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.trservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.trservice.Url), "Basic", networkCredential);
                Trans.trservice.Credentials = credentialCaches;
                Trans.trservice.PreAuthenticate = true;

                Trans.Accentriesservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Account_Entries", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.Accentriesservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.Accentriesservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.Accentriesservice.Url), "Basic", networkCredential);
                Trans.Accentriesservice.Credentials = credentialCaches;
                Trans.Accentriesservice.PreAuthenticate = true;
                Trans.Accservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Accounts", s.Serverip, s.Companyname, s.Instance, s.Port);

                Trans.Accservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.Accservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.Accservice.Url), "Basic", networkCredential);
                Trans.Accservice.Credentials = credentialCaches;
                Trans.Accservice.PreAuthenticate = true;
                Trans.account_Types_Service.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Account_Types", s.Serverip, s.Companyname, s.Instance, s.Port);

                Trans.account_Types_Service.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.account_Types_Service.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.Accservice.Url), "Basic", networkCredential);
                Trans.account_Types_Service.Credentials = credentialCaches;
                Trans.account_Types_Service.PreAuthenticate = true;

                Trans.s_mobile.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Codeunit/S_Mobile", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.s_mobile.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.s_mobile.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.s_mobile.Url), "Basic", networkCredential);
                Trans.s_mobile.Credentials = credentialCaches;
                Trans.s_mobile.PreAuthenticate = true;

                Applications.appservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Applications", s.Serverip, s.Companyname, s.Instance, s.Port);
                Applications.appservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Applications.appservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Applications.appservice.Url), "Basic", networkCredential);
                Applications.appservice.Credentials = credentialCaches;
                Applications.appservice.PreAuthenticate = true;
                Trans.setupservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Setup", s.Serverip, s.Companyname, s.Instance, s.Port);
                Trans.setupservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Trans.setupservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Trans.setupservice.Url), "Basic", networkCredential);
                Trans.setupservice.Credentials = credentialCaches;
                Trans.setupservice.PreAuthenticate = true;

                Members.Memberservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Member", s.Serverip, s.Companyname, s.Instance, s.Port);
                Members.Memberservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                Members.Memberservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(Members.Memberservice.Url), "Basic", networkCredential);
                Members.Memberservice.Credentials = credentialCaches;
                Members.Memberservice.PreAuthenticate = true;

                loan.loanservice.Url = String.Format("http://{0}:{3}/{2}/WS/{1}/Page/Loans", s.Serverip, s.Companyname, s.Instance, s.Port);
                loan.loanservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\NavServiceCert.cer"));
                loan.loanservice.ClientCertificates.Add(X509Certificate.CreateFromCertFile(s.certpath + "\\RootNavServiceCA.cer"));
                credentialCaches.Add(new Uri(loan.loanservice.Url), "Basic", networkCredential);
                loan.loanservice.Credentials = credentialCaches;
                loan.loanservice.PreAuthenticate = true;
                Trans.setup = Trans.setupservice.ReadByRecId("1");
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }

        }
        public Loans_Eligibility.Loans_Eligibility Loan_Eligibility(string Member, string Productid)
        {
            Loans_Eligibility.Loans_Eligibility loans_Eligibility = new Loans_Eligibility.Loans_Eligibility();
            loans_Eligibility.Member = Member;
            loans_Eligibility.Product_ID = Productid;
            var le = loan.loans_Eligibility_.Read(Member, Productid);
            if (le != null)
                loan.loans_Eligibility_.Delete(le.Key);

                loan.loans_Eligibility_.Create(ref loans_Eligibility);
            
            return loans_Eligibility;

        }
        public Loan_guarantor_eligibility.Loan_guarantor_eligibility Loan_Guarantor_Eligibility(string guarantor)
        {
             Loan_guarantor_eligibility.Loan_guarantor_eligibility loang = new Loan_guarantor_eligibility.Loan_guarantor_eligibility();
            var acc  = Trans.Getaccounts2(guarantor);
            if (acc != null)
            {
                if (acc.Accounts.Length>0)
                loang = loan.loan_Guarantor_Eligibility_Service.Read(acc.Accounts[0].Member_No);
            }

            return loang;

        }

        public List<Products.Products> Loan_products() {
            List<Products.Products> ps = null;
            try
            {
                ps = loan.Products_Service.ReadMultiple(new Products.Products_Filter[] { }, null, 0).ToList();

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                
            }
            return ps;
        }
        public List<SASRA_Sectors.SASRA_Sectors> SASRA_Sectors()
        {
            List<SASRA_Sectors.SASRA_Sectors> ps = null;
            try
            {
                ps = Trans.sASRA_Sectors_Service.ReadMultiple(new SASRA_Sectors.SASRA_Sectors_Filter[] { }, null, 0).ToList();

            }
            catch (Exception ex)    
            {
                Logging.Logging.ReportError(ex);

            }
            return ps;
        }
        public MobileLoanTopup.MobileLoanTopups Topups(MobileLoanTopup.MobileLoanTopups mobileLoanTopup)
        {
            try
            {
                var mt = Trans.MobileLoanTopup_Service.ReadMultiple(new MobileLoanTopup.MobileLoanTopup_Filter[] {new MobileLoanTopup.MobileLoanTopup_Filter { Criteria = mobileLoanTopup.Document_No , Field = MobileLoanTopup.MobileLoanTopup_Fields.Document_No},new MobileLoanTopup.MobileLoanTopup_Filter { Criteria = mobileLoanTopup.Loan_No , Field = MobileLoanTopup.MobileLoanTopup_Fields.Loan_No} },null,0).FirstOrDefault();
                if (mt == null)
                {
                    MobileLoanTopup.MobileLoanTopup tp = new MobileLoanTopup.MobileLoanTopup();
                    tp.Document_No = mobileLoanTopup.Document_No;
                    tp.Loan_No = mobileLoanTopup.Loan_No;
                    tp.Amount_to_Topup = mobileLoanTopup.Amount_to_Topup;
                    tp.Amount_to_TopupSpecified = true;
                    
                    Trans.MobileLoanTopup_Service.Create(ref tp);
                    mobileLoanTopup.code = 0;
                }
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
                mobileLoanTopup.code = -1;
                mobileLoanTopup.error_Desc = ex.Message;
            }
            return mobileLoanTopup;
        }
        public Results Loan_guarantors(Guarantors.Guarantors guarantor)
        {
            Results results = new Results();
            try
            {
                    loan.guarantors_Service.Create(ref guarantor);

                
                results.data = guarantor;
            }
            catch (Exception ex)
            {
                results.code = -1;
                results.error_Desc = ex.Message;
                Logging.Logging.ReportError(ex);

            }
            return results;
        }
        public Results Activate(string id) {
            Results results = new Results();
            try
            {
                var app = Applications.appservice.ReadMultiple(new S_Applications.Applications_Filter[] { new S_Applications.Applications_Filter { Criteria = id, Field = S_Applications.Applications_Fields.Customer_ID_No }, new S_Applications.Applications_Filter { Criteria = "Change", Field = S_Applications.Applications_Fields.Application_Type } }, null, 0).FirstOrDefault();
                if (app == null)
                    app = Applications.appservice.ReadMultiple(new S_Applications.Applications_Filter[] { new S_Applications.Applications_Filter { Criteria = id, Field = S_Applications.Applications_Fields.Customer_ID_No }, new S_Applications.Applications_Filter { Criteria = "Initial", Field = S_Applications.Applications_Fields.Application_Type } }, null, 0).FirstOrDefault();

                if (app != null)
                {
                    app.Status = S_Applications.Status.Approved;
                    app.StatusSpecified = true;

                    var acc = Trans.Accservice.Read(app.Account_No);
                    if (acc != null)
                    {//27882335
                        acc.MPESA_Mobile_No = app.MPESA_Mobile_No;
                        Trans.Accservice.Update(ref acc);
                        Applications.appservice.Update(ref app);
                    }
                    else
                    {
                        results.code = -1;
                        results.error_Desc = "Account Not found";
                    }
                }
            }
            catch (Exception ex)
            {
                results.code = -1;
                results.error_Desc = ex.Message;
            }
            return results;
        
        }
        public Results Tstatus(string documentNo)
        {
            Results r = new Results();
            try
            {
                var T = Trans.trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = documentNo, Field = Transactions_Fields.Document_No } }, null,0 );
                if (T.Count() > 0)
                {
                    if (T[0].Status == Transactions.Status.Completed)
                    {
                        r.code = 0;
                        r.error_Desc = "Successfull";
                    }
                    else
                    {
                        r.code = -1;
                        r.error_Desc = T[0].Comments;
                    }
                }
                else {  r.code = -1;
                        r.error_Desc = "Transaction not found";
                }
            }
            catch(Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return r;
        }

        public Trans Transaction(Trans t)
        {
            return Trans.Create(t);
        }
        public List<Sms.Sms> sendsms(List<Sms.Sms> smses)
        {            
            return Sms.Sms.sendsms(smses);
        }
        //public List<Sms.Sms> SmsUpdate(List<Sms.Sms> s)
        //{
        //    Smss.Upddatesms(ref s);
        //    return s;
        //}
        public double Bal(string acc)
        {
            return  Trans.Balance(acc);
        }
        //public eligibility Eligibility(string phone,String loantype)
        public eligibility Eligibility(string phone,Transactions.Loan_Type loantype)
        {
            eligibility el = new eligibility();
            Logging.Logging.LogEntryOnFile("Eligibility: " + phone);
            try
            {

                var acc = loan.Eligibility_Service.ReadMultiple(new Eligibilitys.Eligibility_Filter[] { new Eligibilitys.Eligibility_Filter { Criteria = phone, Field = Eligibilitys.Eligibility_Fields.Telephone }, new Eligibilitys.Eligibility_Filter { Criteria = loantype.ToString(), Field = Eligibilitys.Eligibility_Fields.Loan_type } }, null, 0).FirstOrDefault();

                if (acc != null)
                {
                    try
                    {
                        loan.Eligibility_Service.Delete(acc.Key);
                    }
                    catch (Exception exx)
                    { Logging.Logging.ReportError(exx); }
                    }


                Trans.s_mobile.AdvanceEligibility(phone,(int) loantype);



               System.Threading.Thread.Sleep(2000);

                var ac = loan.Eligibility_Service.ReadMultiple(new Eligibilitys.Eligibility_Filter[] { new Eligibilitys.Eligibility_Filter { Criteria = phone, Field = Eligibilitys.Eligibility_Fields.Telephone }, new Eligibilitys.Eligibility_Filter { Criteria = loantype.ToString(), Field = Eligibilitys.Eligibility_Fields.Loan_type } }, null, 0).FirstOrDefault();

                if (ac != null)
                {
                    //el.eligible_amount = (double)Trans.s_mobile.AdvanceEligibility(phone, (int)loantype);
                    if (!string.IsNullOrEmpty(ac.Comments))
                    {
                        el.code = -1;
                        el.error_Desc = ac.Comments;
                    }
                    else
                    {
                        el.eligible_amount = (double)ac.Net;
                        el.Charges = (double)ac.Charges;
                        el.Topups = (double)ac.Top_ups;
                        el.Total_Eligible = (double)ac.Eligibility1;
                        if (loantype == Loan_Type.Dividend)
                            el.Total_Eligible = (double)ac.Net;
                        el.Loan_period = ac.Loan_Period;
                        el.Rate = (double)ac.Rate;
                        el.minimum = (double)ac.Minimum;
                    }
                }
                else
                {
                    el.code = -1;
                    el.error_Desc = "Account not found";
                }

            }

            catch (Exception ex)
            {
                el.code = -1;
                el.error_Desc = ex.Message;
                Logging.Logging.ReportError(ex);

            }
        Trans. CreateXML(el);
            return el;

        }
        public List<S_Applications.Applications> Registration()
        {
            return Applications.Registrations();
        }
        public List<Loans_mobile> CustomerLoans(string telephone)
        {
            return loan.Customerloans(telephone);
        }
        public Account Accounts(string tel)
        {
            return Trans.Getaccounts2(tel);
        }
        public Member.Member Accountsbyid(string id)
        {
            return Members.getmemberbyid(id);


        }
        //public List<Accounts.Accounts> Accountsbyid(string id)
        //{
        //    return Trans.Getaccountsbyid(id);
        //}
        public List<Accounts.Accounts> ChildAccounts(string no)
        {
            return Trans.Getchilda(no);
        }
        public List<Accounts.Accounts> Memberaccounts(string tel)
        {
            return Trans.Getmemberaccounts(tel);
        }
        public Accounts.Accounts Account(string acc)
        {
            
            return Trans.Getaccount(acc);
        }
        public Member.Member member(string acc)
        {
            return Members.getmember(acc);
        }

    }
    public enum loantypes {
        Mloan, Dividend
    }
    public class settings
    {
        public string Serverip = string.Empty;
        public string domain = string.Empty;
        public string Instance = string.Empty;
        public int Port = 0;
        public string Username = string.Empty;
        public string pass = string.Empty;
        public string Companyname = string.Empty;
        public int PostIntervalinsec = 2;
        public int Reconnectintervalinsec = 10;
        public string logpath = string.Empty;
        public Boolean usewindowsauth = true;
        public string certpath = string.Empty;
        public DateTime t = DateTime.Now.Date;
        public DateTime tt = new DateTime(2017, 2, 5);
        public settings loadsettings(string file)
        {
            settings s = new settings();
            XmlSerializer xs = new XmlSerializer(typeof(settings));
            using (var sr = new StreamReader(file))
            {
                s = (settings)xs.Deserialize(sr);
                Logging.Logging.logpath = s.logpath;
            }
            return s;
        }
        public void setup(ref settings s)
        {
            var p = s.Username;
            s.pass = p;
        }
    }
    public class loan
    {

        public static Loans_mobile_Service loanservice = new Loans_mobile_Service();
        public static Product_Charges.Product_Charges_Service productchargesservice = new Product_Charges.Product_Charges_Service();
        public static Products.Products_Service Products_Service = new Products.Products_Service();
        public static Guarantors.Guarantors_Service guarantors_Service = new Guarantors.Guarantors_Service();
        public static Eligibilitys.Eligibility_Service Eligibility_Service = new Eligibilitys.Eligibility_Service();
        public static Loans_Eligibility.Loans_Eligibility_Service loans_Eligibility_ = new Loans_Eligibility.Loans_Eligibility_Service();
        public static Loan_guarantor_eligibility.Loan_guarantor_eligibility_Service loan_Guarantor_Eligibility_Service = new Loan_guarantor_eligibility.Loan_guarantor_eligibility_Service();
        public string loantype;
        public decimal balance;
        public Loans.Status status;

        public static List<Loans_mobile> Customerloans(string acc)
        {
            List<Loans_mobile> Customerloan = new List<Loans_mobile>();
            try
            {
                var a = Trans.Getaccounts(acc);
                if (a.Count() != 0)
                {
                   
                    Customerloan = loanservice.ReadMultiple(new Loans_mobile_Filter[] { new Loans_mobile_Filter { Criteria = a[0].Member_No, Field = Loans_mobile_Fields.Client_Code } }, null, 0).Where(o => o.Outstanding_Balance > 0 || o.Outstanding_Interest > 0).ToList();

                }
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return Customerloan;
        }

        internal static void LoanBalance(ref Trans t)
        {
            List<Loans_mobile> ll = new List<Loans_mobile>();
            Trans tt = t;
         
            var cl = loanservice.ReadMultiple(new Loans_mobile_Filter[] { new Loans_mobile_Filter { Criteria = t.Account_No, Field = Loans_mobile_Fields.Client_Code } }, null, 0).Where(o => o.Outstanding_Balance > 0 || o.Outstanding_Interest > 0).ToList();
            ll = cl;
            //foreach (var l in cl)
            //{
            //    Logging.Logging.LogEntryOnFile(l.Loan_No);
            //    loan la = new loan();
            //    la.loantype = l.Loan_Name;
            //    la.balance = l.Outstanding_Balance + l.Oustanding_Interest;
            //    ll.Add(la);
            //}
            //Accounts.Accounts a = Trans.Getaccount(t.Account_No);

            //Members.member = Members.getmember(a.BOSA_Account_No);
            //cl = loanservice.ReadMultiple(new Loans_Filter[] { new Loans_Filter { Criteria = Members.member.No, Field = Loans_Fields.Client_Code } }, null, 0).Where(o => o.Outstanding_Balance > 0 || o.Oustanding_Interest > 0).ToList();
            //foreach (var l in cl)
            //{
            //    if (ll.FirstOrDefault(o => o.loantype == l.Loan_Name) == null)
            //    {
            //        loan la = new loan();
            //        la.loantype = l.Loan_Name;
            //        la.balance = l.Outstanding_Balance + l.Oustanding_Interest;
            //        ll.Add(la);
            //    }
            //}

            t.LoanBalances = ll;
          
                ;
        }
        internal static void Loanstatus(ref Trans t)
        {
            List<loan> ll = new List<loan>();
            Trans tt = t;
            var cl = Customerloans(t.Account_No).Where(o => o.Status == Loans.Status.Approved);
            foreach (var l in cl)
            {
                loan la = new loan()
                {
                    loantype = l.Loan_Name,
                    status = l.Status
                };
                ll.Add(la);
            }
            Accounts.Accounts a = Trans.Getaccount(t.Account_No);
            Members.member = Members.getmember(a.Member_No);
            cl = Customerloans(Members.member.No).Where(o => o.Status == Loans.Status.Approved);
            foreach (var l in cl)
            {
                loan la = new loan();
                la.loantype = l.Loan_Name;
                la.balance = l.Outstanding_Balance + l.Outstanding_Interest;
                ll.Add(la);
            }
            t.LoanStatus = ll;
        }
    }
    public class Applications
    {
        public static S_Applications.Applications_Service appservice = new S_Applications.Applications_Service();
        public static List<S_Applications.Applications> Registrations()
        {
            List<S_Applications.Applications> r = new List<S_Applications.Applications>();
            try
            {
                var rr = appservice.ReadMultiple(new S_Applications.Applications_Filter[] { new S_Applications.Applications_Filter { Criteria = "No", Field = S_Applications.Applications_Fields.Sent_To_Server }, new S_Applications.Applications_Filter { Criteria = "Approved", Field = S_Applications.Applications_Fields.Status } }, null, 100);
                foreach (var i in rr)
                {
                    i.Sent_To_Server = S_Applications.Sent_To_Server.Yes;
                    i.Sent_To_ServerSpecified = true;
                }
                appservice.UpdateMultiple(ref rr);
                r = rr.ToList();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            Trans.CreateXML(r);
            return r;
        }
    }
    public class eligibility :Results
    {
        public double eligible_amount { get; set; }
        public double Topups { get; set; }
        public double Charges { get; set; }
        public double Total_Eligible { get; set; }
        public int Loan_period { get; set; }
        public double Rate { get; set; }
        public double minimum { get; set; }



    }
  
    public class Ministatement
    {
        public double amount;
        public string desc;
        public DateTime posting_Date;
        public double balance;


    }
    public class Members
    {
        public static Member.Member_Service Memberservice = new Member.Member_Service();
        public static Member.Member member;
        public static Member.Member getmember(string acc)
        {
            Member.Member m = null;
            try
            {

                m = Members.Memberservice.Read(acc);

            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }
        public static Member.Member getmemberbyid(string id)
        {
            Member.Member m = null;
            try
            {
                m = Members.Memberservice.ReadMultiple(new Member.Member_Filter[] { new Member.Member_Filter {Criteria = id, Field = Member.Member_Fields.ID_No }, new Member.Member_Filter { Criteria = "Active|Rejoined", Field = Member.Member_Fields.Status } },null,0).FirstOrDefault();
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return m;
        }

        public List<deposits> depositbalance (string member)
        {
            List<deposits> d = new List<deposits>();
            try
            {
               var mm =Trans.Getaccount(member);
                if (mm != null)
                {
                    var acc = Trans.Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = mm.Member_No, Field = Accounts.Accounts_Fields.Member_No } }, null, 0).Where(o => o.Product_Category == Accounts.Product_Category.Deposit_Contribution || o.Product_Category == Accounts.Product_Category.Share_Capital);

                    foreach (var m in acc)
                    {
                        d.Add(new deposits(m.Product_Name, (double)m.Balance));

                    }
                }
              

            }
            catch (Exception e) { }
            return d;
        }
        public class deposits
        {
            public string type;
                public double balance;
            public deposits() { }
            public deposits(string type, double bal)
            {
                this.type = type;
                this.balance = bal;
            }

        }
    }
 
}
namespace Client.Accounts
{
    
    
    public partial class Accounts
    {
        public AccountTypes.Account_Types Type
        {
            get
            {
                var types = Trans.account_Types_Service.Read(Product_Type);

                return types;
            }
        }
       
    }
}
namespace Client.Member
{
    public partial class Member
    {
        public Accounts.Accounts[] accounts
        {
            get
            {
                List<Accounts.Accounts> a = new List<Accounts.Accounts>();
                a = Trans.Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = No, Field = Accounts.Accounts_Fields.Member_No } }, null, 0).ToList();

                return a.ToArray();

            }
        }
    }
}
namespace Client.Sms
{
  
    public partial class Sms:Results
    {
        public static List<Sms> sendsms(List<Sms> s)
        {
            Sms[] ss = s.ToArray();
            try
            {
                foreach (var sms in s)
                {
                    try
                    {
                        Trans.s_mobile.SendSms(sms.Document_No, sms.Telephone_No, sms.SMS_Message, sms.Document_No);
                        sms.code = 0;
                    }
                    catch (Exception ex)
                    {
                        sms.code = -1;
                        sms.error_Desc = "Unspecified Error";
                        Logging.Logging.ReportError(ex); }
                }
}
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return ss.ToList();
        }
    }
}
namespace Client.Loans
{
    public partial class Loans_mobile
    {
        public double Loan_Balance
        {
            get
            {
                return (double)Outstanding_Balance + (double)Outstanding_Interest;
            }
        }
    }
}