package com.trimline.paul.metro.reports;

import android.app.Activity;
import android.app.AlertDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Button;
import android.widget.ExpandableListView;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.material.datepicker.MaterialDatePicker;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.DB;
import com.trimline.paul.metro.JsonParser;
import com.trimline.paul.metro.R;
import com.trimline.paul.metro.summaries;
import com.trimline.paul.metro.transaction;
import com.trimline.paul.metro.types;
import com.trimline.paul.metro.vehicles;

import java.lang.ref.WeakReference;
import java.lang.reflect.Type;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

public class cashier_report extends AppCompatActivity {
    private ExpandableListView cashierReportExpandable;
    private ProgressBar progressBar;
    private Button dateButton;
    private SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy", Locale.US);
    private String selectedVehicle = "";
    private ArrayList<String> selectedTypes = new ArrayList<>();
    private DB db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_cashier_report);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        db = new DB(this);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setNavigationOnClickListener(v -> onBackPressed());

        cashierReportExpandable = findViewById(R.id.cashierreport_expandable);
        progressBar = findViewById(R.id.cashierprogress);
        dateButton = findViewById(R.id.date_range_button);

        String todayDateString = sdf.format(new Date());
        dateButton.setText(todayDateString);
        new GetAgentTypeSummaryTask(this, todayDateString, progressBar, cashierReportExpandable).execute();

        dateButton.setOnClickListener(v -> {
            MaterialDatePicker.Builder<Long> builder = MaterialDatePicker.Builder.datePicker();
            builder.setTitleText("Select a date");
            final MaterialDatePicker<Long> picker = builder.build();
            picker.show(getSupportFragmentManager(), picker.toString());

            picker.addOnPositiveButtonClickListener(selection -> {
                String selectedDate = sdf.format(new Date(selection));
                dateButton.setText(selectedDate);
                new GetAgentTypeSummaryTask(cashier_report.this, selectedDate, progressBar, cashierReportExpandable).execute();
            });
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.cashier_report_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == R.id.action_filter) {
            showFilterDialog();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    private void showFilterDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Filter Report");

        View view = getLayoutInflater().inflate(R.layout.filter_dialog, null);
        builder.setView(view);

        AutoCompleteTextView vehicleFilter = view.findViewById(R.id.vehicle_filter);
        TextView typeFilterSelect = view.findViewById(R.id.type_filter_select);

        List<String> vehicles = getVehicleList();
        final String[] types = getTypeList().toArray(new String[0]);
        final boolean[] checkedTypes = new boolean[types.length];

        for (int i = 0; i < types.length; i++) {
            if (selectedTypes.contains(types[i])) {
                checkedTypes[i] = true;
            }
        }

        if (selectedTypes.isEmpty()) {
            typeFilterSelect.setText("Select Types");
        } else {
            typeFilterSelect.setText(String.join(", ", selectedTypes));
        }

        ArrayAdapter<String> vehicleAdapter = new ArrayAdapter<>(this, android.R.layout.simple_dropdown_item_1line, vehicles);
        vehicleFilter.setAdapter(vehicleAdapter);
        vehicleFilter.setThreshold(1);

        typeFilterSelect.setOnClickListener(v -> {
            AlertDialog.Builder typeBuilder = new AlertDialog.Builder(cashier_report.this);
            typeBuilder.setTitle("Select Types");
            typeBuilder.setMultiChoiceItems(types, checkedTypes, (dialog, which, isChecked) -> {
                checkedTypes[which] = isChecked;
            });
            typeBuilder.setPositiveButton("OK", (dialog, which) -> {
                selectedTypes.clear();
                for (int i = 0; i < checkedTypes.length; i++) {
                    if (checkedTypes[i]) {
                        selectedTypes.add(types[i]);
                    }
                }
                if (selectedTypes.isEmpty()) {
                    typeFilterSelect.setText("Select Types");
                } else {
                    typeFilterSelect.setText(String.join(", ", selectedTypes));
                }
            });
            typeBuilder.setNegativeButton("Cancel", (dialog, which) -> dialog.dismiss());
            typeBuilder.create().show();
        });


        builder.setPositiveButton("Filter", (dialog, which) -> {
            selectedVehicle = vehicleFilter.getText().toString();
            new GetAgentTypeSummaryTask(this, dateButton.getText().toString(), progressBar, cashierReportExpandable).execute();
        });

        builder.setNegativeButton("Cancel", (dialog, which) -> dialog.cancel());

        builder.setNeutralButton("Clear", (dialog, which) -> {
            selectedVehicle = "";
            selectedTypes.clear();
            new GetAgentTypeSummaryTask(this, dateButton.getText().toString(), progressBar, cashierReportExpandable).execute();
        });

        builder.show();
    }

    private List<String> getVehicleList() {
        return db.getvehicles().stream()
                .map(vehicles::getVehicle_Number)
                .filter(s -> s != null && !s.trim().isEmpty())
                .collect(Collectors.toList());
    }

    private List<String> getTypeList() {
        return db.gettypes().stream().map(types::getType).collect(Collectors.toList());
    }

    public class GetAgentTypeSummaryTask extends AsyncTask<String, Void, Map<String, List<transaction>>> {
        private final String date;
        private final ProgressBar progressBar;
        private final ExpandableListView summaryListView;
        private final WeakReference<Activity> activityRef;

        GetAgentTypeSummaryTask(Activity context, String date, ProgressBar progressBar,
                                ExpandableListView summaryListView) {
            this.activityRef = new WeakReference<>(context);
            this.date = date;
            this.progressBar = progressBar;
            this.summaryListView = summaryListView;
        }

        @Override
        protected void onPreExecute() {
            Activity activity = activityRef.get();
            if (activity != null && !activity.isFinishing()) {
                progressBar.setVisibility(View.VISIBLE);
                summaryListView.setAdapter((android.widget.ExpandableListAdapter) null);
            }
        }

        @Override
        protected Map<String, List<transaction>> doInBackground(String... params) {
            try {
                summaries.getdata requestData = new summaries.getdata();
                requestData.firstdate = date;
                requestData.user = "";

                Gson gson = new Gson();
                String jsonRequest = gson.toJson(requestData);
                String jsonResponse = JsonParser.postjson("GetallCollections", "data", jsonRequest);

                Type transactionListType = new TypeToken<List<transaction>>() {
                }.getType();
                List<transaction> transactions = gson.fromJson(jsonResponse, transactionListType);

                return groupTransactionsByAgent(transactions);
            } catch (Exception e) {
                Log.e("AgentTypeSummary", "Error fetching data", e);
                return null;
            }
        }

        private Map<String, List<transaction>> groupTransactionsByAgent(List<transaction> transactions) {
            Map<String, List<transaction>> agentTransactionMap = new HashMap<>();
            if (transactions != null) {
                for (transaction t : transactions) {
                    boolean vehicleMatch = selectedVehicle.isEmpty() || t.getLoan_No().equalsIgnoreCase(selectedVehicle);
                    boolean typeMatch = selectedTypes.isEmpty() || selectedTypes.contains(t.getType());
                    if (vehicleMatch && typeMatch) {
                        agentTransactionMap.computeIfAbsent(t.Agent_Code, k -> new ArrayList<>()).add(t);
                    }
                }
            }
            return agentTransactionMap;
        }

        @Override
        protected void onPostExecute(Map<String, List<transaction>> result) {
            Activity activity = activityRef.get();
            if (activity == null || activity.isFinishing()) return;
            if (progressBar != null) {
                progressBar.setVisibility(View.GONE);
            }
            if (result == null || result.isEmpty()) {
                Toast.makeText(activity,
                        "No transactions found",
                        Toast.LENGTH_LONG).show();
                return;
            }

            List<GroupHeader> listDataHeader = new ArrayList<>();
            HashMap<String, List<ChildItem>> listDataChild = new HashMap<>();
            Map<String, List<transaction>> allTransactions = new HashMap<>();

            DecimalFormat formatter = new DecimalFormat("#,##0.00");

            for (Map.Entry<String, List<transaction>> entry : result.entrySet()) {
                String agentCode = entry.getKey();
                List<transaction> transactions = entry.getValue();
                allTransactions.put(agentCode, transactions);

                double totalAmount = 0;
                double managementSum = 0;
                double saccoSum = 0;
                double operationSum = 0;
                double loanSum = 0;
                double othersSum = 0;

                Map<String, Map<String, Double>> itemSummaryMap = new HashMap<>();

                for (transaction t : transactions) {
                    totalAmount += t.getAmount();
                    String type = t.getType();
                    String itemNo = t.getLoan_No();

                    itemSummaryMap.putIfAbsent(itemNo, new HashMap<>());
                    Map<String, Double> itemMap = itemSummaryMap.get(itemNo);

                    if (type.equalsIgnoreCase("Management")) {
                        managementSum += t.getAmount();
                        itemMap.merge("Management", t.getAmount(), Double::sum);
                    } else if (type.equalsIgnoreCase("Sacco")) {
                        saccoSum += t.getAmount();
                        itemMap.merge("Sacco", t.getAmount(), Double::sum);
                    } else if (type.equalsIgnoreCase("Operation")) {
                        operationSum += t.getAmount();
                        itemMap.merge("Operation", t.getAmount(), Double::sum);
                    } else if (type.equalsIgnoreCase("Loan")) {
                        loanSum += t.getAmount();
                        itemMap.merge("Loan", t.getAmount(), Double::sum);
                    } else {
                        othersSum += t.getAmount();
                        itemMap.merge("Others", t.getAmount(), Double::sum);
                    }
                }

                listDataHeader.add(new GroupHeader(agentCode, itemSummaryMap.size(), totalAmount, managementSum, saccoSum, operationSum, loanSum, othersSum));

                List<ChildItem> itemDetails = new ArrayList<>();

                for (Map.Entry<String, Map<String, Double>> itemEntry : itemSummaryMap.entrySet()) {
                    String itemNo = itemEntry.getKey();
                    Map<String, Double> itemMap = itemEntry.getValue();
                    vehicles vehicle = db.getvehicle(itemNo);
                    String fleetNo = vehicle != null ? vehicle.Fleet_No : "";
                    itemDetails.add(new ChildItem(itemNo + " (" + fleetNo + ")",
                            itemMap.getOrDefault("Management", 0.0),
                            itemMap.getOrDefault("Sacco", 0.0),
                            itemMap.getOrDefault("Operation", 0.0),
                            itemMap.getOrDefault("Loan", 0.0),
                            itemMap.getOrDefault("Others", 0.0)));
                }
                listDataChild.put(agentCode, itemDetails);
            }

            Collections.sort(listDataHeader, (o1, o2) -> o1.agentCode.compareTo(o2.agentCode));


            ExpandableListAdapter listAdapter = new ExpandableListAdapter(cashier_report.this, listDataHeader, listDataChild);
            summaryListView.setAdapter(listAdapter);

            summaryListView.setOnChildClickListener((parent, v, groupPosition, childPosition, id) -> {
                String agentCode = listDataHeader.get(groupPosition).agentCode;
                ChildItem childItem = listDataChild.get(agentCode).get(childPosition);
                String itemNoWithFleet = childItem.itemNo;
                String itemNo = itemNoWithFleet.substring(0, itemNoWithFleet.indexOf("(")).trim();


                List<transaction> allAgentTransactions = allTransactions.get(agentCode);
                List<transaction> itemTransactions = new ArrayList<>();

                if (allAgentTransactions != null) {
                    for (transaction t : allAgentTransactions) {
                        if (t.getLoan_No().equals(itemNo)) {
                            itemTransactions.add(t);
                        }
                    }
                }

                StringBuilder message = new StringBuilder();
                for (transaction t : itemTransactions) {
                    message.append(t.Time).append(" - ").append(t.getType()).append(" - ").append(formatter.format(t.getAmount())).append("\n");
                }

                new AlertDialog.Builder(cashier_report.this)
                        .setTitle("Transactions for " + itemNo)
                        .setMessage(message.toString())
                        .setPositiveButton(android.R.string.ok, null)
                        .show();

                return true;
            });
        }
    }
}
