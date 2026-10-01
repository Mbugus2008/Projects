package com.trimline.paul.metro;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.recyclerview.widget.RecyclerView;

import java.util.List;

/**
 * Adapter for the Daily summary RecyclerView. The visible list is a flattened
 * hierarchy: date group (parent) -> transaction-type group (sub-group) ->
 * transactions. Tapping a date card or a type header toggles its expanded
 * state; the owner rebuilds the flattened row list and this adapter is
 * notified via the onToggle callback.
 */
public class SummaryRecyclerAdapter extends RecyclerView.Adapter<SummaryRecyclerAdapter.RowHolder> {

    private static final int TYPE_DATE = 0;
    private static final int TYPE_TYPE = 1;
    private static final int TYPE_TRANS = 2;

    private final Context _context;
    private final DB db;
    private final List<Object> rows;
    private final Runnable onToggle;

    public SummaryRecyclerAdapter(Context context, DB db, List<Object> rows, Runnable onToggle) {
        this._context = context;
        this.db = db;
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
        if (o instanceof summaries.typeday)
            return TYPE_DATE;
        if (o instanceof summaries.typegroup)
            return TYPE_TYPE;
        return TYPE_TRANS;
    }

    @Override
    public RowHolder onCreateViewHolder(ViewGroup parent, int viewType) {
        LayoutInflater inf = LayoutInflater.from(_context);
        if (viewType == TYPE_DATE)
            return new RowHolder(inf.inflate(R.layout.reportgroup, parent, false));
        if (viewType == TYPE_TYPE)
            return new RowHolder(inf.inflate(R.layout.reporttypeheader, parent, false));
        return new RowHolder(inf.inflate(R.layout.reportlist, parent, false));
    }

    @Override
    public void onBindViewHolder(RowHolder holder, int position) {
        Object o = rows.get(position);
        if (o instanceof summaries.typeday)
            bindDate(holder.itemView, (summaries.typeday) o);
        else if (o instanceof summaries.typegroup)
            bindType(holder.itemView, (summaries.typegroup) o);
        else
            bindTransaction(holder.itemView, (transaction) o);
    }

    @Override
    public int getItemCount() {
        return rows.size();
    }

    /** Date group card: date, transaction count, day total and the
     *  print/refresh actions. Tapping the card toggles the whole day. */
    private void bindDate(View v, final summaries.typeday d) {
        TextView lblgroupname = (TextView) v.findViewById(R.id.lblListHeader);
        lblgroupname.setText(d.date);

        TextView lblcount = (TextView) v.findViewById(R.id.groupcountvalue);
        lblcount.setText(d.Count + (d.Count == 1 ? " transaction" : " transactions"));

        TextView lbltotal = (TextView) v.findViewById(R.id.grouptotalvalue);
        lbltotal.setText(String.format("%,.2f", d.Total));

        ImageView print = (ImageView) v.findViewById(R.id.printdaily);
        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View btn) {
                summaries.printer p = new summaries.printer();
                Bitmap b = BitmapFactory.decodeResource(btn.getResources(), R.drawable.logop);
                List<tsummary> tr = db.gettranssummarybydate(d.date);
                if (!p.printSummary(b, tr))
                    Toast.makeText(_context,
                            "Could not print - check the printer connection", Toast.LENGTH_LONG).show();
                db.refresh(d.date);
            }
        });

        ImageView refresh = (ImageView) v.findViewById(R.id.refresh);
        refresh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View btn) {
                db.refresh(d.date);
                Log.i("refresh", d.date);
            }
        });

        View card = v.findViewById(R.id.datecard);
        card.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View row) {
                d.Expanded = !d.Expanded;
                onToggle.run();
            }
        });
    }

    /** Type sub-group header: type name, item count and subtotal.
     *  Tapping it collapses/expands just this type's transactions. */
    private void bindType(View v, final summaries.typegroup tg) {
        TextView txttype = (TextView) v.findViewById(R.id.typename);
        txttype.setText(tg.Name);

        TextView txttypecount = (TextView) v.findViewById(R.id.typecount);
        txttypecount.setText(tg.Count + (tg.Count == 1 ? " item" : " items"));

        TextView txttypetotal = (TextView) v.findViewById(R.id.typetotal);
        txttypetotal.setText(String.format("%,.2f", tg.Total));

        View header = v.findViewById(R.id.typeheader);
        header.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View row) {
                tg.Expanded = !tg.Expanded;
                onToggle.run();
            }
        });
    }

    /** A single transaction row. */
    private void bindTransaction(View v, transaction t) {
        TextView txtmemberno = (TextView) v.findViewById(R.id.memberno);
        txtmemberno.setText(t.Account_No);

        TextView txtmembername = (TextView) v.findViewById(R.id.membername);
        txtmembername.setText(t.Account_Name);

        TextView txtreference = (TextView) v.findViewById(R.id.reference);
        txtreference.setText(t.Document_No);

        TextView txtreceipt = (TextView) v.findViewById(R.id.receiptno);
        txtreceipt.setText(t.Date + " " + t.Time);

        TextView txtttype = (TextView) v.findViewById(R.id.transtype);
        if (!t.Loan_No.equals("")) {
            if (t.Type.contains("LOAN"))
                txtttype.setText(t.typename + "(" + t.Ward + ")");
            else
                txtttype.setText(t.typename + "(" + t.Loan_No + " - " + t.Group + ")");
        } else
            txtttype.setText(t.typename);

        TextView txtamount = (TextView) v.findViewById(R.id.tamount);
        txtamount.setText(String.format("%,.2f", t.getAmount()));

        ImageView sent = (ImageView) v.findViewById(R.id.sent);
        sent.setVisibility(t.sent ? View.VISIBLE : View.GONE);
    }
}
