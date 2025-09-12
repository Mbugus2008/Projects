package com.trimline.paul.m_branch.bindingadapters;

import android.widget.EditText;

import androidx.databinding.BindingAdapter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BindingAdapters {
    @BindingAdapter("android:text")
    public static void setDateText(EditText editText, Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String dateString = dateFormat.format(date);
        editText.setText(dateString);
    }
}
