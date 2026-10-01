package com.trimline.paul.metro;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.AlertDialog;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;

import android.telephony.TelephonyManager;
import android.text.Html;
import android.text.method.ScrollingMovementMethod;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.databinding.DataBindingUtil;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.databinding.Agent;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;

public class cashreceipt extends AppCompatActivity {
    StringBuilder s;
    Agent agent;
    EditText amount,texpenses;
    AutoCompleteTextView memberno;
    TextView membername, id, totalrec, penalty, loanbalance, operationcost;
    ImageButton find, clear;
    Spinner ttypes, tvehicles, tloans;
    String type;
    Button addtrans, postnew, reprint,recoverydate;
    ProgressBar findmember;
    Calendar cdt;
    transaction T;
    DB db = null;
    member f;
    CheckBox recovery;
    List<vehicles> mvehicles = new ArrayList<>();
    SimpleDateFormat batch;
    static String Batch, lastbatch;
    types t;
    ListView ttrans;
    SharedPreferences preferences;
    private summaries.printer p = new summaries.printer();
    static ArrayAdapter<loan> loanAdapter;
    static ArrayAdapter<vehicles> vehicleAdapter;
    String selectedvalue;
    String selectedtext = "";
    String selectedvehicle = "";
    String selectedfleet = "";
    String selectedloan = "";
    vehicles currentvehcle;
    final static int MY_PERMISSIONS_REQUEST_READ_CONTACTS = 0;
    private int mYear, mMonth, mDay, mHour, mMinute;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_cashreceipt);
        agent = DataBindingUtil.setContentView(this, R.layout.activity_cashreceipt);
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        db = new DB(this);
        ttrans = findViewById(R.id.ttrans);
        ttypes = findViewById(R.id.ttype);
        tvehicles = findViewById(R.id.tvehicles);
        tloans = findViewById(R.id.tloans);
        texpenses = findViewById(R.id.texpense);
        recoverydate= findViewById(R.id.recoverydate);
        recoverydate.setVisibility(View.GONE);
        cdt=Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        recoverydate.setText(df.format(cdt.getTime()));
        final Calendar c = Calendar.getInstance();
        DecimalFormat mFormat= new DecimalFormat("00");

        s = new StringBuilder();

        agent.setAgent(login.CurrentAgent);
        mYear = c.get(Calendar.YEAR);
        mMonth = c.get(Calendar.MONTH);
        mDay = c.get(Calendar.DAY_OF_MONTH);

        recoverydate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(cashreceipt.this,
                        new DatePickerDialog.OnDateSetListener() {
                            @Override
                            public void onDateSet(DatePicker view, int year,
                                                  int monthOfYear, int dayOfMonth) {
//dd-MM-yyyy
                                DecimalFormat mFormat = new DecimalFormat("00");
                                String date = mFormat.format(Double.valueOf(dayOfMonth)) + "-" + mFormat.format(Double.valueOf(monthOfYear + 1)) + "-" + year;
                                recoverydate.setText(date);
                            }
                        }, mYear, mMonth, mDay);
                datePickerDialog.getDatePicker().setMaxDate(System.currentTimeMillis());
                datePickerDialog.show();
            }
        });
        recovery = (CheckBox)findViewById(R.id.recovery);
        recovery.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                cdt = Calendar.getInstance();
                Log.i( "onCheckedChanged: ",String.valueOf(isChecked));
                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");

                if (isChecked){
                    cdt.add(Calendar.DATE ,-1);
                    recoverydate.setText(df.format(cdt.getTime()));
                recoverydate.setVisibility(View.VISIBLE);
               }
               else{
                    cdt=Calendar.getInstance();
                    recoverydate.setText(df.format(cdt.getTime()));
                   recoverydate.setVisibility(View.GONE);

               }
            }
        });
        recovery.setChecked(false);
        permissions();
