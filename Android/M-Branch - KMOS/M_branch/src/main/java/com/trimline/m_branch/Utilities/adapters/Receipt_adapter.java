package com.trimline.m_branch.Utilities.adapters;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import com.trimline.m_branch.R;
import com.trimline.m_branch.Utilities.Mbranch;
import com.trimline.m_branch.Utilities.Printer;
import com.trimline.m_branch.Utilities.Receipts;
import com.trimline.m_branch.db.Models.tViewModel;
import com.trimline.m_branch.reports.receipts;
import com.trimline.m_branch.transaction;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

public  class Receipt_adapter extends BaseExpandableListAdapter {
    private Context _context;
    private tViewModel viewModel;
    private List<Receipts> _listDataHeader; // header titles
    private HashMap<Receipts, List<transaction>> _listDataChild;
    public Receipt_adapter(Context context, List<Receipts> listDataHeader,
                           HashMap<Receipts, List<transaction>> listChildData,tViewModel viewModel) {
        this._context = context;
        this._listDataHeader = listDataHeader;
        this._listDataChild = listChildData;
        this.viewModel = viewModel;
    }
    @Override
    public Object getChild(int groupPosition, int childPosititon) {
        return this._listDataChild.get(this._listDataHeader.get(groupPosition))
                .get(childPosititon);
    }
    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public View getChildView(int groupPosition, final int childPosition,
                             boolean isLastChild, View convertView, ViewGroup parent) {

        final transaction t = (transaction) getChild(groupPosition, childPosition);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.reportreceiptlist, null);
        }
        TextView recno = (TextView) convertView.findViewById(R.id.Receiptno);
        recno.setText(t.Document_No);

        TextView time = (TextView) convertView.findViewById(R.id.time);
        time.setText(t.Time);

        TextView type = (TextView) convertView.findViewById(R.id.type);
        type.setText(t.typename);
        TextView loanno = (TextView) convertView.findViewById(R.id.loanno);
        if(t.Type.contains("LOAN"))
            loanno.setText(t.Loan_No +"("+ t.Ward +")");
        else
            loanno.setText(t.Loan_No);

        TextView txtamount = (TextView) convertView.findViewById(R.id.Amount);
        txtamount.setText(String.format("%.2f", t.Amount));

        ImageView sent = (ImageView) convertView.findViewById(R.id.sent);
        if (!t.sent)
            sent.setVisibility(View.GONE);

        return convertView;
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        return this._listDataChild.get(this._listDataHeader.get(groupPosition))
                .size();
    }
    @Override
    public Object getGroup(int groupPosition) {
        return this._listDataHeader.get(groupPosition);
    }

    @Override
    public int getGroupCount() {
        return this._listDataHeader.size();
    }
    @Override
    public long getGroupId(int groupPosition) {
        return groupPosition;
    }
    @Override
    public View getGroupView(int groupPosition, boolean isExpanded,
                             View convertView, ViewGroup parent) {
        final Receipts headerTitle = (Receipts) getGroup(groupPosition);
        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.receiptgroup, null);
        }
        ImageView im = (ImageView) convertView.findViewById(R.id.groupheadericon);

        TextView lblgroupname = (TextView) convertView
                .findViewById(R.id.lblListHeader);
        lblgroupname.setText(headerTitle.date);

        TextView lblrec = (TextView) convertView
                .findViewById(R.id.lblListreceipt);
        lblrec.setText(headerTitle.receipt + "(" + headerTitle.Count + ")");

        TextView lblmno = (TextView) convertView
                .findViewById(R.id.memberno);
        lblmno.setText(headerTitle.No);

        TextView mname = (TextView) convertView
                .findViewById(R.id.membername);
        mname.setText(headerTitle.Name);


        TextView lblcount = (TextView) convertView
                .findViewById(R.id.groupcountvalue);
        lblcount.setText(String.valueOf(headerTitle.user));

        TextView lbltotal = (TextView) convertView
                .findViewById(R.id.grouptotalvalue);
        lbltotal.setText(String.format("%.2f", headerTitle.Total));

        Calendar cdt;
        cdt = Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        final String formattedDate = df.format(cdt.getTime());
        final ImageView reverse = (ImageView) convertView.findViewById(R.id.reverse);
        reverse.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                List<transaction> d = viewModel.trepo.getreceipt(headerTitle.receipt + "R");
                if (d.size() == 0) {
                    List<transaction> t = viewModel.trepo.getreceipt(headerTitle.receipt);
                    for (transaction tt : t
                    ) {
                        tt.Constituency = "1";
                        tt.reversed = true;
                        tt.Reversal_Doc = tt.Document_No + "R";
                        viewModel.update(tt);// db.updatetrans(tt);
                        //Create reversal entry
                        transaction tn = tt;
                        tn.Reversal_Doc = tt.Document_No;
                        tn.sent = false;
                        tn.Document_No = tn.Document_No + "R";
                        tn.OTTN = tn.OTTN + "R";
                        tn.Amount = tn.Amount * -1;
                        tn.reversed = true;

                        viewModel.insert(tn);// db.inserttrans(tt);
                        reverse.setVisibility(View.GONE);
                    }
                    _listDataHeader.add(viewModel.trepo.getreceiptsummary(headerTitle.receipt));
                    notifyDataSetChanged();
                }
            }
        });
        ImageView print = (ImageView) convertView.findViewById(R.id.printdaily);
        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewModel.trepo.post(headerTitle.receipt);
                Printer p = ((Mbranch) _context).printer;
                p.printcollection(null,viewModel.trepo.getreceipt(headerTitle.receipt) );
            }
        });
        reverse.setVisibility(View.VISIBLE);
        print.setVisibility(View.VISIBLE);

        if (headerTitle.reversed){
            reverse.setVisibility(View.GONE);
            print.setVisibility(View.GONE);
        }

        //            if (!d.get(0).Date.equals(formattedDate)) {
        //                   reverse.setVisibility(View.GONE);
        //                print.setVisibility(View.GONE);
        //            }

        if (((Mbranch) _context).CurrentAgent.Account_type !=1) {

            reverse.setVisibility(View.GONE);

        }

        return convertView;
    }
    @Override
    public boolean hasStableIds() {
        return true;
    }
    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }
}
