using Client.Transactions;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;
using System.Xml;
using System.Xml.Serialization;

namespace Client
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    //[XmlSerializerFormat]
    public interface Mobile
    {
        [OperationContract]
        [XmlSerializerFormat]
        Results Tstatus(string documentNo);
       
        [OperationContract]
        [XmlSerializerFormat]
        eligibility Eligibility(string phone, Transactions.Loan_Type loantype);

        [OperationContract]
        [XmlSerializerFormat]
        MobileLoanTopup.MobileLoanTopups Topups(MobileLoanTopup.MobileLoanTopups mobileLoanTopup);

        [OperationContract]
        [XmlSerializerFormat]
        List<SASRA_Sectors.SASRA_Sectors> SASRA_Sectors();


        [OperationContract]
        [XmlSerializerFormat]
        Loans_Eligibility.Loans_Eligibility Loan_Eligibility(string Member, string Productid);

        [OperationContract]
        [XmlSerializerFormat]
        Loan_guarantor_eligibility.Loan_guarantor_eligibility Loan_Guarantor_Eligibility(string guarantor);

        [OperationContract]
        Member.Member member(string acc);
        
        [OperationContract]
        [XmlSerializerFormat]
        List<Accounts.Accounts> Memberaccounts(string tel);
        
        [OperationContract]
        Trans Transaction(Trans t);
        [OperationContract]
        [XmlSerializerFormat]
        List<Sms.Sms> sendsms(List<Sms.Sms> smses);
        //[OperationContract]
        //List<Sms.Sms> SmsUpdate(List<Sms.Sms> s);
        [OperationContract]
        [XmlSerializerFormat]
        double Bal(string acc);
        [OperationContract]
        [XmlSerializerFormat]
        Results Loan_guarantors(Guarantors.Guarantors guarantor);
        [OperationContract]
        [XmlSerializerFormat]
        List<Products.Products> Loan_products();

        [OperationContract]
        [XmlSerializerFormat]
        Results Activate(string id);

        [OperationContract]
        List<S_Applications.Applications> Registration();
        [OperationContract]
        List<Loans.Loans_mobile> CustomerLoans(string telephone);

        [OperationContract]
        Account Accounts(string tel);

        [OperationContract]
     
        Accounts.Accounts Account(string tel);

        [OperationContract]
        [XmlSerializerFormat]
        Member.Member Accountsbyid(string id);
        [OperationContract]
        [XmlSerializerFormat]
        List<Accounts.Accounts> ChildAccounts(string no);
    }

    [DataContract]
    public class Results
    {[DataMember]
        public int code = 0;
        [DataMember]
        public string error_Desc;
        [DataMember]
        public object data;
    }
    [DataContract]
    public class Account {
        private bool mobile_registered;
        private Accounts.Accounts[] accounts;
        [DataMember]
        public bool Mobile_Registered
        {
            get { return mobile_registered; }
            set { mobile_registered = value; }
        }
        [DataMember]
        public Accounts.Accounts[] Accounts { 
        get { return accounts; 
            }
            set { accounts = value; }
        }
    }
    [DataContract]
    public class Trans : Results
    {
        [XmlIgnore]
        public static Transactions_Service trservice = new Transactions_Service();
        [XmlIgnore]
        public static Statement.Account_Entries_Service Accentriesservice = new Statement.Account_Entries_Service();
        [XmlIgnore]
        public static Accounts.Accounts_Service Accservice = new Accounts.Accounts_Service();
        [XmlIgnore]
        public static S_Mobile.Mobile s_mobile = new S_Mobile.Mobile();
        [XmlIgnore]
        public static AccountTypes.Account_Types_Service account_Types_Service = new AccountTypes.Account_Types_Service();
        [XmlIgnore]
        public static Setup.Setup_Service setupservice = new Setup.Setup_Service();
        [XmlIgnore]
        public static Setup.Setup setup;
        [XmlIgnore]
        public static Mobile_Charges.Mobile_Charges_Service mobile_charges = new Mobile_Charges.Mobile_Charges_Service();
        [XmlIgnore]
        public static SASRA_Sectors.SASRA_Sectors_Service sASRA_Sectors_Service = new SASRA_Sectors.SASRA_Sectors_Service(); [XmlIgnore]
        public static MobileLoanTopup.MobileLoanTopup_Service MobileLoanTopup_Service = new MobileLoanTopup.MobileLoanTopup_Service ();



        [XmlIgnore]
        public int Entry;
        [DataMember]
        public string Account_No = string.Empty;
        [DataMember]
        public string Account_Name;
        [DataMember]
        public string Document_No = string.Empty;
        [DataMember]
        public System.DateTime Document_Date = DateTime.Now.Date;
        [DataMember(EmitDefaultValue = true)]
        public System.DateTime Transaction_Time = DateTime.Now;
        [DataMember]
        public int Transaction_Type = -1;
        [DataMember]
        public string Telephone_Number = string.Empty;
        [DataMember]
        public string Account_2 = string.Empty;
        [XmlIgnore]
        public Transactions.Status Status = Transactions.Status.Pending;
        [DataMember]
        public int Loan_Period = 0;
        [DataMember]
        public string Comments;
        [DataMember]
        public bool Self_Guarantee;
        [DataMember]
        public decimal Amount = 0;
        [DataMember]
        public decimal Charge = 0;
        [DataMember]
        public decimal Account_Balance = 0;
        [DataMember]
        public string Description = string.Empty;
        [XmlIgnore]
        public string Client;
        [DataMember]
        public List<Ministatement> Mini = null;
        [DataMember]
        public decimal AccountBalance = 0;
        [DataMember]
        public string Fosa_Account = String.Empty;
        [DataMember]
        public  string Member_No;
        [DataMember]
        public List<Loans.Loans_mobile> LoanBalances = null;
        [DataMember]
        public List<loan> LoanStatus = null;
        [DataMember]
        public List<Members.deposits> sharedepositbalance;
        [DataMember]
        public int statement_size = 5;
        [DataMember]
        public string Loan_No;
        [DataMember]
        public Transactions.Loan_Type loantype;
        [DataMember]
        public Source source;
        [DataMember]
        public bool Dont_Charge;
        [DataMember]
        public Destination destination;
        [DataMember]
        public Bank_Transfer_type Bank_transfer_type { get; set; }
        [DataMember]
        public string Receipt_No { get; set; }
        [DataMember] 
        public decimal Loan_Balance;
        [DataMember] 
        public string Sector;
        [DataMember] 
        public string Product_ID;
        [DataMember]
        public string Get_charge;
        [DataMember]
        public  Transactions.Channel channel { get; set; }
        [DataMember]
        public decimal Boostamount = 0;
        [DataMember]
       public List<MobileLoanTopup.MobileLoanTopup> MobileLoanTopups { get; set; }
        public Trans()
        { }
      
        public enum Trans_Type
        {
            _blank_ = 0,
            Withdrawal = 1,
            Deposit = 2,
            Balance = 3,
            Ministatement = 4,
            Airtime = 5,
            Loan_balance = 6,
            Loan_Status = 7,
            Share_Deposit_Balance = 8,
            Transfer_to_Fosa = 9,
            Bank_Transfer = 10,
            Utility_Payment = 11,
            Loan_Application = 12,
            Standing_orders = 13,
            Reversal = 14,
            Loan_Repayment = 15,
            Share_Contribution = 16,
            Stop_Atm = 17,
            Confirm = 18,
            Billconfirmation = 19,
            Airtime_Confirmation = 20,
            Lump_sump =21,
            Bank_Transfer_Confirmation =22,
        }
        public static void CreateXML(Object YourClassObject)
        {
            XmlDocument xmlDoc = new XmlDocument();
            try
            {
                //Represents an XML document, 
                // Initializes a new instance of the XmlDocument class.          
                XmlSerializer xmlSerializer = new XmlSerializer(YourClassObject.GetType());
                // Creates a stream whose backing store is memory. 
                using (MemoryStream xmlStream = new MemoryStream())
                {
                    xmlSerializer.Serialize(xmlStream, YourClassObject);
                    xmlStream.Position = 0;
                    //Loads the XML document from the specified string.
                    xmlDoc.Load(xmlStream);
                }
                Logging.Logging.LogEntryOnFile(xmlDoc.InnerXml);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }

        }
        public static Trans Create(Trans t)
        {
            Logging.Logging.LogEntryOnFile(String.Format("{0}>>>{1}", DateTime.Now.ToString(),t.Document_No));
            CreateXML(t);
            Transactions.Transactions[] trs = null;
            Transactions.Transactions tr = null;
            if (t.Get_charge == "1")
            {
                switch ((Trans_Type)t.Transaction_Type)
                {
                    case Trans_Type.Withdrawal:
                            t.Charge = Tcharges(Trans_Type.Confirm, t.Amount,t.Account_No,(t.Account_2??""),t.source,t.Bank_transfer_type,t.channel);
                        break;
                    case Trans_Type.Utility_Payment:
                        t.Charge = Tcharges(Trans_Type.Billconfirmation, t.Amount, t.Account_No, (t.Account_2 ?? ""), t.source, t.Bank_transfer_type, t.channel);
                        break;
                    case Trans_Type.Airtime:
                        t.Charge = Tcharges(Trans_Type.Airtime_Confirmation, t.Amount, t.Account_No, (t.Account_2 ?? ""), t.source, t.Bank_transfer_type, t.channel);
                        break;
                    case Trans_Type.Bank_Transfer:
                        t.Charge = Tcharges(Trans_Type.Bank_Transfer_Confirmation, t.Amount, t.Account_No, (t.Account_2 ?? ""), t.source, t.Bank_transfer_type, t.channel);
                        break;
                    default:
                        t.Charge = Tcharges((Trans_Type)t.Transaction_Type, t.Amount, t.Account_No, (t.Account_2 ?? ""), t.source, t.Bank_transfer_type, t.channel);
                        break;
                }

                return t;
            }
            try
            {
                if ((Trans_Type)t.Transaction_Type == Trans_Type._blank_)
                {
                    t.code = 9;
                    return t;
                }
                            
                if (t.Transaction_Type == 18 || t.Transaction_Type == 19 || t.Transaction_Type == 20|| t.Transaction_Type == 22)
                {
                    var doc = t.Document_No;
                    t.Document_No = t.Receipt_No;
                    t.Receipt_No = doc;
                }
                switch ((Trans_Type)t.Transaction_Type)
                {
                    case Trans_Type.Confirm:
                    case Trans_Type.Share_Deposit_Balance:
                    case Trans_Type.Loan_balance:
                    case Trans_Type.Billconfirmation:
                    case Trans_Type.Airtime_Confirmation:
                    case Trans_Type.Bank_Transfer_Confirmation:

                        break;
                    default:
                        var p = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = "Pending", Field = Transactions_Fields.Status }, new Transactions_Filter { Criteria = t.Transaction_Type.ToString(), Field = Transactions_Fields.Transaction_Type }, new Transactions_Filter { Criteria = t.Account_No.ToString(), Field = Transactions_Fields.Account_No } }, null, 1);
                        if (p.Count() != 0)
                        {
                            t.code = 22;
                            return t;
                        }
                        break;
                }
                //Logging.Logging.LogEntryOnFile(String.Format("{0} Get Pending {1}", DateTime.Now.ToString(), t.Document_No));
                trs = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Completed|Pending", Field = Transactions_Fields.Status }, new Transactions_Filter { Criteria = t.Transaction_Type.ToString(), Field = Transactions_Fields.Transaction_Type } }, null, 1);

                //Logging.Logging.LogEntryOnFile(String.Format("{0} Got Pending {1}", DateTime.Now.ToString(), t.Document_No));
                if (trs.Count() == 0)
                {
                    tr = new Transactions.Transactions();
                    tr.Account_No = t.Account_No;
                    tr.Account_Name = t.Account_Name;
                    tr.Document_No = t.Document_No;
                    tr.Document_Date = t.Document_Date;
                    tr.Document_DateSpecified = true;
                    tr.Loan_Period = t.Loan_Period;
                    tr.Loan_PeriodSpecified = true;
                    tr.Date_PostedSpecified = true;
                    t.Transaction_Time = DateTime.Now;
                    tr.Transaction_Time = t.Transaction_Time;
                    tr.Self_Guarantee = t.Self_Guarantee;
                    tr.Self_GuaranteeSpecified = true;
                    tr.Transaction_TimeSpecified = true;
                    tr.Transaction_Type = (Transaction_Type)t.Transaction_Type;
                    tr.Transaction_TypeSpecified = true;
                    tr.Telephone_Number = t.Telephone_Number;
                    tr.Account_2 = t.Account_2;
                    tr.Loan_No = t.Loan_No;
                    tr.Amount = t.Amount;
                    tr.AmountSpecified = true;
                    tr.Charge = t.Charge;
                    tr.ChargeSpecified = true;
                    tr.Sector = t.Sector;
                    tr.Product_Id = t.Product_ID;
                    tr.Description = t.Description;// (t.Description == string.Empty ? tr.Transaction_Type.ToString() : tr.Description);
                    tr.Client = t.Client;
                    tr.Status = Status.Completed;
                    // tr.Status = t.Status;
                    tr.StatusSpecified = true;
                    tr.Source = t.source;
                    tr.SourceSpecified = true;
                    tr.Destination = t.destination;
                    tr.DestinationSpecified = true;
                    tr.Comments = t.Comments;
                    tr.Loan_Type = t.loantype;
                    tr.Loan_TypeSpecified = true;
                    tr.Receipt_No = t.Receipt_No;
                    tr.Channel = t.channel;
                    tr.ChannelSpecified = true;
                    tr.Dont_Charge = t.Dont_Charge;
                    tr.Dont_ChargeSpecified = true;
                    tr.Bank_Transfer_type = t.Bank_transfer_type;
                    tr.Bank_Transfer_typeSpecified = true;
                    tr.Boost_Amount = t.Boostamount;
                    tr.Boost_AmountSpecified = true;
                     trservice.Create(ref tr);
                    t.AccountBalance = tr.Account_Balance;
                    t.Fosa_Account = tr.Fosa_Account;
                    t.Member_No = tr.Member_No;
                    t.code = 0;
                    //Logging.Logging.LogEntryOnFile(String.Format("Topups {0}", t.MobileLoanTopups.Count()));
                    if (t.MobileLoanTopups!=null)
                    if (t.MobileLoanTopups.Count() > 0)
                    {
                        foreach (var topup in t.MobileLoanTopups)
                        {
                            MobileLoanTopup.MobileLoanTopup topups = new MobileLoanTopup.MobileLoanTopup();
                            topups.Document_No = t.Document_No;
                            topups.Loan_No = topup.Loan_No;
                            topups.Amount_to_Topup = topup.Amount_to_Topup;
                            topups.Amount_to_TopupSpecified = true;
                            MobileLoanTopup_Service.Create(ref topups);
                        }
                     }

                    if (tr.Status != Status.Failed)
                    { 
                    checkparameters(ref t);
                    if (t.code != 0)
                        return t;
                    validateaccount(ref t);
                    if (t.code != 0)
                        return t;

                    switch ((Trans_Type)t.Transaction_Type)
                    {
                        case Trans_Type.Ministatement:
                            Ministatement(ref t);
                            break;
                        case Trans_Type.Loan_balance:

                            loan.LoanBalance(ref t);
                            //if (t.LoanBalances.Count() == 0)
                            //  t.code = 13;
                            break;
                        case Trans_Type.Balance:
                            t.AccountBalance = s_mobile.Balance(t.Account_No);
                            break;
                        case Trans_Type.Share_Deposit_Balance:
                            t.sharedepositbalance = new Members().depositbalance(t.Account_No);
                            break;
                        case Trans_Type.Loan_Status:
                            loan.Loanstatus(ref t);
                            if (t.LoanStatus.Count() == 0)
                                t.code = 13;
                            break;
                        case Trans_Type.Loan_Application:
                            try
                            {
                                // var amount = s_mobile.LoanEligibility(t.Telephone_Number, (int)t.loantype);

                                //if (amount < t.Amount)
                                //  t.code = 19;
                            }
                            catch (Exception ex)
                            {
                                t.code = Convert.ToInt32(ex.Message);
                            }
                            break;
                    }
                }
                    else
                    {
                        t.code = -2;
                        t.error_Desc = tr.Comments;
                    }
                }
                else
                {
                    t.code = 10;

                }
                //        break;

                //}
            }
            catch (Exception ex)
            {
                t.code = -1;
                t.error_Desc = "Unspecified error";
                Logging.Logging.ReportError(ex);
            }
            finally
            {
                try
                {
                    if (t.code > -2)
                    {
                        t.error_Desc = GeterrorDesc(t.code);
                        if (t.code != 0)
                        {
                            if (tr != null)
                            {
                                tr.Status = Transactions.Status.Failed;
                                tr.Comments = t.error_Desc;
                                t.Status = Transactions.Status.Failed;
                                tr.StatusSpecified = true;
                            }
                        }

                        else
                        {
                            tr.Status = Status.Pending;
                            tr.StatusSpecified = true;

                        }

                        if (tr != null)
                        {

                            trservice.Update(ref tr);
                            Logging.Logging.LogEntryOnFile(tr.Bank_Transfer_type.ToString());
                            double bal = Trans.Balance(tr.Account_No);
                            decimal charge = Tcharges((Trans_Type)tr.Transaction_Type, tr.Amount, tr.Account_No, tr.Account_2 ?? "", tr.Source, tr.Bank_Transfer_type, tr.Channel);
                            t.AccountBalance = (decimal)bal;//- charge - t.Amount;
                            t.Account_Balance = (decimal)bal;

                            Logging.Logging.LogEntryOnFile(String.Format("Balance {0} - {1} - {2}", bal, charge, t.Amount));
                            // if (tr.Product_Category != Product_Category._blank_)
                            //t.AccountBalance = (decimal)Trans.Balance(tr.Account_No) ;

                            t.Loan_Balance = tr.Loan_Balance;
                            // Logging.Logging.LogEntryOnFile(String.Format("{0} End saving {1}", DateTime.Now.ToString(), t.Document_No));
                        }
                        try
                        {
                            //s_mobile.Post();
                        }
                        catch (Exception ex) { Logging.Logging.ReportError(ex); }
                    }
                }
                catch (Exception ex)
                {
                    t.code = -1;
                    t.error_Desc = "Unspecified error";
                    Logging.Logging.ReportError(ex);
                }
            }
           // Logging.Logging.LogEntryOnFile("Response");
            CreateXML(t);
            Logging.Logging.LogEntryOnFile(String.Format("{0}<<<{1}", DateTime.Now.ToString(), t.Document_No));
            return t;
        }
        private static void validateaccount(ref Trans t)
        {
            try
            {
                if (((Trans_Type)t.Transaction_Type) != Trans_Type.Deposit)
                {
                    Accounts.Accounts a = Getaccount(t.Account_No);

                    if (a == null)
                    {
                        t.code = 1;
                        return;
                    }
                    Members.member = Members.getmember(a.Member_No);
                    t.Account_Name = a.Name;
                    switch ((Trans_Type)t.Transaction_Type)
                    {
                        case Trans_Type.Deposit:
                        //case Trans_Type.Lump_sump:
                            if (a.Blocked != Accounts.Blocked.All)
                            {
                                t.code = 3;
                                return;
                            }
                            break;
                        case Trans_Type.Transfer_to_Fosa:
                            if (a.Blocked == Accounts.Blocked.All)
                            {
                                t.code = 3;
                                return;
                            }
                            if (t.source == Source.Fosa)
                            {
                                if (a.Status != Accounts.Status.Active)
                                {
                                    t.code = 2;
                                    return;
                                }
                                if (a.Blocked == Accounts.Blocked.All)
                                {
                                    t.code = 3;
                                    return;
                                }
                            }
                            break;
                        default:
                            {

                                if (a.Status != Accounts.Status.Active)
                                {
                                    t.code = 2;
                                    return;
                                }

                                if (a.Blocked != Accounts.Blocked._blank_)
                                {
                                    t.code = 3;
                                    return;
                                }
                                break;
                            }
                    }
                    //Logging.Logging.LogEntryOnFile(t.Transaction_Type.ToString());
                    //if (a.S_Mobile_No.Replace("+", "") != t.Telephone_Number.Replace("+", ""))
                    //{
                    //    t.code = 5;
                    //    return;
                    //}
                    switch ((Trans_Type)t.Transaction_Type)
                    {
                        case Trans_Type.Loan_Application:
                           
                        case Trans_Type.Deposit:
                        case Trans_Type.Confirm:
                        case Trans_Type.Bank_Transfer_Confirmation:
                        case Trans_Type.Reversal:
                        case Trans_Type.Billconfirmation:
                        case Trans_Type.Airtime_Confirmation:
                       
                            break;
                        //case Trans_Type.Balance:
                        //case Trans_Type.Loan_balance:
                        //case Trans_Type.Share_Deposit_Balance:
                        //    if (t.channel == Channel.Ussd_503)
                        //    {
                        //        if ((Balance(t.Account_No) < (double)(t.Amount + t.Charge + Tcharges((Trans_Type)t.Transaction_Type, t.Amount, t.Account_No, t.Account_2 ?? "", t.source, t.Bank_transfer_type))))
                        //        {
                        //            t.code = 4;
                        //            return;
                        //        }
                        //    }
                        //    break;
                        case Trans_Type.Withdrawal:
                        case Trans_Type.Transfer_to_Fosa:
                            if (t.source == Source.Fosa)
                            {
                               if ((Balance(t.Account_No) < (double)(t.Amount + t.Charge + Tcharges((Trans_Type)t.Transaction_Type, t.Amount, t.Account_No, t.Account_2 ?? "", t.source, t.Bank_transfer_type, t.channel))))
                                {
                                    t.code = 4;
                                    return;
                                }
                            }
                            break;
                        default:
                            {
                                if (t.source == Source.Fosa)
                                {
                                    
                                    if ((Balance(t.Fosa_Account) < (double)(t.Amount + t.Charge + Tcharges((Trans_Type)t.Transaction_Type, t.Amount, t.Account_No, t.Account_2 ?? "", t.source, t.Bank_transfer_type,t.channel))))
                                    {
                                        t.code = 4;
                                        return;
                                    }
                                }
                                break;
                            }
                    }
                    switch ((Trans_Type)t.Transaction_Type)
                    {
                        case Trans_Type.Airtime:
                        case Trans_Type.Utility_Payment:
                        case Trans_Type.Withdrawal:
                            if (t.source != Source.Fosa)
                            {
                                t.code = 17;
                                return;
                            }
                            break;
                        default:
                            {

                                break;
                            }

                    }


                    switch ((Trans_Type)t.Transaction_Type)
                    {
                        case Trans_Type.Loan_Application:
                            var acc = Trans.fosaaccounts(t.Member_No).FirstOrDefault(o=>o.Product_Category == Accounts.Product_Category.Disbursement_Account);
                            if (acc!=null)
                                if (acc.Blocked== Accounts.Blocked.All)
                                {
                                    //t.code = 3;
                                    //return ;
                                }
                            var c = new Client();
                         var   l = c.Eligibility(t.Telephone_Number, t.loantype);
                            if (t.loantype == Loan_Type.Mloan)
                            if ((l.Total_Eligible <(double) t.Amount) || (t.Amount <(decimal) l.minimum))
                            { 
                                t.code = 12;
                                return; 
                            }
                            if (t.loantype == Loan_Type.Dividend)
                                if ((l.eligible_amount < (double)t.Amount) || (t.Amount < (decimal)l.minimum))
                                {
                                    t.code = 12;
                                    return;
                                }

                            if (t.loantype== Loan_Type.Other)
                            {
                                if (t.Product_ID == "")
                                {

                                    t.code = 26;
                                    return;
                                }


                            }
                            break;
                        case Trans_Type.Loan_Repayment:
                            try
                            {
                                if (string.IsNullOrEmpty(t.Loan_No))
                                { t.code = 16; return; }
                            }
                            catch (Exception ex)
                            {
                                Logging.Logging.ReportError(ex);
                            }
                            break;
                        case Trans_Type.Withdrawal:
                            try
                            {   
                                var mc =   mobile_charges.ReadMultiple(new Mobile_Charges.Mobile_Charges_Filter[] { new Mobile_Charges.Mobile_Charges_Filter { Criteria = "Withdrawal Confirm", Field = Mobile_Charges.Mobile_Charges_Fields.Transaction_Type } }, null, 0).FirstOrDefault();
                                   if (mc!=null)
                                    if (mc.Max_Daily_limit >0)
                                if (Dailyamount(t.Account_No, "Confirm".ToString()) > mc.Max_Daily_limit)
                                {
                                    t.code = 11;
                                    return;
                                }

                                if (mc != null)
                                    if (t.Amount > mc.Max_Trans_Limit)
                                {
                                    t.code = 12;
                                    return;
                                }
                            }
                            catch (Exception ex) { Logging.Logging.ReportError(ex); }
                            break;
                        case Trans_Type.Bank_Transfer:
                            var mcc = mobile_charges.ReadMultiple(new Mobile_Charges.Mobile_Charges_Filter[] { new Mobile_Charges.Mobile_Charges_Filter { Criteria = "Bank Transfer Confirmation", Field = Mobile_Charges.Mobile_Charges_Fields.Transaction_Type }, new Mobile_Charges.Mobile_Charges_Filter { Criteria = t.Bank_transfer_type.ToString(), Field = Mobile_Charges.Mobile_Charges_Fields.Bank_Transfer_type } }, null, 0).FirstOrDefault();
                            if (mcc != null)
                                if (mcc.Max_Daily_limit > 0)
                                    if (Dailyamount(t.Account_No, "Bank Transfer Confirmation".ToString()) > mcc.Max_Daily_limit)
                                    {
                                        t.code = 11;
                                        return;
                                    }

                            if (mcc != null)
                                if (t.Amount > mcc.Max_Trans_Limit)
                                {
                                    t.code = 12;
                                    return;
                                }
                            break;
                        case Trans_Type.Share_Deposit_Balance:
                            if (Members.member == null)
                            {
                                t.code = 13;
                                return;
                            }
                            break;
                    }
                }
            }
            catch (Exception ex)
            {
                t.code = -1;
                Logging.Logging.ReportError(ex);
            }
        }
        private static decimal Dailyamount(string account_No, string t)
        {
            decimal limit = 0;
            try
            {
                var l = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = account_No, Field = Transactions_Fields.Account_No }, new Transactions_Filter { Criteria = "<>Failed", Field = Transactions_Fields.Status }, new Transactions_Filter { Criteria = t, Field = Transactions_Fields.Transaction_Type } }, null, 0);
            
                    limit = l.Where(o=> o.Document_Date == DateTime.Now.Date) .Sum(o => o.Amount);


            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return limit;
        }
        private static string parsedate()
        {
            string inputString = "15-08-2015";
            string format = string.Empty;
            DateTime dDate;

            if (DateTime.TryParse(inputString, out dDate))
            {
                format = "dd/MM/yyyy";
            }
            else
            {
                format = "MM/dd/yyyy";
            }

            return format;
        }
        private static void checkparameters(ref Trans t)
        {
            if (t.Document_No == string.Empty)
            {
                t.code = 6;
                return;
            }
            if (t.channel == Channel._blank_)
            {
                t.code = 25;
                return;
            }
            if (t.Telephone_Number == string.Empty)
            {
                t.code = 7;
                return;
            }
            if (t.Account_No == string.Empty)
            {
                t.code = 8;
                return;
            }
            if ((Trans_Type)t.Transaction_Type == Trans_Type._blank_)
            {
                t.code = 9;
                return;
            }

            switch ((Trans_Type)t.Transaction_Type)
            {
                case Trans_Type.Reversal:
                    var trs = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Completed|Pending", Field = Transactions_Fields.Status }, new Transactions_Filter { Criteria = "<>Reversal", Field = Transactions_Fields.Transaction_Type } }, null, 1);
                    if (trs == null)
                    {
                        t.code = 15;
                        return;

                    }
                    break;
                case Trans_Type.Transfer_to_Fosa:
                    switch (t.destination)
                    {
                        case Destination.Fosa:
                            if (string.IsNullOrEmpty(t.Account_2))
                            {
                                t.code = 8;
                                return;
                            }
                            if (t.Account_No.Equals(t.Account_2))
                            {
                                if (t.source == Source.Fosa)
                                {
                                    t.code = 24;
                                    return;
                                }
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                case Trans_Type.Confirm:

                    if (string.IsNullOrEmpty(t.Receipt_No))
                    {
                        t.code = 20;
                        return;
                    }
                    var w = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Withdrawal Request", Field = Transactions_Fields.Transaction_Type } }, null, 1);

                    if (w == null)
                    {
                        t.code = 21;
                        return;
                    }
                    break;

                case Trans_Type.Bank_Transfer_Confirmation:

                    if (string.IsNullOrEmpty(t.Receipt_No))
                    {
                        t.code = 20;
                        return;
                    }
                    var ww = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Bank Transfer", Field = Transactions_Fields.Transaction_Type } }, null, 1);

                    if (ww == null)
                    {
                        t.code = 21;
                        return;
                    }
                    if (t.Bank_transfer_type == Bank_Transfer_type._blank_)
                    {
                     t.code = 26;
                        return;
                    }
                    break;

                case Trans_Type.Bank_Transfer:
                    if (t.Bank_transfer_type == Bank_Transfer_type._blank_)
                    {
                     t.code = 26;
                        return;
                    }
                    break;

                case Trans_Type.Billconfirmation:
                    if (string.IsNullOrEmpty(t.Receipt_No))
                    {
                        t.code = 20;
                        return;
                    }
                    w = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Bill Confirmation", Field = Transactions_Fields.Transaction_Type } }, null, 1);

                    if (w == null)
                    {
                        t.code = 21;
                        return;
                    }
                    break;
                case Trans_Type.Airtime_Confirmation:


                    if (string.IsNullOrEmpty(t.Receipt_No))
                    {
                        t.code = 20;
                        return;
                    }
                    w = trservice.ReadMultiple(new Transactions_Filter[] { new Transactions_Filter { Criteria = t.Document_No, Field = Transactions_Fields.Document_No }, new Transactions_Filter { Criteria = "Airtime Confirmation", Field = Transactions_Fields.Transaction_Type } }, null, 1);

                    if (w == null)
                    {
                        t.code = 21;
                        return;
                    }
                    break;
                case Trans_Type.Ministatement:


                    if (t.Account_No.Equals(t.Account_2))
                    {
                        t.code = 24;
                        return;
                    }

                    break;
            }

        }
        public static Accounts.Accounts Getaccount(string account_No)
        {
            Accounts.Accounts acc = null;
            try
            {
                acc = Accservice.Read(account_No);
                if (acc != null)
                    if (acc.Blocked == Accounts.Blocked.All)
                        acc = null;
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        public static List<Accounts.Accounts> Getaccounts(string tel)
        {
            Logging.Logging.LogEntryOnFile(Accservice.Url);
            List<Accounts.Accounts> acc = new List<Accounts.Accounts>();
            try
            {
                var aa = Applications.appservice.ReadMultiple(new S_Applications.Applications_Filter[] { new S_Applications.Applications_Filter { Criteria = tel, Field = S_Applications.Applications_Fields.MPESA_Mobile_No } }, null, 0);//, new S_Applications.Applications_Filter { Criteria = "Approved", Field = S_Applications.Applications_Fields.Status }

                acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = tel, Field = Accounts.Accounts_Fields.MPESA_Mobile_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked }, new Accounts.Accounts_Filter { Criteria = "Active|Rejoined", Field = Accounts.Accounts_Fields.Status } }, null, 1000).ToList();
                if (acc.Count() > 0)
                    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = acc[0].Member_No, Field = Accounts.Accounts_Fields.Member_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();
              

                //if (acc.Count() == 0)
                //    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = tel, Field = Accounts.Accounts_Fields.Phone_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();

            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        
        public static List<Accounts.Accounts> fosaaccounts(string memberno)
        {
            Logging.Logging.LogEntryOnFile(Accservice.Url);
            List<Accounts.Accounts> acc = new List<Accounts.Accounts>();
            try
            {               
                    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = memberno, Field = Accounts.Accounts_Fields.Member_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();
              

                //if (acc.Count() == 0)
                //    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = tel, Field = Accounts.Accounts_Fields.Phone_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();

            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        public static Account Getaccounts2(string tel)
        {
            Logging.Logging.LogEntryOnFile(Accservice.Url);
            Account acc = new Account();
            try
            {
                var aa = Applications.appservice.ReadMultiple(new S_Applications.Applications_Filter[] { new S_Applications.Applications_Filter { Criteria = tel, Field = S_Applications.Applications_Fields.MPESA_Mobile_No } }, null, 0);//, new S_Applications.Applications_Filter { Criteria = "Approved", Field = S_Applications.Applications_Fields.Status }
                acc.Mobile_Registered = aa.Count() > 0;


                List<Accounts.Accounts> aaa = new List<Accounts.Accounts>();
                aaa = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = tel, Field = Accounts.Accounts_Fields.MPESA_Mobile_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();
                //, new Accounts.Accounts_Filter { Criteria = "Active", Field = Accounts.Accounts_Fields.Status }
                if (aaa.Count() > 0)
                    aaa = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = aaa[0].Member_No, Field = Accounts.Accounts_Fields.Member_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();

                acc.Accounts = aaa.ToArray();
                //if (acc.Count() == 0)
                //    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = tel, Field = Accounts.Accounts_Fields.Phone_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();

            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        public static List<Accounts.Accounts> Getaccountsbyid(string id)
        {
            List<Accounts.Accounts> acc = new List<Accounts.Accounts>();
            try
            {
                acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = id, Field = Accounts.Accounts_Fields.ID_No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        public static List<Accounts.Accounts> Getchilda(string no)
        {
            List<Accounts.Accounts> acc = new List<Accounts.Accounts>();
            try
            {
                var ac = Accservice.Read(no);
                if (ac != null)
                    if (ac.Blocked ==  Accounts.Blocked.All)
                        ac = null;
                if (ac != null)
                    acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = ac.ID_No, Field = Accounts.Accounts_Fields.ID_No }, new Accounts.Accounts_Filter { Criteria = "CHILDA", Field = Accounts.Accounts_Fields.Product_Type } }, null, 1000).ToList();
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        public static List<Accounts.Accounts> Getmemberaccounts(string memberno)
        {
            List<Accounts.Accounts> acc = new List<Accounts.Accounts>();
            try
            {
                acc = Accservice.ReadMultiple(new Accounts.Accounts_Filter[] { new Accounts.Accounts_Filter { Criteria = memberno, Field = Accounts.Accounts_Fields.No }, new Accounts.Accounts_Filter { Criteria = " ", Field = Accounts.Accounts_Fields.Blocked } }, null, 1000).ToList();
            }
            catch (Exception ex) { Logging.Logging.ReportError(ex); }
            return acc;
        }
        private static string GeterrorDesc(int code)
        {
            string err = string.Empty;
            try
            {
                err = s_mobile.GetErrorCode(code);
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return err;
        }

        private static decimal Tcharges(Trans_Type transaction_Type, decimal amount,string account1,string account2,Transactions.Source source,Bank_Transfer_type bank_Transfer_Type, Channel channel)
        {
            return s_mobile.Charge((int)transaction_Type, amount,account1,account2,(int)source,(int)bank_Transfer_Type,(int) channel);

        }
        public static double Balance(string account)
        {
            double bal = 0;
            try
            {
                bal = (double)s_mobile.Balance(account);
              
            }
            catch (Exception ex)
            {
                Logging.Logging.ReportError(ex);
            }
            return bal;
        }
        public static void Ministatement(ref Trans t)
        {
            List<Ministatement> mini = new List<Ministatement>();
            try
            {
                var min = Accentriesservice.ReadMultiple(new Statement.Account_Entries_Filter[] { new Statement.Account_Entries_Filter { Criteria = t.Account_No, Field = Statement.Account_Entries_Fields.Customer_No } }, null, t.statement_size).ToList();


                foreach (var m in min)
                {
                    var nmin = new Ministatement();
                    nmin.amount = (double)m.Amount;
                    nmin.desc = m.Description;
                    nmin.posting_Date = m.Posting_Date;
                    nmin.balance =(double) m.Balance;
                    mini.Add(nmin);
                }
                t.Mini = mini;
            }
            catch (Exception ex)
            {
                t.code = -1;
                Logging.Logging.ReportError(ex);
            }
        }
    }
}
