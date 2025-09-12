package com.trimline.m_branch;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothSocket;
import android.content.SharedPreferences;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.os.Handler;
import android.os.ParcelUuid;
import android.util.Log;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.BitSet;
import java.util.List;
import java.util.Locale;
import java.util.UUID;


import com.google.gson.Gson;
import com.trimline.m_branch.Utilities.BluetoothConnector;
import com.trimline.m_branch.Utilities.Constants;

import com.trimline.m_branch.Utilities.PrinterCommands;
import com.trimline.m_branch.reports.tsummary;
import com.trimline.m_branch.transaction;


/**
 * Created by Paul on 09-Oct-16.
 */

public class summaries {
    public static class reportfields {
        public String field;
        public String value;

    }


    public  static class getdata{
        public  String firstdate;
        public  String LastDate;
        public String user;

    }


    public static class reportheader {
        public String Name;
        public int Count;
        public Double Total;
    }


    public static boolean createBond(BluetoothDevice btDevice)throws Exception {
        Class class1 = Class.forName("android.bluetooth.BluetoothDevice");
        Method createBondMethod = class1.getMethod("createBond");
        Boolean returnValue = (Boolean) createBondMethod.invoke(btDevice);
        return returnValue.booleanValue();
    }




}
