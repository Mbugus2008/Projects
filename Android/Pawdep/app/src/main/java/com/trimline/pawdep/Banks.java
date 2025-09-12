package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;

import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Banks {
    public String Key ;
    @NonNull
    @PrimaryKey
    public String No ;
    public String Name ;
    public Boolean Branch_Cash ;
    public Boolean Branch_CashSpecified ;
    public String Global_Dimension_2_Code ;
    public String Post_Code ;
    public String Country_Region_Code ;
    public String Phone_No ;
    public String Fax_No ;
    public String Contact ;
    public String Bank_Account_No ;
    public String SWIFT_Code ;
    public String IBAN ;
    public String Our_Contact_Code ;
    public String Bank_Acc_Posting_Banks ;
    public String Currency_Code ;
    public String Language_Code ;
    public String Search_Name ;
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Banks t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Banks> t) ;
        @Update
        int Update(Banks t);
        @Delete
        void delete(Banks t);
        @Query("SELECT * FROM Banks")
        List<Banks> getAll();
    }

    public static class Banksadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Banks> groups;
        private List<Banks> tempItems;
        private List<Banks> suggestions;

        public Banksadapter(Context context, int resource, List<Banks> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Banks>(items);
            suggestions = new ArrayList<Banks>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.groupname);
            TextView branchname = view.findViewById(R.id.branchname);
            Banks item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.No);
            branchname.setText(item.Name);
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
                Banks str = (Banks) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Banks names : tempItems) {
                        if (names.Name != null)
                            if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);

                            else if (names.No!=null)
                            if(names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
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
                    List<Banks> filterList = (ArrayList<Banks>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Banks item : filterList) {
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
    public static class Model extends AndroidViewModel {

        Repository repository;
        private LiveData<List<Banks>> all;

        public Model(@NonNull Application application) {
            super(application);
            repository = new Repository(application);
        }

        public void getbanks(AutoCompleteTextView a) {
            repository.Banks(a);
        }
    }

    public static class Repository {
        private static dao Dao;
        private LiveData<List<Banks>> all;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.bdao();

        }

        public void Banks(AutoCompleteTextView h) {
            new getbanks(h).execute();
        }
        private class getbanks extends AsyncTask<Void, Void, List<Banks>> {
            AutoCompleteTextView h;

            public getbanks(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Banks> doInBackground(Void... advance) {

                List<Banks> n = new ArrayList<>();
                try {

                    n = Dao.getAll();

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Banks> res) {

                Banksadapter adapter = new   Banksadapter(app.getApplicationContext(), R.layout.banknames, res);
                h.setAdapter(adapter);

            }
        }
    }
}