//       if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
//       new getclients().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
//       else
//       new getclients().execute();
//write permission
//
        List<AgentTypes> agtypes = db.getagenttypes()  .stream().filter(o -> o.Agent .contentEquals(login.CurrentAgent.Agent_Code)).collect(Collectors.toList());;


        List<types> showtypes = new ArrayList<types>();

        List<types> types = new ArrayList(db.gettypes());
        for (types t: types
             ) {
            Log.i("dbtype",t.Code);
            for (AgentTypes agentTypes  : agtypes
                 ) {
                if(t.Code.equalsIgnoreCase(agentTypes.Transaction_Type))
                    showtypes.add(t);

                Log.i("agenttype",t.Code);
            }
        }

        final ArrayAdapter<types> dataAdapter;
        Log.i("Showtypes",new Gson().toJson(showtypes));
        Log.i("types",new Gson().toJson(types));

        if (agtypes.size()>0)
            dataAdapter = new ArrayAdapter<types>(this,
                android.R.layout.simple_spinner_item, showtypes);
else
            dataAdapter = new ArrayAdapter<types>(this,
                    android.R.layout.simple_spinner_item, types);

        Log.i( "onCreate: ",String.valueOf(dataAdapter.getCount()));
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        ttypes.setAdapter(dataAdapter);
        ttypes.setPrompt("Select Trans");

