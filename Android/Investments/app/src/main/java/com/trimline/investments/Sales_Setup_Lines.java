package com.trimline.investments;

import android.os.Parcelable;

import java.io.Serializable;

public class Sales_Setup_Lines implements Serializable {

    public String Key ;
    public String Asset_Code ;
    public String Asset_Name ;
    @Override
    public String toString() {
        return String.format("%s", this.Asset_Code) ;
    }

    public Double Minimum_Selling_Price ;
    public Boolean Minimum_Selling_PriceSpecified ;
    public Boolean Available ;
    public Boolean AvailableSpecified ;
    public int Leads ;
    public Boolean LeadsSpecified ;
    public Boolean Sold ;
    public Boolean SoldSpecified ;
    public Boolean Leads_Notified ;
    public Boolean Leads_NotifiedSpecified ;
    public properties.Investment_Types Investment_Type ;
    public Boolean Investment_TypeSpecified ;
    public int Bedrooms ;
    public Boolean BedroomsSpecified ;
    public int Bathrooms ;
    public Boolean BathroomsSpecified ;
    public Boolean Published ;
    public Boolean PublishedSpecified ;
   public String Plot_No;

}
