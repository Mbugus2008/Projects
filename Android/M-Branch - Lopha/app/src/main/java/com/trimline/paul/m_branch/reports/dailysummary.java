package com.trimline.paul.m_branch.reports;

import android.content.Context;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;


import com.trimline.paul.m_branch.DB;
import com.trimline.paul.m_branch.R;
import com.trimline.paul.m_branch.summaries;
import com.trimline.paul.m_branch.transaction;
import com.trimline.paul.m_branch.tsummary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class dailysummary extends AppCompatActivity {
    ExpandableListAdapter listAdapter;
    List<summaries.collectiondates> listDataHeader;
    HashMap<summaries.collectiondates, List<transaction>> listDataChild;
    ExpandableListView report;
    DB db = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle("Summary Report");
        report = (ExpandableListView) findViewById(R.id.summuryreport);
        db = new DB(this);
        DateCollection();
        listAdapter = new ExpandableListAdapter(this, listDataHeader, listDataChild,db);
        // setting list adapter
        report.setAdapter(listAdapter);
        report.setOnGroupClickListener(new ExpandableListView.OnGroupClickListener() {

            @Override
            public boolean onGroupClick(ExpandableListView parent, View v,
                                        int groupPosition, long id) {
                // Toast.makeText(getApplicationContext(),
                // "Group Clicked " + listDataHeader.get(groupPosition),
                // Toast.LENGTH_SHORT).show();
                return false;
            }
        });
        report.setOnChildClickListener(new ExpandableListView.OnChildClickListener() {
            @Override
            public boolean onChildClick(ExpandableListView parent, View v,
                                        int groupPosition, int childPosition, long id) {
                // TODO Auto-generated method stub
//                Intent i = new Intent(summary.this, reports.class);
//                i.putExtra("report", listDataChild.get(
//                        listDataHeader.get(groupPosition)).get(
//                        childPosition).toString());
//                startActivity(i);
//                Toast.makeText(
//                        getApplicationContext(),
//                        listDataHeader.get(groupPosition)
//                                + " : "
//                                + listDataChild.get(
//                                listDataHeader.get(groupPosition)).get(
//                                childPosition).toString(), Toast.LENGTH_SHORT)
//                        .show();
                return false;
            }
        });

        report.setOnGroupExpandListener(new ExpandableListView.OnGroupExpandListener() {
            @Override
            public void onGroupExpand(int groupPosition) {
                //rl.setVisibility(View.VISIBLE);
            }
        });
        // Listview Group collasped listener
        report.setOnGroupCollapseListener(new ExpandableListView.OnGroupCollapseListener() {
            @Override
            public void onGroupCollapse(int groupPosition) {
                //rl.setVisibility(View.GONE);
            }
        });
        //expandAll();
    }
    private void expandAll() {
        int count = listAdapter.getGroupCount();
        for (int i = 0; i < count; i++){
            report.expandGroup(i);
        }
    }
    private void DateCollection() {
        listDataHeader = new ArrayList<summaries.collectiondates>();
        listDataChild = new HashMap<summaries.collectiondates, List<transaction>>();
        listDataHeader = db.getcollectiondates();
//        for (summaries.collectiondates c : listDataHeader
//                ) {
//            List<transaction> t = db.gettransbydate(c.date);
//            c.Count = t.size();
//            double total = 0.0;
//            for (transaction tt : t
//                    ) {
//                tt.typename= db.gettype(tt.Type).Name;
//                total += tt.Amount;
//            }
//            c.Total= total;
//            listDataChild.put(c, t);
//        }
    }

    public static class ExpandableListAdapter extends BaseExpandableListAdapter {

        private Context _context;
        private DB db ;
        private List<summaries.collectiondates> _listDataHeader; // header titles
        private HashMap<summaries.collectiondates, List<transaction>> _listDataChild;
        public ExpandableListAdapter(Context context, List<summaries.collectiondates> listDataHeader,
                                     HashMap<summaries.collectiondates, List<transaction>> listChildData,DB d) {
            this._context = context;
            this._listDataHeader = listDataHeader;
            this._listDataChild = listChildData;
            this.db = d;
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
            summaries.collectiondates groupItem = _listDataHeader.get(groupPosition);
            List<transaction> children = db.gettransbydate(groupItem.date);
    Log.i("Children for "+ groupItem.date,String.valueOf(children.size()));
            // Update the child data for the expanded group in the childMap
            _listDataChild.put(groupItem, children);

            // Notify the adapter that the data set has changed
            notifyDataSetChanged();
        }
        @Override
        public int getChildrenCount(int groupPosition) {
            //return this._listDataChild.size();//.get(this._listDataHeader.get(groupPosition)) .size();
            summaries.collectiondates groupItem = _listDataHeader.get(groupPosition);
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
            final summaries.collectiondates headerTitle = (summaries.collectiondates) getGroup(groupPosition);

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
                    summaries.printer p = new summaries.printer();
                    List<tsummary> tr = db.gettranssummarybydate(headerTitle.date);
                    p.printSummary(tr);
                    db.refresh(headerTitle.date);
                }
            });
            ImageView refresh = (ImageView) convertView.findViewById(R.id.refresh);
            refresh.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    db.refresh(headerTitle.date);
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
}