//        final ArrayAdapter<types> dataAdapter;
//        dataAdapter = new ArrayAdapter<types>(this,
//                android.R.layout.simple_spinner_item, db.gettypes());
//        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
//        ttypes.setAdapter(dataAdapter);

        ttypes.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                try {
                    Log.i( "onItemSelected: ","Spinner selected");
                    t = dataAdapter.getItem(position);
                    selectedvalue = "";
                    selectedtext = "";
                    selectedloan = "";
                    type = "";
                    if (t.Code != null)
                        if (t.Attach_to_vehicle) {
                            tvehicles.setVisibility(View.VISIBLE);
                            vehicleAdapter = new ArrayAdapter<vehicles>(cashreceipt.this,
                                    android.R.layout.simple_spinner_item, mvehicles);
                            vehicleAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);

                            tvehicles.setAdapter(vehicleAdapter);
                            if (!selectedvehicle.equals("")) {
                                tvehicles.setSelection(getIndex(tvehicles, selectedvehicle));
                            }
                        }
                    if (t.Code.equals("LOANss")) {
                        tloans.setVisibility(View.VISIBLE);
                        loanAdapter = new ArrayAdapter<loan>(cashreceipt.this,
                                android.R.layout.simple_spinner_item, db.getcustomerloans(f.No));
                        loanAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                        tloans.setAdapter(loanAdapter);
                    } else
                        tloans.setVisibility(View.GONE);

                    if (t.Code.equals("EXPENSES")) {
                        texpenses.setVisibility(View.VISIBLE);

                    }
                    else
                    {texpenses.setVisibility(View.GONE); }

                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {
            }
        });
        tvehicles.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectedvalue = vehicleAdapter.getItem(position).Vehicle_Number;
                if (t.Code.equals("SERVICE FEE PAID"))
                    amount.setText(String.valueOf(vehicleAdapter.getItem(position).Daily_Contribution));
                else
                    amount.setText("");
                amount.setSelection(0, amount.getText().length());
            }
            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });
        tloans.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                selectedloan = loanAdapter.getItem(position).Credit_Number;
                selectedtext = loanAdapter.getItem(position).Loan;
            }

            @Override
            public void onNothingSelected(AdapterView<?> parent) {

            }
        });


        cdt = Calendar.getInstance();

        batch = new SimpleDateFormat("yyyyMMddHHmmss");
        Batch = batch.format(cdt.getTime());
        memberno = findViewById(R.id.memberno);
        memberno.setSelection(memberno.getText().length());
        amount = findViewById(R.id.tamount);
        membername = findViewById(R.id.name);
        membername.setMovementMethod(new ScrollingMovementMethod());
        id = findViewById(R.id.id);
        operationcost = findViewById(R.id.operation);
        loanbalance = findViewById(R.id.LoanBalance);
        penalty = findViewById(R.id.Penalty);
        operationcost.setVisibility(View.GONE);
        loanbalance.setVisibility(View.GONE);
        penalty.setVisibility(View.GONE);
        memberno.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long iid) {
                f = null;
                membername.setText("");
                id.setText("");
                loanbalance.setText("");
                penalty.setText("");
                operationcost.setText("");

                selectedvehicle = "";
                //Toast.makeText(getApplicationContext(), memberno.getText().toString(), Toast.LENGTH_LONG).show();
                vehicles veh = db.getvehicle(memberno.getText().toString());
                if (veh != null) {
                    selectedvehicle = veh.Vehicle_Number;
                    Log.i("v1", veh.Code);
                    f = db.getmemberbyid(veh.Code);
                    Log.i("arrears", String.valueOf(veh.Arrears));

                    penalty.setText(Html.fromHtml(String.format("Penalty: <b>%s</b>", String.format("%,.2f", veh.Penalty))));

                    //penalty.setText("Penalty: " + veh.Penalty);
                    operationcost.setText(Html.fromHtml(String.format("Operation: <b>%s</b>", String.format("%,.2f", veh.Arrears))));
                    //operationcost.setText("Operation: " + veh.Arrears);
                }
                if (f==null){
                     veh = db.getvehiclebyfleet(memberno.getText().toString());
                    if (veh != null) {
                        selectedvehicle = veh.Vehicle_Number;
                        selectedfleet = veh.Fleet_No;
                        Log.i("v1", veh.Code);
                        f = db.getmemberbyid(veh.Code);
                        Log.i("arrears", String.valueOf(veh.Arrears));


                        penalty.setText(Html.fromHtml(String.format("Penalty: <b>%s</b>", String.format("%,.2f", veh.Penalty))));

                        //penalty.setText("Penalty: " + veh.Penalty);
                        operationcost.setText(Html.fromHtml(String.format("Operation: <b>%s</b>", String.format("%,.2f", veh.Arrears))));
                        //operationcost.setText("Operation: " + veh.Arrears);
                    }

                }

                if (f == null) {
                    f = db.getmember(memberno.getText().toString());
                }
                if (f == null) {
                    f = db.getmember(memberno.getText().toString());
                }
                if (f == null) {
                    f = db.getmember(String.format("%4s", memberno.getText().toString()).replace(' ', '0'));
                }
                if (f == null) {
                    memberno.setError("Member/vehicle no not found");
                    memberno.selectAll();
                    memberno.requestFocus();
                    return;
                }

                amount.requestFocus();
                //ttypes.setAdapter(dataAdapter);

                s = new StringBuilder();
                s.append(String.format("Reg : <b>%s</b> Fleet No: <b>%s</b><br>", veh.Vehicle_Number,veh.Fleet_No));
                s.append(String.format("_____________________________________________________<br>"));
                membername.setText(Html.fromHtml(s.toString().replace(" ", "&nbsp;")));
                new getcollections(veh.Vehicle_Number,recoverydate.getText().toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

                //id.setText(f.No);
                String loans = String.format("Loan Arrears: <b>%s</b>   Last Payment :<b>%s</b><br/>Savings: <b>%s</b> Last Payment: <b>%s</b><br/>Xmas: <b>%s</b>  Last Payment: <b>%s</b>", String.format("%,.2f", f.Loan_Arrears + f.dailyrepayment),f.Last_update_Loan,String.format("%,.2f",(f.Savings>=0?0:f.Savings)),f.Last_update_savings,String.format("%,.2f",(f.Xmas>=0?0:f.Xmas)),f.Last_update_xmas);

                loanbalance.setText(Html.fromHtml(loans));
                ttypes.setSelection(0, true);
                tvehicles.setAdapter(null);
                Log.i("Looking for vehicles", f.No);
                mvehicles = db.getcustomervehicles(f.No);
            }
        });
        ArrayList<String> clients = new ArrayList<>();
        String result = null;
        try {
            for (vehicles v : db.getvehicles()
                    ) {
                if (v.Vehicle_Number != null)
                    clients.add(v.Vehicle_Number);
                if (v.Fleet_No !=null)
                    if (!v.Fleet_No.equals(""))
                    clients.add(v.Fleet_No);

            }


        } catch (Exception e) {
            Log.i("autocomplete", e.getMessage());
            e.printStackTrace();
        }
        Myvariables.vehs = clients;

        AutoSuggestAdapter adapter = new AutoSuggestAdapter(cashreceipt.this, android.R.layout.simple_list_item_1, Myvariables.vehs);
        memberno.setAdapter(adapter);
        totalrec = findViewById(R.id.totalreceipt);
        clear = findViewById(R.id.clear);
        clear.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                memberno.setText("");
            }
        });
        find = findViewById(R.id.find);
        find.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                f = null;
                membername.setText("");
                id.setText("");
                loanbalance.setText("");
                penalty.setText("");
                operationcost.setText("");
                if (memberno.getText().toString().equals("")) {
                    memberno.setError("Member no required");
                    memberno.requestFocus();
                    return;
                }
                selectedvehicle = "";
                vehicles veh = db.getvehicle(memberno.getText().toString());
                if (veh != null) {
                    selectedvehicle = veh.Vehicle_Number;
                    f = db.getmemberbyid(veh.Code);
                    Log.i("arrears", String.valueOf(veh.Arrears));
                    penalty.setText("Penalty: " + veh.Penalty);

                    operationcost.setText("Operation: " + veh.Arrears);
                }
                if (f == null) {
                    f = db.getmember(memberno.getText().toString());
                }
                if (f == null) {
                    f = db.getmember(memberno.getText().toString());
                }
                if (f == null) {
                    f = db.getmember(String.format("%4s", memberno.getText().toString()).replace(' ', '0'));
                }
                if (f == null) {
                    memberno.setError("Member/vehicle no not found");
                    memberno.selectAll();
                    memberno.requestFocus();
                    return;
                }

                amount.requestFocus();
                //ttypes.setAdapter(dataAdapter);
                membername.setText(f.Name);
                id.setText(f.No);
                loanbalance.setText("Loan Balance: " + f.Loan_Balances);

                ttypes.setSelection(0, true);
                tvehicles.setAdapter(null);
                mvehicles = db.getcustomervehicles(f.ID_No);
            }
        });

        reprint = findViewById(R.id.reprint);
        reprint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Bitmap b = BitmapFactory.decodeResource(getResources(), R.drawable.logo);
                p.printcollection(b, db.gettransbybatch(lastbatch));
            }
        });
        postnew = findViewById(R.id.postnew);
        postnew.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    if (T != null) {
                        db.post(T);
                        Bitmap b = BitmapFactory.decodeResource(getResources(), R.drawable.logo);
                        p.printcollection(b, db.gettransbybatch(Batch));
                        clearfarmer();
                        cleartrans();
                        lastbatch = Batch;
                        T = new transaction();
                        cdt = Calendar.getInstance();
                        batch = new SimpleDateFormat("yyyyMMddHHmmss");
                        Batch = batch.format(cdt.getTime());
                        memberno.requestFocus();
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                    Toast.makeText(getApplicationContext(), "Unable to save, try again", Toast.LENGTH_LONG).show();
                }
            }
        });
        //add
        addtrans = findViewById(R.id.addtrans);
        addtrans.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    memberno.setError(null);
                    amount.setError(null);
                    if (memberno.getText().toString().equals("")) {
                        memberno.setError("Member no required");
                        memberno.requestFocus();
                        return;
                    }
                    if (f == null) {
                        memberno.setError("Member not found");
                        memberno.requestFocus();
                        return;
                    }
                    if (amount.getText().toString().equals("")) {
                        amount.setError("Amount is required");
                        amount.requestFocus();
                        return;
                    }
                    if (Double.parseDouble(amount.getText().toString()) == 0) {
                        amount.setError("Amount is required");
                        amount.requestFocus();
                        return;
                    }
                    if (t == null) {
                        Toast.makeText(getApplicationContext(), "Please select transaction type", Toast.LENGTH_LONG).show();
                        return;
                    }
                    if (t.Code .equalsIgnoreCase( "EXPENSES")){
                        if (texpenses.getText().toString().equalsIgnoreCase(""))
                        {
                            texpenses.setError("A description for this expense is required");
                            texpenses.requestFocus();
                            return;
                        }

                    }
                    cdt = Calendar.getInstance();
                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    final String formattedDate = df.format(cdt.getTime());
                    df = new SimpleDateFormat("HH:mm:ss");
                    final String formattedtime = df.format(cdt.getTime());
                    TelephonyManager mngr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                   // String iidd = mngr.getDeviceId();
                    df = new SimpleDateFormat("yyMMddHHmmss");
                    final String Doc = df.format(cdt.getTime());
                    T = new transaction();
                    T.Recovery = recovery.isChecked();
                    T.Date = recoverydate.getText().toString();// formattedDate;
                    T.Time = formattedtime;
                    T.Account_No = f.No;
                    T.Document_No = selectedvehicle.replace(" ","") + Doc;
                    T.setAmount((Double.parseDouble(amount.getText().toString())));
                    //if (t.Type==1)
                      //  T.Amount = (Double.parseDouble(amount.getText().toString())*-1);
                    T.Account_Name = f.Name;
                    T.Agent_Code = Myvariables.CurrentAgent.Agent_Code;// login.CurrentAgent.Agent_Code;
                    T.Telephone = f.Phone_No;
                    T.Transaction_Type = transaction.T_Type._blank_.ordinal();
                    T.OTTN = Batch;
                    T.Group = selectedfleet;
                    T.sent = true;
                    T.Type = t.Code;
                    T.typename = t.Name;
                    T.Loan_No = selectedvehicle;
                    T.Ward = texpenses.getText().toString();
                    T.Id_No = selectedloan;
                    final transaction ttt = T;
                    ArrayList<transaction> list = db.gettransbytype(T.Date, T.Loan_No, T.Type);
                    if (list.size() > 0) {
                        new AlertDialog.Builder(cashreceipt.this)
                                .setTitle("Duplicate Transaction")
                                .setMessage(T.Loan_No + " " + T.typename + " of " + list.get(0).getAmount() + " has been paid Today. Do you want to Pay again.")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        db.inserttrans(ttt);
                                        ArrayList<transaction> tt = db.gettransbybatch(ttt.OTTN);
                                        double totalr = 0;
                                        for (transaction tr : tt
                                                ) {
                                            totalr += tr.getAmount();
                                        }
                                        totalrec.setText(String.valueOf(totalr));
                                        ListAdapter fc = new trans(cashreceipt.this, tt, db);
                                        ttrans.setAdapter(fc);
                                    }
                                })
                                .setNegativeButton(android.R.string.no, new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int whichButton) {

                                        Toast.makeText(getApplicationContext(), "Transaction cancelled.", Toast.LENGTH_LONG).show();
                                        return;
                                    }
                                }).show();
                    } else
                        db.inserttrans(T);

                    Savefile(T);
                    ArrayList<transaction> tt = db.gettransbybatch(Batch);
                    double totalr = 0;
                    for (transaction tr : tt
                            ) {
                        totalr += tr.getAmount();
                    }
                    totalrec.setText(String.valueOf(totalr));
                    ListAdapter fc = new trans(cashreceipt.this, tt, db);
                    ttrans.setAdapter(fc);
                    cleartrans();
                } catch (Exception ex) {
                    ex.printStackTrace();
                    Toast.makeText(getApplicationContext(), ex.getMessage(), Toast.LENGTH_LONG).show();
                }
            }
        });
    }
    private static final int PERMISSION_REQUEST_CODE = 200;
    private  boolean checkPermission(transaction c) {

        return ContextCompat.checkSelfPermission(this, WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED
                && ContextCompat.checkSelfPermission(this, READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED
                ;
    }
    private void requestPermissionAndContinue(transaction c) {
        if (ContextCompat.checkSelfPermission(this, WRITE_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED
                && ContextCompat.checkSelfPermission(this, READ_EXTERNAL_STORAGE) != PackageManager.PERMISSION_GRANTED) {

            if (ActivityCompat.shouldShowRequestPermissionRationale(this, WRITE_EXTERNAL_STORAGE)
                    && ActivityCompat.shouldShowRequestPermissionRationale(this, READ_EXTERNAL_STORAGE)) {
                AlertDialog.Builder alertBuilder = new AlertDialog.Builder(this);
                alertBuilder.setCancelable(true);
                alertBuilder.setTitle("Required Permission");
                alertBuilder.setMessage("Application requires access rights");
                alertBuilder.setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                    @TargetApi(Build.VERSION_CODES.JELLY_BEAN)
                    public void onClick(DialogInterface dialog, int which) {
                        ActivityCompat.requestPermissions(cashreceipt.this, new String[]{WRITE_EXTERNAL_STORAGE
                                , READ_EXTERNAL_STORAGE}, PERMISSION_REQUEST_CODE);
                    }
                });
                AlertDialog alert = alertBuilder.create();
                alert.show();
                Log.e("", "permission denied, show dialog");
            } else {
                ActivityCompat.requestPermissions(cashreceipt.this, new String[]{WRITE_EXTERNAL_STORAGE,
                        READ_EXTERNAL_STORAGE}, PERMISSION_REQUEST_CODE);
            }
        } else {
            createfile(c);
        }
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {

        if (requestCode == PERMISSION_REQUEST_CODE) {
            if (permissions.length > 0 && grantResults.length > 0) {

                boolean flag = true;
                for (int i = 0; i < grantResults.length; i++) {
                    if (grantResults[i] != PackageManager.PERMISSION_GRANTED) {
                        flag = false;
                    }
                }

            } else {

            }
        } else {
            super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        }
    }


    @Override
    public void onResume(){
        super.onResume();
        String pref ="";
        String value = preferences.getString("User", "");
        if (value != null || value != "") {
            Log.i("User",value);
            Myvariables.CurrentAgent = db.getagent(value.toUpperCase());
            if (Myvariables.CurrentAgent !=null){
                Log.i("User","Found User"+ Myvariables.CurrentAgent.Name);
            }
        }

    }

    public void permissions() {
        int permissionCheck = ContextCompat.checkSelfPermission(this, Manifest.permission.READ_PHONE_STATE);
        if (permissionCheck != PackageManager.PERMISSION_GRANTED) {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this,
                    Manifest.permission.READ_PHONE_STATE)) {

                // Show an explanation to the user *asynchronously* -- don't block
                // this thread waiting for the user's response! After the user
// sees the explanation, try again to request the permission.

            } else {

// No explanation needed, we can request the permission.

                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.READ_PHONE_STATE},
                        MY_PERMISSIONS_REQUEST_READ_CONTACTS);

                // MY_PERMISSIONS_REQUEST_READ_CONTACTS is an
                // app-defined int constant. The callback method gets the
                // result of the request.
            }


        }
    }



    private int getIndex(Spinner spinner, String myString) {
        int index = 0;

        for (int i = 0; i < spinner.getCount(); i++) {
            if (((vehicles) spinner.getItemAtPosition(i)).Code.equalsIgnoreCase(myString)) {
                index = i;
                break;
            }
        }
        return index;
    }
