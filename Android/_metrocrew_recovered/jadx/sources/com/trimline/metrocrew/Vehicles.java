package com.trimline.metrocrew;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;
import androidx.lifecycle.AndroidViewModel;
import java.util.ArrayList;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class Vehicles {
    public double Arrears;
    public String Code;
    public Double Daily_Contribution;
    public String Fleet_No;
    public String Id_Number;
    public double Penalty;
    public String Start_Date;
    public String Vehicle_Number;
    public int vehicle_type;

    public static abstract class dao {
        abstract void delete(Vehicles entity);

        abstract List<Vehicles> getall();

        abstract void insert(Vehicles entity);

        abstract void update(Vehicles entity);
    }

    public String toString() {
        return this.Code;
    }

    public enum Vehicle_Type {
        _x0031_4_Seater("14 Seater"),
        _x0033_3_Seater("33 Seater"),
        _x0032_5_Seater("25 Seater"),
        _x0032_9_Seater("29 Seater"),
        _x0034_1_Seater("41 Seater"),
        _x0032_6_Seater("26 Seater"),
        _x0033_7_Seater("37 Seater");

        private String type;

        Vehicle_Type(String aState) {
            this.type = aState;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.type;
        }
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.vDao();
        }

        public List<Vehicles> getall() {
            return this.dao.getall();
        }

        public void insert(Vehicles loan) {
            new InsertAsyncTask(this.dao).execute(loan);
        }

        public void update(Vehicles loan) {
            new UpdateloanAsyncTask(this.dao).execute(loan);
        }

        public void delete(Vehicles loan) {
            new DeleteloanAsyncTask(this.dao).execute(loan);
        }

        private class InsertAsyncTask extends AsyncTask<Vehicles, Void, Void> {
            private dao dao;

            private InsertAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Vehicles... loans) {
                this.dao.insert(loans[0]);
                return null;
            }
        }

        private class UpdateloanAsyncTask extends AsyncTask<Vehicles, Void, Void> {
            private dao dao;

            private UpdateloanAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Vehicles... loans) {
                this.dao.update(loans[0]);
                return null;
            }
        }

        private class DeleteloanAsyncTask extends AsyncTask<Vehicles, Void, Void> {
            private dao dao;

            private DeleteloanAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(Vehicles... loans) {
                this.dao.delete(loans[0]);
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

        public void insert(Vehicles loan) {
            this.repository.insert(loan);
        }

        public void update(Vehicles loan) {
            this.repository.update(loan);
        }

        public void delete(Vehicles loan) {
            this.repository.delete(loan);
        }

        public List<Vehicles> getall() {
            return this.repository.getall();
        }
    }

    public static class autocomplete extends ArrayAdapter {
        private Context context;
        private List<Vehicles> items;
        Filter nameFilter;
        private int resource;
        private List<Vehicles> suggestions;
        private List<Vehicles> tempItems;

        public autocomplete(Context context, int resource, List<Vehicles> items) {
            super(context, resource, 0, items);
            this.nameFilter = new Filter() { // from class: com.trimline.metrocrew.Vehicles.autocomplete.1
                @Override // android.widget.Filter
                public CharSequence convertResultToString(Object resultValue) {
                    Vehicles str = (Vehicles) resultValue;
                    return str.Vehicle_Number;
                }

                @Override // android.widget.Filter
                protected Filter.FilterResults performFiltering(CharSequence constraint) {
                    if (constraint != null) {
                        autocomplete.this.suggestions.clear();
                        for (Vehicles names : autocomplete.this.tempItems) {
                            if (names.Vehicle_Number != null && names.Vehicle_Number.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                autocomplete.this.suggestions.add(names);
                            }
                            if (names.Fleet_No.toLowerCase().contains(constraint.toString().toLowerCase())) {
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
                        List<Vehicles> filterList = (ArrayList) results.values;
                        if (results == null || results.count <= 0) {
                            return;
                        }
                        autocomplete.this.clear();
                        for (Vehicles item : filterList) {
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
            Vehicles item = this.items.get(position);
            TextView name = (TextView) view.findViewById(R.id.name);
            name.setText(item.Fleet_No + " " + item.Vehicle_Number);
            return view;
        }

        @Override // android.widget.ArrayAdapter, android.widget.Filterable
        public Filter getFilter() {
            return this.nameFilter;
        }
    }
}
