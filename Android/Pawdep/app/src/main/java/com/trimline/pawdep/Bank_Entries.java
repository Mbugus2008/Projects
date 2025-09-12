package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;
import android.widget.Toast;

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
import androidx.room.TypeConverters;
import androidx.room.Update;

import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;

//@Entity
public class Bank_Entries {
    public String Key;
    //@PrimaryKey
    //@NonNull
    public String TransactionId;
    public String Message_reference;
    //@TypeConverters(Converters.class)
    public java.sql.Date Message_DateTime;
    public Boolean Message_DateTimeSpecified;
    public String Service_Name;
    public String Notification_Code;
    public String Payment_Ref;
    public String AccountNumber;
    public double Amount;
    public Boolean AmountSpecified;
    public String Transaction_Date;
    public String Event_Type;
    public String Currency;
    public String Exchange_Rate;
    public String Narration;
    public String Value_Date;
    public String Entry_Date;
    public String Cust_Memo_Line1;
    public String Cust_Memo_Line2;
    public String Cust_Memo_Line3;
    public String Reference;
    public String ID_No;
    public String Phone_No;
    public Boolean Posted;
    public String Member_No;

//    @Dao
//    public interface dao extends Basedao {
//        @Insert(onConflict = OnConflictStrategy.REPLACE)
//        long Insert(Bank_Entries t);
//        @Insert(onConflict = OnConflictStrategy.REPLACE)
//        void   Insertall(Iterable<Bank_Entries> t) ;
//        @Update
//        int Update(Bank_Entries t);
//        @Delete
//        void delete(Bank_Entries t);
//
//        @Query("SELECT * FROM Bank_Entries")
//        LiveData<List<Bank_Entries>> getAll();
//    }


    public static class Model extends AndroidViewModel {
        // Bank_Entries.Repository repository;
        private LiveData<List<Bank_Entries>> all;
        public Bank_Entries currentbankentry;

        public Model(@NonNull Application application) {
            super(application);
            //repository = new Bank_Entries.Repository(application);
            //all = repository.getall();
        }

        public LiveData<List<Bank_Entries>> getall() {
            return all;
        }

    }

    //    public static class Repository {
//        private static Bank_Entries.dao Dao;
//        private LiveData<List<Bank_Entries>> all;
//        static Application app;
//
//        public Repository(Application application) {
//            this.app = application;
//            DB database = DB.getInstance(application);
//            Dao = database.bankentriesdao();
//            all = Dao.getAll();
//
//        }
//
//
//        public LiveData<List<Bank_Entries>> getall(){
//            return all;
//        }
//    }
    public static class autocomplete extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Bank_Entries> groups;
        private List<Bank_Entries> tempItems;
        private List<Bank_Entries> suggestions;

        public autocomplete(Context context, int resource, List<Bank_Entries> items) {
            super(context, resource, 0, items);
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Bank_Entries>(items);
            suggestions = new ArrayList<Bank_Entries>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }
            TextView bnk_tid = view.findViewById(R.id.bnke_tid);
            TextView bnk_id = view.findViewById(R.id.bnke_idno);
            TextView bnk_phone = view.findViewById(R.id.bnke_phone);
            TextView bnk_amount = view.findViewById(R.id.bnke_amount);
            Bank_Entries item = groups.get(position);

            bnk_id.setText(item.ID_No);
            bnk_tid.setText(item.Reference);
            bnk_phone.setText(item.Phone_No);
            bnk_amount.setText(String.format("%,.2f", item.Amount));


            return view;
        }

        @Override
        public Filter getFilter() {
            return nameFilter;
        }

        Filter nameFilter = new Filter() {
            @Override
            public CharSequence convertResultToString(Object resultValue) {
                Bank_Entries str = (Bank_Entries) resultValue;
                return str.TransactionId;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Bank_Entries names : tempItems) {
                        if (names.ID_No != null) {
                            if (names.ID_No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
                        }
                        if (names.Reference != null) {
                            if (names.Reference.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
                        }
                        if (String.valueOf(names.Phone_No) != null) {
                            if (String.valueOf(names.Phone_No).contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
                        }
                        if (String.valueOf(names.TransactionId) != null) {
                            if (String.valueOf(names.TransactionId.toLowerCase()).contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
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
                    List<Bank_Entries> filterList = (ArrayList<Bank_Entries>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Bank_Entries item : filterList) {
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

    public static class attachlist extends AsyncTask<String, Void, List<Bank_Entries>> {
        AutoCompleteTextView h;
        Context c;

        public attachlist(AutoCompleteTextView hh, Context c) {
            this.h = hh;
            this.c = c;
        }

        @Override
        protected List<Bank_Entries> doInBackground(String... advance) {

            List<Bank_Entries> n = new ArrayList<>();
            try {
                String result = JsonParser.postjson("Bankentries", null, null);
                Type localType = new TypeToken<List<Bank_Entries>>() {
                }.getType();
                n = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return n;
        }

        @Override
        protected void onPostExecute(List<Bank_Entries> res) {
            if (res != null) {
                h.setHint("Search by typing phone no, reference or id ");
                Toast.makeText(c, "Bank entries Loaded", Toast.LENGTH_SHORT).show();
                autocomplete adapter = new autocomplete(c, R.layout.bank_entries, res);
                h.setAdapter(adapter);
            } else
                h.setHint("Could not Populate Bank entries");
        }
    }

}
