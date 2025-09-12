package com.trimline.pawdep;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.Observer;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.app.DownloadManager;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.WindowManager;
import android.widget.AdapterView;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.trimline.pawdep.databinding.Allocations_binding;
import com.trimline.pawdep.databinding.Grouplist;
import com.trimline.pawdep.databinding.Perfomance;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Allocations extends AppCompatActivity {
    Allocation_header.Model model;
    Allocation_Line.Model allinemodel;
    Group.Model     gmodel;
    RecyclerView allocationslist;
    Allocations_binding binding;
    private Printer.printer p = new Printer.printer();
    Printer.Printerthread sp;
    private String mConnectedDeviceName = null;
    SharedPreferences preferences;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.allocations);

        model = ViewModelProviders.of(this).get(Allocation_header.Model.class);
        allinemodel = ViewModelProviders.of(this).get(Allocation_Line.Model.class);
        gmodel = ViewModelProviders.of(this).get(Group.Model.class);

        final Allocation_header.adapter adapter = new Allocation_header.adapter(Allocations.this,allinemodel);
        allocationslist = findViewById(R.id.allocationslist);
        allocationslist.setLayoutManager(new LinearLayoutManager(this));
        allocationslist.setHasFixedSize(true);
        allocationslist.setAdapter(adapter);


        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        JsonParser.preferences = preferences;
        Printer.mHandler = mHandler;
        sp = new Printer.Printerthread(preferences);
        sp.start();

        model.getall().observe(this, new Observer<List<Allocation_header>>() {
            @Override
            public void onChanged(@Nullable List<Allocation_header> notes) {
               adapter.setTrans(notes);
            }
        });
        adapter.setOnItemClickListener(new Allocation_header.adapter.OnItemClickListener() {
            @Override
            public void onItemClick(Allocation_header note) {
                if (note.Posted!=null) {
                    if (note.Posted)
                    { Toast.makeText(getApplicationContext(), "Posted Allocation cannot be edited", Toast.LENGTH_LONG).show();
                    return;}
                }
                Intent intent = new Intent(Allocations.this, all_add_edit.class);
                intent.putExtra("allocation", note);
                startActivity(intent);
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.allo_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newall:
                Allocation_header all = new Allocation_header();
                all.No = String.valueOf(new Date().getTime());
                all.Allocation_Date = new java.sql.Date(new Date().getTime());
                all.Transaction_No = "";
                all.Captured_by= Pawdep.Agent.Code;
                all.Posted = false;
                all.Status = Allocation_header.Statuss.None;
                Intent intent = new Intent(Allocations.this, all_add_edit.class);
                intent.putExtra("allocation", all);
                startActivity(intent);
                return true;
            case R.id.Loanbooking:
                startActivity(new Intent(Allocations.this, Loan_request_app.class));
                return true;
            case R.id.loanapplication:
                startActivity(new Intent(Allocations.this, Loan_app_list.class));
                return true;
            case R.id.settings:
                startActivity(new Intent(Allocations.this,Settings.class));
                return true;
            case R.id.pr:
                ConfirmationBox();
            default:
                return super.onOptionsItemSelected(item);
        }
    }

    public void ConfirmationBox() {
        LayoutInflater li = LayoutInflater.from(Allocations.this);
        View promptsView = li.inflate(R.layout.performance_filter, null);
        AlertDialog.Builder alertDialogBuilder = new AlertDialog.Builder(Allocations.this);


        alertDialogBuilder.setView(promptsView);
        final Button fromdate = (Button) promptsView.findViewById(R.id.fromdate);
        final Button todate = (Button) promptsView.findViewById(R.id.todate);
        final AutoCompleteTextView group = (AutoCompleteTextView) promptsView.findViewById(R.id.groups);
        Pr pr = new Pr();
        group.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Group g = (Group)parent.getItemAtPosition(position);
                if (g!=null)
                    pr.Group = g.Group_Name;
            }
        });

        String date = "";

        gmodel.getgroups(group);

        int mYear, mMonth, mDay, mHour, mMinute;
        final Calendar c = Calendar.getInstance();


      //  java.sql.Date dd = new java.sql.Date(c.getTimeInMillis());

        pr.fromdate = c.getTime();
        pr.todate = c.getTime();


//        DecimalFormat mFormat= new DecimalFormat("00");
//
        mYear = c.get(Calendar.YEAR);
        mMonth = c.get(Calendar.MONTH);
        mDay = c.get(Calendar.DAY_OF_MONTH);
