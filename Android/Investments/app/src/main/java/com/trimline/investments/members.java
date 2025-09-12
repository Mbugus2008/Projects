package com.trimline.investments;

import java.util.ArrayList;
import java.util.List;

public class members {
    public String Key;
    public String No;
    public String Staff_No;
    public String Name;
    public String Search_Name;
    public String First_Name;
    public String Middle_Name;
    public String Last_Name;
    public String National_ID_No;
    public String Nationality;
    public String Relationship_Officer;
    public String Officer_Name;
    public String Passport_No;
    public Gender Gender;
    public Boolean GenderSpecified;
    public String County;
    public String Sub_County;
    public java.util.Date Date_of_Birth;
    public Boolean Date_of_BirthSpecified;
    public String Place_of_Birth;
    public Boolean Disabled;
    public Boolean DisabledSpecified;
    public Boolean Dividend_Exempt;
    public Boolean Dividend_ExemptSpecified;
    public String Disability_Description;
    public Boolean Protected_Member;
    public Boolean Protected_MemberSpecified;
    public String Employer_Name;
    public String Agency_Code;
    public Member_Orientation Member_Orientation;
    public Boolean Member_OrientationSpecified;
    public Boolean SMS_Sent;
    public Boolean SMS_SentSpecified;
    public Boolean Mail_Monthly_Statement;
    public Boolean Mail_Monthly_StatementSpecified;
    public String Global_Dimension_1_Code;
    public String Global_Dimension_2_Code;
    public String Address;
    public String Address_2;
    public String Post_Code;
    public String City;
    public String Country_Region_Code;
    public String ShowMap;
    public String Primary_Contact_No;
    public String ContactName;
    public String Phone_No;
    public String SMS_Notification_Number;
    public String E_Mail;
    public String Fax_No;
    public String Home_Page;
    public String Language_Code;
    public Member_Agencies[] Member_Agencies;
    public Member_Accounts_Listpart[] Member_Accounts;

    public Member_Accounts_Listpart[] getMember_Deposits_Accounts() {


        List<Member_Accounts_Listpart> macc = new ArrayList<>();
        for (members.Member_Accounts_Listpart m : Investments.member.Member_Accounts
        ) {
            if (m.Account_Type.equals("S02"))
                macc.add(m);
        }
        Member_Accounts_Listpart mp = new Member_Accounts_Listpart();
        mp.No = "MPesa";
        mp.Name = "Mpesa";
        mp.type = 1;
        macc.add(mp);


        Member_Accounts_Listpart[] array = new Member_Accounts_Listpart[macc.size()];
        macc.toArray(array);
        return array;
    }

    public void setMember_Deposits_Accounts(Member_Accounts_Listpart[] member_Deposits_Accounts) {
        Member_Deposits_Accounts = member_Deposits_Accounts;
    }

    public Member_Accounts_Listpart[] Member_Deposits_Accounts;

    public Deposit_Account[] getDeposits_Accounts() {

        List<Deposit_Account> macc = new ArrayList<>();
        for (members.Member_Accounts_Listpart m : Investments.member.Member_Accounts
        ) {
            if (m.Share_Capital_Account) {
                {
                    Deposit_Account d = new Deposit_Account();
                    d.Account = m.No;
                    d.Description = m.Name;
                    d.Balance = Double.valueOf(m.Balance);
                    macc.add(d);
                }
            }
            if (m.Account_Type.equals("S02"))
            {
                Deposit_Account d = new Deposit_Account();
                d.Account = m.No;
                d.Description = m.Name;
                d.Balance = Double.valueOf(m.Balance);
                macc.add(d);

            }
            if (m.Account_Type.equals("L01"))
            {
                Deposit_Account d = new Deposit_Account();
                d.Account = m.No;
                d.Description = m.Name;
                d.Balance = Double.valueOf(m.Balance);
                macc.add(d);

            }

        }


        for (Projects dd : Disbursed_Loans
        ) {
            if (dd.Control_Account_Balance > 0) {

                Deposit_Account d = new Deposit_Account();
                d.Account = dd.Application_No;
                d.Description = dd.Project_Description;
                d.Balance = Double.valueOf(dd.Control_Account_Balance);
                macc.add(d);
            }
        }

        Deposit_Account[] array = new Deposit_Account[macc.size()];
        macc.toArray(array);
        return array;

    }

