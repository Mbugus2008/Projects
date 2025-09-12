package com.trimline.sales;

import androidx.room.TypeConverter;

import java.sql.Date;
import java.sql.Time;

public class Converters {
    public static class DateConverter {

        @TypeConverter
        public static Date toDate(Long dateLong){
            return dateLong == null ? null: new Date(dateLong);
        }

        @TypeConverter
        public static Long fromDate(Date date){
            return date == null ? null : date.getTime();
        }
    }
    public static class TimeConverter {

        @TypeConverter
        public static Time toTime(Long dateLong){
            return dateLong == null ? null: new Time(dateLong);
        }

        @TypeConverter
        public static Long fromTime(Time date){
            return date == null ? null : date.getTime();
        }
    }


}


