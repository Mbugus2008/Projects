package com.trimline.sales

import android.util.Log

import androidx.room.TypeConverter
import java.sql.Date
import java.sql.Time
import java.text.DateFormat
import java.text.SimpleDateFormat

class Converters {
    @TypeConverter
    fun toDate(dateLong: Long?): Date? {
        return if (dateLong == null) null else Date(dateLong)
    }

    @TypeConverter
    fun fromDate(date: Date?): Long? {
        return date?.time
    }
@TypeConverter
fun toitemtype(itemtypes: Item_Type?): Int?{

    return itemtypes?.ordinal;
}
    @TypeConverter
    fun fromitemtype(itemtypes: Int?): Item_Type?{
        return Item_Type.values()[itemtypes!!];
    }
}