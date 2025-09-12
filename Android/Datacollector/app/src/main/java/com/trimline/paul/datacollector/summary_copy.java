package com.trimline.paul.datacollector;

import android.app.DatePickerDialog;
import android.app.ProgressDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ExpandableListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

public class summary_copy extends AppCompatActivity {
    ExpandableListAdapter listAdapter;
    ExpandableListView expListView;
    List<Summaries.Bydate> listDataHeader;
    HashMap<Summaries.Bydate, List<Collection>> listDataChild;
    DB db = null;
    Button btnFromDate, btnToDate;
    String fromDate = "", toDate = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        btnFromDate = findViewById(R.id.btnFromDate);
        btnToDate = findViewById(R.id.btnToDate);

        btnFromDate.setOnClickListener(v -> showDatePicker(true));
        btnToDate.setOnClickListener(v -> showDatePicker(false));

        expListView = (ExpandableListView) findViewById(R.id.summary);
        db = new DB(this);
        // preparing list data
        //prepareListData();
        new LoadSummaryDataTask().execute();
       // listAdapter = new ExpandableListAdapter(this, listDataHeader, listDataChild);
        //expListView.setAdapter(listAdapter);
        // setting list adapter
        expListView.setOnGroupClickListener(new ExpandableListView.OnGroupClickListener() {

            @Override
            public boolean onGroupClick(ExpandableListView parent, View v,
                                        int groupPosition, long id) {
                // Toast.makeText(getApplicationContext(),
                // "Group Clicked " + listDataHeader.get(groupPosition),
                // Toast.LENGTH_SHORT).show();
                return false;
            }
        });



        // Listview on child click listener
        expListView.setOnChildClickListener(new ExpandableListView.OnChildClickListener() {

            @Override
            public boolean onChildClick(ExpandableListView parent, View v,
                                        int groupPosition, int childPosition, long id) {
                // TODO Auto-generated method stub
                Toast.makeText(
                                getApplicationContext(),
                                listDataHeader.get(groupPosition)
                                        + " : "
                                        + listDataChild.get(
                                        listDataHeader.get(groupPosition)).get(
                                        childPosition).Farmers_Name, Toast.LENGTH_SHORT)
                        .show();
                return false;
            }
        });
    }
    private void showDatePicker(boolean isFrom) {
        Calendar calendar = Calendar.getInstance();
        DatePickerDialog datePickerDialog = new DatePickerDialog(this,
                (view, year, month, dayOfMonth) -> {
                    calendar.set(year, month, dayOfMonth);
                    String selectedDate = sdf.format(calendar.getTime());

                    if (isFrom) {
                        fromDate = selectedDate;
                        btnFromDate.setText("From: " + selectedDate);
                    } else {
                        toDate = selectedDate;
                        btnToDate.setText("To: " + selectedDate);
                    }

                    if (!fromDate.isEmpty() && !toDate.isEmpty()) {
                        new LoadSummaryDataTask().execute(); // Reload with filter
                    }
                },
                calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH),
                calendar.get(Calendar.DAY_OF_MONTH));
        datePickerDialog.show();
    }

    private void prepareListData() {
        listDataHeader = db.getdates();


        listDataChild = new HashMap<Summaries.Bydate, List<Collection>>();

        for (Summaries.Bydate s : listDataHeader
        ) {
            double total = 0.0;
            List<Collection> det = db.getbydates(s.Date);
            for (Collection c : det
            ) {
                total += c.Kg_Collected;
            }
            s.Total = total;

            listDataChild.put(s, det);
        }
    }

    private class LoadSummaryDataTask extends AsyncTask<Void, Void, Boolean> {
        ProgressDialog progressDialog;
        @Override
        protected void onPreExecute() {
            super.onPreExecute();
            progressDialog = new ProgressDialog(summary_copy.this);
            progressDialog.setMessage("Loading data...");
            progressDialog.setCancelable(false); // Optional: prevent dismiss by back button
            progressDialog.show();

          //  Toast.makeText(summary.this, "Loading summary...", Toast.LENGTH_SHORT).show();
        }

        @Override
        protected Boolean doInBackground(Void... voids) {
            try {
                if (!fromDate.isEmpty() && !toDate.isEmpty()) {
                    listDataHeader = db.getdatesBetween(fromDate, toDate);
                } else {
                    listDataHeader = db.getdates(); // fallback
                }
                listDataChild = new HashMap<>();
                for (Summaries.Bydate s : listDataHeader) {
                    double total = 0.0;
                    List<Collection> det = db.getbydates(s.Date);
                    for (Collection c : det) {
                        total += c.Kg_Collected;
                    }
                    s.Total = total;
                    listDataChild.put(s, det);
                }
                return true; // success
            } catch (Exception e) {
                e.printStackTrace();
                return false; // failure
            }
        }
        @Override
        protected void onPostExecute(Boolean success) {
            if (progressDialog != null && progressDialog.isShowing()) {
                progressDialog.dismiss();
            }
            if (success) {
                listAdapter = new ExpandableListAdapter(summary_copy.this, listDataHeader, listDataChild);
                expListView.setAdapter(listAdapter);
            } else {
                Toast.makeText(summary_copy.this, "Failed to load summary data", Toast.LENGTH_LONG).show();
            }
        }
    }

}
