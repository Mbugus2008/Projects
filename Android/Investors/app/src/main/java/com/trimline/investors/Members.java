package com.trimline.investors;

import android.app.Application;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;

import java.util.Date;
import java.util.List;

public class Members {
    public String Key ;
    public String No ;
    public String Name ;
    public String Phone_No ;
    public String ID_No ;
    public Gender Gender ;
    public String E_Mail ;
    public Status Status ;
    public double Outstanding_Penalty ;
    public double Loan_Arrears ;
    public double dailyrepayment ;
    public double Savings ;
    public double Xmas ;
    public Date Last_update_savings ;
    public Date Last_update_xmas ;
    public Date Last_update_Loan ;
    public Date Last_Date_Modified ;
    public String Password ;
    /// <remarks/>
    public Boolean Password_Changed ;
    public double Todays_Total ;
    public int Total_vehicles ;
    public double loans_Todays_Total;
    public int Total_loans ;
    public List<Vehicle> vehicles ;
    public Statistics statistics;

    public List<Loans> loans;
    public enum Gender {

        /// <remarks/>
        Male,

        /// <remarks/>
        Female,
    }


    public enum Status {

        /// <remarks/>
        Active,

        /// <remarks/>
        Dormant,
    }
    public static class Model extends AndroidViewModel {


        public Members member;

        public Model(@NonNull Application application) {
            super(application);
            member = Login.member;
        }


    }

}
