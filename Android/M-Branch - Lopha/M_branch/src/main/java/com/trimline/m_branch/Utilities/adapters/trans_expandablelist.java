package com.trimline.m_branch.Utilities.adapters;

import static android.content.Context.LAYOUT_INFLATER_SERVICE;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import com.trimline.m_branch.R;
import com.trimline.m_branch.Utilities.Mbranch;
import com.trimline.m_branch.Utilities.Printer;
import com.trimline.m_branch.Utilities.collectiondates;
import com.trimline.m_branch.db.Models.tViewModel;
import com.trimline.m_branch.reports.tsummary;
import com.trimline.m_branch.transaction;

import java.util.HashMap;
import java.util.List;

public  class trans_expandablelist extends BaseExpandableListAdapter {

    private Context _context;
    private tViewModel viewModel;
    private List<collectiondates> _listDataHeader; // header titles
    private HashMap<collectiondates, List<transaction>> _listDataChild;
    public trans_expandablelist(Context context, List<collectiondates> listDataHeader,
                                 HashMap<collectiondates, List<transaction>> listChildData,tViewModel viewModel) {
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
            convertView = infalInflater.inflate(R.layout.reportlist, null);
        }

        TextView txtmemberno = (TextView) convertView.findViewById(R.id.memberno);
        txtmemberno.setText(t.Account_No);
        TextView txtmembername = (TextView) convertView.findViewById(R.id.membername);
        txtmembername.setText(t.Account_Name);
        TextView txtreference = (TextView) convertView.findViewById(R.id.reference);
        txtreference.setText(t.Document_No);
        TextView txtreceipt = (TextView) convertView.findViewById(R.id.receiptno);
        txtreceipt.setText(t.Date + " " + t.Time);
        TextView txtttype = (TextView) convertView.findViewById(R.id.transtype);
        if ((t != null) && (t.Loan_No!=null))
            if (!t.Loan_No.equals("")) {
                if (t.Type.contains("LOAN"))
                    txtttype.setText(t.typename + "(" + t.Ward + ")");
                else
                    txtttype.setText(t.typename + "(" + t.Loan_No + ")");
            } else
                txtttype.setText(t.typename);

        TextView txtamount = (TextView) convertView.findViewById(R.id.tamount);
        txtamount.setText(String.format("%.2f", t.Amount));
        ImageView sent = (ImageView) convertView.findViewById(R.id.sent);
        if (!t.sent)
            sent.setVisibility(View.GONE);

        return convertView;
    }
    @Override
    public void onGroupExpanded(int groupPosition) {
        // Load the children for the expanded group here
        collectiondates groupItem = _listDataHeader.get(groupPosition);
        List<transaction> children = viewModel.getdates(groupItem.date);// db.gettransbydate(groupItem.date);
        Log.i("Children for "+ groupItem.date,String.valueOf(children.size()));
        // Update the child data for the expanded group in the childMap
        _listDataChild.put(groupItem, children);

        // Notify the adapter that the data set has changed
        notifyDataSetChanged();
    }
    @Override
    public int getChildrenCount(int groupPosition) {
        //return this._listDataChild.size();//.get(this._listDataHeader.get(groupPosition)) .size();
        collectiondates groupItem = _listDataHeader.get(groupPosition);
        List<transaction> children = _listDataChild.get(groupItem);
        return children != null ? children.size() : 0;
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
        final collectiondates headerTitle = (collectiondates) getGroup(groupPosition);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.reportgroup, null);
        }
        ImageView im = (ImageView) convertView.findViewById(R.id.groupheadericon);


        TextView lblgroupname = (TextView) convertView
                .findViewById(R.id.lblListHeader);
        lblgroupname.setText(headerTitle.date);

        TextView lblcount = (TextView) convertView
                .findViewById(R.id.groupcountvalue);
        lblcount.setText(String.valueOf(headerTitle.Count));

        TextView lbltotal = (TextView) convertView
                .findViewById(R.id.grouptotalvalue);
        lbltotal.setText(headerTitle.Total.toString());

        ImageView print = (ImageView) convertView.findViewById(R.id.printdaily);
        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                Printer p =  ( (Mbranch) _context).printer;;
                List<tsummary> tr = viewModel.trepo.gettranssummarybydate(headerTitle.date);
                p.printSummary(tr);
                viewModel.trepo.refresh(headerTitle.date);
            }
        });
        ImageView refresh = (ImageView) convertView.findViewById(R.id.refresh);
        refresh.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                viewModel.trepo.refresh(headerTitle.date);
                Log.i("refresh", headerTitle.date);
            }
        });


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