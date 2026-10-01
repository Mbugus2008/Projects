package com.trimline.paul.metro.reports;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.recyclerview.widget.RecyclerView;

import com.trimline.paul.metro.R;

import java.util.List;
import java.util.Map;

/**
 * Adapter for the Cashier Report RecyclerView. The visible list is a
 * flattened hierarchy: agent (cashier) band -> vehicle cards. Tapping a band
 * expands/collapses its vehicles; the owner rebuilds the flattened row list
 * and this adapter is notified through the callback. Tapping a vehicle card
 * opens the collection drill-down (handled by the owner).
 */
public class CashierReportAdapter extends RecyclerView.Adapter<CashierReportAdapter.RowHolder> {

    private static final int TYPE_AGENT = 0;
    private static final int TYPE_VEHICLE = 1;

    /** Keeps the activity in control of row rebuilding and drill-down. */
    public interface Callback {
        void onToggle();

        void onVehicleClick(CashierVehicle vehicle);
    }

    private final Context _context;
    private final List<Object> rows;
    private final Callback callback;

    public CashierReportAdapter(Context context, List<Object> rows, Callback callback) {
        this._context = context;
        this.rows = rows;
        this.callback = callback;
    }

    public static class RowHolder extends RecyclerView.ViewHolder {
        public RowHolder(View itemView) {
            super(itemView);
        }
    }

    @Override
    public int getItemViewType(int position) {
        return (rows.get(position) instanceof CashierAgent) ? TYPE_AGENT : TYPE_VEHICLE;
    }

    @Override
    public RowHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inf = LayoutInflater.from(_context);
        if (viewType == TYPE_AGENT)
            return new RowHolder(inf.inflate(R.layout.cashieragentheader, parent, false));
        return new RowHolder(inf.inflate(R.layout.cashiervehiclecard, parent, false));
    }

    @Override
    public void onBindViewHolder(RowHolder holder, int position) {
        Object o = rows.get(position);
        if (o instanceof CashierAgent)
            bindAgent(holder.itemView, (CashierAgent) o);
        else
            bindVehicle(holder.itemView, (CashierVehicle) o);
    }

    @Override
    public int getItemCount() {
        return rows.size();
    }

    /** Cashier band: name/code, number of collections, vehicles collected
     *  for, total and the per-type breakdown. Tapping toggles expansion. */
    private void bindAgent(View v, final CashierAgent a) {
        TextView name = (TextView) v.findViewById(R.id.agentname);
        name.setText(a.Name == null || a.Name.isEmpty() ? "(no agent)" : a.Name);

        TextView code = (TextView) v.findViewById(R.id.agentcode);
        code.setText(a.Code == null || a.Code.isEmpty() ? "" : "Agent " + a.Code);

        TextView colls = (TextView) v.findViewById(R.id.agentcollections);
        colls.setText(a.Count + (a.Count == 1 ? " collection" : " collections"));

        TextView vehs = (TextView) v.findViewById(R.id.agentvehicles);
        vehs.setText(a.VehicleCount + (a.VehicleCount == 1 ? " vehicle" : " vehicles"));

        TextView tot = (TextView) v.findViewById(R.id.agenttotal);
        tot.setText(String.format("%,.2f", a.Total));

        TextView breakdown = (TextView) v.findViewById(R.id.agentbreakdown);
        String txt = breakdownText(a.TypeTotals);
        breakdown.setText(txt);
        breakdown.setVisibility(txt.isEmpty() ? View.GONE : View.VISIBLE);

        View header = v.findViewById(R.id.agentheader);
        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View row) {
                a.Expanded = !a.Expanded;
                callback.onToggle();
            }
        });
    }

    /** Vehicle card: vehicle no + fleet, per-type breakdown, count and total.
     *  Tapping opens the collection drill-down dialog. */
    private void bindVehicle(View v, final CashierVehicle item) {
        TextView no = (TextView) v.findViewById(R.id.vehicleno);
        no.setText(item.ItemNo == null || item.ItemNo.isEmpty() ? "(no vehicle)" : item.ItemNo);

        TextView fleet = (TextView) v.findViewById(R.id.vehiclefleet);
        fleet.setText(item.FleetNo == null || item.FleetNo.isEmpty() ? "" : "(" + item.FleetNo + ")");

        TextView breakdown = (TextView) v.findViewById(R.id.vehiclebreakdown);
        breakdown.setText(breakdownText(item.TypeSums));

        TextView count = (TextView) v.findViewById(R.id.vehiclecount);
        count.setText(item.Count + (item.Count == 1 ? " collection" : " collections"));

        TextView tot = (TextView) v.findViewById(R.id.vehicletotal);
        tot.setText(String.format("%,.2f", item.Total));

        v.findViewById(R.id.vehiclecard).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View card) {
                callback.onVehicleClick(item);
            }
        });
    }

    /** "Sacco 12,000.00   ·   Welfare 3,000.00" - zero sums are skipped. */
    static String breakdownText(Map<String, Double> sums) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, Double> e : sums.entrySet()) {
            double val = e.getValue() == null ? 0 : e.getValue();
            if (Math.abs(val) < 0.005)
                continue;
            if (sb.length() > 0)
                sb.append("   ·   ");
            sb.append(e.getKey()).append(' ').append(String.format("%,.2f", val));
        }
        return sb.toString();
    }
}
