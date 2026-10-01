package com.trimline.paul.metro;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;

public class AutoSuggestAdapter extends ArrayAdapter
{
    private Context      context;
    private int          resource;
    private List<String> items;
    private List<String> tempItems;
    private List<String> suggestions;

    /** Optional decorator: lets callers show extra info on each suggestion
     *  row while the underlying value (and the picked text) stays plain. */
    public interface Decorator {
        String decorate(String item);
    }

    private Decorator decorator;

    public void setDecorator(Decorator d) {
        this.decorator = d;
    }

    /** Optional custom row: inflate a layout and let the caller fill it in,
     *  instead of the default single decorated text line. */
    public interface RowBinder {
        void bind(View view, String item);
    }

    private int rowLayout = 0;
    private RowBinder rowBinder;

    public void setCustomRow(int layoutRes, RowBinder binder) {
        this.rowLayout = layoutRes;
        this.rowBinder = binder;
    }

    /** Optional: items this returns true for are ranked first among the filter
     *  matches (used to bubble fleet-number matches above vehicle numbers). */
    public interface Ranker {
        boolean ranksFirst(String item);
    }

    private Ranker ranker;

    public void setRanker(Ranker r) {
        this.ranker = r;
    }

    public AutoSuggestAdapter(Context context, int resource, List<String> items)
    {
        super(context, resource, 0, items);

        this.context = context;
        this.resource = resource;
        this.items = items;
        tempItems = new ArrayList<String>(items);
        suggestions = new ArrayList<String>();
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent)
    {
        View view = convertView;

        if (rowBinder != null)
        {
            if (view == null || view.findViewById(R.id.dd_title) == null)
            {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(rowLayout, parent, false);
            }
            rowBinder.bind(view, items.get(position));
            return view;
        }

        if (convertView == null)
        {
            LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
            view = inflater.inflate(resource, parent, false);
        }

        String item = items.get(position);

        if (item != null && decorator != null)
            item = decorator.decorate(item);

        if (item != null && view instanceof TextView)
        {
            ((TextView) view).setText(item);
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
            String str = (String) resultValue;
            return str;
        }

        @Override
        protected FilterResults performFiltering(CharSequence constraint)
        {
            if (constraint != null)
            {
                suggestions.clear();
                ArrayList<String> rest = new ArrayList<String>();
                String needle = constraint.toString().toLowerCase();
                for (String names : tempItems)
                {
                    if (names.toLowerCase().contains(needle))
                    {
                        if (ranker != null && ranker.ranksFirst(names))
                            suggestions.add(names);
                        else
                            rest.add(names);
                    }
                }
                suggestions.addAll(rest);
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
            List<String> filterList = (ArrayList<String>) results.values;
            if (results != null && results.count > 0)
            {
                clear();
                for (String item : filterList)
                {
                    add(item);
                    notifyDataSetChanged();
                }
            }
        }catch (Exception ex){ex.printStackTrace();}}
    };
}
