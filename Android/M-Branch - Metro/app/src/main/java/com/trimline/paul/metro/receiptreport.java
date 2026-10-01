package com.trimline.paul.metro;

import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;

import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;

import java.util.stream.Collectors;

public class receiptreport extends AppCompatActivity implements
        View.OnClickListener {
    ReceiptsRecyclerAdapter listAdapter;
    List<summaries.agentreceipts> daylist;
    List<Object> rows; // flattened visible rows (agent / receipt / transaction)
    HashMap<summaries.Receipts, List<transaction>> listDataChild;
    RecyclerView report;
    ProgressDialog progress;
    private int mYear, mMonth, mDay, mHour, mMinute;
    DB db = null;
    Button setdate;
    String date;
    TextView total;
    CheckBox showreversed;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_receipts);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle("Summary Report");
        db = new DB(this);
        progress = new ProgressDialog(receiptreport.this);
        progress.setMessage("Loading report");
        progress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
        progress.setIndeterminate(false);
        progress.setProgress(0);
        report = (RecyclerView) findViewById(R.id.receiptsrecycler);
        total = (TextView) findViewById(R.id.total);

        // The list is flattened manually (agent -> receipt -> transactions) so
        // each level can expand and collapse independently.
        report.setLayoutManager(new LinearLayoutManager(this));
        rows = new ArrayList<Object>();
        daylist = new ArrayList<summaries.agentreceipts>();
        listDataChild = new HashMap<summaries.Receipts, List<transaction>>();
        listAdapter = new ReceiptsRecyclerAdapter(this, db, listDataChild, daylist, rows, new Runnable() {
            @Override
            public void run() {
                rebuildRows();
            }
        });
        report.setAdapter(listAdapter);

        // Reversed entries are hidden unless this box is ticked, so the report
        // shows an auditable net view by default.
        showreversed = (CheckBox) findViewById(R.id.showreversed);
        showreversed.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
                    new loaddata(date, isChecked).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                else
                    new loaddata(date, isChecked).execute();
            }
        });

        //datepicker

            final Calendar c = Calendar.getInstance();
            DecimalFormat mFormat= new DecimalFormat("00");

            mYear = c.get(Calendar.YEAR);
            mMonth = c.get(Calendar.MONTH);
            mDay = c.get(Calendar.DAY_OF_MONTH);

            date = mFormat.format(Double.valueOf(mDay)) + "-" + (mFormat.format(Double.valueOf(mMonth+ 1)) ) + "-" + mYear;
            setdate = (Button) findViewById(R.id.Date);

            setdate.setOnClickListener(this);
            setdate.setText(date);

        //datepicker

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
            new loaddata(date, showreversed.isChecked()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        else
            new loaddata(date, showreversed.isChecked()).execute();
    }

    @Override
    public void onClick(View v) {
        // Get Current Date


        DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                new DatePickerDialog.OnDateSetListener() {
                    @Override
                    public void onDateSet(DatePicker view, int year,
                                          int monthOfYear, int dayOfMonth) {
//dd-MM-yyyy
                        DecimalFormat mFormat = new DecimalFormat("00");
                        date = mFormat.format(Double.valueOf(dayOfMonth)) + "-" + mFormat.format(Double.valueOf(monthOfYear + 1)) + "-" + year;
                        setdate.setText(date);
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
                            new loaddata(date, showreversed.isChecked()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                        else
                            new loaddata(date, showreversed.isChecked()).execute();

                    }
                }, mYear, mMonth, mDay);
        datePickerDialog.show();
    }

    /** Flattens the agent -> receipt -> transactions hierarchy into the
     *  visible rows, honouring the expanded state of each level. */
    private void rebuildRows() {
        rows.clear();
        for (summaries.agentreceipts a : daylist
        ) {
            rows.add(a);
            if (!a.Expanded)
                continue;
            for (summaries.Receipts r : a.ReceiptsList
            ) {
                rows.add(r);
                if (r.Expanded) {
                    List<transaction> t = listDataChild.get(r);
                    if (t != null)
                        rows.addAll(t);
                }
            }
        }
        listAdapter.notifyDataSetChanged();
    }

    private void showEmptyState() {
        TextView empty = (TextView) findViewById(R.id.summaryEmpty);
        if (empty != null) {
            boolean none = daylist.isEmpty() || daylist.get(0).Count == 0;
            if (none) {
                empty.setText("No receipts found");
                empty.setVisibility(View.VISIBLE);
            } else {
                empty.setVisibility(View.GONE);
            }
        }
    }

    private class loaddata extends AsyncTask<String, Integer, Void> {

        int i = 1;
        String d;
        boolean showrev;

        loaddata(String dd, boolean revers) {
            d = dd;
            showrev = revers;
        }

        @Override
        protected void onPreExecute() {

            progress.show();
        }

        @Override
        protected void onProgressUpdate(Integer... prog) {
            // Log.i("progress", prog[0].toString());
            progress.setProgress(prog[0]);
        }

        @Override
        protected Void doInBackground(String... params) {

            try {

                List<summaries.agentreceipts> builtAgents = new ArrayList<summaries.agentreceipts>();
                HashMap<summaries.Receipts, List<transaction>> builtChild = new HashMap<summaries.Receipts, List<transaction>>();
                final LinkedHashMap<String, summaries.agentreceipts> byagent = new LinkedHashMap<String, summaries.agentreceipts>();
                HashMap<String, HashSet<String>> agentvehicles = new HashMap<String, HashSet<String>>();
                HashMap<String, String> typenames = new HashMap<String, String>();

                List<summaries.Receipts> rec = db.getcollectionreceiptsbydate(d);
                List<types> typ = db.gettypes();
                List<transaction> trns = db.gettransallbydate(d);
                if (!showrev) {
                    // hide reversed entries (Constituency "1" marks both the
                    // reversed original and its reversal batch)
                    List<transaction> filtered = new ArrayList<transaction>();
                    for (transaction tt : trns
                    ) {
                        if (tt.Constituency == null || !tt.Constituency.equals("1"))
                            filtered.add(tt);
                    }
                    trns = filtered;
                }

double globaltotal =0;
                progress.setMax(rec.size());
                for (summaries.Receipts c : rec
                        ) {
                    publishProgress(i);
                    List<transaction> t = trns.stream().filter(p -> p.OTTN.contentEquals(c.receipt)).collect(Collectors.toList());
                    if (t.isEmpty() && !showrev) {
                        i++;
                        continue;
                    }
                    c.Count = t.size();

                    double total = 0.0;
                    for (transaction tt : t
                            ) {
                        c.date = tt.Date;
                        c.No = tt.Account_No;
                        c.Name = tt.Account_Name;
                        c.user = tt.Agent_Code;
                        c.vehicle = tt.Loan_No;
                        c.fleetNo = tt.Group;
                        c.Recovery = tt.Recovery;

                        // Display names resolve from the synced types table;
                        // inactive (historical) types are still looked up so
                        // old collections show their proper name.
                        if (!typenames.containsKey(tt.Type)) {
                            String nm = null;
                            for (types o : typ
                            ) {
                                if (o.Code.contentEquals(tt.Type)) {
                                    nm = o.Name;
                                    break;
                                }
                            }
                            if (nm == null) {
                                types in = db.gettype(tt.Type);
                                nm = (in != null) ? in.Name : tt.Type;
                            }
                            typenames.put(tt.Type, nm);
                        }
                        tt.typename = typenames.get(tt.Type);

                        if (!tt.Type.equals("PENALTY CHARGED"))
                        total += tt.getAmount();

                    }
                    c.Total = total;
                    globaltotal += total;
                    builtChild.put(c, t);

                    // parent group: the agent that collected this receipt
                    String code = c.user == null ? "" : c.user;
                    summaries.agentreceipts a = byagent.get(code);
                    if (a == null) {
                        a = new summaries.agentreceipts();
                        a.Code = code;
                        a.Name = code.isEmpty() ? "" : null;
                        byagent.put(code, a);
                    }
                    a.ReceiptsList.add(c);
                    a.Count++;
                    a.Total += total;

                    // distinct vehicles this agent collected for
                    String vcode = (c.vehicle == null ? "" : c.vehicle.trim()) + "|" + (c.fleetNo == null ? "" : c.fleetNo.trim());
                    if (!vcode.equals("|")) {
                        HashSet<String> vs = agentvehicles.get(code);
                        if (vs == null) {
                            vs = new HashSet<String>();
                            agentvehicles.put(code, vs);
                        }
                        vs.add(vcode);
                    }
                    i++;
                }

                for (summaries.agentreceipts a : byagent.values()
                ) {
                    if (a.Name == null) {
                        Agent ag = db.getagent(a.Code);
                        a.Name = (ag != null && ag.Name != null && !ag.Name.isEmpty()) ? ag.Name : a.Code;
                    }
                    HashSet<String> vs = agentvehicles.get(a.Code);
                    a.VehicleCount = vs == null ? 0 : vs.size();
                    builtAgents.add(a);
                }

                // swap in the freshly built data on the shared instances so the
                // adapter keeps working with the same references
                daylist.clear();
                daylist.addAll(builtAgents);
                listDataChild.clear();
                listDataChild.putAll(builtChild);

                total.setText(String.format("%,.2f",globaltotal));
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        }

        @Override
        protected void onPostExecute(Void res) {
            try {
                if (progress.isShowing())
                    progress.dismiss();
                rebuildRows();
                showEmptyState();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
