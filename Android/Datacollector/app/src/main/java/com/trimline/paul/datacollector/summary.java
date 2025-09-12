package com.trimline.paul.datacollector;

import static android.nfc.tech.MifareUltralight.PAGE_SIZE;

import android.app.ProgressDialog;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.app.DatePickerDialog;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ExpandableListView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class summary extends AppCompatActivity {
    ExpandableListAdapter listAdapter;
    ExpandableListView expListView;
    List<Summaries.Bydate> listDataHeader;
    HashMap<Summaries.Bydate, List<Collection>> listDataChild;
    DB db = null;
    Button btnFromDate, btnToDate;
    String fromDate = "", toDate = "";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
RecyclerView recycler;
    SummaryAdapter adapter;
    List<ListItem> items;
    int currentPage = 1;
    final int PAGE_SIZE = 10;
    boolean isLoading = false;
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
        //new LoadSummaryDataTask().execute();
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

        recycler = findViewById(R.id.summaryRecycler);
        recycler.setLayoutManager(new LinearLayoutManager(this));


        loaditems(null,null);
//   txtKg.setText( String.format("%.1f kg",  c.Kg_Collected ));
        adapter = new SummaryAdapter(this, items);
        recycler.setAdapter(adapter);

// Add scroll listener for pagination (optional)
        recycler.addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrolled(@NonNull RecyclerView recyclerView, int dx, int dy) {
                if (!recyclerView.canScrollVertically(1)) {
                    loadNextPage();
                }
            }
        });

    }

    private void loaditems( String fromdate, String todate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Adjust if your date format is different
        Date today = new Date();
        items = new ArrayList<>();
        List<Summaries.Bydate> page0 = db.getPagedDates(0, PAGE_SIZE,fromdate,toDate);
        Collections.sort(page0, new Comparator<Summaries.Bydate>() {
            @Override
            public int compare(Summaries.Bydate o1, Summaries.Bydate o2) {
                try {
                    Date d1 = sdf.parse(o1.Date);
                    Date d2 = sdf.parse(o2.Date);

                    long diff1 = Math.abs(d1.getTime() - today.getTime());
                    long diff2 = Math.abs(d2.getTime() - today.getTime());

                    return Long.compare(diff1, diff2);
                } catch (ParseException e) {
                    return 0; // fallback
                }
            }
        });
        for (Summaries.Bydate group : page0) {
            group.Children = db.getbydates(group.Date);
            double total = 0.0;
            for (Collection c : group.Children ) {
                total += c.Kg_Collected;
            }
            group.Total = total;
            items.add(new ListItem(ListItem.TYPE_GROUP, group, null));
        }
    }

    private void loadNextPage() {
        if (isLoading) return;

        isLoading = true;
        List<Summaries.Bydate> newPage = db.getPagedDates(currentPage, PAGE_SIZE,null,null);
        if (newPage.isEmpty()) {
            isLoading = false;
            return; // No more data
        }

        for (Summaries.Bydate group : newPage) {
            group.Children = db.getbydates(group.Date);
            double total = 0.0;
            for (Collection c : group.Children ) {
                total += c.Kg_Collected;
            }
            group.Total = total;
            items.add(new ListItem(ListItem.TYPE_GROUP, group, null));
        }

        adapter.notifyDataSetChanged();
        currentPage++;
        isLoading = false;
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
                       loaditems(fromDate,toDate);
                        //new LoadSummaryDataTask().execute(); // Reload with filter
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
            progressDialog = new ProgressDialog(summary.this);
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
                listAdapter = new ExpandableListAdapter(summary.this, listDataHeader, listDataChild);
                expListView.setAdapter(listAdapter);
            } else {
                Toast.makeText(summary.this, "Failed to load summary data", Toast.LENGTH_LONG).show();
            }
        }
    }





}
