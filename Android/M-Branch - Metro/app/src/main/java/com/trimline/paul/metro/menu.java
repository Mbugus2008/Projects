package com.trimline.paul.metro;

import android.Manifest;
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

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.Toast;

import com.google.android.material.navigation.NavigationView;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.reports.cashier_report;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class menu extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    Button cash, paymentstatus, Parcel;
    DB db;
    CheckBox printer;
    SharedPreferences preferences;
    private summaries.printer p = new summaries.printer();
    summaries.Printerthread sp;
    private updatemembers membersupdate;


    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                try {
                    BluetoothDevice device = intent
                            .getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    if (summaries.printer.printerdevice.equals(device)) {
                        mHandler.obtainMessage(Constants.PRINTER_DISCONNECTED).sendToTarget();
                        summaries.printer.printersock.close();
                        summaries.printer.printerout.close();
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.

        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {


        switch (item.getItemId()) {

            case R.id.settings: {
                Intent summary = new Intent(menu.this, Settings.class);
                startActivity(summary);
                return true;
            }

        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onResume() {
        super.onResume();

        new getreversals().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        cash = findViewById(R.id.CashReceipt);
        if (Myvariables.CurrentAgent.Account_type == 2)
            cash.setVisibility(View.GONE);
        else
            cash.setVisibility(View.VISIBLE);
        paymentstatus = findViewById(R.id.Paymentstatus);
        Parcel = findViewById(R.id.Parcel);
        Parcel.setVisibility(View.GONE);
        Parcel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, Parcel_list.class));
            }
        });
        db = new DB(this);
        printer = findViewById(R.id.printer);

        if (Myvariables.CurrentAgent != null)
            if (Myvariables.CurrentAgent.Account_type == 2) {
                cash.setVisibility(View.GONE);
                printer.setVisibility(View.GONE);
            }
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        JsonParser.preferences = preferences;
        summaries.mHandler = mHandler;
        sp = new summaries.Printerthread(preferences);
        sp.start();
        permission();
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);
        membersupdate = new updatemembers();
        membersupdate.start();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            Log.i("sending", "here");
            new Getmembers().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Gettypes().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Getagenttypes().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Getloans().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new getreversals().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        } else {
            Log.i("sending", "here2");
            new Getmembers().execute();
            new Gettypes().execute();
            new Getagenttypes().execute();
            new Getloans().execute();
            new getreversals().execute();
        }
        cash.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, cashreceipt.class));
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
        } else if (id == R.id.summary) {
            i = new Intent(this, summary.class);
        } else if (id == R.id.vehicle_collection) {
            i = new Intent(this, vehiclereport.class);
        } else if (id == R.id.receipts) {
            i = new Intent(this, receiptreport.class);
        }else if (id == R.id.Cashiers) {
            i = new Intent(this, cashier_report.class);
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

    private class Getagenttypes extends AsyncTask<Void, String, List<AgentTypes>> {
        @Override
        protected void onPreExecute() {

        }


        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<AgentTypes> doInBackground(Void... params) {
            //publishProgress("Getting transaction types");
            List<AgentTypes> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("agenttypes", null, null);
                Type localType = new TypeToken<List<AgentTypes>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        db.deleteAgenttypes();
                        //publishProgress("Updating transaction types");
                        for (AgentTypes f : results
                        ) {
                            db.inserttypeagent(f);
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
        protected void onPostExecute(List<AgentTypes> res) {
            try {


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
            if (summaries.printer.printersock != null) {
                summaries.printer.printerout.close();
                summaries.printer.printersock.close();
                summaries.printer.printersock = null;
                //sp.interrupt();
                sp.cancel();


                Log.i("disconnect", "bluetooth");
            }
        } catch (Exception e) {
            e.printStackTrace();
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

                try {
                    while (all == false) {
                        Gson g = new Gson();
                        result = JsonParser.postjson("keymembers", "key", key);
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
                                    if (f.vehicles.length > 0) {
                                        db.deletevehiclesforMember(f.No);
                                        for (vehicles v : f.vehicles
                                        ) {
                                            db.inservehicles(v);
                                        }
                                    } else {
                                        db.deletevehiclesforMember(f.No);
                                    }
                                }
                            }
                        }
                    }
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

    private class getreversals extends AsyncTask<Void, Void, List<transaction>> {
        summaries.getdata c = new summaries.getdata();

        @Override
        protected void onPreExecute() {
        }

        @Override
        protected List<transaction> doInBackground(Void... params) {
            List<transaction> results = null;
            String result = null;
            try {
                c.user = login.CurrentAgent.Agent_Code;
                Gson g = new Gson();
                result = g.toJson(c);
                result = JsonParser.postjson("Getreversals", "data", result);
                Type localType = new TypeToken<List<transaction>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    for (transaction f : results
                    ) {
                        transaction t = db.gettransbydocument(f.Document_No.replace("R", ""));
                        if (t != null) {
                            f.sent = true;
                            f.Constituency = "1";
                            db.inserttrans(f);

                            t.Constituency = "1";
                            db.updatetrans(t);

                            Log.i("Reversal", f.Document_No);
                        }
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
                    printer.setChecked(true);
                    break;

                case Constants.PRINTER_DISCONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer Disconnected", Toast.LENGTH_LONG).show();
                    printer.setChecked(false);
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
                    new collections(db.getunsenttrans()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

//                   Calendar cdt = Calendar.getInstance();
//                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//                    final String formattedDate = df.format(cdt.getTime());
//
//                    summaries.getdata g = new summaries.getdata();
//                    g.firstdate=formattedDate;
//                    g.user = login.CurrentAgent.Agent_Code;
//
//                    new getcollections(g).execute();

                    sleep(30000);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private static final int REQUEST_CODE_PERMISSIONS = 1;
    private String[] permissions = {
            Manifest.permission.BLUETOOTH_CONNECT,
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
