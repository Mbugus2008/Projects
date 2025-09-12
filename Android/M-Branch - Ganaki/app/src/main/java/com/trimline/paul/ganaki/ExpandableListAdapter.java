package com.trimline.paul.ganaki;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseExpandableListAdapter;
import android.widget.ImageView;
import android.widget.TextView;

public class ExpandableListAdapter extends BaseExpandableListAdapter {

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
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            convertView = infalInflater.inflate(R.layout.reportlist, null);
        }


        TextView loan = (TextView) convertView.findViewById(R.id.loan);
        TextView welfare = (TextView) convertView.findViewById(R.id.welfare);
        TextView stage = (TextView) convertView.findViewById(R.id.stage);
        TextView savings = (TextView) convertView.findViewById(R.id.savings);
        TextView operation = (TextView) convertView.findViewById(R.id.operation);
        TextView court = (TextView) convertView.findViewById(R.id.court);
        TextView Amount = (TextView) convertView.findViewById(R.id.amount);
        TextView Shares = (TextView) convertView.findViewById(R.id.shares);
        loan.setText(String.format("Loan: %.2f", t.Loan));
        welfare.setText(String.format("Welfare: %.2f", t.Welfare));
        stage.setText(String.format("Stage Cash: %.2f", t.Stage));
        savings.setText(String.format("Savings: %.2f", t.Savings));
        operation.setText(String.format("Operation: %.2f", t.Operation));
        court.setText(String.format("Court Bond: %.2f", t.Court_Bond));
        Amount.setText(String.format("Total: %.2f", t.Amount));
        Shares.setText(String.format("Shares: %.2f", t.Shares));

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
        final summaries.collectiondates headerTitle = (summaries.collectiondates) getGroup(groupPosition);

        if (convertView == null) {
            LayoutInflater infalInflater = (LayoutInflater) this._context
                    .getSystemService(Context.LAYOUT_INFLATER_SERVICE);
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

        ImageView print = (ImageView)convertView.findViewById(R.id.printdaily);
        print.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                summaries.printer p = new summaries.printer();

                ArrayList<transaction> tr = db.gettransbydate_daily(headerTitle.date);
                p.printSummary( tr.get(0));
                db.refresh(headerTitle.date);
            }
        });
        ImageView refresh = (ImageView)convertView.findViewById(R.id.refresh);
refresh.setOnClickListener(new View.OnClickListener() {
    @Override
    public void onClick(View v) {
        db.refresh(headerTitle.date);
        Log.i("refresh",headerTitle.date );
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