package com.trimline.paul.metro;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Color;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.RecyclerView;

import com.google.android.material.card.MaterialCardView;

import java.util.HashMap;
import java.util.List;

/**
 * Adapter for the Receipts RecyclerView. The visible list is a flattened
 * hierarchy: agent group (parent) -> receipt batch -> transaction rows.
 * Tapping an agent band or a receipt card toggles its expanded state; the
 * owner rebuilds the flattened row list and this adapter is notified via the
 * onToggle callback.
 */
public class ReceiptsRecyclerAdapter extends RecyclerView.Adapter<ReceiptsRecyclerAdapter.RowHolder> {

    private static final int TYPE_AGENT = 0;
    private static final int TYPE_RECEIPT = 1;
    private static final int TYPE_TRANS = 2;

    private final Context _context;
    private final DB db;
    private final HashMap<summaries.Receipts, List<transaction>> listDataChild;
    private final List<summaries.agentreceipts> daylist;
    private final List<Object> rows;
    private final Runnable onToggle;

    public ReceiptsRecyclerAdapter(Context context, DB db,
                                   HashMap<summaries.Receipts, List<transaction>> listDataChild,
                                   List<summaries.agentreceipts> daylist,
                                   List<Object> rows, Runnable onToggle) {
        this._context = context;
        this.db = db;
        this.listDataChild = listDataChild;
        this.daylist = daylist;
        this.rows = rows;
        this.onToggle = onToggle;
    }

    public static class RowHolder extends RecyclerView.ViewHolder {
        public RowHolder(View itemView) {
            super(itemView);
        }
    }

    @Override
    public int getItemViewType(int position) {
        Object o = rows.get(position);
        if (o instanceof summaries.agentreceipts)
            return TYPE_AGENT;
        if (o instanceof summaries.Receipts)
            return TYPE_RECEIPT;
        return TYPE_TRANS;
    }

