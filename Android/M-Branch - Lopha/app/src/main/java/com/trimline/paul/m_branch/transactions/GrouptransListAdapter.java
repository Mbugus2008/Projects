package com.trimline.paul.m_branch.transactions;

// ExpandableListAdapter.java
import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;

import androidx.appcompat.app.AlertDialog;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.trimline.paul.m_branch.R;
import com.trimline.paul.m_branch.transaction;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class GrouptransListAdapter extends BaseExpandableListAdapter {

    private Context context;
    private List<GroupedByVehicle> loanNoList;

    public GrouptransListAdapter(Context context, List<GroupedByVehicle> loanNoList) {
        this.context = context;
        this.loanNoList = loanNoList;
    }

    @Override
    public int getGroupCount() {
        return loanNoList.size();
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        return loanNoList.get(groupPosition).getGroupedByTypeList().size();
    }

    @Override
    public Object getGroup(int groupPosition) {
        return loanNoList.get(groupPosition);
    }

    @Override
    public Object getChild(int groupPosition, int childPosition) {
        return loanNoList.get(groupPosition).getGroupedByTypeList().get(childPosition);
    }

    @Override
    public long getGroupId(int groupPosition) {
        return groupPosition;
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public boolean hasStableIds() {
        return true;
    }

    @Override
    public View getGroupView(int groupPosition, boolean isExpanded, View convertView, ViewGroup parent) {
        if (convertView == null) {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.groupedtrans, null);
        }

        GroupedByVehicle group = (GroupedByVehicle) getGroup(groupPosition);
        TextView text1 = convertView.findViewById(R.id.text1);
        TextView text2 = convertView.findViewById(R.id.text2);

        text1.setText( String.format("%s", group.getVehicle()));
        text2.setText( String.format("%,.2f",group.getTotalAmount()));
        text2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                showCustomDialog(group);
            }
        });

        return convertView;
    }
    private void showCustomDialog(GroupedByVehicle header) {
        // Inflate the custom layout
        LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);;
        View dialogView = inflater.inflate(R.layout.showvehdetail, null);
        TextView h = dialogView.findViewById(R.id.dialog_title);

        h.setText(String.format("%s (%s)",header.getFleetNO(),header.getVehicle()));
        // Create an AlertDialog.Builder and set the custom layout
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(context);
        dialogBuilder.setView(dialogView);

        // Create and show the dialog
        AlertDialog alertDialog = dialogBuilder.create();
        alertDialog.show();

        // Setup the RecyclerView
        RecyclerView recyclerView = dialogView.findViewById(R.id.recyclerViewDialog);
        recyclerView.setLayoutManager(new LinearLayoutManager(context));

        // Example data
        Collections.sort(header.getTransactions(), new Comparator<transaction>() {
            @Override
            public int compare(transaction o1, transaction o2) {
                return o1.Document_No.compareTo(o2.Document_No);
            }
        });
        // Setup the adapter
        MyRecyclerViewAdapter adapter = new MyRecyclerViewAdapter(header.getTransactions(), item -> {
            // Handle item click
            // For example, display a Toast, or perform any action
            // Dismiss the dialog after an item is selected
            alertDialog.dismiss();
        });

        recyclerView.setAdapter(adapter);
    }
    @Override
    public View getChildView(int groupPosition, int childPosition, boolean isLastChild, View convertView, ViewGroup parent) {
        if (convertView == null) {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = inflater.inflate(R.layout.groupedtransdet, null);
        }

        GroupedByType child = (GroupedByType) getChild(groupPosition, childPosition);
        TextView text1 = convertView.findViewById(R.id.text1);
        TextView text2 = convertView.findViewById(R.id.text2);

        text1.setText( child.getType());
        text2.setText(   String.format("%,.2f",child.getTotalAmount()));

        return convertView;
    }

    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }
}