    public void setDeposits_Accounts(Deposit_Account[] deposits_Accounts) {
        Deposits_Accounts = deposits_Accounts;
    }

    public Deposit_Account[] Deposits_Accounts;
    public Projects[] Disbursed_Loans;
    public Investment_Accounts_Listpart[] Investment_Accounts_Listpart;
    public String Photo_url;
    public Member_type member_type;
    public String Member_Category;
    public String Otp;

    public enum Member_type {

        Member,
        Customer
    }

    public enum Gender {

        /// <remarks/>
        _blank_,

        /// <remarks/>
        Female,

        /// <remarks/>
        Male,

        /// <remarks/>
        Company,
    }

    /// <remarks/>

    public enum Member_Orientation {

        /// <remarks/>
        Ordinary,

        /// <remarks/>
        Preferantial,
    }

    public class Deposit_Account {

        public String Account;
        public String Description;
        public Double Balance;
        public int Type;

    }


    /// <remarks/>
    public class Investment_Accounts_Listpart {
        public String Key;
        public String No;
        public String Name;
        public String Search_Name;
        public Double Balance;
        public Boolean BalanceSpecified;
        public String Account_Type;
    }

    public class Member_Accounts_Listpart {
        public String Key;
        public String No;
        public String Name;
        public String Search_Name;
        public float Balance;
        public Boolean BalanceSpecified;
        public Double Balance_LCY;
        public Boolean Balance_LCYSpecified;
        public Boolean Cheque_Deposit_Allowed;
        public Boolean Cheque_Deposit_AllowedSpecified;
        public Boolean Cash_Deposit_Allowed;
        public Boolean Cash_Deposit_AllowedSpecified;
        public Boolean Cash_Withdrawal_Allowed;
        public Boolean Cash_Withdrawal_AllowedSpecified;
        public Boolean Cash_Transfer_Allowed;
        public Boolean Cash_Transfer_AllowedSpecified;
        public Boolean Payout_Allowed;
        public Boolean Payout_AllowedSpecified;
        public Boolean Share_Capital_Account;
        public int Noofshares;
        public String Account_Type;
        public Boolean Share_Trading_Account;
        public float Minimum_Balance;
        public boolean Integration_Account;
        public boolean Hide_on_statement;
        public int type = 0;

        @Override
        public String toString() {
            return this.Name;
        }

    }

    public class Projects {
        public String Key;
        public String Application_No;
        public String Project_Description;
        public String Title_Deed;
        public String Member_No;
        public String Member_Name;
        public String Staff_No;
        public String Global_Dimension_1_Code;
        public java.util.Date Application_Date;
        public String Employer_Code;
        public String Credit_Officer;
        public String Credit_Officer_Name;
        public double Principle_Amount;
        public Boolean Protected_Member;
        public Loan_Status Loan_Status;
        public double Loan_Balance;
        public int Repayment_Period_M;
        public double Monthly_Installment;
        public double Outstanding_Principle;
        public double Total_Principle_Arrears;
        public double Accrued_Interest;
        public double Total_Principle_Bill_Due;
        public double Total_Interest_Due;
        public double Total_Interest_Paid;
        public double Total_Principl_Paid;
        public int Defaulted_Days;
        public Boolean Variated;
        public String Previous_Loan_No;
        public java.util.Date Repayment_Start_Date;
        public java.util.Date Posting_Date;
        public int Posted_Entries;
        public double Net_Payout;
        public Boolean Bill_Exist;
        public double Control_Account_Balance;

        @Override
        public String toString() {
            return this.Project_Description;
        }
    }

    public class Member_Agencies {
        public String Key;
        public String Agency_Code;
        public String Agency_Description;
        public String Member_Agency_Code;
        public String Post_To;

    }

    public enum Loan_Status {
        /// <remarks/>
        New,
        /// <remarks/>
        Appraisal,
        /// <remarks/>
        Posted,
    }
}
