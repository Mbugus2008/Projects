package com.trimline.metrocrew;

import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;
import androidx.lifecycle.AndroidViewModel;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class Member implements Serializable {
    public double Current_Savings;
    public double Current_Shares;
    public String ID_No;
    public String Key;
    public String Name;
    public String No;
    public double Outstanding_Balance;
    public String Phone_No;
    public double Registration_Fee_Paid;
    public double Shares_Retained;
    public loan[] loans;

    public static abstract class dao {
        abstract void delete(Member entity);

        abstract List<Member> getmembers();

        abstract void insert(Member entity);

        abstract void update(Member entity);
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.memberDao();
        }

        public List<Member> getmembers() {
            return this.dao.getmembers();
        }

        public void insert(Member member) {
            new InsertmemberAsyncTask(this.dao).execute(member);
        }

        public void update(Member member) {
            new UpdatememberAsyncTask(this.dao).execute(member);
        }

        public void delete(Member member) {
            new DeletememberAsyncTask(this.dao).execute(member);
        }

        private class InsertmemberAsyncTask extends AsyncTask<Member, Void, Void> {
            private dao dao;

            private InsertmemberAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Member... members) {
                this.dao.insert(members[0]);
                return null;
            }
        }

        private class UpdatememberAsyncTask extends AsyncTask<Member, Void, Void> {
            private dao dao;

            private UpdatememberAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Member... members) {
                this.dao.update(members[0]);
                return null;
            }
        }

        private class DeletememberAsyncTask extends AsyncTask<Member, Void, Void> {
            private dao dao;

            private DeletememberAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Member... members) {
                this.dao.delete(members[0]);
                return null;
            }
        }
    }

    public static class Model extends AndroidViewModel {
        private Repository repository;

        public Model(Application application) {
            super(application);
            this.repository = new Repository(application);
        }

        public void insert(Member member) {
            this.repository.insert(member);
        }

        public void update(Member member) {
            this.repository.update(member);
        }

        public void delete(Member member) {
            this.repository.delete(member);
        }

        public List<Member> getallmbers() {
            return this.repository.getmembers();
        }
    }

    public static class autocomplete extends ArrayAdapter {
        private Context context;
        private List<Member> items;
        Filter nameFilter;
        private int resource;
        private List<Member> suggestions;
        private List<Member> tempItems;

        public autocomplete(Context context, int resource, List<Member> items) {
            super(context, resource, 0, items);
            this.nameFilter = new Filter() { // from class: com.trimline.metrocrew.Member.autocomplete.1
                @Override // android.widget.Filter
                public CharSequence convertResultToString(Object resultValue) {
                    Member str = (Member) resultValue;
                    return str.No;
                }

                @Override // android.widget.Filter
                protected Filter.FilterResults performFiltering(CharSequence constraint) {
                    if (constraint != null) {
                        autocomplete.this.suggestions.clear();
                        for (Member names : autocomplete.this.tempItems) {
                            if (names.Name != null && names.Name.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                autocomplete.this.suggestions.add(names);
                            }
                            if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                autocomplete.this.suggestions.add(names);
                            }
                            if (names.ID_No != null && names.ID_No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                autocomplete.this.suggestions.add(names);
                            }
                            if (names.Phone_No != null && names.Phone_No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                autocomplete.this.suggestions.add(names);
                            }
                            if (names.No.toLowerCase().contains("new")) {
                                autocomplete.this.suggestions.add(names);
                            }
                        }
                        Filter.FilterResults filterResults = new Filter.FilterResults();
                        filterResults.values = autocomplete.this.suggestions;
                        filterResults.count = autocomplete.this.suggestions.size();
                        return filterResults;
                    }
                    return new Filter.FilterResults();
                }

                @Override // android.widget.Filter
                protected void publishResults(CharSequence constraint, Filter.FilterResults results) {
                    try {
                        List<Member> filterList = (ArrayList) results.values;
                        if (results == null || results.count <= 0) {
                            return;
                        }
                        autocomplete.this.clear();
                        for (Member item : filterList) {
                            autocomplete.this.add(item);
                            autocomplete.this.notifyDataSetChanged();
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            };
            this.context = context;
            this.resource = resource;
            this.items = items;
            this.tempItems = new ArrayList(items);
            this.suggestions = new ArrayList();
        }

        @Override // android.widget.ArrayAdapter, android.widget.Adapter
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) this.context.getSystemService("layout_inflater");
                view = inflater.inflate(this.resource, parent, false);
            }
            Member item = this.items.get(position);
            TextView no = (TextView) view.findViewById(R.id.no);
            TextView name = (TextView) view.findViewById(R.id.name);
            if (item != null) {
                no.setText(item.No + " | " + (item.ID_No == null ? "No ID" : item.ID_No) + " | " + (item.Phone_No == null ? "No Phone" : item.Phone_No));
                name.setText(item.Name);
            }
            ColorStateList c = name.getTextColors();
            if (item.No.equalsIgnoreCase("New")) {
                no.setVisibility(8);
                name.setTextColor(-16776961);
            } else {
                no.setVisibility(0);
                name.setTextColor(c);
            }
            return view;
        }

        @Override // android.widget.ArrayAdapter, android.widget.Filterable
        public Filter getFilter() {
            return this.nameFilter;
        }
    }
}
