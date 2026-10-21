package com.trimline.paul.m_branch;

import android.Manifest;
import android.annotation.TargetApi;
import android.app.AlertDialog;
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
import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.appcompat.app.AppCompatActivity;
import android.telephony.TelephonyManager;
import android.text.Html;
import android.util.Log;
import android.view.Menu;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;
import java.util.stream.Collectors;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.google.android.material.textfield.TextInputLayout;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import static android.Manifest.permission.READ_EXTERNAL_STORAGE;
import static android.Manifest.permission.WRITE_EXTERNAL_STORAGE;
import static java.util.stream.Collectors.groupingBy;

public class cashreceipt extends AppCompatActivity {
    StringBuilder s;
    EditText amount;
    AutoCompleteTextView memberno;
    TextView membername, id, totalrec, penalty, operationcost;
    TextView loanArrears, savingsValue, xmasValue, depositValue, welfareValue, parkingValue;
    LinearLayout collectionsBox;
    ImageButton find, clear;
    Spinner ttypes, tloans;
    String type;
    Button addtrans, postnew, reprint;
    ProgressBar findmember;
    Calendar cdt;
    transaction T;
    DB db = null;
    Date tdate;
    member f;
    List<vehicles> mvehicles = new ArrayList<>();
    SimpleDateFormat batch;
    static String Batch, lastbatch;
    types t;
    ListView ttrans;
    SharedPreferences preferences;
    private summaries.printer p = new summaries.printer();
    static ArrayAdapter<loan> loanAdapter;
    String selectedvalue;
    String selectedtext = "";
    String selectedvehicle = "";
    String selectedloan = "";
    TextInputLayout amountLayout;
    vehicles currentvehcle;
    final static int MY_PERMISSIONS_REQUEST_READ_CONTACTS = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cashreceipt);
        findViewById(R.id.back).setOnClickListener(v -> finish());
        ((android.widget.TextView) findViewById(R.id.backTitle)).setText("Cash receipt");
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        db = new DB(this);
        ttrans = findViewById(R.id.ttrans);
        ttypes = findViewById(R.id.ttype);
        tloans = findViewById(R.id.tloans);
        collectionsBox = findViewById(R.id.collectionsBox);
        permissions();


