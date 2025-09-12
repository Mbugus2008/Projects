package com.trimline.investments;

import android.content.Context;
import android.os.AsyncTask;
import android.util.AttributeSet;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Spinner;

import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.BindingAdapter;
import androidx.databinding.InverseBindingAdapter;
import androidx.databinding.InverseBindingListener;
import androidx.databinding.InverseBindingMethod;
import androidx.databinding.InverseBindingMethods;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class FDTyes {
    private int selectedItemPosition;
    public String Key;
    public String FD_Type;
    public String FD_Description;
    public Boolean Interest_Calculation_TypeSpecified;
    public String FD_Control_Account;
    public int Total_FD_Accounts;
    public Boolean Total_FD_AccountsSpecified;
    public int Running_FD_Accounts;
    public Boolean Running_FD_AccountsSpecified;
    public String Accrued_Interest_Account;
    public String FD_Marturity_Deductions;
    public Boolean Allow_Topup;
    public Boolean Allow_TopupSpecified;
    public Boolean Accrual_TypeSpecified;
    public double Min_Amount;
    public Boolean Min_AmountSpecified;

    @Override
    public String toString(){return FD_Type;}
}