    @Override
    public RowHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inf = LayoutInflater.from(_context);
        if (viewType == TYPE_AGENT)
            return new RowHolder(inf.inflate(R.layout.receiptagentheader, parent, false));
        if (viewType == TYPE_RECEIPT)
            return new RowHolder(inf.inflate(R.layout.receiptgroup, parent, false));
        return new RowHolder(inf.inflate(R.layout.reportreceiptlist, parent, false));
    }

    @Override
    public void onBindViewHolder(RowHolder holder, int position) {
        Object o = rows.get(position);
        if (o instanceof summaries.agentreceipts)
            bindAgent(holder.itemView, (summaries.agentreceipts) o);
        else if (o instanceof summaries.Receipts)
            bindReceipt(holder.itemView, (summaries.Receipts) o);
        else
            bindTransaction(holder.itemView, (transaction) o);
    }

    @Override
    public int getItemCount() {
        return rows.size();
    }

    /** Agent band: agent name/code, number of receipts and collected total.
     *  Tapping it collapses/expands all receipts of that agent. */
    private void bindAgent(View v, final summaries.agentreceipts a) {
        TextView name = (TextView) v.findViewById(R.id.agentname);
        name.setText(a.Name == null || a.Name.isEmpty() ? "(no agent)" : a.Name);

        TextView code = (TextView) v.findViewById(R.id.agentcode);
        code.setText(a.Code == null || a.Code.isEmpty() ? "" : "Agent " + a.Code);

        TextView count = (TextView) v.findViewById(R.id.agentcount);
        count.setText(a.Count + (a.Count == 1 ? " receipt" : " receipts"));

        TextView vehicles = (TextView) v.findViewById(R.id.agentvehicles);
        vehicles.setText(a.VehicleCount + (a.VehicleCount == 1 ? " vehicle" : " vehicles"));

        TextView tot = (TextView) v.findViewById(R.id.agenttotal);
        tot.setText(String.format("%,.2f", a.Total));

        View header = v.findViewById(R.id.agentheader);
        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View row) {
                a.Expanded = !a.Expanded;
                onToggle.run();
            }
        });
    }

    /** Receipt batch card: date, receipt (item count), member, vehicle, total
     *  and the reverse/print actions. Tapping the card shows/hides its rows. */
    private void bindReceipt(View v, final summaries.Receipts hit) {
        MaterialCardView card = (MaterialCardView) v.findViewById(R.id.receiptcard);
        if (hit.Recovery != null && hit.Recovery) {
            card.setCardBackgroundColor(Color.parseColor("#FFF3E0"));
            card.setStrokeColor(Color.parseColor("#E65100"));
        } else {
            card.setCardBackgroundColor(Color.WHITE);
            card.setStrokeColor(Color.parseColor("#C9D2E3"));
        }

        TextView lblgroupname = (TextView) v.findViewById(R.id.lblListHeader);
        lblgroupname.setText(hit.date);

        TextView lblrec = (TextView) v.findViewById(R.id.lblListreceipt);
        lblrec.setText(hit.receipt + " (" + hit.Count + (hit.Count == 1 ? " item)" : " items)"));

        TextView lblmno = (TextView) v.findViewById(R.id.memberno);
        String veh = hit.vehicle == null ? "" : hit.vehicle;
        String flt = hit.fleetNo == null ? "" : hit.fleetNo;
        lblmno.setText(veh.isEmpty() && flt.isEmpty() ? "" : veh + " - " + flt);

        TextView mname = (TextView) v.findViewById(R.id.membername);
        mname.setText(hit.Name);

        TextView lblcount = (TextView) v.findViewById(R.id.groupcountvalue);
        lblcount.setText(String.valueOf(hit.user));

        TextView lbltotal = (TextView) v.findViewById(R.id.grouptotalvalue);
        lbltotal.setText(String.format("%,.2f", hit.Total));

        final ImageView reverse = (ImageView) v.findViewById(R.id.reverse);
        final ImageView print = (ImageView) v.findViewById(R.id.printdaily);

        reverse.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View btn) {
                List<transaction> d = db.gettransbybatch(hit.receipt + "R");
                if (d.size() == 0) {
                    List<transaction> t = db.gettransbybatch(hit.receipt);
                    if (t.isEmpty())
                        return;

                    // reflect the reversal on the in-memory rows too, so the
                    // reverse action is still hidden when the list is rebuilt
                    List<transaction> inMem = listDataChild.get(hit);
                    if (inMem != null) {
                        for (transaction tt : inMem
                        ) {
                            tt.Constituency = "1";
                        }
                    }

                    for (transaction tt : t
                    ) {
                        tt.Constituency = "1";
                        db.updatetrans(tt);
                        tt.sent = false;
                        tt.Document_No = tt.Document_No + "R";
                        tt.OTTN = tt.OTTN + "R";
                        tt.setAmount(tt.getAmount() * -1);
                        db.inserttrans(tt);
                    }

                    summaries.Receipts r = new summaries.Receipts();
                    r.date = t.get(0).Date;
                    r.receipt = hit.receipt + "R";
                    r.No = t.get(0).Account_No;
                    r.Name = t.get(0).Account_Name;
                    r.Count = t.size();
                    r.user = t.get(0).Agent_Code;
                    r.vehicle = hit.vehicle;
                    r.fleetNo = hit.fleetNo;
                    r.Recovery = hit.Recovery;
                    double rtotal = 0.0;
                    for (transaction tt : t
                    ) {
                        if (!tt.Type.equals("PENALTY CHARGED"))
                            rtotal += tt.getAmount();
                    }
                    r.Total = rtotal;
                    listDataChild.put(r, t);

                    // attach the reversal to the same agent group and refresh
                    String code = r.user == null ? "" : r.user;
                    for (summaries.agentreceipts a : daylist
                    ) {
                        if ((a.Code == null ? "" : a.Code).equals(code)) {
                            a.ReceiptsList.add(r);
                            a.Count++;
                            break;
                        }
                    }
                    onToggle.run();
                }
            }
        });

        final View fv = v;
        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View btn) {
                db.post(hit.receipt);
                summaries.printer p = new summaries.printer();
                Bitmap b = BitmapFactory.decodeResource(fv.getResources(), R.drawable.logop);
                if (!p.printcollection(b, db.gettransbybatch(hit.receipt)))
                    Toast.makeText(_context,
                            "Could not print - check the printer connection", Toast.LENGTH_LONG).show();
            }
        });

        reverse.setVisibility(View.VISIBLE);
        print.setVisibility(View.VISIBLE);
        // Use the already loaded transactions instead of re-querying the DB
        // here: this runs on the main thread while rendering, and background
        // sync threads hold SQLite write locks, which caused an ANR.
        List<transaction> d = listDataChild.get(hit);
        if (d != null && d.size() > 0) {
            if (d.get(0).Constituency != null && d.get(0).Constituency.equals("1")) {
                reverse.setVisibility(View.GONE);
                print.setVisibility(View.GONE);
            }
        }
        if (Myvariables.CurrentAgent.Account_type != 1)
            reverse.setVisibility(View.GONE);

        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View row) {
                hit.Expanded = !hit.Expanded;
                onToggle.run();
            }
        });
    }

    /** A single transaction line of a receipt. */
    private void bindTransaction(View v, transaction t) {
        TextView recno = (TextView) v.findViewById(R.id.Receiptno);
        recno.setText(t.Document_No);

        TextView time = (TextView) v.findViewById(R.id.time);
        time.setText(t.Time);

        TextView type = (TextView) v.findViewById(R.id.type);
        type.setText(t.typename);

        TextView loanno = (TextView) v.findViewById(R.id.loanno);
        String ln = t.Loan_No == null ? "" : t.Loan_No;
        if (t.Type.contains("LOAN"))
            loanno.setText(ln + "(" + t.Ward + ")");
        else
            loanno.setText(ln);

        TextView txtamount = (TextView) v.findViewById(R.id.Amount);
        txtamount.setText(String.format("%,.2f", t.getAmount()));

        ImageView sent = (ImageView) v.findViewById(R.id.sent);
        sent.setVisibility(t.sent ? View.VISIBLE : View.GONE);
    }
}
