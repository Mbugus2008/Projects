package com.trimline.paul.ganaki;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.widget.ExpandableListView;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class summary extends AppCompatActivity {
    ExpandableListAdapter listAdapter;
    List<summaries.collectiondates> listDataHeader;
    HashMap<summaries.collectiondates, List<transaction>> listDataChild;
    ExpandableListView report;
    DB db = null;
    TextView total;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        toolbar.setTitle("Summary Report");
        report = (ExpandableListView) findViewById(R.id.summuryreport);
        db = new DB(this);
        total = (TextView) findViewById(R.id.total);
        DateCollection();
        listAdapter = new ExpandableListAdapter(this, listDataHeader, listDataChild, db);
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
        for (int i = 0; i < count; i++) {
            report.expandGroup(i);
        }
    }

    private void DateCollection() {
        listDataHeader = new ArrayList<summaries.collectiondates>();
        listDataChild = new HashMap<summaries.collectiondates, List<transaction>>();
        listDataHeader = db.getcollectiondates();
        double tot = 0.0;
        for (summaries.collectiondates c : listDataHeader
        ) {
            List<transaction> t = db.gettransbydate_daily(c.date);
            c.Count = t.get(0).count;
            c.Total = t.get(0).Amount;
            tot += c.Total;
            listDataChild.put(c, t);
        }
        total.setText(String.format("Total: %.2f", tot));
    }
}