//write permission//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
////            new getclients().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
////        else
////        new getclients().execute();
new Getdate().execute();
        final ArrayAdapter<types> dataAdapter;
        dataAdapter = new ArrayAdapter<types>(this, R.layout.spinner_item, db.gettypes());
        dataAdapter.setDropDownViewResource(R.layout.spinner_dropdown_item);
        ttypes.setAdapter(dataAdapter);

        ttypes.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                try {
                    setAmountHint("Amount");
                    t = dataAdapter.getItem(position);
                    selectedvalue = "";
                    selectedtext = "";
                    selectedloan = "";
                    type = "";
                    if (t.Code != null) {
                        if (t.Attach_to_vehicle && !selectedvehicle.isEmpty()) {
                            vehicles selected = vehicleByNumber(selectedvehicle);
                            if (selected != null && "SERVICE FEE PAID".equals(t.Code)) {
                                amount.setText(String.valueOf(selected.Daily_Contribution));
                                amount.setSelection(0, amount.getText().length());
                            }
                        }
                        if (t.Code.equals("FUEL"))
                            setAmountHint("LITRES");
                    }

                    if (t.Code.equals("LOAN")) {
                        tloans.setVisibility(View.VISIBLE);
                        loanAdapter = new ArrayAdapter<loan>(cashreceipt.this, R.layout.spinner_item, db.getcustomerloans(f.No));
                        loanAdapter.setDropDownViewResource(R.layout.spinner_dropdown_item);
                        tloans.setAdapter(loanAdapter);
                    } else
                        tloans.setVisibility(View.GONE);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
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
        amountLayout = findViewById(R.id.input_layout_amount);
        membername = findViewById(R.id.name);
        id = findViewById(R.id.id);
        operationcost = findViewById(R.id.operation);
        penalty = findViewById(R.id.Penalty);
        loanArrears = findViewById(R.id.loanArrears);
        savingsValue = findViewById(R.id.savingsValue);
        xmasValue = findViewById(R.id.xmasValue);
        depositValue = findViewById(R.id.depositValue);
        welfareValue = findViewById(R.id.welfareValue);
        parkingValue = findViewById(R.id.parkingValue);
        memberno.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long iid) {
                f = null;
                membername.setText("");
                id.setText("");
                clearBalances();
                selectedvehicle = "";
                Toast.makeText(getApplicationContext(), memberno.getText().toString(), Toast.LENGTH_LONG).show();
                vehicles veh = db.getvehicle(memberno.getText().toString());
                if (veh != null) {
                    selectedvehicle = veh.Vehicle_Number;
                    selectedvalue = veh.Vehicle_Number;
                    Log.i("v1", veh.Code);
                    f = db.getmemberbyid(veh.Code);
                    Log.i("arrears", String.valueOf(veh.Arrears));
                    currentvehcle = veh;
                    showVehicle(veh);
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
                ttypes.setAdapter(dataAdapter);

                membername.setText(Html.fromHtml(String.format("<b>%s</b>-%s", f.No, f.Name)));
                cdt=Calendar.getInstance();
                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");


                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
                    Log.i("sending", "here");
                    new Getmember(f.No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                    new getcollections(f.No,df.format(cdt.getTime()).toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                    //new getcollections(f.No,df.format(cdt.getTime()).toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

                } else {
                    Log.i("sending", "here2");
                    new Getmember(f.No).execute();
                    new getcollections(f.No,df.format(cdt.getTime()).toString()).execute();

                }
                //id.setText(f.No);
                showBalances(f);
                ttypes.setSelection(0, true);
                Log.i("Looking for vehicles", f.No);
                mvehicles = db.getcustomervehicles(f.No);
                applyDefaultVehicle();
            }
        });
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
                clearBalances();
                if (memberno.getText().toString().equals("")) {
                    memberno.setError("Member no required");
                    memberno.requestFocus();
                    return;
                }
                selectedvehicle = "";
                vehicles veh = db.getvehicle(memberno.getText().toString());
                if (veh != null) {
                    selectedvehicle = veh.Vehicle_Number;
                    selectedvalue = veh.Vehicle_Number;
                    f = db.getmemberbyid(veh.Code);
                    Log.i("arrears", String.valueOf(veh.Arrears));
                    showVehicle(veh);
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
                ttypes.setAdapter(dataAdapter);
                membername.setText(f.Name);
                id.setText(f.No);
                setMoney(loanArrears, f.Loan_Balances);

                ttypes.setSelection(0, true);
                mvehicles = db.getcustomervehicles(f.ID_No);
                applyDefaultVehicle();
            }
        });

        reprint = findViewById(R.id.reprint);
        reprint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Bitmap b = BitmapFactory.decodeResource(getResources(), R.drawable.logo);
                p.printcollectioncopy(b, db.gettransbybatch(lastbatch));
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
                    if (Boolean.TRUE.equals(t.Attach_to_vehicle) && selectedvehicle.isEmpty() && !mvehicles.isEmpty()) {
                        memberno.setError("Enter the vehicle no in the account field");
                        memberno.requestFocus();
                        Toast.makeText(getApplicationContext(), "Enter the vehicle no in the account field", Toast.LENGTH_LONG).show();
                        return;
                    }
                    cdt = Calendar.getInstance();
                    SimpleDateFormat dy = new SimpleDateFormat("yy");
                    final String formattedy = dy.format(cdt.getTime());

                    SimpleDateFormat dm = new SimpleDateFormat("MM");
                    final String formattedm = dm.format(cdt.getTime());
                    int d = Integer.valueOf(formattedy)+ Integer.valueOf(formattedm);


                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                    final String formattedDate = df.format(cdt.getTime());
                    df = new SimpleDateFormat("HH:mm:ss");
                    final String formattedtime = df.format(cdt.getTime());
                    TelephonyManager mngr = (TelephonyManager) getSystemService(Context.TELEPHONY_SERVICE);
                    //String iidd = mngr.getDeviceId();
                    df = new SimpleDateFormat("ddHHmmssSSS");
                    final String Doc = df.format(cdt.getTime());
                    T = new transaction();
                    T.Date = formattedDate;
                    T.Time = formattedtime;
                    T.Account_No = f.No;
                    T.Document_No = f.No + Doc;
                    if ( !selectedvalue.equals(""))
                        T.Document_No = selectedvalue.substring(2) + String.valueOf(d)+ Doc;//BJ475P220810172021

                    T.Amount = (Double.parseDouble(amount.getText().toString()));
                    T.Account_Name = f.Name;
                    T.Agent_Code = Myvariables.CurrentAgent.Agent_Code;// login.CurrentAgent.Agent_Code;
                    T.Telephone = f.Phone_No;
                    T.Transaction_Type = transaction.T_Type._blank_.ordinal();
                    T.OTTN = Batch;
                    T.sent = true;
                    T.Type = t.Code;
                    T.typename = t.Name;
                    T.Loan_No = selectedvehicle;
                    T.Ward = selectedtext;
                    T.Id_No = selectedloan;
                    final transaction ttt = T;
                    ArrayList<transaction> list = db.gettransbytype(T.Date, T.Loan_No, T.Type);
                    if (list.size() > 0) {
                        new AlertDialog.Builder(cashreceipt.this)
                                .setTitle("Duplicate Transaction")
                                .setMessage(T.Loan_No + " " + T.typename + " of " + list.get(0).Amount + " has been paid Today. Do you want to Pay again.")
                                .setIcon(android.R.drawable.ic_dialog_alert)
                                .setPositiveButton(android.R.string.yes, new DialogInterface.OnClickListener() {
                                    @Override
                                    public void onClick(DialogInterface dialog, int which) {
                                        db.inserttrans(ttt);
                                        ArrayList<transaction> tt = db.gettransbybatch(ttt.OTTN);
                                        double totalr = 0;
                                        for (transaction tr : tt
                                        ) {
                                            totalr += tr.Amount;
                                        }
                                        totalrec.setText(String.format(java.util.Locale.US, "%,.2f", totalr));
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
                        totalr += tr.Amount;
                    }
                    totalrec.setText(String.format(java.util.Locale.US, "%,.2f", totalr));
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

    private void setMoney(TextView tv, double value) {
        if (tv == null) return;
        tv.setText(String.format(java.util.Locale.US, "%,.2f", value));
    }

    private void clearBalances() {
        setMoney(loanArrears, 0);
        setMoney(savingsValue, 0);
        setMoney(xmasValue, 0);
        setMoney(depositValue, 0);
        setMoney(welfareValue, 0);
        setMoney(parkingValue, 0);
        setMoney(operationcost, 0);
        setMoney(penalty, 0);
        if (collectionsBox != null) collectionsBox.removeAllViews();
    }

    private void showVehicle(vehicles v) {
        if (v == null) return;
        setMoney(penalty, v.Penalty);
        setMoney(operationcost, v.Arrears);
    }

    private vehicles vehicleByNumber(String number) {
        if (number == null) return null;
        for (vehicles v : mvehicles) {
            if (number.equals(v.Vehicle_Number)) return v;
        }
        return null;
    }

    /** When the account has exactly one vehicle, use it automatically. */
    private void applyDefaultVehicle() {
        if (selectedvehicle != null && !selectedvehicle.isEmpty()) return;
        if (mvehicles.size() == 1) {
            currentvehcle = mvehicles.get(0);
            selectedvehicle = currentvehcle.Vehicle_Number;
            selectedvalue = selectedvehicle;
            showVehicle(currentvehcle);
        }
    }

    private void showBalances(member f) {
        if (f == null) return;
        boolean fullView = Myvariables.CurrentAgent != null && Myvariables.CurrentAgent.Account_type == 1;
        setMoney(loanArrears, f.Loan_Arrears + f.dailyrepayment);
        setMoney(savingsValue, fullView ? f.Savings : (f.Savings >= 0 ? 0 : f.Savings));
        setMoney(xmasValue, fullView ? f.Xmas : (f.Xmas >= 0 ? 0 : f.Xmas));
        setMoney(depositValue, f.Deposit);
        setMoney(welfareValue, f.Welfare);
        setMoney(parkingValue, f.ParkingBal);
    }

    private String typeName(List<types> list, String code) {
        if (list != null && code != null) {
            for (types item : list) {
                if (code.equals(item.Code)) {
                    return item.Name == null ? code.toUpperCase() : item.Name.toUpperCase();
                }
            }
        }
        return code == null ? "" : code.toUpperCase();
    }

    private void addCollectionRow(String label, double amount, boolean totalRow) {
        if (collectionsBox == null) return;
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(android.view.Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(6), 0, dp(6));

        TextView name = new TextView(this);
        name.setText(label);
        name.setTextColor(ContextCompat.getColor(this, totalRow ? R.color.brand_ink : R.color.brand_text));
        name.setTextSize(13);
        name.setTypeface(name.getTypeface(), totalRow ? android.graphics.Typeface.BOLD : android.graphics.Typeface.NORMAL);
        name.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView value = new TextView(this);
        value.setText(String.format(java.util.Locale.US, "%,.2f", amount));
        value.setTextColor(ContextCompat.getColor(this, totalRow ? R.color.brand_orange_dark : R.color.brand_ink));
        value.setTextSize(13);
        value.setTypeface(value.getTypeface(), android.graphics.Typeface.BOLD);
        value.setGravity(android.view.Gravity.END);

        row.addView(name);
        row.addView(value);
        collectionsBox.addView(row);
    }

    private void showCollectionsMessage(String message) {
        if (collectionsBox == null) return;
        TextView tv = new TextView(this);
        tv.setText(message);
        tv.setTextColor(ContextCompat.getColor(this, R.color.brand_muted));
        tv.setTextSize(12);
        tv.setPadding(0, dp(6), 0, dp(6));
        collectionsBox.addView(tv);
    }

    private int dp(int value) {
        return (int) (getResources().getDisplayMetrics().density * value);
    }

    private void setAmountHint(String text) {
        if (amountLayout != null) {
            amountLayout.setHint(text);
        } else if (amount != null) {
            amount.setHint(text);
        }
    }
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
        //String data = c.Date + " " + c.Time + "," + c.OTTN + "," + c.Document_No + "," + c.Type + "," + c.Amount + "," + c.Account_No + "," + c.Agent_Code + "\n";
        String data = new Gson().toJson(c);// c.Date + " " + c.Time + "," + c.OTTN + "," + c.Document_No + "," + c.Type + "," + c.Amount + "," + c.Account_No + "," + c.Agent_Code + "\n";
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

        f = null;
        totalrec.setText("");
        ttrans.setAdapter(null);
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

    private class Getmember extends AsyncTask<Void, String, member> {
        private String no;

        Getmember(String No) {
            this.no = No;
        }

        @Override
        protected void onPreExecute() {

        }

        @Override
        protected member doInBackground(Void... params) {
            member results = null;
            String result = null;
            try {
                String key = no;
                Boolean all = false;
                try {
                    Gson g = new Gson();
                    result = JsonParser.postjson("getmember", "No", key);
                    Type localType = new TypeToken<member>() {
                    }.getType();
                    results = new Gson().fromJson(result, localType);
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
        protected void onPostExecute(member f) {
            try {
                if (f != null) {
                    showBalances(f);

                    List<vehicles> v = Arrays.asList(f.vehicles);

                    List<vehicles> vv = v.stream().filter(o -> o.Vehicle_Number.contentEquals(selectedvehicle)).collect(Collectors.toList());
                    if (vv != null)
                        if (vv.size() > 0) {
                            showVehicle(vv.get(0));
                        }
                }
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
                //result = JsonParser.postjson("GetCollections", "data", result);
                result = JsonParser.postjson("GetCollection_member", "data", result);
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
                if (collectionsBox == null) return;
                collectionsBox.removeAllViews();

                if (res == null || res.isEmpty()) {
                    Toast.makeText(getApplicationContext(), "No payment for Vehicle " + c + " today", Toast.LENGTH_LONG).show();
                    showCollectionsMessage("No payment for vehicle " + c + " today");
                    return;
                }

                List<types> tyy = db.gettypes();
                List<String> membertrans = Arrays.asList("SACCO", "WELFARE", "SHARE");

                // member-wide collections
                List<transaction> memtrans = res.stream()
                        .filter(o -> o.getType() != null && membertrans.contains(o.getType()))
                        .collect(Collectors.toList());
                Map<String, Double> Trans = memtrans.stream().collect(
                        Collectors.groupingBy(transaction::getType, Collectors.summingDouble(transaction::getAmount)));
                for (Map.Entry<String, Double> pair : Trans.entrySet()) {
                    addCollectionRow(typeName(tyy, pair.getKey()), pair.getValue(), false);
                }

                // collections for the selected vehicle
                String vehicleNo = currentvehcle == null ? null : currentvehcle.Vehicle_Number;
                memtrans = res.stream()
                        .filter(o -> o.getType() != null && !membertrans.contains(o.getType())
                                && vehicleNo != null && o.Loan_No != null && o.Loan_No.contentEquals(vehicleNo))
                        .collect(Collectors.toList());
                Map<String, Double> vehicleTrans = memtrans.stream().collect(
                        Collectors.groupingBy(transaction::getType, Collectors.summingDouble(transaction::getAmount)));
                for (Map.Entry<String, Double> pair : vehicleTrans.entrySet()) {
                    addCollectionRow(typeName(tyy, pair.getKey()), pair.getValue(), false);
                }

                double total = res.stream().mapToDouble(a -> a.Amount == null ? 0 : a.Amount).sum();
                addCollectionRow("TOTAL", total, true);

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private class Getdate extends AsyncTask<Void, Void, Date> {
        private String no;

        @Override
        protected void onPreExecute() {

        }

        @Override
        protected Date doInBackground(Void... params) {
            Date results = null;
            String result = null;
            try {
                String key = no;
                Boolean all = false;
                try {
                    Gson g = new Gson();
                    result = JsonParser.postjson("TransactionDate", "", null);
                    Type localType = new TypeToken<member>() {
                    }.getType();
                    results = new Gson().fromJson(result, localType);
                    // publishProgress(results.size()+  " Members updated");
                } catch (Exception ex) {

                    ex.printStackTrace();
                }
                //}
            } catch (Exception e) {

                e.printStackTrace();
            }
            return results;
        }

        protected void onPostExecute(Date f) {
            try {
                if (f != null) {
                   tdate    = f;
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
