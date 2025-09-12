package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.text.InputType;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Pawdep extends Application {
    public static Agent Agent;

    public static String Uid() {
        Date c = Calendar.getInstance().getTime();
        SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
        return df.format(c);
    }
    public static class Ttypes extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<String> groups;
        private List<String> tempItems;
        private List<String> suggestions;
        public Ttypes(Context context, int resource, List<String> items) {
            super(context, resource, 0, items);
            this.context = context;
            this.resource = resource;
this.groups = items;
            tempItems = new ArrayList<String>(items);
            suggestions = new ArrayList<String>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.name);

            String item = groups.get(position);

            groupname.setText(item);

            // }

            return view;
        }

        @Override
        public Filter getFilter() {
            return nameFilter;
        }

        Filter nameFilter = new Filter() {
            @Override
            public CharSequence convertResultToString(Object resultValue) {
                String str = (String) resultValue;
                return str;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (String names : tempItems) {
                        suggestions.add(names);
//                        if (names.Name != null)
//                            if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
//
//                            else if (names.No != null) {
//                                if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
//                                    suggestions.add(names);
//                                }
//                            } else if (names.GID != null) {
//                                if (names.GID.toLowerCase().contains(constraint.toString().toLowerCase())) {
//                                    suggestions.add(names);
//                                }
//                            }
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
                    List<String> filterList = (ArrayList<String>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (String item : filterList) {
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

    public static <E extends Enum<E>> void bind(AutoCompleteTextView view, Class<E> enumData,Context c, Boolean useasdropdown){
        List<String> enums= new ArrayList<>();
        for (Enum<E> enumVal: enumData.getEnumConstants()) {
            enums.add(enumVal.toString());
        }
        view.setAdapter(new Pawdep.Ttypes(c,
                R.layout.enums, enums));
        if (useasdropdown)
        {
            view.setInputType(InputType.TYPE_NULL);
            view.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    view.showDropDown();
                    return false;
                }
            });
        }
    }
}
