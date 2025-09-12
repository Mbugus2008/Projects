package com.trimline.pawdep;

import com.google.gson.annotations.SerializedName;

public class enums {
    public enum Transaction_Type {

        /// <remarks/>
        @SerializedName("0")
        _blank_,

        /// <remarks/>
        @SerializedName("1")
        Loan,

        /// <remarks/>
        @SerializedName("2")
        Repayment,

        /// <remarks/>
        @SerializedName("3")
        Member_Deposit,

        /// <remarks/>
        @SerializedName("4")
        Share_Capital,

        /// <remarks/>
        @SerializedName("5")
        Benevolent_Fund,

        /// <remarks/>
        @SerializedName("6")
        Application_Fee,

        /// <remarks/>
        @SerializedName("7")
        Interest_Due,

        /// <remarks/>
        @SerializedName("8")
        Interest_Paid,

        /// <remarks/>
        @SerializedName("9")
        Chattel,

        /// <remarks/>
        @SerializedName("10")
        Assessment_Fee,

        /// <remarks/>
        @SerializedName("11")
        Pass_Book,

        /// <remarks/>
        @SerializedName("12")
        Fines,

        /// <remarks/>
        @SerializedName("13")
        Processing_Fee,

        /// <remarks/>
        @SerializedName("14")
        Registration_Fee,

        /// <remarks/>
        @SerializedName("15")
        Risk_Fund,

        /// <remarks/>
        @SerializedName("16")
        Penalty,

        /// <remarks/>
        @SerializedName("17")
        Group_Savings,

        /// <remarks/>
        @SerializedName("18")
        Individual_Savings,

        /// <remarks/>
        @SerializedName("19")
        Prepaid_Savings,

        /// <remarks/>
        @SerializedName("20")
        Transfer_Fee,

        /// <remarks/>
        @SerializedName("21")
        Forms,

        /// <remarks/>
        @SerializedName("22")
        Hall_Fee,
    }
}
