using Newtonsoft.Json;
using RestSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace S_Ussd.ClientData
{
    public interface Iservice
    {
        bool Allow_withdrawal_to_other_Phone { get; }
        string pinmessage { get; }
        bool confirm_ID { get; }
        bool twostepbalancemenu { get; }
        List<account> Accounts(string tel);
        account findmember(string id);
        account getmember(string id,string phone);
        List<account> Transfer_to(string tel);
        List<account> Withdrawable_Accounts(string tel);
        account Account(string acc); account Application(string tel);
        double Tcharges(double amount, int type);
        Logging.Results Trans(Request t);
        bool PendingTrans(string acc, int transtype);
        Logging.settings Navtosettings();
        void sendsms(Request r, string Message);
         string Balances(string tel);
        string LoanBalances(string tel);
        List<Client_Loans> Loanlist(string acc);
        string ministatement(Request r);
        Members member(string tel);
         LoanProducts[] loanproducts(Request r);
        Logging.Results eligibility(string tel, string loantype);
        Logging.Results<LoanEligibility> eligibilitywithtopup(string tel, string loantype, string session);
       
    }

    public partial class Client_Loans
    {

        private string keyField;

        private string loan_NoField;

        private System.DateTime application_DateField;

        private bool application_DateFieldSpecified;

        private string loan_Product_TypeField;

        private string client_CodeField;

        private string client_NameField;

        private decimal balanceField;

        private bool balanceFieldSpecified;

        private bool appraisedField;

        private bool appraisedFieldSpecified;

        private decimal outstanding_BalanceField;

        private bool outstanding_BalanceFieldSpecified;

        private decimal oustanding_InterestField;

        private bool oustanding_InterestFieldSpecified;

        private System.DateTime last_notificationField;

        private bool last_notificationFieldSpecified;

        private System.DateTime last_Penalty_DateField;

        private bool last_Penalty_DateFieldSpecified;

        private decimal requested_AmountField;

        private bool requested_AmountFieldSpecified;

        private decimal approved_AmountField;

        private bool approved_AmountFieldSpecified;

        private decimal daily_interestField;

        private bool daily_interestFieldSpecified;

        private System.DateTime last_Interest_DateField;

        private bool last_Interest_DateFieldSpecified;

        private System.DateTime loan_Disbursement_DateField;

        private bool loan_Disbursement_DateFieldSpecified;

        private System.DateTime date_disbursedField;

        private bool date_disbursedFieldSpecified;

        private decimal penalty_DueField;

        private bool penalty_DueFieldSpecified;

        private bool penalty_chargeField;

        private bool penalty_chargeFieldSpecified;

        private decimal outstanding_PenaltyField;

        private bool outstanding_PenaltyFieldSpecified;

        private string branch_CodeField;

        private int installmentsField;

        private bool installmentsFieldSpecified;

        private string loan_Product_Type_NameField;

        /// <remarks/>
        public string Key
        {
            get
            {
                return this.keyField;
            }
            set
            {
                this.keyField = value;
            }
        }

        /// <remarks/>
        public string Loan_No
        {
            get
            {
                return this.loan_NoField;
            }
            set
            {
                this.loan_NoField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Application_Date
        {
            get
            {
                return this.application_DateField;
            }
            set
            {
                this.application_DateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Application_DateSpecified
        {
            get
            {
                return this.application_DateFieldSpecified;
            }
            set
            {
                this.application_DateFieldSpecified = value;
            }
        }

        /// <remarks/>
        public string Loan_Product_Type
        {
            get
            {
                return this.loan_Product_TypeField;
            }
            set
            {
                this.loan_Product_TypeField = value;
            }
        }

        /// <remarks/>
        public string Client_Code
        {
            get
            {
                return this.client_CodeField;
            }
            set
            {
                this.client_CodeField = value;
            }
        }

        /// <remarks/>
        public string Client_Name
        {
            get
            {
                return this.client_NameField;
            }
            set
            {
                this.client_NameField = value;
            }
        }

        /// <remarks/>
        public decimal Balance
        {
            get
            {
                return this.balanceField;
            }
            set
            {
                this.balanceField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool BalanceSpecified
        {
            get
            {
                return this.balanceFieldSpecified;
            }
            set
            {
                this.balanceFieldSpecified = value;
            }
        }

        /// <remarks/>
        public bool Appraised
        {
            get
            {
                return this.appraisedField;
            }
            set
            {
                this.appraisedField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool AppraisedSpecified
        {
            get
            {
                return this.appraisedFieldSpecified;
            }
            set
            {
                this.appraisedFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Outstanding_Balance
        {
            get
            {
                return this.outstanding_BalanceField;
            }
            set
            {
                this.outstanding_BalanceField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Outstanding_BalanceSpecified
        {
            get
            {
                return this.outstanding_BalanceFieldSpecified;
            }
            set
            {
                this.outstanding_BalanceFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Oustanding_Interest
        {
            get
            {
                return this.oustanding_InterestField;
            }
            set
            {
                this.oustanding_InterestField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Oustanding_InterestSpecified
        {
            get
            {
                return this.oustanding_InterestFieldSpecified;
            }
            set
            {
                this.oustanding_InterestFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Last_notification
        {
            get
            {
                return this.last_notificationField;
            }
            set
            {
                this.last_notificationField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Last_notificationSpecified
        {
            get
            {
                return this.last_notificationFieldSpecified;
            }
            set
            {
                this.last_notificationFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Last_Penalty_Date
        {
            get
            {
                return this.last_Penalty_DateField;
            }
            set
            {
                this.last_Penalty_DateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Last_Penalty_DateSpecified
        {
            get
            {
                return this.last_Penalty_DateFieldSpecified;
            }
            set
            {
                this.last_Penalty_DateFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Requested_Amount
        {
            get
            {
                return this.requested_AmountField;
            }
            set
            {
                this.requested_AmountField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Requested_AmountSpecified
        {
            get
            {
                return this.requested_AmountFieldSpecified;
            }
            set
            {
                this.requested_AmountFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Approved_Amount
        {
            get
            {
                return this.approved_AmountField;
            }
            set
            {
                this.approved_AmountField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Approved_AmountSpecified
        {
            get
            {
                return this.approved_AmountFieldSpecified;
            }
            set
            {
                this.approved_AmountFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Daily_interest
        {
            get
            {
                return this.daily_interestField;
            }
            set
            {
                this.daily_interestField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Daily_interestSpecified
        {
            get
            {
                return this.daily_interestFieldSpecified;
            }
            set
            {
                this.daily_interestFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Last_Interest_Date
        {
            get
            {
                return this.last_Interest_DateField;
            }
            set
            {
                this.last_Interest_DateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Last_Interest_DateSpecified
        {
            get
            {
                return this.last_Interest_DateFieldSpecified;
            }
            set
            {
                this.last_Interest_DateFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Loan_Disbursement_Date
        {
            get
            {
                return this.loan_Disbursement_DateField;
            }
            set
            {
                this.loan_Disbursement_DateField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Loan_Disbursement_DateSpecified
        {
            get
            {
                return this.loan_Disbursement_DateFieldSpecified;
            }
            set
            {
                this.loan_Disbursement_DateFieldSpecified = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlElementAttribute(DataType = "date")]
        public System.DateTime Date_disbursed
        {
            get
            {
                return this.date_disbursedField;
            }
            set
            {
                this.date_disbursedField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Date_disbursedSpecified
        {
            get
            {
                return this.date_disbursedFieldSpecified;
            }
            set
            {
                this.date_disbursedFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Penalty_Due
        {
            get
            {
                return this.penalty_DueField;
            }
            set
            {
                this.penalty_DueField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Penalty_DueSpecified
        {
            get
            {
                return this.penalty_DueFieldSpecified;
            }
            set
            {
                this.penalty_DueFieldSpecified = value;
            }
        }

        /// <remarks/>
        public bool Penalty_charge
        {
            get
            {
                return this.penalty_chargeField;
            }
            set
            {
                this.penalty_chargeField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Penalty_chargeSpecified
        {
            get
            {
                return this.penalty_chargeFieldSpecified;
            }
            set
            {
                this.penalty_chargeFieldSpecified = value;
            }
        }

        /// <remarks/>
        public decimal Outstanding_Penalty
        {
            get
            {
                return this.outstanding_PenaltyField;
            }
            set
            {
                this.outstanding_PenaltyField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool Outstanding_PenaltySpecified
        {
            get
            {
                return this.outstanding_PenaltyFieldSpecified;
            }
            set
            {
                this.outstanding_PenaltyFieldSpecified = value;
            }
        }

        /// <remarks/>
        public string Branch_Code
        {
            get
            {
                return this.branch_CodeField;
            }
            set
            {
                this.branch_CodeField = value;
            }
        }

        /// <remarks/>
        public int Installments
        {
            get
            {
                return this.installmentsField;
            }
            set
            {
                this.installmentsField = value;
            }
        }

        /// <remarks/>
        [System.Xml.Serialization.XmlIgnoreAttribute()]
        public bool InstallmentsSpecified
        {
            get
            {
                return this.installmentsFieldSpecified;
            }
            set
            {
                this.installmentsFieldSpecified = value;
            }
        }

        /// <remarks/>
        public string Loan_Product_Type_Name
        {
            get
            {
                return this.loan_Product_Type_NameField;
            }
            set
            {
                this.loan_Product_Type_NameField = value;
            }
        }
    }

}
