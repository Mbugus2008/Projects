package com.trimline.paul.metro;

import java.util.Date;

public class Parcel {
    public String Key ;
    public String Receipt_No ;
    public String To ;
    public String Sender_Name ;
    public String Sender_Phone ;
    public String To_Name ;
    public String To_Phone ;
    public String Description ;
    public Date Date_Created ;
    public Date Time_Created ;
    public Status Status ;
    public String Created_By ;
    public Date Date_time_Dispatched ;
    public String Dispatched_By ;
    public String Collected_by ;
    public String Collectors_Id ;
    public Date Date_time_Received ;
    public String Received_By ;
    public enum Status {

        /// <remarks/>
        Pending,

        /// <remarks/>
        Dispatched,

        /// <remarks/>
        InTransit,

        /// <remarks/>
        Received,

        /// <remarks/>
        Collected,
    }
}
