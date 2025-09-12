package com.trimline.investments;

public class Account_details {
    public String Key ;
    public java.util.Date Posting_Date ;
   public String Document_No ;
    public float Amount ;
    public float Amount_LCY ;
    public String Vendor_No ;
    public String Reason_Code ;
    public float Debit_Amount ;
    public float Credit_Amount ;
    public int Transaction_Type ;
    public String Loan_No ;

    public enum Transaction_Types {
        /// <remarks/>
        General,

        /// <remarks/>
        Cash_Deposit,

        /// <remarks/>
        Cash_Withdrawal,

        /// <remarks/>
        ATM,

        /// <remarks/>
        Loan_Disbursal,

        /// <remarks/>
        Interest_Due,

        /// <remarks/>
        Interest_Paid,

        /// <remarks/>
        Principle_Paid,

        /// <remarks/>
        Mobile_Dep,

        /// <remarks/>
        Mobile_Wit,

        /// <remarks/>
        Acc_Transfer,

        /// <remarks/>
        Cheque_Deposit,

        /// <remarks/>
        Bankers_Cheque,

        /// <remarks/>
        Standing_Order,

        /// <remarks/>
        Fixed_Deposit,

        /// <remarks/>
        Salary_Pay,

        /// <remarks/>
        Checkoff_Pay,

        /// <remarks/>
        Inter_Teller,

        /// <remarks/>
        Teller_Treasury,

        /// <remarks/>
        Treasury_Teller,

        /// <remarks/>
        Held_Principle,

        /// <remarks/>
        Held_Interest,

        /// <remarks/>
        Disb_Rec,

        /// <remarks/>
        Booking,
    }
}
