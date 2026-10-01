package com.trimline.paul.metro;

import android.Manifest;
import android.bluetooth.BluetoothDevice;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.graphics.drawable.GradientDrawable;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.Editable;
import android.text.TextWatcher;

import androidx.annotation.NonNull;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.navigation.NavigationView;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.metro.reports.cashier_report;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;

public class menu extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    View cash, paymentstatus, Parcel;
    DB db;
    private VehStatusAdapter vehAdapter;
    private final List<VsRow> vehRows = new ArrayList<VsRow>();
    private boolean vehFetching = false;
    /** How often the whole-fleet Vehicle Status card re-fetches (each poll is ~1 MB,
     *  so keep it gentle: the server is shared with the office dashboards). */
    private static final long VEH_REFRESH_MS = 300000L; // 5 minutes
    private final Handler vehRefreshHandler = new Handler();
    private final Runnable vehRefreshTick = new Runnable() {
        @Override
        public void run() {
            if (!vehFetching && Myvariables.CurrentAgent != null && Myvariables.CurrentAgent.Account_type != 0)
                refreshVehicleStatusSilently();
            vehRefreshHandler.postDelayed(this, VEH_REFRESH_MS);
        }
    };
    View printer;
    View printerDot;
    TextView printerStatus;
    SharedPreferences preferences;
    private summaries.printer p = new summaries.printer();
    summaries.Printerthread sp;
    private updatemembers membersupdate;


    private final BroadcastReceiver mReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            if (BluetoothDevice.ACTION_ACL_DISCONNECTED.equals(action)) {
                try {
                    BluetoothDevice device = intent
                            .getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                    if (summaries.printer.printerdevice != null
                            && summaries.printer.printerdevice.equals(device)) {
                        mHandler.obtainMessage(Constants.PRINTER_DISCONNECTED).sendToTarget();
                        if (summaries.printer.printersock != null)
                            summaries.printer.printersock.close();
                        if (summaries.printer.printerout != null)
                            summaries.printer.printerout.close();
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        }
    };

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Top-right overflow menu removed - Settings lives in the drawer.
        return false;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {


        switch (item.getItemId()) {

            case R.id.settings: {
                Intent summary = new Intent(menu.this, Settings.class);
                startActivity(summary);
                return true;
            }

        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void onResume() {
        super.onResume();

        new getreversals().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        UpdateChecker.onResume(this);
        // Agents (Account_type 0) see their own Today's Summary + Recent Receipts;
        // supervisors/admins see the whole-fleet Vehicle Status card instead.
        boolean agent = Myvariables.CurrentAgent == null || Myvariables.CurrentAgent.Account_type == 0;
        setVisible(R.id.todayTitle, agent);
        setVisible(R.id.todayCard, agent);
        setVisible(R.id.recentTitle, agent);
        setVisible(R.id.recentCard, agent);
        if (agent) {
            loadRecentReceipts();
            loadTodaySummary();
        }
        loadVehicleStatus();
        vehRefreshHandler.removeCallbacks(vehRefreshTick);
        vehRefreshHandler.postDelayed(vehRefreshTick, VEH_REFRESH_MS);

    }

    @Override
    protected void onPause() {
        super.onPause();
        vehRefreshHandler.removeCallbacks(vehRefreshTick);
    }

    private void setVisible(int id, boolean visible) {
        View v = findViewById(id);
        if (v != null) v.setVisibility(visible ? View.VISIBLE : View.GONE);
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        if (drawer != null && drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            finishAffinity();
        }
    }

    private void setPrinterStatus(boolean connected) {
        if (printerDot == null || printerStatus == null) return;
        printerStatus.setText(connected ? "Printer connected" : "Printer not connected");
        printerStatus.setTextColor(connected ? 0xFF2E7D32 : 0xFF757575);
        GradientDrawable dot = new GradientDrawable();
        dot.setShape(GradientDrawable.OVAL);
        dot.setColor(connected ? 0xFF4CAF50 : 0xFF9E9E9E);
        printerDot.setBackground(dot);
    }

    private void loadRecentReceipts() {
        LinearLayout container = findViewById(R.id.recentReceiptsContainer);
        TextView empty = findViewById(R.id.recentEmpty);
        if (container == null || empty == null) return;
        container.removeAllViews();
        LayoutInflater inflater = LayoutInflater.from(this);
        int shown = 0;
        for (summaries.Receipts r : db.getcollectionreceipts()) {
            if (shown >= 5) break;
            List<transaction> trans = db.gettransbybatch(r.receipt);
            if (trans == null || trans.isEmpty()) continue;
            // hide reversed receipts (Constituency "1" marks the reversed
            // original and its reversal batch, same as the reports)
            List<transaction> active = new ArrayList<transaction>();
            for (transaction t : trans) {
                if (t.Constituency == null || !t.Constituency.equals("1"))
                    active.add(t);
            }
            if (active.isEmpty()) continue;
            transaction first = active.get(0);
            double total = 0;
            for (transaction t : active) {
                if (t.getAmount() != null) total += t.getAmount();
            }
            View row = inflater.inflate(R.layout.item_recent_receipt, container, false);
            ((TextView) row.findViewById(R.id.receiptRef)).setText("Ref: " + r.receipt);
            StringBuilder meta = new StringBuilder();
            if (first.Date != null) meta.append(first.Date);
            if (first.Time != null) meta.append(" ").append(first.Time);
            if (first.Loan_No != null && !first.Loan_No.isEmpty())
                meta.append("  ·  ").append(first.Loan_No);
            meta.append("  ·  ").append(active.size()).append(active.size() == 1 ? " item" : " items");
            ((TextView) row.findViewById(R.id.receiptMeta)).setText(meta.toString());
            ((TextView) row.findViewById(R.id.receiptTotal)).setText(String.format("%,.2f", total));
            container.addView(row);
            shown++;
        }
        if (shown > 0) {
            View lastRow = container.getChildAt(container.getChildCount() - 1);
            View divider = lastRow.findViewById(R.id.receiptDivider);
            if (divider != null) divider.setVisibility(View.GONE);
        }
        empty.setVisibility(shown == 0 ? View.VISIBLE : View.GONE);
        container.setVisibility(shown == 0 ? View.GONE : View.VISIBLE);
    }

    /** Today's collections summarised per transaction type; reversed entries
     *  are excluded, consistent with the reports. */
    private void loadTodaySummary() {
        LinearLayout container = findViewById(R.id.todayContainer);
        TextView empty = findViewById(R.id.todayEmpty);
        TextView totalView = findViewById(R.id.todayTotal);
        View totalRow = findViewById(R.id.todayTotalRow);
        View divider = findViewById(R.id.todayDivider);
        if (container == null || empty == null || totalView == null || totalRow == null) return;
        container.removeAllViews();

        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        List<transaction> trans = db.gettransbydate(df.format(new Date()));
        if (trans == null) trans = new ArrayList<transaction>();

        LinkedHashMap<String, Double> sums = new LinkedHashMap<String, Double>();
        HashMap<String, String> names = new HashMap<String, String>();
        HashMap<String, Integer> vehicleOwners = null; // lazily loaded vehicle -> Owner map
        List<types> tyy = db.gettypes();
        double grand = 0;
        for (transaction t : trans) {
            if (t.Constituency != null && t.Constituency.equals("1"))
                continue; // reversed
            String code = t.Type == null ? "" : t.Type;
            if (!names.containsKey(code)) {
                String nm = null;
                for (types o : tyy) {
                    if (o.Code.contentEquals(code)) {
                        nm = o.Name;
                        break;
                    }
                }
                if (nm == null) {
                    types in = db.gettype(code);
                    nm = (in != null) ? in.Name : code;
                }
                names.put(code, nm);
            }
            // OffLoad rows are split by the vehicle's owner (1 = Sacco,
            // 2 = Investor) so the dashboard matches the Daily summary.
            // Unclassified vehicles (blank owner) stay in the plain group.
            String key = code;
            if ("OFFLOAD".equalsIgnoreCase(code)) {
                if (vehicleOwners == null) {
                    vehicleOwners = new HashMap<String, Integer>();
                    for (vehicles v : db.getvehicles()) {
                        if (v.Vehicle_Number != null)
                            vehicleOwners.put(v.Vehicle_Number.toUpperCase().trim(), v.Owner);
                    }
                }
                Integer owner = (t.Loan_No == null) ? null
                        : vehicleOwners.get(t.Loan_No.toUpperCase().trim());
                if (owner != null && owner == 1) {
                    key = "OFFLOAD#SACCO";
                    if (!names.containsKey(key))
                        names.put(key, names.get(code) + " - Sacco");
                } else if (owner != null && owner == 2) {
                    key = "OFFLOAD#INVESTOR";
                    if (!names.containsKey(key))
                        names.put(key, names.get(code) + " - Investor");
                }
            }

            double amt = t.getAmount() == null ? 0 : t.getAmount();
            Double prev = sums.get(key);
            sums.put(key, prev == null ? amt : prev + amt);
            grand += amt;
        }

        List<String> codes = new ArrayList<String>(sums.keySet());
        Collections.sort(codes, new Comparator<String>() {
            @Override
            public int compare(String a, String b) {
                return names.get(a).compareTo(names.get(b));
            }
        });

        LayoutInflater inflater = LayoutInflater.from(this);
        for (String code : codes) {
            View row = inflater.inflate(R.layout.item_today_type, container, false);
            ((TextView) row.findViewById(R.id.typeName)).setText(names.get(code));
            ((TextView) row.findViewById(R.id.typeTotal)).setText(String.format("%,.2f", sums.get(code)));
            container.addView(row);
        }

        boolean none = codes.isEmpty();
        empty.setVisibility(none ? View.VISIBLE : View.GONE);
        container.setVisibility(none ? View.GONE : View.VISIBLE);
        totalRow.setVisibility(none ? View.GONE : View.VISIBLE);
        if (divider != null) divider.setVisibility(none ? View.GONE : View.VISIBLE);
        totalView.setText(String.format("%,.2f", grand));
    }

    /** Whole-fleet payment status for today (Management bucket / other types /
     *  total per vehicle) shown on the main screen for supervisors and admins
     *  (Account_type != 0 only) — same data as the Payment Status page. */
    private void loadVehicleStatus() {
        TextView title = findViewById(R.id.vehStatusTitle);
        View card = findViewById(R.id.vehStatusCard);
        if (card == null) return;
        boolean show = Myvariables.CurrentAgent != null && Myvariables.CurrentAgent.Account_type != 0;
        card.setVisibility(show ? View.VISIBLE : View.GONE);
        if (title != null) title.setVisibility(show ? View.VISIBLE : View.GONE);
        if (!show) return;
        if (vehRows.isEmpty()) {
            TextView empty = findViewById(R.id.vehStatusEmpty);
            if (empty != null) {
                empty.setText("Loading vehicle status...");
                empty.setVisibility(View.VISIBLE);
            }
        }
        if (!vehFetching) {
            vehFetching = true;
            new getvehstatus(false).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
    }

    /** Same fetch as loadVehicleStatus, but with no loading state — the list just
     *  updates in place when fresh data arrives (used by the background 60s tick). */
    private void refreshVehicleStatusSilently() {
        if (vehFetching) return;
        vehFetching = true;
        new getvehstatus(true).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
    }

    private class getvehstatus extends AsyncTask<Void, Void, List<transaction>> {
        private final boolean silent;

        getvehstatus(boolean silent) {
            this.silent = silent;
        }

        @Override
        protected List<transaction> doInBackground(Void... params) {
            try {
                SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
                summaries.getdata gt = new summaries.getdata();
                gt.firstdate = df.format(new Date());
                gt.user = "";
                String result = JsonParser.postjson("GetallCollections", "data", new Gson().toJson(gt));
                Type localType = new TypeToken<List<transaction>>() {
                }.getType();
                return new Gson().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }

        @Override
        protected void onPostExecute(List<transaction> res) {
            vehFetching = false;
            renderVehicleStatus(res, silent);
        }
    }

    private void renderVehicleStatus(List<transaction> res, boolean silent) {
        TextView empty = findViewById(R.id.vehStatusEmpty);
        RecyclerView list = findViewById(R.id.vehStatusList);
        if (empty == null || list == null) return;
        if (res == null) {
            if (silent) return; // keep showing the last good data
            empty.setText("Unable to load vehicle status");
            empty.setVisibility(View.VISIBLE);
            list.setVisibility(View.GONE);
            return;
        }

        // Every transaction is summed - a reversed payment's two lines (the original
        // and the negative mirror, whatever its Constituency) cancel each other out.
        LinkedHashMap<String, double[]> agg = new LinkedHashMap<String, double[]>();
        for (transaction t : res) {
            String plate = t.Loan_No == null ? "" : t.Loan_No.trim().toUpperCase();
            double amt = t.getAmount() == null ? 0 : t.getAmount();
            double[] a = agg.get(plate);
            if (a == null) {
                a = new double[3];
                agg.put(plate, a);
            }
            String code = t.Type == null ? "" : t.Type.trim().toUpperCase();
            if (code.equals("MANAGEMENT") || code.equals("SACCO") || code.equals("WELFARE")
                    || code.equals("OPERATION") || code.equals("F1")) a[0] += amt;
            else a[1] += amt;
            a[2] += amt;
        }

        // fleet numbers + owners for the labels (one read); every fleet-numbered
        // vehicle is preloaded so the register shows even before it collects (0.00)
        final HashMap<String, String> fleets = new HashMap<String, String>();
        final HashMap<String, Integer> owners = new HashMap<String, Integer>();
        for (vehicles v : db.getvehicles()) {
            if (v.Vehicle_Number == null) continue;
            String key = v.Vehicle_Number.toUpperCase().trim();
            String fleet = v.Fleet_No == null ? "" : v.Fleet_No.trim();
            fleets.put(key, fleet);
            owners.put(key, v.Owner);
            if (!fleet.isEmpty() && !agg.containsKey(key)) agg.put(key, new double[3]);
        }

        List<String> plates = new ArrayList<String>(agg.keySet());
        Collections.sort(plates, new Comparator<String>() {
            @Override
            public int compare(String x, String y) {
                // SACCO vehicles first, then INVESTOR, unclassified last; within a
                // group total desc (so the 0-amount ones end the group), ties A-Z
                int rx = ownerRank(owners.get(x)), ry = ownerRank(owners.get(y));
                if (rx != ry) return rx - ry;
                int c = Double.compare(agg.get(y)[2], agg.get(x)[2]);
                if (c != 0) return c;
                String fx = fleets.get(x) == null || fleets.get(x).isEmpty() ? x : fleets.get(x);
                String fy = fleets.get(y) == null || fleets.get(y).isEmpty() ? y : fleets.get(y);
                return fx.compareToIgnoreCase(fy);
            }
        });

        vehRows.clear();
        for (String plate : plates) {
            double[] a = agg.get(plate);
            String fleet = fleets.get(plate);
            boolean hasFleet = fleet != null && !fleet.isEmpty();
            String label1 = plate.isEmpty() ? "No vehicle" : (hasFleet ? fleet : plate);
            String label2 = (plate.isEmpty() || !hasFleet) ? "" : plate;
            Integer own = owners.get(plate);
            vehRows.add(new VsRow(label1, label2, own == null ? 0 : own, a[0], a[1], a[2]));
        }
        if (vehAdapter == null) {
            vehAdapter = new VehStatusAdapter();
            list.setLayoutManager(new LinearLayoutManager(this));
            list.setAdapter(vehAdapter);
        }
        EditText search = findViewById(R.id.vehStatusSearch);
        applyVehFilter(search == null ? "" : search.getText().toString());
    }

    /** Filters the main-screen vehicle register by fleet no / plate (contains, case-insensitive). */
    private void applyVehFilter(String q) {
        String query = q == null ? "" : q.trim().toUpperCase();
        List<VsRow> out = new ArrayList<VsRow>();
        for (VsRow r : vehRows) {
            if (query.isEmpty() || r.fleet.toUpperCase().contains(query) || r.plate.toUpperCase().contains(query))
                out.add(r);
        }
        if (vehAdapter != null) vehAdapter.setItems(out);
        TextView empty = findViewById(R.id.vehStatusEmpty);
        RecyclerView list = findViewById(R.id.vehStatusList);
        boolean none = out.isEmpty();
        if (empty != null) {
            if (none) {
                empty.setText(query.isEmpty() ? "No collections today"
                        : "No vehicle matches that search");
                empty.setVisibility(View.VISIBLE);
            } else {
                empty.setVisibility(View.GONE);
            }
        }
        if (list != null) list.setVisibility(none ? View.GONE : View.VISIBLE);
    }

    /** SACCO (owner 1) first, INVESTOR (2) second, unclassified/blank last. */
    private static int ownerRank(Integer owner) {
        if (owner != null && owner == 1) return 0;
        if (owner != null && owner == 2) return 1;
        return 2;
    }

    /** One row of the main-screen vehicle register. */
    private static class VsRow {
        final String fleet, plate;
        final int owner;
        final double mgmt, other, total;

        VsRow(String fleet, String plate, int owner, double mgmt, double other, double total) {
            this.fleet = fleet;
            this.plate = plate;
            this.owner = owner;
            this.mgmt = mgmt;
            this.other = other;
            this.total = total;
        }
    }

    private class VehStatusAdapter extends RecyclerView.Adapter<VehStatusAdapter.VH> {
        private List<VsRow> items = new ArrayList<VsRow>();

        void setItems(List<VsRow> newItems) {
            this.items = newItems;
            notifyDataSetChanged();
        }

        @NonNull
        @Override
        public VH onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            return new VH(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_vehicle_status, parent, false));
        }

        @Override
        public void onBindViewHolder(@NonNull VH h, int position) {
            VsRow r = items.get(position);
            h.fleet.setText(r.fleet);
            h.plate.setText(r.plate);
            if (r.owner == 1) {
                h.owner.setVisibility(View.VISIBLE);
                h.owner.setText("SACCO");
                h.owner.setTextColor(0xFF2E7D32);
            } else if (r.owner == 2) {
                h.owner.setVisibility(View.VISIBLE);
                h.owner.setText("INVESTOR");
                h.owner.setTextColor(0xFF3949AB);
            } else {
                h.owner.setVisibility(View.GONE);
            }
            h.mgmt.setText(String.format("%,.2f", r.mgmt));
            h.other.setText(String.format("%,.2f", r.other));
            h.total.setText(String.format("%,.2f", r.total));
            h.divider.setVisibility(position == items.size() - 1 ? View.GONE : View.VISIBLE);
        }

        @Override
        public int getItemCount() {
            return items.size();
        }

        class VH extends RecyclerView.ViewHolder {
            final TextView fleet, plate, owner, mgmt, other, total;
            final View divider;

            VH(View v) {
                super(v);
                fleet = v.findViewById(R.id.vsFleet);
                plate = v.findViewById(R.id.vsPlate);
                owner = v.findViewById(R.id.vsOwner);
                mgmt = v.findViewById(R.id.vsMgmt);
                other = v.findViewById(R.id.vsOther);
                total = v.findViewById(R.id.vsTotal);
                divider = v.findViewById(R.id.vsDivider);
            }
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_menu);
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setSubtitle(new SimpleDateFormat("EEE, dd MMM yyyy").format(new Date()));
        TextView welcome = findViewById(R.id.welcome);
        if (welcome != null && Myvariables.CurrentAgent != null)
            welcome.setText(Myvariables.CurrentAgent.Name);
        cash = findViewById(R.id.CashReceipt);
        if (Myvariables.CurrentAgent.Account_type == 2)
            cash.setVisibility(View.GONE);
        else
            cash.setVisibility(View.VISIBLE);
        paymentstatus = findViewById(R.id.Paymentstatus);
        Parcel = findViewById(R.id.Parcel);
        Parcel.setVisibility(View.GONE);
        Parcel.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, Parcel_list.class));
            }
        });
        db = new DB(this);
        printer = findViewById(R.id.printer);
        printerDot = findViewById(R.id.printerDot);
        printerStatus = findViewById(R.id.printerStatus);
        setPrinterStatus(false);
        EditText vehSearch = findViewById(R.id.vehStatusSearch);
        if (vehSearch != null)
            vehSearch.addTextChangedListener(new TextWatcher() {
                @Override
                public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                }

                @Override
                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    applyVehFilter(s == null ? "" : s.toString());
                }

                @Override
                public void afterTextChanged(Editable s) {
                }
            });
        // The vehicle register fills whatever space is left below the search box
        // (recomputed on every layout pass, so the keyboard show/hide adapts too).
        final RecyclerView vehList = findViewById(R.id.vehStatusList);
        final View menuRoot = findViewById(R.id.activity_menu);
        if (vehList != null && menuRoot != null) {
            menuRoot.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override
                public void onGlobalLayout() {
                    if (vehList.getVisibility() != View.VISIBLE) return;
                    int[] ll = new int[2], rl = new int[2];
                    vehList.getLocationOnScreen(ll);
                    menuRoot.getLocationOnScreen(rl);
                    float d = getResources().getDisplayMetrics().density;
                    int avail = rl[1] + menuRoot.getHeight() - ll[1] - (int) (20 * d); // root padding
                    int minH = (int) (220 * d);
                    if (avail < minH) avail = minH;
                    ViewGroup.LayoutParams lp = vehList.getLayoutParams();
                    if (lp.height != avail) {
                        lp.height = avail;
                        vehList.setLayoutParams(lp);
                    }
                }
            });
        }

        if (Myvariables.CurrentAgent != null)
            if (Myvariables.CurrentAgent.Account_type == 2) {
                cash.setVisibility(View.GONE);
                printer.setVisibility(View.GONE);
            }
        preferences = getSharedPreferences("Settings", MODE_PRIVATE);
        JsonParser.preferences = preferences;
        summaries.mHandler = mHandler;
        sp = new summaries.Printerthread(preferences);
        sp.start();
        permission();
        UpdateChecker.checkForUpdate(this);
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();
        NavigationView navigationView = findViewById(R.id.nav_view);
        navigationView.setItemIconTintList(null); // keep the drawer icons' own colors
        navigationView.setNavigationItemSelectedListener(this);
        // Cashier report shows the per-cashier collection splits - admin only.
        MenuItem cashierItem = navigationView.getMenu().findItem(R.id.Cashiers);
        if (cashierItem != null && (Myvariables.CurrentAgent == null || Myvariables.CurrentAgent.Account_type != 1))
            cashierItem.setVisible(false);
        View navHeader = navigationView.getHeaderView(0);
        if (navHeader != null) {
            TextView navUserName = navHeader.findViewById(R.id.navUserName);
            if (navUserName != null && Myvariables.CurrentAgent != null)
                navUserName.setText(Myvariables.CurrentAgent.Name);
        }
        TextView drawerVersion = findViewById(R.id.drawerVersion);
        if (drawerVersion != null) {
            try {
                String vName = getPackageManager().getPackageInfo(getPackageName(), 0).versionName;
                drawerVersion.setText("Version " + vName);
            } catch (Exception ignored) {
            }
        }
        membersupdate = new updatemembers();
        membersupdate.start();

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.HONEYCOMB) {
            Log.i("sending", "here");
            new Getmembers().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Gettypes().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Getagenttypes().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new Getloans().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
            new getreversals().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        } else {
            Log.i("sending", "here2");
            new Getmembers().execute();
            new Gettypes().execute();
            new Getagenttypes().execute();
            new Getloans().execute();
            new getreversals().execute();
        }
        cash.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, cashreceipt.class));
            }
        });
        paymentstatus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(menu.this, status.class));
            }
        });
        IntentFilter filter = new IntentFilter(BluetoothDevice.ACTION_ACL_DISCONNECTED);
        registerReceiver(mReceiver, filter);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        // Handle navigation view item clicks here.
        Intent i = null;
        int id = item.getItemId();
        if (id == R.id.nav_settings) {
            i = new Intent(this, Settings.class);
        } else if (id == R.id.nav_changepin) {
            i = new Intent(this, Changepassword.class);
        } else if (id == R.id.summary) {
            i = new Intent(this, summary.class);
        } else if (id == R.id.vehicle_collection) {
            i = new Intent(this, vehiclereport.class);
        } else if (id == R.id.receipts) {
            i = new Intent(this, receiptreport.class);
        }else if (id == R.id.Cashiers) {
            i = new Intent(this, cashier_report.class);
        }
        if (i != null)
            startActivity(i);
        DrawerLayout drawer = findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        return true;
    }

    private class Gettypes extends AsyncTask<Void, String, List<types>> {
        @Override
        protected void onPreExecute() {
        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<types> doInBackground(Void... params) {
            //publishProgress("Getting transaction types");
            List<types> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("Transtypes", null, null);
                Type localType = new TypeToken<List<types>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        db.deleteAlltypes();
                        //publishProgress("Updating transaction types");
                        for (types f : results
                        ) {
                            db.inserttype(f);
                        }
                    } catch (Exception ex) {
                        // publishProgress("Unable to get transaction types");
                        ex.printStackTrace();
                    }
                }
            } catch (Exception e) {
                publishProgress("Unable to get transaction types");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<types> res) {
            try {
                //if (res != null)
                //Toast.makeText(getApplicationContext(), "Transaction types updated", Toast.LENGTH_LONG).show();


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private class Getagenttypes extends AsyncTask<Void, String, List<AgentTypes>> {
        @Override
        protected void onPreExecute() {

        }


        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<AgentTypes> doInBackground(Void... params) {
            //publishProgress("Getting transaction types");
            List<AgentTypes> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("agenttypes", null, null);
                Type localType = new TypeToken<List<AgentTypes>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        db.deleteAgenttypes();
                        //publishProgress("Updating transaction types");
                        for (AgentTypes f : results
                        ) {
                            db.inserttypeagent(f);
                        }
                    } catch (Exception ex) {
                        // publishProgress("Unable to get transaction types");
                        ex.printStackTrace();
                    }
                }
            } catch (Exception e) {
                publishProgress("Unable to get transaction types");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<AgentTypes> res) {
            try {


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private class Getloans extends AsyncTask<Void, String, List<loan>> {
        @Override
        protected void onPreExecute() {

        }


        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected List<loan> doInBackground(Void... params) {
            // publishProgress("Getting Credits");
            List<loan> results = null;
            String result = null;
            try {
                Gson g = new Gson();

                result = JsonParser.postjson("loans", null, null);
                Type localType = new TypeToken<List<loan>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    try {
                        db.deleteloans();
                        // publishProgress("Updating Credits");
                        for (loan f : results
                        ) {
                            db.inserloans(f);
                        }
                    } catch (Exception ex) {
                        publishProgress("Unable to get Credits");
                        ex.printStackTrace();
                    }
                }
            } catch (Exception e) {
                publishProgress("Unable to get Credits");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<loan> res) {
            try {
//                if (res != null)
//                    Toast.makeText(getApplicationContext(), "Credits updated", Toast.LENGTH_LONG).show();


            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    @Override
    protected void onDestroy() {
        super.onDestroy();
        try {
            // Stop the printer thread and close the Bluetooth connection so the
            // socket is not left open after the app (main screen) is closed.
            summaries.printer.disconnect();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private class Getmembers extends AsyncTask<Void, String, List<member>> {
        @Override
        protected void onPreExecute() {

        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_SHORT).show();
        }

        @Override
        protected List<member> doInBackground(Void... params) {
            Log.i("sending", "hereinside");
            List<member> results = null;
            String result = null;
            try {
                String key = "";
                Boolean all = false;

                try {
                    while (all == false) {
                        Gson g = new Gson();
                        result = JsonParser.postjson("keymembers", "key", key);
                        Type localType = new TypeToken<List<member>>() {
                        }.getType();

                        results = new Gson().fromJson(result, localType);

                        if (results != null) {
                            all = results.size() == 0;
                            if (results.size() > 0)
                                key = results.get(results.size() - 1).Key;
                            for (member f : results
                            ) {
                                db.insertmember(f);
                                if (f.vehicles != null) {
                                    if (f.vehicles.length > 0) {
                                        db.deletevehiclesforMember(f.No);
                                        for (vehicles v : f.vehicles
                                        ) {
                                            db.inservehicles(v);
                                        }
                                    } else {
                                        db.deletevehiclesforMember(f.No);
                                    }
                                }
                            }
                        }
                    }
                    // publishProgress(results.size()+  " Members updated");
                } catch (Exception ex) {
                    publishProgress("Unable to get members ");
                    ex.printStackTrace();
                }

                //}
            } catch (Exception e) {
                publishProgress("Unable to get members");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<member> res) {
            try {
                // if (res!=null)
                // Toast.makeText(getApplicationContext(),res.size()+  " Members updated",Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private String mConnectedDeviceName = null;

    private class collections extends AsyncTask<List<transaction>, Void, List<transaction>> {
        List<transaction> c = null;

        collections(List<transaction> ff) {
            c = ff;
        }

        @Override
        protected void onPreExecute() {

        }

        @Override
        protected List<transaction> doInBackground(List<transaction>... params) {
            List<transaction> results = null;
            String result = null;
            try {
                for (transaction cc : c
                ) {
                    transaction res = null;
                    Gson g = new Gson();
                    result = g.toJson(cc);
                    String parsed = JsonParser.postjson("Collections", "data", result);
                    // a failed post (server busy / offline) must NOT be retried in a tight
                    // loop: stop this batch, it will be uploaded on the next sync
                    if (parsed == null || parsed.trim().isEmpty() || parsed.trim().charAt(0) == '<') {
                        break;
                    }
                    Type localType = new TypeToken<transaction>() {
                    }.getType();

                    res = new Gson().fromJson(parsed, localType);
                    if (res != null && res.Document_No != null) {
                        res.sent = true;
                        db.updatetransstatus(res);
                    } else {
                        break; // server did not confirm - stop hammering it
                    }
                    // small gap between posts so a backlog cannot flood the web service
                    try { Thread.sleep(400); } catch (InterruptedException ignored) { }
                }
                results = c;
            } catch (Exception e) {
                e.printStackTrace();
                results = c;
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<transaction> res) {
            try {

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private class getreversals extends AsyncTask<Void, Void, List<transaction>> {
        summaries.getdata c = new summaries.getdata();

        @Override
        protected void onPreExecute() {
        }

        @Override
        protected List<transaction> doInBackground(Void... params) {
            List<transaction> results = null;
            String result = null;
            try {
                c.user = login.CurrentAgent.Agent_Code;
                Gson g = new Gson();
                result = g.toJson(c);
                result = JsonParser.postjson("Getreversals", "data", result);
                Type localType = new TypeToken<List<transaction>>() {
                }.getType();
                results = new Gson().fromJson(result, localType);
                if (results != null) {
                    for (transaction f : results
                    ) {
                        transaction t = db.gettransbydocument(f.Document_No.replace("R", ""));
                        if (t != null) {
                            f.sent = true;
                            f.Constituency = "1";
                            db.inserttrans(f);
                            db.inserttrans(f);
                            t.Constituency = "1";
                            db.updatetrans(t);

                            Log.i("Reversal", f.Document_No);
                        }
                    }
                }

            } catch (Exception e) {
                e.printStackTrace();

            }
            return results;
        }

        @Override
        protected void onPostExecute(List<transaction> res) {
            try {

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    private final Handler mHandler = new Handler() {
        @Override
        public void handleMessage(Message msg) {
            switch (msg.what) {
//                case Constants.MESSAGE_STATE_CHANGE:
//                    switch (msg.arg1) {
//                        case BluetoothChatService.STATE_CONNECTED:
//                            setStatus(getString(R.string.title_connected_to, mConnectedDeviceName));
//                            mConversationArrayAdapter.clear();
//                            break;
//                        case BluetoothChatService.STATE_CONNECTING:
//                            setStatus("Connecting");
//                            break;
//                        case BluetoothChatService.STATE_LISTEN:
//                        case BluetoothChatService.STATE_NONE:
//                            setStatus("Not connected");
//                            break;
//
//                    }
//                    break;
                case Constants.MESSAGE_WRITE:
                    byte[] writeBuf = (byte[]) msg.obj;
                    // construct a string from the buffer
                    String writeMessage = new String(writeBuf);

                    break;

                case Constants.PRINTER_CONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer connected", Toast.LENGTH_LONG).show();
                    setPrinterStatus(true);
                    break;

                case Constants.PRINTER_DISCONNECTED:
                    Toast.makeText(getApplicationContext(), "Printer Disconnected", Toast.LENGTH_LONG).show();
                    setPrinterStatus(false);
                    break;

                case Constants.PRINTER_MESSAGE_READ:
                    byte[] preadBuf = (byte[]) msg.obj;
                    // construct a string from the valid bytes in the buffer
                    String preadMessage = new String(preadBuf, 0, msg.arg1);
                    Log.i("Printer Data Recieved", preadMessage);
                    String[] pread = preadMessage.split("\n");
                    break;
                case Constants.MESSAGE_DEVICE_NAME:
                    // save the connected device's name
                    mConnectedDeviceName = msg.getData().getString(Constants.DEVICE_NAME);
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), "Connected to "
                                + mConnectedDeviceName, Toast.LENGTH_SHORT).show();
                    }
                    break;
                case Constants.MESSAGE_TOAST:
                    if (null != getApplicationContext()) {
                        Toast.makeText(getApplicationContext(), msg.getData().getString(Constants.TOAST),
                                Toast.LENGTH_LONG).show();
                    }
                    break;
            }
        }
    };

    private class updatemembers extends Thread {
        public updatemembers() {
            Log.i("Sending..", "Sending Started");
        }

        public void run() {
            try {
                while (true) {
                    //new updatemember(db.getupdatedmember()).execute();
                    new collections(db.getunsenttrans()).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

//                   Calendar cdt = Calendar.getInstance();
//                    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
//                    final String formattedDate = df.format(cdt.getTime());
//
//                    summaries.getdata g = new summaries.getdata();
//                    g.firstdate=formattedDate;
//                    g.user = login.CurrentAgent.Agent_Code;
//
//                    new getcollections(g).execute();

                    sleep(30000);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private static final int REQUEST_CODE_PERMISSIONS = 1;
    private String[] permissions = {
            Manifest.permission.BLUETOOTH_CONNECT,
            Manifest.permission.BLUETOOTH_SCAN,

            // Add more permissions if needed
    };

    public void permission() {
        List<String> permissionsToRequest = new ArrayList<>();

        // Check each permission if it has not been granted
        for (String permission : permissions) {
            if (ContextCompat.checkSelfPermission(this, permission)
                    != PackageManager.PERMISSION_GRANTED) {
                permissionsToRequest.add(permission);
            }
        }
        // Convert the list to an array and request the permissions
        if (!permissionsToRequest.isEmpty()) {
            ActivityCompat.requestPermissions(this,
                    permissionsToRequest.toArray(new String[0]),
                    REQUEST_CODE_PERMISSIONS);
        } else {
            // All permissions have already been granted
        }
    }
    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions,
                                           @NonNull int[] grantResults) {

        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == REQUEST_CODE_PERMISSIONS) {
            if (grantResults.length > 0) {
                // Check if all permissions were granted
                boolean allPermissionsGranted = true;
                for (int result : grantResults) {
                    if (result != PackageManager.PERMISSION_GRANTED) {
                        allPermissionsGranted = false;
                        break;
                    }
                }

                if (allPermissionsGranted) {
                    // All permissions granted
                } else {
                    // Some permissions were denied
                }
            } else {
                // Permission request was cancelled
            }
        }
    }
}