public static void createfile(transaction c)
{
    try {
    Log.i("File","Saving file");
    File root;
    if (android.os.Environment.getExternalStorageState().equals(
            android.os.Environment.MEDIA_MOUNTED)) {
        root = new File(Environment.getExternalStorageDirectory(), "Mbranch/");
    } else
        root = new File("/data/Mbranch/");
    String data = c.Date + " " + c.Time + "," + c.OTTN + "," + c.Document_No + "," + c.Type + "," + c.getAmount() + "," + c.Account_No + "," + c.Agent_Code + "\n";
    if (!root.exists()) {
        root.mkdirs();
    }
    File gpxfile = new File(root, c.Date);
    FileWriter writer = new FileWriter(gpxfile, true);
    writer.append(data);
    writer.flush();
    writer.close();

    }
    catch (IOException e) {
        e.printStackTrace();
    }catch (Exception ex) {
        ex.printStackTrace();
    }
}

    public  void Savefile(transaction c) {
        try {
            if (!checkPermission(c)) {
               createfile(c);
            } else {
                if (checkPermission(c)) {
                    requestPermissionAndContinue(c);
                } else {
                    createfile(c);
                }
            }
        }catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private void clearfarmer() {
        memberno.setText("");
        memberno.setSelection(memberno.getText().length());
        membername.setText("");
        id.setText("");
        recovery.setChecked(false);
        f = null;
        totalrec.setText("");
        ttrans.setAdapter(null);
        texpenses.setText("");
    }

    private void cleartrans() {
        amount.setText("");
        ttypes.setSelection(0);
        selectedvalue = "";
        selectedtext = "";
        selectedloan = "";


        //t = null;
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);

        return true;
    }

    private class getclients extends AsyncTask<Void, String, ArrayList<String>> {
        @Override
        protected void onPreExecute() {

        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_SHORT).show();
        }

        @Override
        protected ArrayList<String> doInBackground(Void... params) {
            ArrayList<String> clients = new ArrayList<>();
            String result = null;
            try {
                for (vehicles v : db.getvehicles()
                        ) {
                    if (v.Vehicle_Number != null) {
                        clients.add(v.Vehicle_Number);

                    }
                }
                for (member m : db.getmembers()
                        ) {
                    if (m.No != null) {
                        clients.add(m.No);

                    }
                }
            } catch (Exception e) {
                publishProgress(e.getMessage());
                e.printStackTrace();
            }
            return clients;
        }

        @Override
        protected void onPostExecute(ArrayList<String> res) {
            try {
                AutoSuggestAdapter adapter = new AutoSuggestAdapter(cashreceipt.this, android.R.layout.simple_list_item_1, res);
                memberno.setAdapter(adapter);
                //  Toast.makeText(getApplicationContext(), res.size() + " Members attached", Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private class getcollections extends AsyncTask<String, Void, List<transaction>> {
        String c = null;
        String date =null;

        getcollections(String ff,String date) {
            c = ff;
            this.date =date;
        }

        @Override
        protected void onPreExecute() {
        }

        @Override
        protected List<transaction> doInBackground(String... params) {
            List<transaction> results = null;
            String result = null;
            try {
//                Calendar cdt = Calendar.getInstance();
//                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//                final String formattedDate = df.format(cdt.getTime());

                summaries.getdata gt = new summaries.getdata();
                gt.firstdate = date;
                gt.user = c;

                Gson g = new Gson();
                result = g.toJson(gt);
                result = JsonParser.postjson("GetCollections", "data", result);
                Type localType = new TypeToken<List<transaction>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();

            }
            return results;
        }

        @Override
        protected void onPostExecute(List<transaction> res) {
            try {

                if (res != null)
                    if (res.size() > 0) {
                        List<types> tyy = db.gettypes();

                        for (int i = 0; i < res.size(); i++) {

                            transaction t = res.get(i);
                            List<types> rr = tyy.stream().filter(o -> o.Code.contentEquals(t.Type)).collect(Collectors.toList());
                            String type;
                            if (rr.size() > 0)
                                type = rr.get(0).Name;
                            else
                                type = t.Type;
                            String amount = String.format("%,.2f", t.getAmount());
//if (t.Constituency.equalsIgnoreCase("1"))
  //   amount = String.format("<s>%,.2f</s>", t.Amount);

                            if (i == res.size()-1)
                                s.append(String.format("<u>%8s | %15s | %10s | <b>%10s</b></u><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
                            else
                                s.append(String.format("%8s | %15s | %10s | <b>%10s</b><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
                        }
                        String total = String.format("%,.2f", res.stream().mapToDouble(a -> a.getAmount()).sum());
                        s.append(String.format("<u>%10s | <b>%10s</b></u><br>","TOTAL", total));

                    } else

                    {  Toast.makeText(getApplicationContext(), "No payment for Vehicle " + c + " today", Toast.LENGTH_LONG).show();
                s.append(String.format("No payment for vehicle %s today",c));}
                membername.setText(Html.fromHtml(s.toString().replace(" ", "&nbsp;")));

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
