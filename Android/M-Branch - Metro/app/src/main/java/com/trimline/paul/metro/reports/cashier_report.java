package com.trimline.paul.metro.reports;

import android.app.AlertDialog;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.CheckBox;
import android.widget.ProgressBar;
import android.widget.TextView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.button.MaterialButton;
import com.google.android.material.datepicker.MaterialDatePicker;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.Agent;
import com.trimline.paul.metro.DB;
import com.trimline.paul.metro.JsonParser;
import com.trimline.paul.metro.R;
import com.trimline.paul.metro.summaries;
import com.trimline.paul.metro.transaction;
import com.trimline.paul.metro.types;
import com.trimline.paul.metro.vehicles;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 * Cashier report: what each cashier (agent) collected on a day, split by
 * transaction type, per vehicle. Data is fetched from the server
 * (GetallCollections) and the per-type buckets are derived from the actual
 * transaction types present, labelled from the synced type catalogue.
 */
public class cashier_report extends AppCompatActivity implements CashierReportAdapter.Callback {
    private RecyclerView recycler;
    private ProgressBar progressBar;
    private MaterialButton dateButton;
    private CheckBox showReversed;
    private TextView emptyView;
    private TextView totalView;
    private final SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy", Locale.US);

    private String selectedDate;
    private String selectedVehicle = "";
    private final ArrayList<String> selectedTypes = new ArrayList<>();
    private DB db;

    // visible rows: agent bands + (when expanded) their vehicle cards
    private final List<CashierAgent> daylist = new ArrayList<>();
    private final List<Object> rows = new ArrayList<>();
    private CashierReportAdapter listAdapter;

