package com.trimline.investors;

import android.util.Log;

import androidx.databinding.InverseMethod;


import java.util.Date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Converters {

    @InverseMethod("fromstringtodate")
    public static String fromDatetostring(Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
        String text = "";
              if (date !=null)
                  text = df.format(date);
        return text;
    }
    public static Date fromstringtodate(String date) {

        String[] d = date.split("/");
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        java.util.Date   parsed = null;
        try {
            parsed = sdf.parse(date);
        }
        catch (Exception es){}


        Date sqlStartDate = new Date(parsed.getTime());

        return sqlStartDate;// new Date(Integer.valueOf(d[2]),Integer.valueOf(d[1]),Integer.valueOf(d[0]));
    }



}


