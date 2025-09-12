package com.trimline.paul.metro.reports;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ListView;
import android.widget.ProgressBar;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.JsonParser;
import com.trimline.paul.metro.R;
import com.trimline.paul.metro.summaries;
import com.trimline.paul.metro.transaction;

import java.lang.ref.WeakReference;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class cashier_report extends AppCompatActivity {
    private int mYear, mMonth, mDay, mHour, mMinute;
    ListView cashierreport;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_cashier_report);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setNavigationOnClickListener(v -> onBackPressed());
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
cashierreport = findViewById(R.id.cashierreport);
        ProgressBar progressBar = findViewById(R.id.cashierprogress);
        ListView summaryListView = findViewById(R.id.cashierreport);

        LocalDate today = LocalDate.now();

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
        String todayDateString = today.format(formatter);


        new GetAgentTypeSummaryTask(
                this,  // Your Activity instance
                "",
                todayDateString,
                progressBar,
                summaryListView

        ).execute();
    }

public class GetAgentTypeSummaryTask extends AsyncTask<String, Void, List<AgentTypeSummary>> {
    private final String userCode;
    private final String date;
    private final ProgressBar progressBar;
    private final ListView summaryListView;
    private final WeakReference<Activity> activityRef;

    GetAgentTypeSummaryTask(Activity context,String userCode, String date, ProgressBar progressBar,
                            ListView summaryListView) {
        this.activityRef = new WeakReference<>(context);
        this.userCode = userCode;
        this.date = date;
        this.progressBar = progressBar;
        this.summaryListView = summaryListView;
    }
    @Override
    protected void onPreExecute() {
        Activity activity = activityRef.get();
        if (activity != null && !activity.isFinishing()) {
        progressBar.setVisibility(View.VISIBLE);
        summaryListView.setAdapter(null);
    }}
    @Override
    protected List<AgentTypeSummary> doInBackground(String... params) {
        try {
            summaries.getdata requestData = new summaries.getdata();
            requestData.firstdate = date;
            requestData.user = userCode;

            Gson gson = new Gson();
            String jsonRequest = gson.toJson(requestData);
            String jsonResponse = JsonParser.postjson("GetallCollections", "data", jsonRequest);

            Type transactionListType = new TypeToken<List<transaction>>() {}.getType();
            List<transaction> transactions = gson.fromJson(jsonResponse, transactionListType);

            return groupByAgentAndType(transactions);
        } catch (Exception e) {
            Log.e("AgentTypeSummary", "Error fetching data", e);
            return null;
        }
    }

    private List<AgentTypeSummary> groupByAgentAndType(List<transaction> transactions) {
        // Group by Agent Code
        Map<String, Double> agentTotalMap = new HashMap<>();

        for (transaction t : transactions) {
            agentTotalMap.merge(t.Agent_Code, t.getAmount(), Double::sum);
        }

        // Convert to list of AgentTypeSummary objects
        List<AgentTypeSummary> result = new ArrayList<>();
        for (Map.Entry<String, Double> agentEntry : agentTotalMap.entrySet()) {
            String agentCode = agentEntry.getKey();
            //String agentName = dbHelper.getAgentName(agentCode); // Assuming you have this method

            result.add(new AgentTypeSummary(
                    agentCode,
                    "Total Amount", // Type
                    agentEntry.getValue() // Amount
            ));
        }

        // Sort by Agent Code
        Collections.sort(result, (a, b) -> a.agentCode.compareTo(b.agentCode));

        return result;
    }

    @Override
    protected void onPostExecute(List<AgentTypeSummary> result) {
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



        List<AgentTypeSummary> summaryData = result;
        AgentTypeSummaryAdapter adapter = new AgentTypeSummaryAdapter(cashier_report.this, summaryData);
        ListView listView = findViewById(R.id.cashierreport);
        listView.setAdapter(adapter);

// Optional: Add click listener
        listView.setOnItemClickListener((parent, view, position, id) -> {
            AgentTypeSummary item = adapter.getItem(position);
            // Handle item click
        });

    }
}
}
