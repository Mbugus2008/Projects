package com.trimline.paul.metro.reports;

import android.content.Context;
import android.graphics.Typeface;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;

import com.trimline.paul.metro.R;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

public class ExpandableListAdapter extends BaseExpandableListAdapter {

    private Context _context;
    private List<GroupHeader> _listDataHeader;
    private HashMap<String, List<ChildItem>> _listDataChild;

    public ExpandableListAdapter(Context context, List<GroupHeader> listDataHeader,
                                 HashMap<String, List<ChildItem>> listChildData) {
        this._context = context;
        this._listDataHeader = listDataHeader;
        this._listDataChild = listChildData;
    }

    @Override
    public Object getChild(int groupPosition, int childPosititon) {
        return this._listDataChild.get(this._listDataHeader.get(groupPosition).agentCode)
                .get(childPosititon);
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public View getChildView(int groupPosition, final int childPosition,
                             boolean isLastChild, View convertView, ViewGroup parent) {

        final ChildItem childItem = (ChildItem) getChild(groupPosition, childPosition);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.list_item, null);
        }

        TextView lblListItemHeader = convertView.findViewById(R.id.lblListItemHeader);
        lblListItemHeader.setText(childItem.itemNo);

        DecimalFormat formatter = new DecimalFormat("#,##0.00");

        TextView lblManagementSum = convertView.findViewById(R.id.lblManagementSum);
        lblManagementSum.setText("Mgt: " + formatter.format(childItem.managementSum));

        TextView lblSaccoSum = convertView.findViewById(R.id.lblSaccoSum);
        lblSaccoSum.setText("Sacco: " + formatter.format(childItem.saccoSum));

        TextView lblOperationSum = convertView.findViewById(R.id.lblOperationSum);
        lblOperationSum.setText("Ops: " + formatter.format(childItem.operationSum));

        TextView lblLoanSum = convertView.findViewById(R.id.lblLoanSum);
        lblLoanSum.setText("Loan: " + formatter.format(childItem.loanSum));

        TextView lblOthersSum = convertView.findViewById(R.id.lblOthersSum);
        lblOthersSum.setText("Others: " + formatter.format(childItem.othersSum));

        return convertView;
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        return this._listDataChild.get(this._listDataHeader.get(groupPosition).agentCode)
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
        GroupHeader header = (GroupHeader) getGroup(groupPosition);
        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.list_group, null);
        }

        TextView lblListHeader = (TextView) convertView
                .findViewById(R.id.lblListHeader);
        lblListHeader.setTypeface(null, Typeface.BOLD);
        lblListHeader.setText(header.agentCode);

        TextView lblVehicleCount = (TextView) convertView
                .findViewById(R.id.lblVehicleCount);
        lblVehicleCount.setText("Vehicles: " + header.vehicleCount);

        TextView lblTotalAmount = (TextView) convertView
                .findViewById(R.id.lblTotalAmount);

        DecimalFormat formatter = new DecimalFormat("#,##0.00");
        String formattedTotal = formatter.format(header.totalAmount);
        lblTotalAmount.setText("Total: " + formattedTotal);

        TextView lblManagementCount = convertView.findViewById(R.id.lblManagementCount);
        lblManagementCount.setText("Mgt: " + formatter.format(header.managementSum));

        TextView lblSaccoCount = convertView.findViewById(R.id.lblSaccoCount);
        lblSaccoCount.setText("Sacco: " + formatter.format(header.saccoSum));

        TextView lblOperationCount = convertView.findViewById(R.id.lblOperationCount);
        lblOperationCount.setText("Ops: " + formatter.format(header.operationSum));

        TextView lblLoanCount = convertView.findViewById(R.id.lblLoanCount);
        lblLoanCount.setText("Loan: " + formatter.format(header.loanSum));

        TextView lblOthersCount = convertView.findViewById(R.id.lblOthersCount);
        lblOthersCount.setText("Others: " + formatter.format(header.othersSum));


        return convertView;
    }

    @Override
    public boolean hasStableIds() {
        return false;
    }

    @Override
    public boolean isChildSelectable(int groupPosition, int childPosition) {
        return true;
    }
}
