package com.trimline.ftdm.adapters;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;

import com.trimline.ftdm.Farmer;
import com.trimline.ftdm.datacollector.R;


import java.util.ArrayList;
import java.util.List;

public class farmers_adapter extends ArrayAdapter
{
    private Context      context;
    private int          resource;
    private List<Farmer> items;
    private List<Farmer> tempItems;
    private List<Farmer> suggestions;

    public farmers_adapter(Context context, int resource, List<Farmer> items)
    {
        super(context, resource, 0, items);

        this.context = context;
        this.resource = resource;
        this.items = items;
        tempItems = new ArrayList<Farmer>(items);
        suggestions = new ArrayList<Farmer>();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        View view = convertView;
        if (convertView == null)
        {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(resource, parent, false);
        }

        Farmer item = items.get(position);
        TextView no = (TextView) view.findViewById(R.id.no);
        TextView name = (TextView) view.findViewById(R.id.name);
        if (item != null )
        {
            no.setText(item.No );
            name.setText(item.Name);
        }

        return view;
    }

    @Override
    public Filter getFilter()
    {
        return nameFilter;
    }

    Filter nameFilter = new Filter()
    {
        @Override
        public CharSequence convertResultToString(Object resultValue)
        {
            Farmer str = (Farmer) resultValue;
            return str.No;
        }

        @Override
        protected FilterResults performFiltering(CharSequence constraint)
        {
            if (constraint != null)
            {
                suggestions.clear();
                for (Farmer names : tempItems)
                {
                    if (names.Name !=null)
                    if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                    {
                        suggestions.add(names);
                    }

                    if (names.No !=null)
                        if (names.No.toLowerCase().contains(constraint.toString().toLowerCase()))
                        {
                            suggestions.add(names);
                        }

                }
                FilterResults filterResults = new FilterResults();
                filterResults.values = suggestions;
                filterResults.count = suggestions.size();
                return filterResults;
            }
            else
            {
                return new FilterResults();
            }
        }

        @Override
        protected void publishResults(CharSequence constraint, FilterResults results)
        {try{
            List<Farmer> filterList = (ArrayList<Farmer>) results.values;
            if (results != null && results.count > 0)
            {
                clear();
                for (Farmer item : filterList)
                {
                    add(item);
                    notifyDataSetChanged();
                }
            }
        }catch (Exception ex){ex.printStackTrace();}}
    };
}

