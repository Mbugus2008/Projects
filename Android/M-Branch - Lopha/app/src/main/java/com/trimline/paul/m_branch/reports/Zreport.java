package com.trimline.paul.m_branch.reports;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.view.Gravity;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;

import com.trimline.paul.m_branch.DB;
import com.trimline.paul.m_branch.R;
import com.trimline.paul.m_branch.transaction;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class Zreport extends AppCompatActivity {

    private DB db;
    private final Calendar selected = Calendar.getInstance();
    private final SimpleDateFormat dayFormat = new SimpleDateFormat("dd-MM-yyyy", Locale.US);

    private TextView dateView, totalView, receiptsView, generatedView;
    private LinearLayout typesBox;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_zreport);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle("Z Report");
        toolbar.setNavigationIcon(R.drawable.ic_arrow_back);
        toolbar.setNavigationOnClickListener(v -> finish());

        db = new DB(this);
        dateView = findViewById(R.id.zdate);
        totalView = findViewById(R.id.ztotal);
        receiptsView = findViewById(R.id.zreceipts);
        generatedView = findViewById(R.id.zgenerated);
        typesBox = findViewById(R.id.ztypes);

        dateView.setOnClickListener(v -> new DatePickerDialog(this, (view, year, month, dayOfMonth) -> {
            selected.set(year, month, dayOfMonth);
            load();
        }, selected.get(Calendar.YEAR), selected.get(Calendar.MONTH), selected.get(Calendar.DAY_OF_MONTH)).show());

        load();
    }

    private void load() {
        String date = dayFormat.format(selected.getTime());
        dateView.setText(date);

        ArrayList<transaction> rows = db.gettransbydate(date);
        double total = 0;
        LinkedHashMap<String, Double> typeAmounts = new LinkedHashMap<>();
        LinkedHashMap<String, Integer> typeCounts = new LinkedHashMap<>();

        for (transaction t : rows) {
            double amount = t.Amount == null ? 0 : t.Amount;
            total += amount;

            String type = t.typename;
            if (type == null || type.trim().isEmpty()) {
                type = (t.Type == null || t.Type.trim().isEmpty()) ? "OTHER" : t.Type;
            }
            Double typeAmount = typeAmounts.get(type);
            typeAmounts.put(type, (typeAmount == null ? 0 : typeAmount) + amount);
            Integer typeCount = typeCounts.get(type);
            typeCounts.put(type, (typeCount == null ? 0 : typeCount) + 1);
        }

        totalView.setText(String.format(Locale.US, "KES %,.2f", total));
        receiptsView.setText(String.valueOf(rows.size()));

        typesBox.removeAllViews();
        if (typeAmounts.isEmpty()) {
            typesBox.addView(emptyRow("No collections for this date"));
        } else {
            for (Map.Entry<String, Double> entry : sorted(typeAmounts)) {
                Integer count = typeCounts.get(entry.getKey());
                addRow(typesBox, entry.getKey(), (count == null ? 0 : count) + " receipts", entry.getValue());
            }
            addTotalRow(typesBox, total);
        }

        generatedView.setText("Generated " + new SimpleDateFormat("dd-MM-yyyy HH:mm", Locale.US).format(new java.util.Date()));
    }

    private List<Map.Entry<String, Double>> sorted(LinkedHashMap<String, Double> map) {
        List<Map.Entry<String, Double>> entries = new ArrayList<>(map.entrySet());
        Collections.sort(entries, new Comparator<Map.Entry<String, Double>>() {
            @Override
            public int compare(Map.Entry<String, Double> a, Map.Entry<String, Double> b) {
                return b.getValue().compareTo(a.getValue());
            }
        });
        return entries;
    }

    private void addRow(LinearLayout parent, String label, String detail, double amount) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(8), 0, dp(8));

        TextView name = new TextView(this);
        name.setText(label);
        name.setTextColor(getColor(R.color.brand_text));
        name.setTextSize(13);
        name.setTypeface(name.getTypeface(), android.graphics.Typeface.BOLD);
        name.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView meta = new TextView(this);
        meta.setText(detail);
        meta.setTextColor(getColor(R.color.brand_muted));
        meta.setTextSize(11);
        meta.setPadding(dp(8), 0, dp(12), 0);

        TextView value = new TextView(this);
        value.setText(String.format(Locale.US, "%,.2f", amount));
        value.setTextColor(getColor(R.color.brand_ink));
        value.setTextSize(13);
        value.setTypeface(value.getTypeface(), android.graphics.Typeface.BOLD);
        value.setGravity(Gravity.END);

        row.addView(name);
        row.addView(meta);
        row.addView(value);
        parent.addView(row);
        parent.addView(divider());
    }

    private void addTotalRow(LinearLayout parent, double total) {
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER_VERTICAL);
        row.setPadding(0, dp(10), 0, 0);

        TextView name = new TextView(this);
        name.setText("TOTAL");
        name.setTextColor(getColor(R.color.brand_ink));
        name.setTextSize(14);
        name.setTypeface(name.getTypeface(), android.graphics.Typeface.BOLD);
        name.setLayoutParams(new LinearLayout.LayoutParams(0, LinearLayout.LayoutParams.WRAP_CONTENT, 1f));

        TextView value = new TextView(this);
        value.setText(String.format(Locale.US, "%,.2f", total));
        value.setTextColor(getColor(R.color.brand_orange_dark));
        value.setTextSize(15);
        value.setTypeface(value.getTypeface(), android.graphics.Typeface.BOLD);
        value.setGravity(Gravity.END);

        row.addView(name);
        row.addView(value);
        parent.addView(row);
    }

    private TextView emptyRow(String text) {
        TextView empty = new TextView(this);
        empty.setText(text);
        empty.setTextColor(getColor(R.color.brand_muted));
        empty.setTextSize(13);
        empty.setPadding(0, dp(8), 0, dp(8));
        return empty;
    }

    private View divider() {
        View line = new View(this);
        line.setLayoutParams(new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, dp(1)));
        line.setBackgroundColor(getColor(R.color.brand_outline));
        return line;
    }

    private int dp(int value) {
        return (int) (getResources().getDisplayMetrics().density * value);
    }
}