//
//        date = mFormat.format(Double.valueOf(mDay)) + "-" + (mFormat.format(Double.valueOf(mMonth+ 1)) ) + "-" + mYear;
//        fromdate.setText(date);
//        todate.setText(date);

        fromdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(promptsView.getContext(),
                        new DatePickerDialog.OnDateSetListener() {
                            @Override
                            public void onDateSet(DatePicker view, int year,
                                                  int monthOfYear, int dayOfMonth) {
//dd-MM-yyyy
                                DecimalFormat mFormat = new DecimalFormat("00");
                          String      date = (mFormat.format(Double.valueOf(dayOfMonth)) + "/" + mFormat.format(Double.valueOf(monthOfYear + 1)) + "/" + year).toString();

                                fromdate.setText(date);
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                java.util.Date   parsed = null;
                                try {
                                    parsed = sdf.parse(date);
                                }
                                catch (Exception es){}
                                pr.fromdate = parsed;
                            }
                        }, mYear, mMonth, mDay);
                datePickerDialog.show();
            }

        });

        todate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(promptsView.getContext(),
                        new DatePickerDialog.OnDateSetListener() {
                            @Override
                            public void onDateSet(DatePicker view, int year,
                                                  int monthOfYear, int dayOfMonth) {
//dd-MM-yyyy
                                DecimalFormat mFormat = new DecimalFormat("00");
                                String      date = (mFormat.format(Double.valueOf(dayOfMonth)) + "/" + mFormat.format(Double.valueOf(monthOfYear + 1)) + "/" + year).toString();

                                todate.setText(date);
                                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                                java.util.Date   parsed = null;
                                try {
                                    parsed = sdf.parse(date);
                                }
                                catch (Exception es){}
                                pr.todate = parsed;
                            }
                        }, mYear, mMonth, mDay);
                datePickerDialog.show();
            }

        });


        // set dialog message
        alertDialogBuilder
                .setCancelable(false)
                .setTitle("Performance Report")
                .setPositiveButton("OK", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int id) {
                        // get user input and set it to result
                        // edit text
                    }
                })
                .setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
            @Override
            public void onClick(DialogInterface dialog, int id) {
                // get user input and set it to result
                // edit text
            }
        })
        ;
        // create alert dialog
        final AlertDialog adialog = alertDialogBuilder.create();
        adialog.getWindow().setSoftInputMode(WindowManager.LayoutParams.SOFT_INPUT_ADJUST_RESIZE);
        adialog.show();
        adialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fromdate.requestFocus();

                Log.i("Showpr", new Gson().toJson(pr));
                new statement(pr).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
               adialog.dismiss();

            }
        });
        adialog.getButton(AlertDialog.BUTTON_NEGATIVE).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                adialog.dismiss();

            }
        });
    }
    private class statement extends AsyncTask<Void, Void, String> {

        private Pr pr;
        public  statement(Pr p)
        {
            this.pr= p;

        }
        @Override
        protected String doInBackground(Void... notes) {
            String d  = new Gson().toJson(pr);
            String path = JsonParser.postjson("groupperfomance", "data", d);
            return pr.Group;
        }
        @Override
        protected void onPostExecute(String res) {
            beginDownload("http://173.249.49.91:3544/Statements/"+ res + ".pdf",pr.Group.replace("/","_"));
        }
    }
    public  void beginDownload(String url,String name ) {
        try {
            DownloadManager.Request request = new DownloadManager.Request(Uri.parse(url))
                    .setTitle(name)// Title of the Download Notification
                    .setDescription("Downloading")// Description of the Download Notification
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE_NOTIFY_COMPLETED)// Visibility of the download Notification
                    .setDestinationInExternalPublicDir(Environment.DIRECTORY_DOWNLOADS,name + ".pdf")
                    .setMimeType("application/pdf")
                    //.setDestinationUri(Uri.fromFile(file))// Uri of the destination file
                    .setRequiresCharging(false)// Set if charging is required to begin the download
                    .setAllowedOverMetered(true)// Set if download is allowed on Mobile network
                    .setAllowedOverRoaming(true);// Set if download is allowed on roaming network
            DownloadManager downloadManager = (DownloadManager) Allocations.this. getSystemService(DOWNLOAD_SERVICE);
            downloadID = downloadManager.enqueue(request);// enqueue puts the download request in the queue.
        }catch ( Exception ex){
            ex.printStackTrace();

        }}
    static long downloadID;
    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
//
                case Printer.Constants.MESSAGE_WRITE:
                    byte[] writeBuf = (byte[]) msg.obj;
                    // construct a string from the buffer
                    String writeMessage = new String(writeBuf);

                    break;

                case Printer.Constants.PRINTER_CONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer connected", Toast.LENGTH_LONG).show();
                    // printer.setChecked(true);
                    break;

                case Printer.Constants.PRINTER_DISCONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer Disconnected", Toast.LENGTH_LONG).show();
                    //printer.setChecked(false);
                    break;

                case Printer.Constants.PRINTER_MESSAGE_READ:
                    byte[] preadBuf = (byte[]) msg.obj;
                    // construct a string from the valid bytes in the buffer
                    String preadMessage = new String(preadBuf, 0, msg.arg1);
                    Log.i("Printer Data Recieved", preadMessage);
                    String[] pread = preadMessage.split("\n");
                    break;
                case Printer.Constants.MESSAGE_DEVICE_NAME:
                    // save the connected device's name
                    mConnectedDeviceName = msg.getData().getString(Printer.Constants.DEVICE_NAME);
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), "Connected to "
                                + mConnectedDeviceName, Toast.LENGTH_SHORT).show();
                    }
                    break;
                case Printer.Constants.MESSAGE_TOAST:
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), msg.getData().getString(Printer.Constants.TOAST),
                                Toast.LENGTH_LONG).show();
                    }
                    break;
            }
        }
    };
    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                try {
                    BluetoothDevice device = intent
                            .getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    if (Printer.printer.printerdevice.equals(device)) {
                        Printer.printer.printersock.close();
                        Printer.printer.printerout.close();
                        mHandler.obtainMessage(Printer.Constants.PRINTER_DISCONNECTED).sendToTarget();

                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    };
}