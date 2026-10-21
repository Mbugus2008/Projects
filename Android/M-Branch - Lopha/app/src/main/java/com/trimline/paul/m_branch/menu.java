package com.trimline.paul.m_branch;

import android.Manifest;
import android.app.DatePickerDialog;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import com.google.android.material.navigation.NavigationView;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.m_branch.reports.dailysummary;
import com.trimline.paul.m_branch.reports.receipts;
import com.trimline.paul.m_branch.teller.tellertranslist;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class menu extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener
{
    Button  cash,paymentstatus,transfer;
    DB db;
    TextView printer;
    View printerDot;
    SharedPreferences preferences;
    private summaries.printer p = new summaries.printer();
    summaries.Printerthread sp;
    private updatemembers membersupdate;

    // Inline Z report
    private final Calendar zSelected = Calendar.getInstance();
    private final SimpleDateFormat zDayFormat = new SimpleDateFormat("dd-MM-yyyy", Locale.US);
    private TextView zDate, zTotal, zReceipts, zGenerated;
    private LinearLayout zTypes;
//1200 8219396 - jul
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                try {
                    BluetoothDevice device = intent
                            .getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    if (summaries.printer.printerdevice != null && summaries.printer.printerdevice.equals(device)) {
                        try {
                            if (summaries.printer.printersock != null) summaries.printer.printersock.close();
                            if (summaries.printer.printerout != null) summaries.printer.printerout.close();
                        } catch (Exception ignored) {
                        }
                        // drop the socket so the printer thread reconnects cleanly, no flapping
                        summaries.printer.printersock = null;
                        summaries.printer.printerout = null;
                        mHandler.obtainMessage(Constants.PRINTER_DISCONNECTED).sendToTarget();

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    };

    private void refreshBalance() {
        if (Myvariables.CurrentAgent == null || db == null) return;
        agent fresh = db.getagent(Myvariables.CurrentAgent.Agent_Code);
        if (fresh != null) Myvariables.CurrentAgent = fresh;
        ((android.widget.TextView) findViewById(R.id.agentBalance)).setText(
                String.format(java.util.Locale.US, "KES %,.2f", Myvariables.CurrentAgent.Account_Balance));
    }

    private void setPrinterStatus(boolean connected) {
        int color = ContextCompat.getColor(this, connected ? R.color.brand_success : R.color.brand_danger);
        if (printerDot != null) {
            printerDot.setBackgroundTintList(android.content.res.ColorStateList.valueOf(color));
        }
        if (printer != null) {
            printer.setTextColor(ContextCompat.getColor(this, R.color.white));
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        refreshBalance();
        if (zTypes != null) loadZReport();
        UpdateChecker.onResume(this);
    }

    private void loadZReport() {
        if (db == null || zTypes == null) return;

        String date = zDayFormat.format(zSelected.getTime());
        zDate.setText(date + "  \u25BE");

        ArrayList<transaction> rows = db.gettransbydate(date);
        double total = 0;
        LinkedHashMap<String, Double> typeAmounts = new LinkedHashMap<>();
        LinkedHashMap<String, Integer> typeCounts = new LinkedHashMap<>();

        for (transaction t : rows) {
            double amount = t.Amount == null ? 0 : t.Amount;
            total += amount;

            String type = t.typename;
            if (type == null || type.trim().isEmpty()) {
                type = (t.Type == null || t.Type.trim().isEmpty()) ? "OTHER" : t.Type;
            }
            Double typeAmount = typeAmounts.get(type);
            typeAmounts.put(type, (typeAmount == null ? 0 : typeAmount) + amount);
            Integer typeCount = typeCounts.get(type);
            typeCounts.put(type, (typeCount == null ? 0 : typeCount) + 1);
        }

        zTotal.setText(String.format(Locale.US, "KES %,.2f", total));
        zReceipts.setText(String.valueOf(rows.size()));

        zTypes.removeAllViews();
        if (typeAmounts.isEmpty()) {
            zTypes.addView(zEmptyRow("No collections for this date"));
        } else {
            List<Map.Entry<String, Double>> entries = new ArrayList<>(typeAmounts.entrySet());
            Collections.sort(entries, new Comparator<Map.Entry<String, Double>>() {
                @Override
                public int compare(Map.Entry<String, Double> a, Map.Entry<String, Double> b) {
                    return b.getValue().compareTo(a.getValue());
                }
            });
            for (Map.Entry<String, Double> entry : entries) {
                Integer count = typeCounts.get(entry.getKey());
                zAddRow(entry.getKey(), (count == null ? 0 : count) + " receipts", entry.getValue());
            }
            zAddTotalRow(total);
        }

        zGenerated.setText("Generated " + new SimpleDateFormat("dd-MM-yyyy HH:mm", Locale.US).format(new java.util.Date()));
    }

    private void zAddRow(String label, String detail, double amount) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(7), 0, dp(7));

        TextView name = new TextView(this);
        name.setText(label);
        name.setTextColor(ContextCompat.getColor(this, R.color.brand_text));
        name.setTextSize(13);
        name.setTypeface(name.getTypeface(), android.graphics.Typeface.BOLD);
        name.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView meta = new TextView(this);
        meta.setText(detail);
        meta.setTextColor(ContextCompat.getColor(this, R.color.brand_muted));
        meta.setTextSize(11);
        meta.setPadding(dp(8), 0, dp(12), 0);

        TextView value = new TextView(this);
        value.setText(String.format(Locale.US, "%,.2f", amount));
        value.setTextColor(ContextCompat.getColor(this, R.color.brand_ink));
        value.setTextSize(13);
        value.setTypeface(value.getTypeface(), android.graphics.Typeface.BOLD);
        value.setGravity(android.view.Gravity.END);

        row.addView(name);
        row.addView(meta);
        row.addView(value);
        zTypes.addView(row);
        zTypes.addView(zDivider());
    }

    private void zAddTotalRow(double total) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(10), 0, 0);

        TextView name = new TextView(this);
        name.setText("TOTAL");
        name.setTextColor(ContextCompat.getColor(this, R.color.brand_ink));
        name.setTextSize(13);
        name.setTypeface(name.getTypeface(), android.graphics.Typeface.BOLD);
        name.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView value = new TextView(this);
        value.setText(String.format(Locale.US, "%,.2f", total));
        value.setTextColor(ContextCompat.getColor(this, R.color.brand_orange_dark));
        value.setTextSize(14);
        value.setTypeface(value.getTypeface(), android.graphics.Typeface.BOLD);
        value.setGravity(android.view.Gravity.END);

        row.addView(name);
        row.addView(value);
        zTypes.addView(row);
    }

    private TextView zEmptyRow(String text) {
        TextView empty = new TextView(this);
        empty.setText(text);
        empty.setTextColor(ContextCompat.getColor(this, R.color.brand_muted));
        empty.setTextSize(12);
        empty.setPadding(0, dp(8), 0, dp(4));
        return empty;
    }

    private View zDivider() {
        View line = new View(this);
        line.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, dp(1)));
        line.setBackgroundColor(ContextCompat.getColor(this, R.color.brand_outline));
        return line;
    }

    private int dp(int value) {
        return (int) (getResources().getDisplayMetrics().density * value);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setSubtitle(BuildConfig.VERSION_NAME);
        cash = findViewById(R.id.CashReceipt);
        paymentstatus = findViewById(R.id.Paymentstatus);
        transfer = findViewById(R.id.transfer);
        if (Myvariables.CurrentAgent.Account_type == 2)
            cash.setVisibility(View.GONE);
        db = new DB(this);
        refreshBalance();

        zDate = findViewById(R.id.zDate);
        zTotal = findViewById(R.id.zTotal);
        zReceipts = findViewById(R.id.zReceipts);
        zTypes = findViewById(R.id.zTypes);
        zGenerated = findViewById(R.id.zGenerated);
        zDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new DatePickerDialog(menu.this, (view, year, month, dayOfMonth) -> {
                    zSelected.set(year, month, dayOfMonth);
                    loadZReport();
                }, zSelected.get(Calendar.YEAR), zSelected.get(Calendar.MONTH), zSelected.get(Calendar.DAY_OF_MONTH)).show();
            }
        });
        loadZReport();

        UpdateChecker.checkForUpdate(this);
        printer = findViewById(R.id.printer);
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        JsonParser.preferences = preferences;
        summaries.mHandler = mHandler;
        // Re-login creates a new menu: stop any previous printer thread so we never
        // end up with two threads fighting over the same Bluetooth socket.
        if (summaries.printer.printThread != null) {
            summaries.printer.printThread.halt();
        }
        sp = new summaries.Printerthread(preferences);
        sp.start();

        permission();
        printer = findViewById(R.id.printer);
        printerDot = findViewById(R.id.printerDot);
        setPrinterStatus(summaries.printer.printersock != null && summaries.printer.printersock.isConnected());
        DrawerLayout drawer = findViewById(R.id.drawer_layout);

        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        TextView navVersion = findViewById(R.id.navVersion);
        if (navVersion != null) {
            navVersion.setText("Version " + BuildConfig.VERSION_NAME);
        }
        membersupdate = new updatemembers();
        membersupdate.start();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            Log.i("sending", "here");
            new Getmembers().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Gettypes().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Getloans().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        } else {
            Log.i("sending", "here2");
            new Getmembers().execute();
            new Gettypes().execute();
            new Getloans().execute();
        }
        cash.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, cashreceipt.class));
            }
        });
        transfer.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, tellertranslist.class));
            }
        });
        paymentstatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, status.class));
            }
        });
        IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_ACL_DISCONNECTED);
        registerReceiver(mReceiver, filter);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        Intent i = null;
        int id = item.getItemId();
        if (id == R.id.nav_settings) {
            i = new Intent(this, Settings.class);
        } else if (id == R.id.nav_changepin) {
            i = new Intent(this, Changepassword.class);
        } else if (id == R.id.summary) {
            i= new Intent(this, dailysummary.class);
        } else if (id == R.id.vehicle_collection) {
            i= new Intent(this,vehiclereport.class);
        }else if (id == R.id.receipts) {
            i= new Intent(this, receipts.class);
        }
        if (i != null)
            startActivity(i);
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }
    private class Gettypes extends AsyncTask<Void, String, List<types>> {
        @Override
        protected void onPreExecute() {

        }


        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<types> doInBackground(Void... params) {
            //publishProgress("Getting transaction types");
            List<types> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("Transtypes", null, null);
                Type localType = new TypeToken<List<types>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                       db.deleteAlltypes();
                        //publishProgress("Updating transaction types");
                        for (types f : results
                                ) {
                            db.inserttype(f);
                        }
                    } catch (Exception ex) {
                       // publishProgress("Unable to get transaction types");
                        ex.printStackTrace();
                    }
                }
            } catch (Exception e) {
                publishProgress("Unable to get transaction types");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<types> res) {
            try {
                //if (res != null)
                    //Toast.makeText(getApplicationContext(), "Transaction types updated", Toast.LENGTH_LONG).show();


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private class Getloans extends AsyncTask<Void, String, List<loan>> {
        @Override
        protected void onPreExecute() {

        }


        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<loan> doInBackground(Void... params) {
           // publishProgress("Getting Credits");
            List<loan> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("loans", null, null);
                Type localType = new TypeToken<List<loan>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        db.deleteloans();
                       // publishProgress("Updating Credits");
                        for (loan f : results
                                ) {
                            db.inserloans(f);
                        }
                    } catch (Exception ex) {
                        publishProgress("Unable to get Credits");
                        ex.printStackTrace();
                    }
                }
            } catch (Exception e) {
                publishProgress("Unable to get Credits");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<loan> res) {
            try {
//                if (res != null)
//                    Toast.makeText(getApplicationContext(), "Credits updated", Toast.LENGTH_LONG).show();


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        try {
            unregisterReceiver(mReceiver);
        } catch (Exception ignored) {
        }
        if (sp != null) {
            sp.halt();
        }
    }

    private class Getmembers extends AsyncTask<Void, String, List<member>> {
        @Override
        protected void onPreExecute() {

        }
        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_SHORT).show();
        }
        @Override
        protected List<member> doInBackground(Void... params) {
            Log.i("sending", "hereinside");
            List<member> results = null;
            String result = null;
            try {
                String key = "";
                Boolean all = false;

                    try { while (all == false) {
                        Gson g = new Gson();
                        result = JsonParser.postjson("Getmembers", "key", key);
                        Type localType = new TypeToken<List<member>>() {
                        }.getType();
                        results = new Gson().fromJson(result, localType);

                        if (results != null) {
                            all = results.size() == 0;
                            if (results.size() > 0)
                                key = results.get(results.size() - 1).Key;
                            for (member f : results
                            ) {
                                db.insertmember(f);
                                if (f.vehicles != null) {
                                    //Log.i("Got Member", f.No);
                                    //Log.i("vehicles", String.valueOf(f.vehicles.length));

                                    if (f.vehicles.length > 0) {
                                        db.deletevehiclesforMember(f.No);
                                        for (vehicles v : f.vehicles
                                        ) {
                                            db.inservehicles(v);
                                        }
                                    }
                                }
                            }
                        }      }
                        // publishProgress(results.size()+  " Members updated");
                    } catch (Exception ex) {
                        publishProgress("Unable to get members ");
                        ex.printStackTrace();
                    }

                //}
            } catch (Exception e) {
                publishProgress("Unable to get members");
                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(List<member> res) {
            try {
                // if (res!=null)
                // Toast.makeText(getApplicationContext(),res.size()+  " Members updated",Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private String mConnectedDeviceName = null;
    private class collections extends AsyncTask<List<transaction>, Void, List<transaction>> {
        List<transaction> c = null;
        collections(List<transaction> ff) {
            c = ff;
        }
        @Override
        protected void onPreExecute() {

        }
        @Override
        protected List<transaction> doInBackground(List<transaction>... params) {
            List<transaction> results = null;
            String result = null;
            try {
                for (transaction cc : c
                        ) {
                    transaction res = null;
                    Gson g = new Gson();
                    result = g.toJson(cc);
                    result = JsonParser.postjson("Collections", "data", result);
                    Type localType = new TypeToken<transaction>() {
                    }.getType();

                    res = new Gson().fromJson(result, localType);
                    if (res != null) {
                        res.sent = true;
                        db.updatetransstatus(res);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                results = c;
            }
            return results;
        }
        @Override
        protected void onPostExecute(List<transaction> res) {
            try {

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private class getcollections extends AsyncTask<summaries.getdata, Void, List<transaction>> {
       summaries.getdata c = null;
        getcollections(summaries.getdata ff) {
            c = ff;
        }
        @Override
        protected void onPreExecute() {
        }
        @Override
        protected  List<transaction> doInBackground(summaries.getdata... params) {
            List<transaction> results = null;
            String result = null;
            try {
                     Gson g = new Gson();
                    result = g.toJson(c);
                    result = JsonParser.postjson("GetCollections", "data", result);
                    Type localType = new TypeToken<List<transaction>>() {
                    }.getType();
                    results = new Gson().fromJson(result, localType);
                    if (results != null) {
                        for (transaction f : results
                                ) {
                        f.sent = true;
                        db.inserttrans(f);
                    }
                    }

            } catch (Exception e) {
                e.printStackTrace();

            }
            return results;
        }
        @Override
        protected void onPostExecute(List<transaction> res) {
            try {

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
//                case Constants.MESSAGE_STATE_CHANGE:
//                    switch (msg.arg1) {
//                        case BluetoothChatService.STATE_CONNECTED:
//                            setStatus(getString(R.string.title_connected_to, mConnectedDeviceName));
//                            mConversationArrayAdapter.clear();
//                            break;
//                        case BluetoothChatService.STATE_CONNECTING:
//                            setStatus("Connecting");
//                            break;
//                        case BluetoothChatService.STATE_LISTEN:
//                        case BluetoothChatService.STATE_NONE:
//                            setStatus("Not connected");
//                            break;
//
//                    }
//                    break;
                case Constants.MESSAGE_WRITE:
                    byte[] writeBuf = (byte[]) msg.obj;
                    // construct a string from the buffer
                    String writeMessage = new String(writeBuf);

                    break;

                case Constants.PRINTER_CONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer connected", Toast.LENGTH_LONG).show();
                    setPrinterStatus(true);
                    break;

                case Constants.PRINTER_DISCONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer Disconnected", Toast.LENGTH_LONG).show();
                    setPrinterStatus(false);
                    break;

                case Constants.PRINTER_MESSAGE_READ:
                    byte[] preadBuf = (byte[]) msg.obj;
                    // construct a string from the valid bytes in the buffer
                    String preadMessage = new String(preadBuf, 0, msg.arg1);
                    Log.i("Printer Data Recieved", preadMessage);
                    String[] pread = preadMessage.split("\n");
                    break;
                case Constants.MESSAGE_DEVICE_NAME:
                    // save the connected device's name
                    mConnectedDeviceName = msg.getData().getString(Constants.DEVICE_NAME);
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), "Connected to "
                                + mConnectedDeviceName, Toast.LENGTH_SHORT).show();
                    }
                    break;
                case Constants.MESSAGE_TOAST:
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), msg.getData().getString(Constants.TOAST),
                                Toast.LENGTH_LONG).show();
                    }
                    break;
            }
        }
    };

    private class updatemembers extends Thread {
        public updatemembers() {
            Log.i("Sending..", "Sending Started");
        }

        public void run() {
            try {
                while (true) {
                    //new updatemember(db.getupdatedmember()).execute();
                    new collections(db.getunsenttrans()).execute();

//                   Calendar cdt = Calendar.getInstance();
//                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//                    final String formattedDate = df.format(cdt.getTime());
//
//                    summaries.getdata g = new summaries.getdata();
//                    g.firstdate=formattedDate;
//                    g.user = login.CurrentAgent.Agent_Code;
//
//                    new getcollections(g).execute();

                    sleep(20000);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private static final int REQUEST_CODE_PERMISSIONS = 1;

    private String[] permissions = {
            android.Manifest.permission.BLUETOOTH_CONNECT,
            Manifest.permission.BLUETOOTH_SCAN,

            // Add more permissions if needed
    };

    public void permission() {
        List<String> permissionsToRequest = new ArrayList<>();

        // Check each permission if it has not been granted
        for (String permission : permissions) {
            if (ContextCompat.checkSelfPermission(this, permission)
                    != PackageManager.PERMISSION_GRANTED) {
                permissionsToRequest.add(permission);
            }
        }
        // Convert the list to an array and request the permissions
        if (!permissionsToRequest.isEmpty()) {
            ActivityCompat.requestPermissions(this,
                    permissionsToRequest.toArray(new String[0]),
                    REQUEST_CODE_PERMISSIONS);
        } else {
            // All permissions have already been granted
        }
    }
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
                                           @NonNull int[] grantResults) {

        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_CODE_PERMISSIONS) {
            if (grantResults.length > 0) {
                // Check if all permissions were granted
                boolean allPermissionsGranted = true;
                for (int result : grantResults) {
                    if (result != PackageManager.PERMISSION_GRANTED) {
                        allPermissionsGranted = false;
                        break;
                    }
                }

                if (allPermissionsGranted) {
                    // All permissions granted
                } else {
                    // Some permissions were denied
                }
            } else {
                // Permission request was cancelled
            }
        }
    }
}
