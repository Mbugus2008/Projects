package com.trimline.pawdep;

public   enum Loan_Status {

    /// <remarks/>
    None( "",0),

    /// <remarks/>
    Pending( "Pending",1),

    /// <remarks/>
    _x0031_st_Approval( "1st Approval",2),

    /// <remarks/>
    _x0032_nd_Approval( "2nd Approval",3),

    /// <remarks/>
    Approved( "Approved",4);
Loan_Status(){}
    private int code;
    private String text;

    public void setCode(int code) {
        this.code = code;
    }
    public void setText(String text) {
        this.text = text;
    }

    Loan_Status(String text, int code) {
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
