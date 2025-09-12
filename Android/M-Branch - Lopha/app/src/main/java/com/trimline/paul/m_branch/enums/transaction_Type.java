package com.trimline.paul.m_branch.enums;

public enum transaction_Type {

    Issue_To_Teller(0,"Issue To Teller"),

    /// <remarks/>
    Return_To_Treasury(1,"Return To Treasury"),

    /// <remarks/>
    Issue_From_Bank(2,"Issue To Bank"),

    /// <remarks/>
    Return_To_Bank(3,"Return to Bank"),

    /// <remarks/>
    Inter_Teller_Transfers(4,"Transfer to Teller"),

    /// <remarks/>
    Branch_Manager_Transactions(5,"Branch Manager Transfer"),

    /// <remarks/>
    End_of_Day_Return_Cash(6,"End of Day");





    private final String displayName;

    transaction_Type(String displayName) {
        this.displayName = displayName;
    }
    transaction_Type(int n,String displayName) {
        this.displayName = displayName;
    }

    public String getDisplayName() {
        return displayName;
    }
}
