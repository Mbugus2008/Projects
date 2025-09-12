package com.trimline.paul.metro;

import android.app.DatePickerDialog;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;

import android.util.Log;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.ExpandableListView;
import android.widget.ImageButton;
import android.widget.ListAdapter;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.transactions.GroupedByVehicle;
import com.trimline.paul.metro.transactions.GroupedByType;
import com.trimline.paul.metro.transactions.GrouptransListAdapter;

import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class status extends AppCompatActivity {
    DB db = null;
    AutoCompleteTextView vehno;
    ImageButton search;
    ProgressBar p;
    ListView sl;
    TextView total;
    Button addtrans, postnew, reprint,recoverydate;
    private int mYear, mMonth, mDay, mHour, mMinute;
    ExpandableListView expandableListView ;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_status);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        db = new DB(this);
        vehno = (AutoCompleteTextView) findViewById(R.id.searchno);
        p = (ProgressBar) findViewById(R.id.searchprogress);
        sl = (ListView) findViewById(R.id.statuslist);
        search = (ImageButton) findViewById(R.id.findveh);
        total = (TextView) findViewById(R.id.total);
        total.setText(String.format("%.2f", 0.0));
        expandableListView = findViewById(R.id.expandableListView);
        recoverydate= findViewById(R.id.recoverydate);

      Calendar  cdt=Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        recoverydate.setText(df.format(cdt.getTime()));
        mYear = cdt.get(Calendar.YEAR);
        mMonth = cdt.get(Calendar.MONTH);
        mDay = cdt.get(Calendar.DAY_OF_MONTH);

        recoverydate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(status.this,
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
        search.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Search();
            }
        });
        vehno.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Search();
            }
        });

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
            new getclients().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        else
            new getclients().execute();
    }

    private void Search() {
        String veh = "";
        if (vehno.getText().toString().equals("")) {
            vehno.setError("Vehicle no should not be blank");
            return;
        }
        vehicles v = db.getvehicle(vehno.getText().toString());

        if (v == null) {
            v = db.getvehiclebyfleet(vehno.getText().toString());
            if (v != null) veh = v.Vehicle_Number;
        } else veh = v.Vehicle_Number;
        if (v == null) {
            if (vehno.getText().toString().contains("..") || vehno.getText().toString().contains("|")) {
                if (vehno.getText().toString().contains("..")) {
                    List<String> numbers = getNumbersBetween(vehno.getText().toString());
                    String placeholders = numbers.stream()
                            .map(s -> "\'" + s + "\'")
                            .collect(Collectors.joining(", "));
                    Log.i("Fleet",placeholders);
                    var vhs = db.getvehiclesbyfleet(placeholders);
                    String vehicleNumbers = vhs.stream()
                            .map(vehicles::getVehicle_Number) // Extract the 'No' property
                            .collect(Collectors.joining("|"));
                    veh = vehicleNumbers;
                }
                if (vehno.getText().toString().contains("|")) {
                    List<String> numbers = Arrays.asList(vehno.getText().toString().split("\\|"));
                    String placeholders = numbers.stream()
                            .map(s -> "\'" + s + "\'")
                            .collect(Collectors.joining(", "));
                    Log.i("Fleet",placeholders);
                    var vhs = db.getvehiclesbyfleet(placeholders);
                    String vehicleNumbers = vhs.stream()
                            .map(vehicles::getVehicle_Number) // Extract the 'No' property
                            .collect(Collectors.joining("|"));
                    veh = vehicleNumbers;


                }

            }
        }
        p.setVisibility(View.VISIBLE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB)
            new getcollections(veh, recoverydate.getText().toString()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        else
            new getcollections(veh, recoverydate.getText().toString()).execute();
    }
    public static List<String> getNumbersBetween(String range) {
        // Split the string into parts based on ".."
        String[] parts = range.split("\\.\\.");
        if (parts.length != 2) {
            throw new IllegalArgumentException("Invalid range format");
        }

        // Extract the prefix (e.g., "M") and the numeric parts (e.g., "101", "150")
        String prefix = parts[0].replaceAll("\\d", "");
        int start = Integer.parseInt(parts[0].replaceAll("\\D", ""));
        int end = Integer.parseInt(parts[1].replaceAll("\\D", ""));

        // Generate all numbers in the range and append the prefix
        List<String> result = new ArrayList<>();
        for (int i = start; i <= end; i++) {
            result.add(prefix + i);
        }

        return result;
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
                    if (v.Vehicle_Number != null)
                        clients.add(v.Vehicle_Number);
                    if (v.Fleet_No != null)
                        clients.add(v.Fleet_No);
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
                AutoSuggestAdapter adapter = new AutoSuggestAdapter(status.this, android.R.layout.simple_list_item_1, res);
                vehno.setAdapter(adapter);
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
            this.c = ff;
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
                Calendar cdt = Calendar.getInstance();
                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                final String formattedDate = df.format(cdt.getTime());

                summaries.getdata gt = new summaries.getdata();
                gt.firstdate =date;// formattedDate;
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
                List<GroupedByVehicle> groupedByLoanNoList = new ArrayList<>();
                p.setVisibility(View.GONE);
                sl.setAdapter(null);
                if (res != null)
                    if (res.size() > 0) {
                        groupedByLoanNoList  = res.stream()
                                .collect(Collectors.groupingBy(
                                        transaction::getLoan_No,
                                        Collectors.collectingAndThen(
                                                Collectors.toList(),
                                                list -> {
                                                    // Group by Type within each Loan_No
                                                    Map<String, Double> typeTotalMap = list.stream()
                                                            .collect(Collectors.groupingBy(
                                                                    transaction::getType,
                                                                    Collectors.summingDouble(transaction::getAmount)
                                                            ));

                                                    // Create a list of GroupedByType objects
                                                    List<GroupedByType> groupedByTypeList = typeTotalMap.entrySet().stream()
                                                            .map(entry -> new GroupedByType(entry.getKey(), entry.getValue()))
                                                            .collect(Collectors.toList());

                                                    // Calculate total amount for this Loan_No
                                                    double totalAmount = list.stream()
                                                            .mapToDouble(transaction::getAmount)
                                                            .sum();

                                                    // Create and return GroupedByLoanNo object
                                                    return new GroupedByVehicle(
                                                            list.get(0).getLoan_No(),  // Loan_No (same for all in group)
                                                            totalAmount,                // Total Amount for Loan_No
                                                            groupedByTypeList  ,// List of grouped types
                                                            list
                                                    );
                                                }
                                        )
                                ))
                                .values()
                                .stream()
                                .collect(Collectors.toList());
                        groupedByLoanNoList.forEach(System.out::println);

                        for (GroupedByVehicle g:groupedByLoanNoList
                             ) {
                            g.setFleetNO(db.getvehicle(g.getVehicle()).Fleet_No);
                        }
                        Collections.sort(groupedByLoanNoList, new Comparator<GroupedByVehicle>() {
                            @Override
                            public int compare(GroupedByVehicle o1, GroupedByVehicle o2) {
                                return o1.getFleetNO().compareTo(o2.getFleetNO());
                            }
                        });




//                        ListAdapter fc = new transstatus(status.this, res, db);
//                        sl.setAdapter(fc);
//                        double totalAmount = res.stream()
//                                .mapToDouble(transaction::getAmount)
//                                .sum();
//                        total.setText(String.format("%.2f", totalAmount));
//                        Map<String, List<transaction>> groupedTransactions = new HashMap<>();
//
//                        for (transaction trans : res) {
//                            String group = trans.Type;
//                            if (!groupedTransactions.containsKey(group)) {
//                                groupedTransactions.put(group, new ArrayList<>());
//                            }
//                            groupedTransactions.get(group).add(trans);
//                        }
                    } else {



                        Toast.makeText(getApplicationContext(), "No payment for Vehicle " + vehno.getText().toString() + " today", Toast.LENGTH_LONG).show();
                        total.setText(String.format("%.2f", 0.0));

                    }

                GrouptransListAdapter adapter = new GrouptransListAdapter(status.this, groupedByLoanNoList);
                expandableListView.setAdapter(adapter);

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
