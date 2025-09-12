package com.openvalley.afrecash.utils;

import android.app.Dialog;
import android.app.DialogFragment;
import android.app.TimePickerDialog;
import android.os.Bundle;
import android.text.format.DateFormat;
import android.widget.TimePicker;

import com.openvalley.afrecash.listeners.TimePickerListener;

import java.util.Calendar;


/**
 * @author Geek Nat
 *         On 6/30/2016.
 */
public class TimePickerFragment extends DialogFragment implements TimePickerDialog.OnTimeSetListener {

    TimePickerListener timePickerListener;

    @Override
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        final Calendar c = Calendar.getInstance();
        int hour = c.get(Calendar.HOUR_OF_DAY);
        int minute = c.get(Calendar.MINUTE);

        return new TimePickerDialog(getActivity(), this, hour, minute,
                DateFormat.is24HourFormat(getActivity()));
    }

    public void setPickerListener(TimePickerListener timePickerListner) {
        this.timePickerListener = timePickerListner;
    }

    @Override
    public void onTimeSet(TimePicker view, int hourOfDay, int minute) {
        this.timePickerListener.onTimePicked(view, Utils.convertToTwo(hourOfDay), Utils.convertToTwo(minute));
    }
}
