package com.trimline.m_branch.reports;

import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.lifecycle.ViewModelProvider;

import com.trimline.m_branch.R;
import com.trimline.m_branch.Utilities.Mbranch;

import com.trimline.m_branch.Utilities.Printer;
import com.trimline.m_branch.Utilities.Receipts;
import com.trimline.m_branch.Utilities.adapters.Receipt_adapter;
import com.trimline.m_branch.db.Models.tViewModel;
import com.trimline.m_branch.transaction;


import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

public class receipts extends AppCompatActivity implements
        View.OnClickListener {
    Receipt_adapter listAdapter;
    List<Receipts> listDataHeader;
    HashMap<Receipts, List<transaction>> listDataChild;
    ExpandableListView report;
    ProgressDialog progress;
    private int mYear, mMonth, mDay, mHour, mMinute;

    Button setdate;
    String date;
    TextView total ;
    private tViewModel viewModel;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);
        setTitle("Summary Report");
        viewModel = new ViewModelProvider(this).get(tViewModel.class);
        progress = new ProgressDialog(receipts.this);
        progress.setMessage("Loading report");
        progress.setProgressStyle(ProgressDialog.STYLE_HORIZONTAL);
        progress.setIndeterminate(false);
        progress.setProgress(0);
        //progress.setMax( db.getcollectionreceipts().size());
        report = (ExpandableListView) findViewById(R.id.summuryreport);
        total = (TextView)findViewById(R.id.total);

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
            new loaddata(date).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        else
            new loaddata(date).execute();

        report.setOnGroupClickListener(new ExpandableListView.OnGroupClickListener() {

            @Override
            public boolean onGroupClick(ExpandableListView parent, View v,
                                        int groupPosition, long id) {
                // Toast.makeText(getApplicationContext(),
                // "Group Clicked " + listDataHeader.get(groupPosition),
                // Toast.LENGTH_SHORT).show();
                return false;
            }
        });
        report.setOnChildClickListener(new ExpandableListView.OnChildClickListener() {
            @Override
            public boolean onChildClick(ExpandableListView parent, View v,
                                        int groupPosition, int childPosition, long id) {

                return false;
            }
        });
        report.setOnGroupExpandListener(new ExpandableListView.OnGroupExpandListener() {
            @Override
            public void onGroupExpand(int groupPosition) {
                //rl.setVisibility(View.VISIBLE);
            }
        });
        // Listview Group collasped listener
        report.setOnGroupCollapseListener(new ExpandableListView.OnGroupCollapseListener() {
            @Override
            public void onGroupCollapse(int groupPosition) {

            }
        });
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
                            new loaddata(date).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                        else
                            new loaddata(date).execute();

                    }
                }, mYear, mMonth, mDay);
        datePickerDialog.show();
    }


 private class loaddata extends AsyncTask<String, Integer, Void> {

        int i = 1;
        String d;

        loaddata(String dd) {
            d = dd;
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

                listDataHeader = new ArrayList<Receipts>();
                listDataChild = new HashMap<Receipts, List<transaction>>();
                Log.i("Start", "Start");
                listDataHeader = viewModel.trepo.getcollectionreceipts(d);
                Log.i("end", "end");

                List<transaction> trns =viewModel.trepo.gettransallbydate(date);
                double globaltotal =0;
                progress.setMax(listDataHeader.size());
                for (Receipts c : listDataHeader
                        ) {
                    publishProgress(i);
                    List<transaction> t = trns.stream().filter(p -> p.OTTN.contentEquals(c.receipt)).collect(Collectors.toList());
                    globaltotal += c.Total;
                    listDataChild.put(c, t);
                    i++;
                }
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
                listAdapter = new Receipt_adapter(receipts.this, listDataHeader, listDataChild, viewModel);
                report.setAdapter(listAdapter);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }


}
