
using S_Ussd;
using S_Ussd.ClientData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace S_Ussd.Sacco_Memberlist
{
    public partial class Members2_Service
    {
        public Members2_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Memberlist_Memberslist_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}

namespace S_Ussd.Matatu_Members
{
    public partial class Members_Service
    {
        public Members_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Matatu_Members_Members_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}


namespace S_Ussd.Alternate{
    public partial class Alternate
    {
        public Alternate(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Alternate_Alternate, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}
namespace S_Ussd.Smses
{
    public partial class Smses_Service
    {
        public Smses_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Smses_Smses_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}
namespace S_Ussd.LedgerEntries
{
    public partial class LedgerEntries_Service
    {
        public LedgerEntries_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_LedgerEntries_LedgerEntries_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}namespace S_Ussd.MobileTransactions
{
    public partial class MobileTransactions_Service
    {
        public MobileTransactions_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_MobileTransactions_MobileTransactions_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}namespace S_Ussd.Sacco_MobileTransactions
{
    public partial class  MobileTransactions_Service
    {
        public MobileTransactions_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Sacco_MobileTransactions_MobileTransactions_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
}
namespace S_Ussd.Loan_Products
{
    public partial class Loan_Products_Service
    {
        public Loan_Products_Service(Logging.settings ser)
        {
            this.Url = ser.geturl(global::S_Ussd.Properties.Settings.Default.S_Ussd_Loan_Products_Loan_Products_Service, ser.navsettings);
            if ((this.IsLocalFileSystemWebService(this.Url) == true))
            {
                this.UseDefaultCredentials = true;
                this.useDefaultCredentialsSetExplicitly = false;
            }
            else
            {
                this.useDefaultCredentialsSetExplicitly = true;
            }
            this.Credentials = ser.cd;
            this.PreAuthenticate = true;
        }
    }
    public partial class Loan_Products : LoanProducts
    {

    }
}
namespace S_Ussd
{
    public partial class LoanProducts
    {
        public string Key { get; set; }
        public string Code { get; set; }
        public string Product_Description { get; set; }

        public bool Appraise_Dividend { get; set; }
        public string Penalty_Charged_Account { get; set; }
        public int Ordinary_Share_Multiplier { get; set; }
        public bool Appraise_Guarantors { get; set; }
        public string Product_Currency_Code { get; set; }
        public string Min_Re_application_Period { get; set; }

        public int Recovery_Priority { get; set; }
        public int Min_No_Of_Guarantors { get; set; }
        public bool Max_Branch_Approval { get; set; }
        public int Shares_Multiplier { get; set; }
        public bool Appraise_Deposits { get; set; }
        public bool Appraise_Salary { get; set; }
        public int Preferential_Share_Multiplier { get; set; }
        public bool Appraise_Business { get; set; }
        public int Ordinary_Default_Install { get; set; }
        public int Preferential_Default_Install { get; set; }
        public bool Collateral_Appraisal { get; set; }
        public int Max_No_Of_Guarantors { get; set; }

        public bool Interest_Upfront { get; set; }
        public bool Available_on_Mobile { get; set; }
        public bool Auto_Appraise { get; set; }
        public decimal Min_Loan_Amount { get; set; }
        public bool Allow_Topup { get; set; }
        public decimal Max_Loan_Amount { get; set; }
    }

    public partial class LoanEligibility
    {
        public string Key { get; set; }
        public System.DateTime Date { get; set; }
        public string Code { get; set; }
        public string Member { get; set; }
        public string Loan_Type { get; set; }
        public decimal Loan_Balance { get; set; }
        public decimal Eligible_Amount { get; set; }
        public decimal Charges { get; set; }
        public decimal Amount_Requested { get; set; }
        public string Phone { get; set; }
        public Eligibility_Status Eligibility_Status { get; set; }
        public string Comments { get; set; }
        public bool use_percentage { get; set; }
        public decimal Topup_Paid { get; set; }
        public decimal Topup_Installment { get; set; }
    }
    public enum Eligibility_Status
    {

        /// <remarks/>
        Pending,

        /// <remarks/>
        Complete,

        /// <remarks/>
        Failed,
    }
    public partial class MTransactions
    {
    
        public string Account_No { get; set; }
        public string Account_Name { get; set; }
 
        public System.DateTime Document_Date { get; set; }
    
   
        public string Telephone_Number { get; set; }
      
   
        public string Account_2 { get; set; }
 
        public int Entry { get; set; }
        public string Client { get; set; }
        public System.DateTime Posting_Date { get; set; }
 
        public Destination Destination { get; set; }
        public Loan_Type Loan_Type { get; set; }
        public string Receipt_No { get; set; }
        public Channel Channel { get; set; }
        public bool Dont_Charge { get; set; }
        public int Loan_Period { get; set; }
        public decimal Account_Balance { get; set; }
        public decimal Rate { get; set; }
        public decimal Amount_LCY { get; set; }
        public string Product_Name { get; set; }
        public decimal Loan_Balance { get; set; }
        public string Bank { get; set; }
        public Transfer_type Transfer_type { get; set; }
        public bool Hold { get; set; }
        public Bank_Transfer_type Bank_Transfer_type { get; set; }
        public string Product_Id { get; set; }
   
        public string Modified_By { get; set; }
        public string Sector { get; set; }
        public string Fosa_Account { get; set; }
        public int Loan_application_No { get; set; }
        public bool Self_Guarantee { get; set; }
        public decimal Boost_Amount { get; set; }
        public int Code { get; set; }
        public string Desc { get; set; }
        public string Agency_Code { get; set; }
        public decimal Float_Amount { get; set; }
        public string Agent_Account { get; set; }
        public decimal Agent_commision { get; set; }
        public decimal Sacco_Commission { get; set; }
        public decimal Vendor_commission { get; set; }
        public decimal Excise_Duty { get; set; }
        public System.DateTime Statement_From { get; set; }
        public System.DateTime Statement_to { get; set; }
        public string Email { get; set; }
        public decimal Corporate_Commission { get; set; }
        public string Posting_Description { get; set; }
    }

    public partial class Applications {
        public string Key { get; set; }
        public string No { get; set; }
        public string Customer_ID_No { get; set; }
        public string Customer_Name { get; set; }
        public string MPESA_Mobile_No { get; set; }
        public System.DateTime Document_Date { get; set; }
        public bool Document_DateSpecified { get; set; }
        public app_Status Status { get; set; }
        public bool StatusSpecified { get; set; }
        public Sent_To_Server Sent_To_Server { get; set; }
        public bool Sent_To_ServerSpecified { get; set; }
    }
    public enum app_Status
    {

        /// <remarks/>
        Open,

        /// <remarks/>
        Pending,

        /// <remarks/>
        Approved,

        /// <remarks/>
        Rejected,
    }

    /// <remarks/>
    public enum Sent_To_Server
    {

        /// <remarks/>
        No,

        /// <remarks/>
        Yes,
    }

    public enum T_Status
    {

        /// <remarks/>
        Failed,

        /// <remarks/>
        Pending,

        /// <remarks/>
        Completed,
    }


    public enum Source
    {

        /// <remarks/>
        Fosa,

        /// <remarks/>
        Mpesa,
    }


    public enum Destination
    {

        /// <remarks/>
        Fosa,

        /// <remarks/>
        Shares,

        /// <remarks/>
        Deposits,
    }


    public enum Loan_Type
    {

        /// <remarks/>
        Mloan,

        /// <remarks/>
        Dividend,

        /// <remarks/>
        Other,
    }


    public enum Channel
    {

        /// <remarks/>
        _blank_,

        /// <remarks/>
        Ussd,

        /// <remarks/>
        App,

        /// <remarks/>
        Agency,
    }

    /// <remarks/>
    public enum Transfer_type
    {

        /// <remarks/>
        Self,

        /// <remarks/>
        Other_Member,
    }

    public enum Bank_Transfer_type
    {
        /// <remarks/>
        _blank_,

        /// <remarks/>
        Internal,

        /// <remarks/>
        Eft,

        /// <remarks/>
        RTGS,

        /// <remarks/>
        Pesalink,
    }
    public enum Tranfer_To
    {

        /// <remarks/>
        _blank_,

        /// <remarks/>
        Self,

        /// <remarks/>
        Other,

        /// <remarks/>
        Loan,
    }

    public partial class Members
    {


        /// <remarks/>
        public string No
        {
            get
           ;
            set
           ;
        }

        /// <remarks/>
        public string Old_Group_Account_Number
        {
            get
            ;
            set
           ;
        }

        /// <remarks/>
        public string Name
        {
            get
            ;
            set
            ;
        }

        /// <remarks/>
        public string Global_Dimension_2_Code
        {
            get
         ;
            set
           ;
        }

        /// <remarks/>
        public string ID_No
        {
            get
           ;
            set
            ;
        }

        /// <remarks/>
        public string Payroll_Staff_No
        {
            get
            ;
            set
            ;
        }

        /// <remarks/>
        public string FOSA_Account
        {
            get
          ;
            set
            ;
        }

        /// <remarks/>
        public string Section
        {
            get
            ;
            set
           ;
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Registration_Date
        {
            get
            ;
            set
           ;
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Registration_DateSpecified
        {
            get
            ;
            set
            ;
        }

        /// <remarks/>
        public string Region
        {
            get
            ;
            set
            ;
        }

        /// <remarks/>
        public string Group_Name
        {
            get
          ;
            set
           ;
        }


    }
    public class sms
    {

        public string phone { get; set; }
        public string text { get; set; }
        public string Account { get; set; }
    }
}

