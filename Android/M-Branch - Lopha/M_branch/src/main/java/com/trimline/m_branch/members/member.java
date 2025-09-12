package com.trimline.m_branch.members;

import androidx.annotation.NonNull;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.PrimaryKey;

import com.trimline.m_branch.vehicles.vehicles;

/**
 * Created by Paul on 11-Dec-16.
 */
@Entity
public class member {
    @PrimaryKey
    @NonNull
    public String No;
    public String Name;
    public String Phone_No;
    public String ID_No;
    public  int Gender;
    public String E_Mail;
    public String Group;
    public Boolean updated = false;
    public double Un_allocated_Funds;
    public double Loan_Balances;
    public double Repayment;
    public double Outstanding_Penalty;
    public double Operation_Cost;
    @Ignore
    public  com.trimline.m_branch.vehicles.vehicles[] vehicles ;

    public double Loan_Arrears;
    public double dailyrepayment;
    public double Savings;
    public double Xmas;
    public String Last_update_savings;
    public String Last_update_xmas;
    public String Last_update_Loan;
    public String Key;
    public double Deposit ;
    /// <remarks/>
    public double Welfare;
}
