package com.trimline.investments;

import android.util.Log;
import android.widget.EditText;

import androidx.databinding.InverseMethod;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public final class Converters {
    @InverseMethod("fromstring")
    public static String tostring(RealEstate.Maturity_Actions Ma ){
       System.out.println (Ma);
        return (Ma==null?"Null":Ma.toString());
    }

    public static RealEstate.Maturity_Actions fromstring(String Ma){
        return RealEstate.Maturity_Actions.valueOf(Ma);
    }

    @InverseMethod("stringToDate")
    public static String dateToString(
                                      Date value) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = dateFormat.format(value);
        return strDate.toString();
    }

    public static Date stringToDate(
                                    String value) {
        return new Date(value);
    }

    @InverseMethod("Positiontoaccount")
    public static int Accounttoposition(members.Member_Accounts_Listpart l){
        return l == null ? 0 :new ArrayList<>(Arrays.asList(Investments.member.getMember_Deposits_Accounts())).indexOf(l);
       //return l == null ? 0 :new ArrayList<>(Arrays.asList(Investments.member.Member_Accounts)).indexOf(l);
    }

    public static members.Member_Accounts_Listpart Positiontoaccount(int position){
       return new ArrayList<>(Arrays.asList(Investments.member.getMember_Deposits_Accounts())).get(position);
       // return new ArrayList<>(Arrays.asList(Investments.member.Member_Accounts)).get(position);
    }

    @InverseMethod("Positiontodeopsit")
    public static int Depositoposition(members.Deposit_Account l){
        return l == null ? 0 :new ArrayList<>(Arrays.asList(Investments.member.getMember_Deposits_Accounts())).indexOf(l);
        //return l == null ? 0 :new ArrayList<>(Arrays.asList(Investments.member.Member_Accounts)).indexOf(l);
    }

    public static members.Deposit_Account Positiontodeopsit(int position){
        return new ArrayList<>(Arrays.asList(Investments.member.getDeposits_Accounts())).get(position);
        // return new ArrayList<>(Arrays.asList(Investments.member.Member_Accounts)).get(position);
    }


}
