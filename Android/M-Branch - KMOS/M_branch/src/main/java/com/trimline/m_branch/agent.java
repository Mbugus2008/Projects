package com.trimline.m_branch;

import androidx.annotation.NonNull;
import androidx.room.Entity;
import androidx.room.PrimaryKey;

/**
 * Created by Paul on 11-Dec-16.
 */
@Entity
public class agent {
    @PrimaryKey
    @NonNull
    public  String Agent_Code;
    public String Customer_ID_No;
    public String Mobile_No;
    public int Status;
    public String Name;
    public String Account;
    public String Password;
    public String Constituency;
    public int Account_type;
    public double Account_Balance;

}
