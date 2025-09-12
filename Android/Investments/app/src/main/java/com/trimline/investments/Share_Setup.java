package com.trimline.investments;

import java.io.Serializable;

public class Share_Setup implements Serializable {
    public String Key ;
    public String Document_No ;
    public String Description ;
    public String Account_Type ;
    public java.util.Date Start_Date ;
    public Boolean Start_DateSpecified ;
    public java.util.Date End_Date ;
    public Boolean End_DateSpecified ;
    public float Base_Price ;
    public Boolean Base_PriceSpecified ;
    public Boolean Published ;
    public Boolean PublishedSpecified ;
    public Status Status;
    public Boolean StatusSpecified ;
    public String Charges ;
    public String Clearing_Account ;
    public String Holding_Account ;
    public float Total_Value_On_Market ;
    public Boolean Total_Value_On_MarketSpecified ;
    public float Shares_On_Market ;
    public Boolean Shares_On_MarketSpecified ;
    public float Reserve_Price ;
    public Boolean Reserve_PriceSpecified ;
    public String Share_Life ;
    public On_No_Bid On_No_Bid ;
    public Boolean On_No_BidSpecified ;
@Override
public  String toString(){return  this.Description;}
    public enum Status {

        /// <remarks/>
        New,

        /// <remarks/>
        Published,

        /// <remarks/>
        Retired,
    }
    public enum On_No_Bid {

        /// <remarks/>
        Extend,

        /// <remarks/>
        Reverse,
    }
}
