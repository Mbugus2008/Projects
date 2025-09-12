package com.trimline.pawdep;

import androidx.room.TypeConverter;


import java.util.Date;

public class TypesConverter {

    @TypeConverter
    public static int fromstatus(Member.status s) {
        if (s!=null)
        return s.ordinal();
        else
            return 0;
    }

    @TypeConverter
    public static Member.status tostatus(int s) {
        return Member.status.values()[s];
    }

//    @TypeConverter
//    public static int fromstatus(PW_Transactions.Transaction_Type s) {
//        if (s!=null)
//            return s.ordinal();
//        else
//            return 0;
//    }
//
//    @TypeConverter
//    public static PW_Transactions.Transaction_Type totransstatus(int s) {
//        return PW_Transactions.Transaction_Type.values()[s];
//    }
    @TypeConverter
    public static int fromcategory(Member.account_Category s) {
        if (s!=null)
        return s.ordinal();
        else
            return 0;
    }

    @TypeConverter
    public static Member.account_Category tocategory(int s) {
        return Member.account_Category.values()[s];
    }

//Date
    @TypeConverter
    public Date fromTimestamp(Long value) {
        return value == null ? null : new Date(value);
    }

    @TypeConverter
    public Long dateToTimestamp(Date date) {
        if (date == null) {
            return null;
        } else {
            return date.getTime();
        }
    }

    @TypeConverter
    public static Loan_Category fromStringToCategory(int category) {

            return (Loan_Category.values()[category]  );
    }
    @TypeConverter
    public static int fromCategoryToString(Loan_Category category) {
              return category.getCode();
    }






    @TypeConverter
    public static Gender togender(int category) {

        return Gender.values()[category] ;
    }
    @TypeConverter
    public static int fromgender(Gender category) {
        return category.getCode();
    }
    @TypeConverter
    public static Target_Category totargetcategory(int category) {
        return Target_Category.values()[category] ;
    }
    @TypeConverter
    public static int fromtargetcategory(Target_Category category) {
        return category.getCode();
    }
    @TypeConverter
    public static Product_Category toproductcategory(int category) {
        return Product_Category.values()[category] ;
    }
    @TypeConverter
    public static int fromgender(Product_Category category) {
        return category.getCode();
    }
}
