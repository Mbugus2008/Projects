package com.trimline.investments;

public class Contact {
    public String Key ;
    public String Appliccation_No ;
    public String First_Name ;
    public String Middle_Name ;
    public String Last_Name ;
    public String Address ;
    public String National_ID_No ;
    public String Passport_No ;
    public members.Gender Gender ;
    public Boolean GenderSpecified ;
    public String Address_2 ;
    public String City ;
    public String Nationality ;
    public String County ;
    public String Sub_County ;
    public String Relationship_Officer ;
    public String Officer_Name ;
    public String Mobile_Phone_No ;
    public String E_Mail_Address ;
    public java.util.Date Date_of_Birth ;
    public Boolean Date_of_BirthSpecified ;
    public String Place_of_Birth ;
    public Boolean Disabled ;
    public Boolean DisabledSpecified ;
    public String Disability_Description ;
    public String Member_Category ;
    public String Introduced_By ;
    public String Customer_ID ;
    public Boolean Sacco_Member ;
    public Boolean Sacco_MemberSpecified ;
    public int Status ;
    public Boolean StatusSpecified ;
    public String Pass ;
    public String Confirm_Pass;
    public String Occupation;
    public enum Type {

        /// <remarks/>
        Company,

        /// <remarks/>
        Person,
    }

    /// <remarks/>
   public enum Correspondence_Type {

        /// <remarks/>
        _blank_,

        /// <remarks/>
        Hard_Copy,

        /// <remarks/>
        Email,

        /// <remarks/>
        Fax,
    }

}
