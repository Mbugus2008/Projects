package com.trimline.paul.metro;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.TextView;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class Vehicleadapter extends BaseExpandableListAdapter {
    private Context _context;
    private List<summaries.collectiondates> _listDataHeader; // header titles
    private HashMap<summaries.collectiondates, List<transaction>> _listDataChild;
    private DB db;

    public Vehicleadapter(Context context, List<summaries.collectiondates> listDataHeader,
                          HashMap<summaries.collectiondates, List<transaction>> listChildData, DB db) {
        this._context = context;
        this._listDataHeader = listDataHeader;
        this._listDataChild = listChildData;
        this.db = db;
    }

    @Override
    public Object getChild(int groupPosition, int childPosititon) {
        summaries.collectiondates header = _listDataHeader.get(groupPosition);
        List<transaction> transactions = _listDataChild.get(header);
        Map<String, List<transaction>> groupedByType = transactions.stream()
                .collect(Collectors.groupingBy(transaction::getType));
        String type = new ArrayList<>(groupedByType.keySet()).get(childPosititon);
        return groupedByType.get(type);
    }

    @Override
    public long getChildId(int groupPosition, int childPosition) {
        return childPosition;
    }

    @Override
    public View getChildView(int groupPosition, final int childPosition,
                             boolean isLastChild, View convertView, ViewGroup parent) {

        List<transaction> transactions = (List<transaction>) getChild(groupPosition, childPosition);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.list_item_vehicle, null);
        }

        TextView typeName = convertView.findViewById(R.id.lblListItemHeader);
        TextView totalAmount = convertView.findViewById(R.id.lblTotal);
        TextView count = convertView.findViewById(R.id.lblCount);

        String typeCode = transactions.get(0).getType();
        types type = db.gettype(typeCode);
        typeName.setText(type != null ? type.Name : typeCode);

        double total = transactions.stream().mapToDouble(transaction::getAmount).sum();
        totalAmount.setText(new DecimalFormat("#,##0.00").format(total));
        count.setText("Count: " + transactions.size());

        return convertView;
    }

    @Override
    public int getChildrenCount(int groupPosition) {
        summaries.collectiondates header = _listDataHeader.get(groupPosition);
        List<transaction> transactions = _listDataChild.get(header);
        return (int) transactions.stream().map(transaction::getType).distinct().count();
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
        summaries.collectiondates headerTitle = (summaries.collectiondates) getGroup(groupPosition);
        List<transaction> transactions = _listDataChild.get(headerTitle);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.list_group_vehicle, null);
        }

        TextView veh = convertView.findViewById(R.id.lblListHeader);
        vehicles vehicle = db.getvehicle(headerTitle.date);
        String fleetNo = vehicle != null ? vehicle.Fleet_No : "";
        veh.setText(headerTitle.date + " (" + fleetNo + ")");

        double totalManagement = transactions.stream()
                .filter(t -> "Management".equalsIgnoreCase(db.gettype(t.Type).Name))
                .mapToDouble(transaction::getAmount).sum();
        double totalSacco = transactions.stream()
                .filter(t -> "Sacco".equalsIgnoreCase(db.gettype(t.Type).Name))
                .mapToDouble(transaction::getAmount).sum();
        double totalOperation = transactions.stream()
                .filter(t -> "Operation".equalsIgnoreCase(db.gettype(t.Type).Name))
                .mapToDouble(transaction::getAmount).sum();
        double totalOthers = transactions.stream()
                .filter(t -> !"Management".equalsIgnoreCase(db.gettype(t.Type).Name) &&
                        !"Sacco".equalsIgnoreCase(db.gettype(t.Type).Name) &&
                        !"Operation".equalsIgnoreCase(db.gettype(t.Type).Name))
                .mapToDouble(transaction::getAmount).sum();
        double totalAmount = transactions.stream().mapToDouble(transaction::getAmount).sum();

        DecimalFormat formatter = new DecimalFormat("#,##0.00");

        TextView lblManagementTotal = convertView.findViewById(R.id.lblManagementTotal);
        lblManagementTotal.setText("Mgt: " + formatter.format(totalManagement));

        TextView lblSaccoTotal = convertView.findViewById(R.id.lblSaccoTotal);
        lblSaccoTotal.setText("Sacco: " + formatter.format(totalSacco));

        TextView lblOperationTotal = convertView.findViewById(R.id.lblOperationTotal);
        lblOperationTotal.setText("Ops: " + formatter.format(totalOperation));

        TextView lblOthersTotal = convertView.findViewById(R.id.lblOthersTotal);
        lblOthersTotal.setText("Others: " + formatter.format(totalOthers));

        TextView lblTotalAmount = convertView.findViewById(R.id.lblTotalAmount);
        lblTotalAmount.setText("Total: " + formatter.format(totalAmount));

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