    // last fetched (unfiltered) day + the filter options derived from it
    private String cachedDate = null;
    private List<transaction> cachedTransactions = null;
    private final List<String> vehicleOptions = new ArrayList<>();
    private final LinkedHashMap<String, String> typeOptions = new LinkedHashMap<>(); // code -> label
    private final HashMap<String, types> typeCache = new HashMap<>();                // code -> catalogue row
    private final HashMap<String, Agent> agentCache = new HashMap<>();               // code -> agent row

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cashier_report);

        db = new DB(this);

        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        getSupportActionBar().setTitle("Cashier Report");

        recycler = findViewById(R.id.cashierrecycler);
        progressBar = findViewById(R.id.cashierprogress);
        dateButton = findViewById(R.id.cashierdate);
        showReversed = findViewById(R.id.showreversed);
        emptyView = findViewById(R.id.cashierEmpty);
        totalView = findViewById(R.id.cashiertotal);

        recycler.setLayoutManager(new LinearLayoutManager(this));
        listAdapter = new CashierReportAdapter(this, rows, this);
        recycler.setAdapter(listAdapter);

        // Reversed collections are hidden unless this box is ticked, so the
        // report shows an auditable net view by default (same as the other
        // report screens).
        showReversed.setOnCheckedChangeListener((buttonView, isChecked) -> load(false));

        selectedDate = sdf.format(new Date());
        dateButton.setText(selectedDate);
        dateButton.setOnClickListener(v -> {
            MaterialDatePicker.Builder<Long> builder = MaterialDatePicker.Builder.datePicker();
            builder.setTitleText("Select a date");
            final MaterialDatePicker<Long> picker = builder.build();
            picker.show(getSupportFragmentManager(), "cashier_date");
            picker.addOnPositiveButtonClickListener(selection -> {
                // the picker reports UTC millis, format in UTC so the shown
                // day always matches the day that was tapped
                SimpleDateFormat utc = new SimpleDateFormat("dd-MM-yyyy", Locale.US);
                utc.setTimeZone(TimeZone.getTimeZone("UTC"));
                selectedDate = utc.format(new Date(selection));
                dateButton.setText(selectedDate);
                load(true);
            });
        });

        load(true);
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

    /** Reloads the report. forceFetch=true hits the server; otherwise the
     *  cached day is re-grouped (filters and the reversed toggle are applied
     *  client-side, so no network round-trip is needed). */
    private void load(boolean forceFetch) {
        new LoadReportTask(selectedDate, selectedVehicle, new ArrayList<>(selectedTypes),
                showReversed.isChecked(), forceFetch)
                .executeOnExecutor(AsyncTask.SERIAL_EXECUTOR);
    }

    @Override
    public void onToggle() {
        rebuildRows();
    }

    @Override
    public void onVehicleClick(CashierVehicle item) {
        StringBuilder message = new StringBuilder();
        for (transaction t : item.Transactions) {
            double amt = t.getAmount() == null ? 0 : t.getAmount();
            String label = (t.typename == null || t.typename.isEmpty()) ? t.Type : t.typename;
            message.append(t.Time == null ? "" : t.Time)
                    .append("  -  ")
                    .append(label == null ? "" : label)
                    .append("  -  ")
                    .append(String.format("%,.2f", amt))
                    .append("\n");
        }
        String title = item.ItemNo.isEmpty() ? "Collections"
                : item.ItemNo + (item.FleetNo.isEmpty() ? "" : " (" + item.FleetNo + ")");
        new AlertDialog.Builder(this)
                .setTitle("Collections for " + title)
                .setMessage(message.toString())
                .setPositiveButton(android.R.string.ok, null)
                .show();
    }

    /** Flattens the agent -> vehicles hierarchy into the visible rows,
     *  honouring the expanded state of each agent band. */
    private void rebuildRows() {
        rows.clear();
        for (CashierAgent a : daylist) {
            rows.add(a);
            if (!a.Expanded)
                continue;
            rows.addAll(a.Vehicles);
        }
        listAdapter.notifyDataSetChanged();
    }

    private void applyResult(List<CashierAgent> built) {
        daylist.clear();
        if (built != null)
            daylist.addAll(built);
        rebuildRows();

        emptyView.setVisibility(daylist.isEmpty() ? View.VISIBLE : View.GONE);

        double grand = 0;
        for (CashierAgent a : daylist)
            grand += a.Total;
        totalView.setText(String.format("%,.2f", grand));
    }

    // ------------------------------------------------------------------
    // Filtering
    // ------------------------------------------------------------------

    private void showFilterDialog() {
        AlertDialog.Builder builder = new AlertDialog.Builder(this);
        builder.setTitle("Filter Report");

        View view = getLayoutInflater().inflate(R.layout.filter_dialog, null);
        builder.setView(view);

        AutoCompleteTextView vehicleFilter = view.findViewById(R.id.vehicle_filter);
        TextView typeFilterSelect = view.findViewById(R.id.type_filter_select);

        // options come from the last fetched day, so the lists always match
        // the data actually on screen
        ArrayAdapter<String> vehicleAdapter = new ArrayAdapter<>(this,
                android.R.layout.simple_dropdown_item_1line, new ArrayList<>(vehicleOptions));
        vehicleFilter.setAdapter(vehicleAdapter);
        vehicleFilter.setText(selectedVehicle);
        vehicleFilter.setThreshold(1);

        final String[] typeCodes = typeOptions.keySet().toArray(new String[0]);
        final String[] typeLabels = new String[typeCodes.length];
        for (int i = 0; i < typeCodes.length; i++)
            typeLabels[i] = typeOptions.get(typeCodes[i]);
        final boolean[] checkedTypes = new boolean[typeCodes.length];
        for (int i = 0; i < typeCodes.length; i++)
            checkedTypes[i] = selectedTypes.contains(typeCodes[i]);

        updateTypeFilterText(typeFilterSelect, typeLabels, checkedTypes);

        typeFilterSelect.setOnClickListener(v -> {
            AlertDialog.Builder typeBuilder = new AlertDialog.Builder(cashier_report.this);
            typeBuilder.setTitle("Select Types");
            typeBuilder.setMultiChoiceItems(typeLabels, checkedTypes, (dialog, which, isChecked) -> {
                checkedTypes[which] = isChecked;
            });
            typeBuilder.setPositiveButton("OK", (dialog, which) -> {
                selectedTypes.clear();
                for (int i = 0; i < checkedTypes.length; i++) {
                    if (checkedTypes[i])
                        selectedTypes.add(typeCodes[i]);
                }
                updateTypeFilterText(typeFilterSelect, typeLabels, checkedTypes);
            });
            typeBuilder.setNegativeButton("Cancel", (dialog, which) -> dialog.dismiss());
            typeBuilder.create().show();
        });

        builder.setPositiveButton("Filter", (dialog, which) -> {
            selectedVehicle = vehicleFilter.getText().toString().trim();
            load(false);
        });

        builder.setNegativeButton("Cancel", (dialog, which) -> dialog.cancel());

        builder.setNeutralButton("Clear", (dialog, which) -> {
            selectedVehicle = "";
            selectedTypes.clear();
            load(false);
        });

        builder.show();
    }

    private void updateTypeFilterText(TextView view, String[] labels, boolean[] checked) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < checked.length; i++) {
            if (!checked[i])
                continue;
            if (sb.length() > 0)
                sb.append(", ");
            sb.append(labels[i]);
        }
        view.setText(sb.length() == 0 ? "Select Types" : sb.toString());
    }

    // ------------------------------------------------------------------
    // Load + grouping (background)
    // ------------------------------------------------------------------

    private class LoadReportTask extends AsyncTask<Void, Void, List<CashierAgent>> {
        private final String date;
        private final String vehicle;
        private final ArrayList<String> typeFilter;
        private final boolean showrev;
        private final boolean forceFetch;

        LoadReportTask(String date, String vehicle, ArrayList<String> typeFilter,
                       boolean showrev, boolean forceFetch) {
            this.date = date;
            this.vehicle = vehicle;
            this.typeFilter = typeFilter;
            this.showrev = showrev;
            this.forceFetch = forceFetch;
        }

        @Override
        protected void onPreExecute() {
            progressBar.setVisibility(View.VISIBLE);
        }

        @Override
        protected List<CashierAgent> doInBackground(Void... params) {
            try {
                List<transaction> all;
                if (!forceFetch && cachedTransactions != null && date.equals(cachedDate)) {
                    all = cachedTransactions;
                } else {
                    summaries.getdata request = new summaries.getdata();
                    request.firstdate = date;   // dd-MM-yyyy, same as the app-wide convention
                    request.user = "";
                    Gson gson = new Gson();
                    String response = JsonParser.postjson("GetallCollections", "data", gson.toJson(request));
                    Type listType = new TypeToken<List<transaction>>() {
                    }.getType();
                    all = gson.fromJson(response, listType);
                    if (all == null)
                        return null;
                    cachedDate = date;
                    cachedTransactions = all;
                    buildFilterOptions(all);
                }

                List<transaction> filtered = new ArrayList<>();
                for (transaction t : all) {
                    // rows the app marked as reversed locally are hidden unless the box
                    // is ticked (server-made reversals net to zero on their own)
                    if (!showrev && t.Constituency != null && t.Constituency.equals("1"))
                        continue;
                    if (!vehicle.isEmpty()
                            && (t.Loan_No == null || !t.Loan_No.equalsIgnoreCase(vehicle)))
                        continue;
                    if (!typeFilter.isEmpty()) {
                        boolean hit = false;
                        for (String code : typeFilter) {
                            if (code != null && code.equalsIgnoreCase(t.Type)) {
                                hit = true;
                                break;
                            }
                        }
                        if (!hit)
                            continue;
                    }
                    filtered.add(t);
                }

                return group(filtered);
            } catch (Exception e) {
                Log.e("cashier_report", "Failed to load report", e);
                return null;
            }
        }

        @Override
        protected void onPostExecute(List<CashierAgent> built) {
            progressBar.setVisibility(View.GONE);
            if (isFinishing())
                return;
            if (built == null) {
                Toast.makeText(cashier_report.this, "Could not load the report", Toast.LENGTH_LONG).show();
                return;
            }
            applyResult(built);
        }
    }

    /** Distinct vehicles/types for the filter dialog, ordered the same way the
     *  catalogue orders types. */
    private void buildFilterOptions(List<transaction> all) {
        java.util.TreeSet<String> vehs = new java.util.TreeSet<>(String.CASE_INSENSITIVE_ORDER);
        LinkedHashMap<String, Integer> order = new LinkedHashMap<>();
        for (transaction t : all) {
            if (t.Loan_No != null && !t.Loan_No.trim().isEmpty())
                vehs.add(t.Loan_No.trim());
            String code = t.Type == null ? "" : t.Type;
            if (!code.isEmpty() && !order.containsKey(code))
                order.put(code, orderFor(code));
        }
        vehicleOptions.clear();
        vehicleOptions.addAll(vehs);

        List<String> codes = new ArrayList<>(order.keySet());
        final LinkedHashMap<String, Integer> finalOrder = order;
        Collections.sort(codes, new Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                int oa = finalOrder.containsKey(a) ? finalOrder.get(a) : 9999;
                int ob = finalOrder.containsKey(b) ? finalOrder.get(b) : 9999;
                if (oa != ob)
                    return oa - ob;
                return a.compareToIgnoreCase(b);
            }
        });
        typeOptions.clear();
        for (String code : codes)
            typeOptions.put(code, labelFor(code));
    }

    /** Groups the day's transactions: agent -> vehicle, summing per type. All
     *  DB lookups (agent name, fleet no, type labels) happen here on the
     *  background thread. */
    private List<CashierAgent> group(List<transaction> filtered) {
        LinkedHashMap<String, CashierAgent> agents = new LinkedHashMap<>();
        HashMap<String, HashMap<String, CashierVehicle>> vehiclesByAgent = new HashMap<>();
        HashMap<String, Integer> labelOrder = new HashMap<>();

        for (transaction t : filtered) {
            // NAV stores the agent as either the code ("ESTHER") or the name
            // ("Esther Nyokabi"). Resolve through the agent table and merge by
            // display name so one cashier never shows up as two rows.
            AgentInfo ai = agentInfo(t.Agent_Code);
            String key = ai.mergeKey;
            CashierAgent a = agents.get(key);
            if (a == null) {
                a = new CashierAgent();
                a.Name = ai.name;
                a.Code = ai.code;
                a.Resolved = ai.resolved;
                agents.put(key, a);
                vehiclesByAgent.put(key, new HashMap<String, CashierVehicle>());
            } else if (!a.Resolved && ai.resolved) {
                // a resolvable code showed up later - adopt the canonical form
                a.Name = ai.name;
                a.Code = ai.code;
                a.Resolved = true;
            }

            String label = labelFor(t.Type);
            if (!labelOrder.containsKey(label))
                labelOrder.put(label, orderFor(t.Type));
            t.typename = label;

            String itemNo = t.Loan_No == null ? "" : t.Loan_No.trim();
            HashMap<String, CashierVehicle> vmap = vehiclesByAgent.get(key);
            CashierVehicle v = vmap.get(itemNo);
            if (v == null) {
                v = new CashierVehicle();
                v.ItemNo = itemNo;
                vmap.put(itemNo, v);
                a.Vehicles.add(v);
            }

            double amt = t.getAmount() == null ? 0 : t.getAmount();
            v.Count++;
            v.Total += amt;
            v.Transactions.add(t);
            v.TypeSums.merge(label, amt, Double::sum);
            a.Count++;
            a.Total += amt;
            a.TypeTotals.merge(label, amt, Double::sum);
        }

        List<CashierAgent> built = new ArrayList<>(agents.values());
        for (CashierAgent a : built) {
            a.VehicleCount = a.Vehicles.size();
            for (CashierVehicle v : a.Vehicles) {
                if (!v.ItemNo.isEmpty()) {
                    vehicles veh = db.getvehicle(v.ItemNo);
                    v.FleetNo = (veh != null && veh.Fleet_No != null) ? veh.Fleet_No.trim() : "";
                }
                reorderSums(v.TypeSums, labelOrder);
            }
            sortVehicles(a.Vehicles);
            reorderSums(a.TypeTotals, labelOrder);
        }
        sortAgents(built);
        return built;
    }

    /** Re-orders an accumulated map so the breakdown follows the catalogue
     *  order (then alphabetical for anything unknown). */
    private static void reorderSums(LinkedHashMap<String, Double> sums,
                                    HashMap<String, Integer> labelOrder) {
        List<String> keys = new ArrayList<>(sums.keySet());
        final HashMap<String, Integer> order = labelOrder;
        Collections.sort(keys, new Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                int oa = order.containsKey(a) ? order.get(a) : 9999;
                int ob = order.containsKey(b) ? order.get(b) : 9999;
                if (oa != ob)
                    return oa - ob;
                return a.compareToIgnoreCase(b);
            }
        });
        LinkedHashMap<String, Double> ordered = new LinkedHashMap<>();
        for (String k : keys)
            ordered.put(k, sums.get(k));
        sums.clear();
        sums.putAll(ordered);
    }

    private static void sortVehicles(List<CashierVehicle> vs) {
        Collections.sort(vs, new Comparator<CashierVehicle>() {
            @Override
            public int compare(CashierVehicle a, CashierVehicle b) {
                return a.ItemNo.compareToIgnoreCase(b.ItemNo);
            }
        });
    }

    private static void sortAgents(List<CashierAgent> as) {
        Collections.sort(as, new Comparator<CashierAgent>() {
            @Override
            public int compare(CashierAgent a, CashierAgent b) {
                String na = a.Name == null ? "" : a.Name;
                String nb = b.Name == null ? "" : b.Name;
                int c = na.compareToIgnoreCase(nb);
                if (c != 0)
                    return c;
                return a.Code.compareToIgnoreCase(b.Code);
            }
        });
    }

    // ------------------------------------------------------------------
    // Type catalogue helpers
    // ------------------------------------------------------------------

    /** Agent identity for one transaction row: the display name and canonical
     *  code when the value resolves through the agent table, otherwise the raw
     *  value from the server. mergeKey is the name (case-insensitive) so the
     *  code and name forms of the same cashier end up in one group. */
    private static class AgentInfo {
        String name = "";
        String code = "";
        String mergeKey = "";
        boolean resolved;
    }

    private AgentInfo agentInfo(String rawCode) {
        AgentInfo ai = new AgentInfo();
        String code = rawCode == null ? "" : rawCode.trim();
        Agent ag = agentFor(code);
        if (ag != null && ag.Name != null && !ag.Name.isEmpty()) {
            ai.name = ag.Name;
            ai.code = ag.Agent_Code == null ? code : ag.Agent_Code;
            ai.resolved = true;
        } else {
            ai.name = code;
            ai.code = code;
        }
        String key = ai.name.trim().toUpperCase(Locale.US);
        ai.mergeKey = key.isEmpty() ? "~no-agent~" : key;
        return ai;
    }

    private Agent agentFor(String code) {
        if (code == null || code.isEmpty())
            return null;
        if (agentCache.containsKey(code))
            return agentCache.get(code);
        Agent ag = db.getagent(code);
        agentCache.put(code, ag);
        return ag;
    }

    /** Catalogue row for a type code (cached; inactive/historical types are
     *  still resolved so old collections show their proper name). */
    private types typeInfo(String code) {
        if (code == null || code.isEmpty())
            return null;
        if (typeCache.containsKey(code))
            return typeCache.get(code);
        types t = db.gettype(code);
        typeCache.put(code, t);
        return t;
    }

    private String labelFor(String code) {
        if (code == null || code.isEmpty())
            return "Others";
        types t = typeInfo(code);
        return (t != null && t.Name != null && !t.Name.isEmpty()) ? t.Name : code;
    }

    private int orderFor(String code) {
        types t = typeInfo(code);
        return t == null ? 9999 : t.Order;
    }
}
