package com.openvalley.afrecash.utils;

import android.app.FragmentManager;
import android.graphics.Color;

import com.openvalley.afrecash.listeners.DatePickerListener;
import com.wdullaer.materialdatetimepicker.date.DatePickerDialog;

import java.util.Calendar;


/**
 * @author Geek Nat
 *         On 6/30/2016.
 */
public class DatePickerFragment implements DatePickerDialog.OnDateSetListener {

    DatePickerListener datePickerListener;
    DatePickerDialog datePickerDialog;

    public DatePickerFragment() {
        Calendar now = Calendar.getInstance();
        datePickerDialog = DatePickerDialog.newInstance(
                this,
                now.get(Calendar.YEAR),
                now.get(Calendar.MONTH),
                now.get(Calendar.DAY_OF_MONTH)
        );
        datePickerDialog.setAccentColor(Color.parseColor("#EF5350"));
    }

    public void show(FragmentManager fragmentManager, String tag) {
        datePickerDialog.show(fragmentManager, tag);
    }

    public void setPickerListener(DatePickerListener datePickerListener) {
        this.datePickerListener = datePickerListener;
    }

    @Override
    public void onDateSet(DatePickerDialog view, int year, int monthOfYear, int dayOfMonth) {
        this.datePickerListener.onDatePicked(null, String.valueOf(year), Utils.convertToTwo(monthOfYear + 1), Utils.convertToTwo(dayOfMonth));
    }
}
