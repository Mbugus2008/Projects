package com.trimline.m_branch.reports;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.lifecycle.ViewModelProvider;

import com.trimline.m_branch.R;
import com.trimline.m_branch.Utilities.Mbranch;
import com.trimline.m_branch.Utilities.Printer;
import com.trimline.m_branch.Utilities.adapters.trans_expandablelist;
import com.trimline.m_branch.Utilities.collectiondates;
import com.trimline.m_branch.db.Models.BaseViewModel;
import com.trimline.m_branch.db.dao.B_Dao;
import com.trimline.m_branch.db.repository.Repository;
import com.trimline.m_branch.db.repository.t_repo;
import com.trimline.m_branch.transaction;
import com.trimline.m_branch.db.dao.d_transaction;
import com.trimline.m_branch.db.Models.tViewModel;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class dailysummary extends AppCompatActivity {
    trans_expandablelist listAdapter;
    List<collectiondates> listDataHeader;
    HashMap<collectiondates, List<transaction>> listDataChild;
    ExpandableListView report;
    private tViewModel viewModel;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_summary);
        setTitle("Summary Report");
        report = (ExpandableListView) findViewById(R.id.summuryreport);


        viewModel = new ViewModelProvider(this).get(tViewModel.class);

        DateCollection();
        listAdapter = new trans_expandablelist(this, listDataHeader, listDataChild,viewModel);
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
            public boolean onChildClick(ExpandableListView parent, View v, int groupPosition, int childPosition, long id) {
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
        listDataHeader = new ArrayList<collectiondates>();
        listDataChild = new HashMap<collectiondates, List<transaction>>();
        listDataHeader = viewModel.getdates();// db.getcollectiondates();
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


}
