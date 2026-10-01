package com.trimline.paul.metro;

import android.app.DatePickerDialog;
import android.os.Bundle;

import android.view.View;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.DatePicker;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

public class summary extends AppCompatActivity {
    SummaryRecyclerAdapter listAdapter;
    List<summaries.typeday> daylist;
    List<Object> rows; // flattened visible rows (date group / type group / transaction)
    RecyclerView report;
    Button setdate;
    CheckBox showreversed;
    String date = ""; // "" = show all dates
    private int mYear, mMonth, mDay;
    DB db = null;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_daily_summary);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Daily summary");
        report = (RecyclerView) findViewById(R.id.summaryrecycler);
        db = new DB(this);

        // The list is flattened manually (date -> type -> transactions) so both
        // group levels (date and type) can expand and collapse independently.
        report.setLayoutManager(new LinearLayoutManager(this));
        rows = new ArrayList<Object>();
        listAdapter = new SummaryRecyclerAdapter(this, db, rows, new Runnable() {
            @Override
            public void run() {
                rebuildRows();
            }
        });
        report.setAdapter(listAdapter);

        // Reversed transactions are hidden unless this box is ticked, so the
        // report shows an auditable net view by default.
        showreversed = (CheckBox) findViewById(R.id.showreversed);
        showreversed.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                DateCollection();
            }
        });

        // The date button filters the report down to a single day;
        // with no selection it shows all dates. Long press = all dates again.
        final Calendar c = Calendar.getInstance();
        mYear = c.get(Calendar.YEAR);
        mMonth = c.get(Calendar.MONTH);
        mDay = c.get(Calendar.DAY_OF_MONTH);
        setdate = (Button) findViewById(R.id.Date);
        setdate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                DatePickerDialog datePickerDialog = new DatePickerDialog(summary.this,
                        new DatePickerDialog.OnDateSetListener() {
                            @Override
                            public void onDateSet(DatePicker view, int year, int monthOfYear, int dayOfMonth) {
                                DecimalFormat mFormat = new DecimalFormat("00");
                                date = mFormat.format(Double.valueOf(dayOfMonth)) + "-" + mFormat.format(Double.valueOf(monthOfYear + 1)) + "-" + year;
                                mYear = year;
                                mMonth = monthOfYear;
                                mDay = dayOfMonth;
                                setdate.setText(date);
                                DateCollection();
                            }
                        }, mYear, mMonth, mDay);
                datePickerDialog.show();
            }
        });
        setdate.setOnLongClickListener(new View.OnLongClickListener() {
            @Override
            public boolean onLongClick(View v) {
                date = "";
                setdate.setText("Select date");
                DateCollection();
                Toast.makeText(getApplicationContext(), "Showing all dates", Toast.LENGTH_SHORT).show();
                return true;
            }
        });

        DateCollection();

        // (Old ExpandableListView click/listen hooks removed - taps on date
        // cards and type headers are handled by the RecyclerView adapter.)
    }

    private void DateCollection() {
        daylist = new ArrayList<summaries.typeday>();

        List<summaries.collectiondates> dates;
        if (date.equals("")) {
            dates = db.getcollectiondates();
        } else {
            summaries.collectiondates d = new summaries.collectiondates();
            d.date = date;
            dates = new ArrayList<summaries.collectiondates>();
            dates.add(d);
        }

        List<types> tyy = db.gettypes();
        for (summaries.collectiondates c : dates
        ) {
            List<transaction> t = db.gettransbydate(c.date);

            if (!showreversed.isChecked()) {
                // hide reversed entries (Constituency "1" marks both the
                // reversed original and its reversal batch)
                List<transaction> keep = new ArrayList<transaction>();
                for (transaction tt : t
                ) {
                    if (tt.Constituency == null || !tt.Constituency.equals("1"))
                        keep.add(tt);
                }
                t = keep;
            }
            if (t.isEmpty())
                continue;

            // Group the day's transactions by type so each day shows a
            // per-type breakdown: type header (with subtotal) then its rows.
            // Display names resolve from the synced types table; inactive
            // (historical) types are still looked up so old collections show
            // their proper name instead of the raw code.
            final LinkedHashMap<String, List<transaction>> bytype = new LinkedHashMap<String, List<transaction>>();
            HashMap<String, String> typenames = new HashMap<String, String>();
            HashMap<String, Integer> vehicleOwners = null; // lazily loaded vehicle -> Owner map
            for (transaction tt : t
            ) {
                if (!typenames.containsKey(tt.Type)) {
                    String nm = null;
                    for (types o : tyy
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

                // OffLoad rows are split by the vehicle's owner so the day
                // shows how much was offloaded for Sacco vs Investor vehicles
                // (Owner 1 = Sacco, 2 = Investor). Unclassified vehicles stay
                // in the plain OffLoad group.
                String key = tt.Type;
                if ("OFFLOAD".equalsIgnoreCase(tt.Type)) {
                    if (vehicleOwners == null) {
                        vehicleOwners = new HashMap<String, Integer>();
                        for (vehicles v : db.getvehicles()) {
                            if (v.Vehicle_Number != null)
                                vehicleOwners.put(v.Vehicle_Number.toUpperCase().trim(), v.Owner);
                        }
                    }
                    Integer owner = (tt.Loan_No == null) ? null
                            : vehicleOwners.get(tt.Loan_No.toUpperCase().trim());
                    if (owner != null && owner == 1) {
                        key = "OFFLOAD#SACCO";
                        tt.typename = tt.typename + " - Sacco";
                    } else if (owner != null && owner == 2) {
                        key = "OFFLOAD#INVESTOR";
                        tt.typename = tt.typename + " - Investor";
                    }
                }

                if (!bytype.containsKey(key))
                    bytype.put(key, new ArrayList<transaction>());
                bytype.get(key).add(tt);
            }

            List<String> codes = new ArrayList<String>(bytype.keySet());
            Collections.sort(codes, new Comparator<String>() {
                @Override
                public int compare(String a, String b) {
                    return bytype.get(a).get(0).typename.compareTo(bytype.get(b).get(0).typename);
                }
            });

            summaries.typeday d = new summaries.typeday();
            d.date = c.date;
            d.Count = t.size();
            double daytotal = 0.0;
            for (String code : codes
            ) {
                List<transaction> group = bytype.get(code);
                summaries.typegroup tg = new summaries.typegroup();
                tg.Name = group.get(0).typename;
                tg.Count = group.size();
                double subtotal = 0.0;
                for (transaction tt : group
                ) {
                    subtotal += tt.getAmount();
                }
                tg.Total = subtotal;
                tg.Items = group;
                daytotal += subtotal;
                d.Types.add(tg);
            }
            d.Total = daytotal;
            daylist.add(d);
        }

        rebuildRows();

        TextView empty = (TextView) findViewById(R.id.summaryEmpty);
        if (empty != null) {
            boolean none = daylist.isEmpty() || daylist.get(0).Count == 0;
            if (none) {
                empty.setText(date.equals("") ? "No collections found" : "No collections on " + date);
                empty.setVisibility(View.VISIBLE);
            } else {
                empty.setVisibility(View.GONE);
            }
        }

    }

    /** Flattens the date -> type -> transactions hierarchy into the visible
     *  rows, honouring the expanded state of both group levels. */
    private void rebuildRows() {
        rows.clear();
        for (summaries.typeday d : daylist
        ) {
            rows.add(d);
            if (!d.Expanded)
                continue;
            for (summaries.typegroup tg : d.Types
            ) {
                rows.add(tg);
                if (tg.Expanded)
                    rows.addAll(tg.Items);
            }
        }
        listAdapter.notifyDataSetChanged();
    }
}
