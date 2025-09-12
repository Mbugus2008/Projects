
using S_Ussd.Members3;
using S_Ussd.Statistics;
using S_Ussd.Vehicles;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace S_Ussd
{
    public class Api
    {
        Client setting;
        public Api(S_Ussd.Client customer)
        {
            customer.cd = new System.Net.NetworkCredential(customer.UserName, customer.Password, "");
            this.setting = customer;
            Logging.nav nav = new Logging.nav();
            nav.Username = customer.UserName;
            nav.pass = customer.Password;
            nav.Instance = customer.Instance;
            nav.Port = (int)customer.Port;
            nav.Companyname = customer.Company;
            nav.Server = customer.IPAddress;
            customer.navsetting = nav;

        }
        public Members3.Members3 member(string phone)
        {

            return new Members3_Service(setting).ReadMultiple(new Members3_Filter[] { new Members3_Filter { Criteria = string.Format("*{0}*", phone.Substring(phone.Length - 9)), Field = Members3_Fields.Phone_No } }, null, 0).FirstOrDefault();


        }

        public void sendsms(Request req, String message)
        {

            new MBranch.MBranch(setting).Sendsms("USSD", req.MSISDN, message, req.SESSIONID);


        }

        internal string Balances(string account_No)
        {
            List<Balances> bals = new List<Balances>();
            StringBuilder bb = new StringBuilder();
            var stats = new Statistics_Service(setting).Read(account_No);
            if (stats != null)
            {
                bb.AppendLine(string.Join(",", "Deposits", (double)stats.Deposit_Balance));
                bb.AppendLine(string.Join(",", "Savings", (double)stats.Savings));

            };
            return bb.ToString();
        }
        internal List<Vehicles.Vehicles> vehicles(string account_No)
        {         
            return  new Vehicles_Service(setting).ReadMultiple(new Vehicles_Filter[] {new Vehicles_Filter {Criteria = account_No,Field = Vehicles_Fields.Code } },null,0).ToList();

        }
        internal string LoanBalances(string acc)
        {
          
            StringBuilder bb = new StringBuilder(); 
            var stats = new Loans.Loans_Service(setting).ReadMultiple(new Loans.Loans_Filter[] { new Loans.Loans_Filter { Criteria = acc,Field = Loans.Loans_Fields.Client_Code  } },null,0);
            foreach (var b in stats)
            {
                bb.AppendLine(string.Join(",", b.Product_Name, (double)(b.Credit_Balance + b.Interest_Balance)));
             
             
            };
            return bb.ToString();
        }

        internal void Trans(ref Request req)
        {
            //var service = new MobileTransactions.MobileTransactions_Service(setting);
            //var mt = service.Read(req.SESSIONID, req.transaction.Transaction_Type.ToString());
            //if (mt == null) {
            //mt = new MobileTransactions.MobileTransactions();
            //    mt.Document_No = req.SESSIONID;
            //    mt.Transaction_Type = req.transaction.Transaction_Type.ToString();
            //    mt.Account_No = req.transaction.Account_No;
            //    mt.Document_Date = (DateTime)req.transaction.Transaction_Date;
            //    mt.Telephone_Number = req.MSISDN;

            //    service.Create(ref mt);
            
            //}
        }

        internal List<account> Withdrawableaccounts(string account_No)
        {
            List<account> accs = new List<account>();
          
            var stats = new Statistics_Service(setting).Read(account_No);
            if (stats != null)
            {
                accs = new List<account> { new account { No = stats.No, Name = "Savings",Balance = (double)stats.Savings } };
                          };
           return accs;
        }
    }
    public partial class Client
    {
        public System.Net.NetworkCredential cd { set; get; }
        public Logging.nav navsetting { set; get; }
    }
    namespace Members3
    {
        public partial class Members3_Service
        {

            public Members3_Service(Client s)
            {
                this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Members3_Members3_Service, s.navsetting);

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
    namespace  Loans
    {
        public partial class Loans_Service
        {

            public Loans_Service(Client s)
            {
                this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Loans_Loans_Service, s.navsetting);

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
    namespace Statistics
    {
        public class Balances
        {
            public string Name { get; set; }
            public double balance { get; set; }
        }


        public partial class Statistics_Service
        {

            public Statistics_Service(Client s)
            {
                this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Statistics_Statistics_Service, s.navsetting);

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
    namespace Vehicles
    {

        public partial class Vehicles_Service
        {

            public Vehicles_Service(Client s)
            {
                this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Vehicles_Vehicles_Service, s.navsetting);

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
    //namespace MobileTransactions
    //{

    //    public partial class MobileTransactions_Service
    //    {

    //        public MobileTransactions_Service(Client s)
    //        {
    //            this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_MobileTransactions_MobileTransactions_Service, s.navsetting);

    //            if ((this.IsLocalFileSystemWebService(this.Url) == true))
    //            {
    //                this.UseDefaultCredentials = true;
    //                this.useDefaultCredentialsSetExplicitly = false;
    //            }
    //            else
    //            {
    //                this.useDefaultCredentialsSetExplicitly = true;
    //            }
    //            this.Credentials = s.cd;
    //            this.PreAuthenticate = true;
    //        }


    //    }
    //}
    namespace MBranch
    {
        public partial class MBranch
        {

            public MBranch(Client s)
            {
                this.Url = new Logging.settings().geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_MBranch_MBranch, s.navsetting);

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

}