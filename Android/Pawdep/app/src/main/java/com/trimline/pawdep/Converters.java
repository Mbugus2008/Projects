package com.trimline.pawdep;

import android.util.Log;

import androidx.databinding.InverseMethod;
import androidx.room.TypeConverter;

import java.sql.Date;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Converters {

    @TypeConverter
    public static Date toDate(Long dateLong) {
        return dateLong == null ? null : new Date(dateLong);
    }

    @TypeConverter
    public static Long fromDate(Date date) {
        return date == null ? null : date.getTime();
    }

    @InverseMethod("fromstringtodate")
    public static String fromDatetostring(Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String text = df.format(date);
        return text;
    }
    public static Date fromstringtodate(String date) {


        Log.i("Datechanges", date );
         String[] d = date.split("/");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date   parsed = null;
        try {
            parsed = sdf.parse(date);
        }
        catch (Exception es){}


        java.sql.Date sqlStartDate = new java.sql.Date(parsed.getTime());

        return sqlStartDate;// new Date(Integer.valueOf(d[2]),Integer.valueOf(d[1]),Integer.valueOf(d[0]));
    }


    @InverseMethod("fromstringtodateutil")
    public static String fromDatetostringutil(java.util.Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String text = df.format(date);
        return text;
    }
    public static java.util.Date fromstringtodateutil(String date) {


        Log.i("Datechanges", date );
        String[] d = date.split("/");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date   parsed = null;
        try {
            parsed = sdf.parse(date);
        }
        catch (Exception es){}


      //  java.sql.Date sqlStartDate = new java.sql.Date(parsed.getTime());

        return parsed;// new Date(Integer.valueOf(d[2]),Integer.valueOf(d[1]),Integer.valueOf(d[0]));
    }

    @TypeConverter
    public static Time toTime(Long dateLong) {
        return dateLong == null ? null : new Time(dateLong);
    }

    @TypeConverter
    public static Long fromTime(Time date) {
        return date == null ? null : date.getTime();
    }

    @TypeConverter
    public static enums.Transaction_Type inttotranstype(int t) {
        return enums.Transaction_Type.values()[t];
    }

    @TypeConverter
    public static int transtypetoint(enums.Transaction_Type t) {
        return t.ordinal();
    }

    @TypeConverter
    public static Allocation_Line.Account_Types inttoaccounttype(int t) {
        return Allocation_Line.Account_Types.values()[t];
    }

    @TypeConverter
    public static int accounttypetoint(Allocation_Line.Account_Types t) {
        return t.ordinal();
    }
    @TypeConverter
    public static Allocation_Line.Rent_Types inttorenttype(int t) {
        return Allocation_Line.Rent_Types.values()[t];
    }
    @TypeConverter
    public static int Renttypetoint(Allocation_Line.Rent_Types t) {
        return t.ordinal();
    }

    @TypeConverter
    public static Allocation_header.Categorys inttocategory(int t) {
        return Allocation_header.Categorys.values()[t];
    }
    @TypeConverter
    public static int Categorytoint(Allocation_header.Categorys t) {
        return t.ordinal();
    }

    @TypeConverter
    public static Allocation_header.Statuss inttostatus(int t) {
        return Allocation_header.Statuss.values()[t];
    }

    @TypeConverter
    public static int Statustoint(Allocation_header.Statuss t) {

        return t.ordinal();
    }

    @TypeConverter
    public static Loan_Status toloanstatus(int category) {

        return Loan_Status.values()[category];
    }

    @TypeConverter
    public static int fromloanstatus(Loan_Status category) {
        return category.getCode();
    }

    @TypeConverter
    public static Member_Category toMembercategory(int category) {

        return Member_Category.values()[category];
    }

    @TypeConverter
    public static int frommembercategory(Member_Category category) {
        return category.getCode();
    }


    @TypeConverter
    public static Gender togender(int category) {

        return Gender.values()[category];
    }

    @TypeConverter
    public static int fromgender(Gender category) {
        return category.getCode();
    }

    @TypeConverter
    public static Target_Category totargetcategory(int category) {
        return Target_Category.values()[category];
    }

    @TypeConverter
    public static int fromtargetcategory(Target_Category category) {
        return category.getCode();
    }


    @TypeConverter
    public static Product_Category toproductcategory(int category) {
        return Product_Category.values()[category];
    }

    @TypeConverter
    public static int fromgender(Product_Category category) {
        return category.getCode();
    }

}


