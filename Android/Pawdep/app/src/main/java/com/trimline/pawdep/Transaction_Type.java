package com.trimline.pawdep;

public enum Transaction_Type {

    _blank_("Select",0),

    /// <remarks/>
    Loan("Loan",1),

    /// <remarks/>
    Repayment("Repayment",2),

    /// <remarks/>
    Member_Deposit("Member Deposit",3),

    /// <remarks/>
    Share_Capital("Share_Capital",4),

    /// <remarks/>
    Benevolent_Fund("Benevolent Fund",5),

    /// <remarks/>
    Application_Fee("Application Fee",6),

    /// <remarks/>
    Interest_Due("Interest Due",7),

    /// <remarks/>
    Interest_Paid("Interest Paid",8),

    /// <remarks/>
    Chattel("Chattel",9),

    /// <remarks/>
    Assessment_Fee("Assessment Fee",10),

    /// <remarks/>
    Pass_Book("Pass Book",11),

    /// <remarks/>
    Fines("Fines",12),

    /// <remarks/>
    Processing_Fee("Processing_Fee",13),

    /// <remarks/>
    Registration_Fee("Registration Fee",14),
    /// <remarks/>
    Risk_Fund("Risk Fund",15),

    /// <remarks/>
    Penalty("Penalty",16),

    /// <remarks/>
    Group_Savings("Group Savings",17),

    /// <remarks/>
    Transfer_Fee("Transfer Fee",18),

    /// <remarks/>
    Forms("Forms",19),

    /// <remarks/>
    Hall_Fee("Hall Fee",20);
    public int code;
    private String text;

    Transaction_Type(String text, int code) {
        this.code = code;
        this.text = text;
    }
    public int getCode() {
        return code;
    }
    public String getText() {
        return text;
    }
    @Override
    public String toString() {
        // you can localise this string somehow here
        return text;
    }
}
