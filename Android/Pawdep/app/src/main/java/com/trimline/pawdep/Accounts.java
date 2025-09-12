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
public class Accounts {
    public String Key ;
    @NonNull
    @PrimaryKey
    public String No ;
    public String Name ;
    public int Income_Balance ;
    public Boolean Income_BalanceSpecified ;
    public int Account_Type ;
    public Boolean Account_TypeSpecified ;
    public int Gen_Posting_Type ;
    public Boolean Gen_Posting_TypeSpecified ;
    public String Gen_Bus_Posting_Group ;
    public String Gen_Prod_Posting_Group ;
    public String VAT_Bus_Posting_Group ;
    public String VAT_Prod_Posting_Group ;
    public Boolean Direct_Posting ;
    public Boolean Direct_PostingSpecified ;
    public Boolean Reconciliation_Account ;
    public Boolean Reconciliation_AccountSpecified ;
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Accounts t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Accounts> t) ;
        @Update
        int Update(Accounts t);
        @Delete
        void delete(Accounts t);
        @Query("SELECT * FROM Accounts")
        List<Accounts> getAll();
    }

    public static class adapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Accounts> groups;
        private List<Accounts> tempItems;
        private List<Accounts> suggestions;

        public adapter(Context context, int resource, List<Accounts> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Accounts>(items);
            suggestions = new ArrayList<Accounts>();
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
            TextView memberno = view.findViewById(R.id.memberNo);
            Accounts item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.No);
            branchname.setText(item.Name);
            memberno.setVisibility(View.GONE);

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
                Accounts str = (Accounts) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Accounts names : tempItems) {
                        if (names.Name != null)
                            if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);
                            else if (names.No !=null){
                                if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                    suggestions.add(names);
                                }}
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
                    List<Accounts> filterList = (ArrayList<Accounts>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Accounts item : filterList) {
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



    public static class Repository {
        private static Accounts.dao Dao;
        private LiveData<List<Accounts>> allAccountss;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.accdao();

        }

        public void insert(Accounts member) {
            new Accounts.Repository.InsertAccountsAsyncTask(Dao).execute(member);
        }

        public void insert(List<Accounts> member) {
            new Accounts.Repository.InsertAccountssAsyncTask(Dao).execute(member);
        }

        public void update(Accounts member) {
            new Accounts.Repository.UpdateAccountsAsyncTask(Dao).execute(member);
        }

        public void delete(Accounts member) {
            new Accounts.Repository.DeleteAccountsAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Accounts>> allAccountss() {
            return allAccountss;
        }

        private class InsertAccountsAsyncTask extends AsyncTask<Accounts, Void, Void> {
            private Accounts.dao memberDao;

            private InsertAccountsAsyncTask(Accounts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Accounts... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }

        private class InsertAccountssAsyncTask extends AsyncTask<List<Accounts>, Void, Void> {
            private Accounts.dao memberDao;

            private InsertAccountssAsyncTask(Accounts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Accounts>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateAccountsAsyncTask extends AsyncTask<Accounts, Void, Void> {
            private Accounts.dao memberDao;

            private UpdateAccountsAsyncTask(Accounts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Accounts... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteAccountsAsyncTask extends AsyncTask<Accounts, Void, Void> {
            private Accounts.dao memberDao;

            private DeleteAccountsAsyncTask(Accounts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Accounts... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }
        public void bindaccount(AutoCompleteTextView h) {
            new bindaccount(h).execute();
        }
        private class bindaccount extends AsyncTask<Void, Void, List<Accounts>> {
            AutoCompleteTextView h;

            public bindaccount(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Accounts> doInBackground(Void... advance) {

                List<Accounts> n = new ArrayList<>();
                try {

                        n = Dao.getAll();

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Accounts> res) {

                Accounts.adapter adapter = new Accounts.adapter(app.getApplicationContext(), R.layout.membernames, res);
                h.setAdapter(adapter);

            }
        }
    }
}
