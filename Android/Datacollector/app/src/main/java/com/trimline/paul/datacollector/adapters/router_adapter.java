package com.trimline.paul.datacollector.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;

import com.trimline.paul.datacollector.Farmer;
import com.trimline.paul.datacollector.R;
import com.trimline.paul.datacollector.Routes;

import java.util.ArrayList;
import java.util.List;

public class router_adapter extends ArrayAdapter {
    private Context context;
    private int resource;
    private List<Routes> items;
    private List<Routes> tempItems;
    private List<Routes> suggestions;

    public router_adapter(Context context, int resource, List<Routes> items) {
        super(context, resource, 0, items);

        this.context = context;
        this.resource = resource;
        this.items = items;
        tempItems = new ArrayList<Routes>(items);
        suggestions = new ArrayList<Routes>();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        View view = convertView;
        if (convertView == null) {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(resource, parent, false);
        }

        Routes item = items.get(position);
        TextView no = (TextView) view.findViewById(R.id.no);
        TextView name = (TextView) view.findViewById(R.id.name);
        if (item != null) {
            no.setText(item.Code);
            name.setText(item.Description);
        }

        return view;
    }

    @Override
    public Filter getFilter() {
        return nameFilter;
    }

    Filter nameFilter = new Filter() {
        @Override
        public CharSequence convertResultToString(Object resultValue) {
            Routes str = (Routes) resultValue;
            return str.Code;
        }

        @Override
        protected FilterResults performFiltering(CharSequence constraint) {
            if (constraint != null) {
                suggestions.clear();
                for (Routes names : tempItems) {
                    if (names.Description != null)
                        if (names.Description.toLowerCase().contains(constraint.toString().toLowerCase())) {
                            suggestions.add(names);
                        }

                    if (names.Code != null)
                        if (names.Code.toLowerCase().contains(constraint.toString().toLowerCase())) {
                            suggestions.add(names);
                        }

                }
                FilterResults filterResults = new FilterResults();
                filterResults.values = suggestions;
                filterResults.count = suggestions.size();
                return filterResults;
            } else {
                return new FilterResults();
            }
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results) {
            try {
                List<Routes> filterList = (ArrayList<Routes>) results.values;
                if (results != null && results.count > 0) {
                    clear();
                    for (Routes item : filterList) {
                        add(item);
                        notifyDataSetChanged();
                    }
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    };
}
