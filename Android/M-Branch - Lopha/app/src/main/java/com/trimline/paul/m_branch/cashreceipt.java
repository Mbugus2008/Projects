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
    TextView membername, id, totalrec, penalty, loanbalance, operationcost,collections;
    ImageButton find, clear;
    Spinner ttypes, tvehicles, tloans;
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
    static ArrayAdapter<vehicles> vehicleAdapter;
    String selectedvalue;
    String selectedtext = "";
    String selectedvehicle = "";
    String selectedloan = "";
    vehicles currentvehcle;
    final static int MY_PERMISSIONS_REQUEST_READ_CONTACTS = 0;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cashreceipt);
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        db = new DB(this);
        ttrans = findViewById(R.id.ttrans);
        ttypes = findViewById(R.id.ttype);
        tvehicles = findViewById(R.id.tvehicles);
        tloans = findViewById(R.id.tloans);
        collections = findViewById(R.id.collections);
        permissions();


//write permission//        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
////            new getclients().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
////        else
////        new getclients().execute();
new Getdate().execute();
        final ArrayAdapter<types> dataAdapter;
        dataAdapter = new ArrayAdapter<types>(this,android.R.layout.simple_spinner_item, db.gettypes());
        dataAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        ttypes.setAdapter(dataAdapter);

        ttypes.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            @Override
            public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                try {
                    amount.setHint("AMOUNT");
                    t = dataAdapter.getItem(position);
                    selectedvalue = "";
                    selectedtext = "";
                    selectedloan = "";
                    type = "";
                    if (t.Code != null)
                        if (t.Attach_to_vehicle) {
                            tvehicles.setVisibility(View.VISIBLE);
                            vehicleAdapter = new ArrayAdapter<vehicles>(cashreceipt.this, android.R.layout.simple_spinner_item, mvehicles);
                            vehicleAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
                            tvehicles.setAdapter(vehicleAdapter);
                            if (!selectedvehicle.equals("")) {
                                tvehicles.setSelection(getIndex(tvehicles, selectedvehicle));
                            }
                        }
                    if (t.Code.equals("FUEL"))
                        amount.setHint("LITRES");

                    if (t.Code.equals("LOAN")) {
                        tloans.setVisibility(View.VISIBLE);
                        loanAdapter = new ArrayAdapter<loan>(cashreceipt.this, android.R.layout.simple_spinner_item, db.getcustomerloans(f.No));
                        loanAdapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
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
        id = findViewById(R.id.id);
        operationcost = findViewById(R.id.operation);
        loanbalance = findViewById(R.id.LoanBalance);
        penalty = findViewById(R.id.Penalty);
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
                Toast.makeText(getApplicationContext(), memberno.getText().toString(), Toast.LENGTH_LONG).show();
                vehicles veh = db.getvehicle(memberno.getText().toString());
                if (veh != null) {
                    selectedvehicle = veh.Vehicle_Number;
                    Log.i("v1", veh.Code);
                    f = db.getmemberbyid(veh.Code);
                    Log.i("arrears", String.valueOf(veh.Arrears));
                    currentvehcle = veh;
                    penalty.setText(Html.fromHtml(String.format("Penalty: <b>%s</b>", String.format("%,.2f", veh.Penalty))));

                    //penalty.setText("Penalty: " + veh.Penalty);
                    operationcost.setText(Html.fromHtml(String.format("Operation: <b>%s</b>", String.format("%,.2f", veh.Arrears))));
                    //operationcost.setText("Operation: " + veh.Arrears);
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
                String loans = String.format("Loan Arrears: <b>%s</b>   Last Payment :<b>%s</b><br/>Savings: <b>%s</b> Last Payment: <b>%s</b><br/>Xmas: <b>%s</b>  Last Payment: <b>%s</b>", String.format("%,.2f", f.Loan_Arrears + f.dailyrepayment), f.Last_update_Loan, String.format("%,.2f", (f.Savings >= 0 ? 0 : f.Savings)), f.Last_update_savings, String.format("%,.2f", (f.Xmas >= 0 ? 0 : f.Xmas)), f.Last_update_xmas);

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
                if (v.Vehicle_Number != null) {
                    clients.add(v.Vehicle_Number);

                }
            }
            for (member m : db.getmembers()
            ) {
                if (m.No != null) {
                    clients.add(m.No);
                    Log.i("Member", m.No);
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
                ttypes.setAdapter(dataAdapter);
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
                        totalr += tr.Amount;
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
                    String loans = String.format("Loan Arrears: <b>%s</b> Last Payment :<b>%s</b><br/>" +
                                    "Savings: <b>%s</b> Last Payment: <b>%s</b><br/>" +
                                    "Xmas: <b>%s</b>  Last Payment: <b>%s</b><br/><br/>" +
                                    "Deposit arrears: <b>%s</b><br/>"+
                                    "Welfare arrears: <b>%s</b>"+
                                    "Parking arrears: <b>%s</b>",
                            String.format("%,.2f", f.Loan_Arrears + f.dailyrepayment),
                            f.Last_update_Loan, String.format("%,.2f", (f.Savings >= 0 ? 0 : f.Savings)),
                            f.Last_update_savings, String.format("%,.2f", (f.Xmas >= 0 ? 0 : f.Xmas)), f.Last_update_xmas,String.format("%,.2f",f.Deposit),String.format("%,.2f",f.Welfare)
                            ,String.format("%,.2f",f.ParkingBal));

                    if (Myvariables.CurrentAgent.Account_type == 1)
                        loans = String.format("Loan Arrears: <b>%s</b>  " +
                                        " Last Payment :<b>%s</b><br/>" +
                                        "Savings: <b>%s</b> " +
                                        "Last Payment: <b>%s</b><br/>" +
                                        "Xmas: <b>%s</b>  " +
                                        "Last Payment: <b>%s</b><br/>"+
                                        "Deposit arrears: <b>%s</b><br/>"+
                                        "Welfare arrears: <b>%s</b><br/>"+
                                "Parking arrears: <b>%s</b><br/>",
                                String.format("%,.2f", f.Loan_Arrears + f.dailyrepayment),
                                f.Last_update_Loan, String.format("%,.2f", f.Savings),
                                f.Last_update_savings, String.format("%,.2f", f.Xmas), f.Last_update_xmas,String.format("%,.2f",f.Deposit),String.format("%,.2f",f.Welfare),String.format("%,.2f",f.ParkingBal));

                    loanbalance.setText(Html.fromHtml(loans));

                    List<vehicles> v = Arrays.asList(f.vehicles);

                    List<vehicles> vv = v.stream().filter(o -> o.Vehicle_Number.contentEquals(selectedvehicle)).collect(Collectors.toList());
                    if (vv != null)
                        if (vv.size() > 0) {
                            penalty.setText(Html.fromHtml(String.format("Penalty: <b>%s</b>", String.format("%,.2f", vv.get(0).Penalty))));

//                            operationcost.setText(Html.fromHtml(String.format("Penalty: <b>%s</b><br/> Operation: <b>%s</b><br/>Parking Bal: <b>%s</b>",String.format("%,.2f", vv.get(0).Penalty), String.format("%,.2f", vv.get(0).Arrears),String.format("%,.2f", vv.get(0).Parking))));

                            operationcost.setText(Html.fromHtml(String.format("Penalty: <b>%s</b><br/> Operation: <b>%s</b><br/>",String.format("%,.2f", vv.get(0).Penalty), String.format("%,.2f", vv.get(0).Arrears))));
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

                if (res != null)
                    if (res.size() > 0) {
                        s= new StringBuilder();
                        List<types> tyy = db.gettypes();
                        List<String> membertrans = Arrays.asList("SACCO", "WELFARE","SHARE");
                        List<transaction> memtrans =  res.stream().filter(o ->  membertrans.contains(o.getType())  ).collect(Collectors.toList());


                        Map<String, Double> Trans = memtrans.stream().collect(
                                Collectors.groupingBy(transaction::getType, Collectors.summingDouble(transaction::getAmount)));
                        s.append(String.format(" <b><u>Todays Collections</u></b><br>"));
                        Iterator it = Trans.entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry pair = (Map.Entry)it.next();

                            System.out.println(pair.getKey() + " = " + pair.getValue());
                            List<types> rr = tyy.stream().filter(o -> o.Code.contentEquals(pair.getKey().toString())).collect(Collectors.toList());
                            String type;
                            if (rr.size() > 0)
                                type = rr.get(0).Name;
                            else
                                type = pair.getKey().toString();
                            String amount = String.format("%,.2f", pair.getValue());
//                            if (i == res.size()-1)
//                                s.append(String.format("<u>%8s | %15s | <b>%10s</b></u><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
//                            else

                                s.append(String.format(" %15s | <b>%10s</b><br>",  type.toUpperCase(), amount));

                        }
                        s.append(String.format("<br>"));
                        memtrans =  res.stream().filter(o -> ! membertrans.contains(o.getType()) && o.Loan_No.contentEquals(currentvehcle.Vehicle_Number)  ).collect(Collectors.toList());


                        Trans = memtrans.stream().collect(
                                Collectors.groupingBy(transaction::getType, Collectors.summingDouble(transaction::getAmount)));

                  it = Trans.entrySet().iterator();
                        while (it.hasNext()) {
                            Map.Entry pair = (Map.Entry)it.next();

                            System.out.println(pair.getKey() + " = " + pair.getValue());
                            List<types> rr = tyy.stream().filter(o -> o.Code.contentEquals(pair.getKey().toString())).collect(Collectors.toList());
                            String type;
                            if (rr.size() > 0)
                                type = rr.get(0).Name;
                            else
                                type = pair.getKey().toString();
                            String amount = String.format("%,.2f", pair.getValue());
//                            if (i == res.size()-1)
//                                s.append(String.format("<u>%8s | %15s | <b>%10s</b></u><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
//                            else
                            s.append(String.format(" %15s | <b>%10s</b><br>",  type.toUpperCase(), amount));

                        }
//                        for (int i = 0; i < res.size(); i++) {
//
//                            transaction t = res.get(i);
//                            List<types> rr = tyy.stream().filter(o -> o.Code.contentEquals(t.Type)).collect(Collectors.toList());
//                            String type;
//                            if (rr.size() > 0)
//                                type = rr.get(0).Name;
//                            else
//                                type = t.Type;
//                            String amount = String.format("%,.2f", t.Amount);
//                            //if (t.Constituency.equalsIgnoreCase("1"))
//                            //   amount = String.format("<s>%,.2f</s>", t.Amount);
//
//                            if (i == res.size()-1)
//                                s.append(String.format("<u>%8s | %15s | %10s | <b>%10s</b></u><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
//                            else
//                                s.append(String.format("%8s | %15s | %10s | <b>%10s</b><br>", t.Time, type.toUpperCase(), t.Agent_Code, amount));
//                        }
                        String total = String.format("%,.2f", res.stream().mapToDouble(a -> a.Amount).sum());
                        s.append(String.format("<br>"));
                       // s.append(String.format("<u>%10s | <b>%10s</b></u><br>","TOTAL", total));

                    } else

                    {  Toast.makeText(getApplicationContext(), "No payment for Vehicle " + c + " today", Toast.LENGTH_LONG).show();
                        s.append(String.format("No payment for vehicle %s today",c));}
                collections.setText(Html.fromHtml(s.toString().replace(" ", "&nbsp;")));

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
