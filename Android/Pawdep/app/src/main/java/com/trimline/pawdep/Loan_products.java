package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.text.InputType;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
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
import java.util.stream.Collectors;

@Entity
public class Loan_products {
    public String Key ;
    @NonNull
    @PrimaryKey
    public String Code ;
    public String Product_Description ;
    public String Source_od_Financing ;
    public float Interest_Rate ;
    public int Interest_Calculation_Method ;
    public float Insurance_Percent ;
    public String No_Series ;
    public String Grace_Period ;
    public String Name_of_Source_of_Funding ;
    public int Rounding ;
    public float Rounding_Precision ;
    public float Loan_Appraisal_Percent ;
    public int No_of_Installment ;
    public String Loan_No_Series ;
    public String New_Numbers ;
    public String Installment_Period ;
    public float Loan_to_Share_Ratio ;
    public String Penalty_Calculation_Days ;
    public float Penalty_Percentage ;
    public int Penalty_Calculation_Method ;
    public String Penalty_Account ;
    public Boolean Use_Cycles ;
    public float Max_Loan_Amount ;
    public transient java.sql.Date Penalty_Posted_Reporting_Date ;
    public transient java.sql.Date Penalty_Posted_Last_Calc_Date ;
    public float Compulsary_Savings ;
    public int Repayment_Method ;
    public int Grace_Period_Principal_M ;
    public int Grace_Peiod_Interest_M ;
    public float Min_Loan_Amount ;
    public String Bank_Account_Details ;
    public String Bank_Code ;
    public String Loan_Account ;
    public String Loan_Interest_Account ;
    public String Receivable_Interest_Account ;
    public String BOSA_Account ;
    public int Action ;
    public String BOSA_Personal_Loan_Account ;
    public String Top_Up_Commission_Account ;
    public float Top_Up_Commission ;
    public int Source ;
    public float Valuation_Amount ;
    public int Priority ;
    public String Minutes_Nos ;
    public String SMS_Code ;
    public float Shares_Multiplier ;
    public int Mode_of_Qualification ;
    public String Product_Currency_Code ;
    public transient java.sql.Date Loan_Product_Expiry_Date ;
    public int Appln_Between_Currencies ;
    public int Repayment_Frequency ;
    public Boolean Appraise_Deposits ;
    public Boolean Appraise_Shares ;
    public Boolean Appraise_Salary ;
    public Boolean Appraise_Guarantors ;
    public Boolean Appraise_Business ;
    public int Recovery_Mode ;
    public float Deposits_Multiplier ;
    public float Appraise_Collateral ;
    public Boolean Appraise_Dividend ;
    public int Min_No_Of_Guarantors ;
    public String Min_Re_application_Period ;
    public int Default_Installments ;
    public int Recovery_Priority ;
    public Boolean Check_Off_Recovery ;
    public int Check_Off_Loan_No ;
    public int Default_Repayment_Mode ;
    public Boolean Allow_Multiple_Products ;
    public int Target_Group ;
    public int Beneficiary_Gender ;
    public Boolean Allow_Multiple_Loans ;
    public float Top_Up_Commision ;
    public String Top_Up_Commision_Account ;
    public float Saving_Percent_Required ;
    public int Target_Category ;
    public int Charge_Type ;
    public int Product_Category ;
    public float Processing_Fee_Percent ;
    public float Insurance_Fee_Percent ;
    public float Legal_Fee_Percent ;
    @Override
    public String toString() {
        return this.Code;}
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Loan_products t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Loan_products> t) ;
        @Update
        int Update(Loan_products t);

        @Delete
        void delete(Loan_products t);


        @Query("SELECT * FROM Loan_products")
        List<Loan_products> getAll();


    }
    public static class Model extends AndroidViewModel {
       Loan_products.dao Dao;
        public Repository repository;
        private List<Loan_products> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.lpdao();
            repository = new Repository(application);

        }
        public void bindlist(AutoCompleteTextView h,  Boolean asdropdown){
            repository.bindlist(h,asdropdown);
        }


    }
    public static class Repository {
        private static dao Dao;


        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.lpdao();

        }

        public void insert(Loan_products Loan_products) {
            new InsertMemberAsyncTask(Dao).execute(Loan_products);
        }

        public void insert(List<Loan_products> Loan_products) {
            new InsertMembersAsyncTask(Dao).execute(Loan_products);
        }

        public void update(Loan_products Loan_products) {
            new UpdateMemberAsyncTask(Dao).execute(Loan_products);
        }

        public void delete(Loan_products Loan_products) {
            new DeleteMemberAsyncTask(Dao).execute(Loan_products);
        }


        private class InsertMemberAsyncTask extends AsyncTask<Loan_products, Void, Void> {
            private Loan_products.dao Dao;

            private InsertMemberAsyncTask(Loan_products.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_products... members) {
                Dao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Loan_products>, Void, Void> {
            private Loan_products.dao Dao;

            private InsertMembersAsyncTask(Loan_products.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(List<Loan_products>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Loan_products, Void, Void> {
            private Loan_products.dao Dao;

            private UpdateMemberAsyncTask(Loan_products.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_products... members) {
                Dao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Loan_products, Void, Void> {
            private Loan_products.dao Dao;

            private DeleteMemberAsyncTask(Loan_products.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_products... members) {
                Dao.delete(members[0]);
                return null;
            }
        }
        public void bindlist(AutoCompleteTextView h,  Boolean asdropdown) {
            new bind(h,asdropdown).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        private class bind extends AsyncTask<Void, Void, List<Loan_products>> {
            AutoCompleteTextView h;
            Boolean dropdown;
            public bind(AutoCompleteTextView hh, Boolean asdropdown) {
                this.h = hh;
                this.dropdown = asdropdown;
            }

            @Override
            protected List<Loan_products> doInBackground(Void... advance) {

                List<Loan_products> n = new ArrayList<>();
                try {

                    n = Dao.getAll();
                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan_products> res) {

                simpleadapter adapter = new simpleadapter(app.getApplicationContext(), R.layout.membernames, res,dropdown);
                h.setAdapter(adapter);

                if (dropdown)
                    h.setInputType(InputType.TYPE_NULL);
                h.setOnTouchListener(new View.OnTouchListener() {
                    @Override
                    public boolean onTouch(View v, MotionEvent event) {
                        h.showDropDown();
                        return false;
                    }
                });

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Loan_products> groups;
        private List<Loan_products> tempItems;
        private List<Loan_products> suggestions;
        private boolean asdropdown;

        public simpleadapter(Context context, int resource, List<Loan_products> items,boolean asdropdown ) {
            super(context, resource, 0, items);
            this.asdropdown= asdropdown;
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Loan_products>(items);
            suggestions = new ArrayList<Loan_products>();
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
            Loan_products item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.Code);
            branchname.setText(item.Product_Description);
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
                Loan_products str = (Loan_products) resultValue;
                return str.Code;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Loan_products names : tempItems) {
                        if (asdropdown)
                            suggestions.add(names);
                        else
                        {
                            if (names.Product_Description != null)
                                if (names.Product_Description.toLowerCase().contains(constraint.toString().toLowerCase()))
                                    suggestions.add(names);
                                else if (names.Code !=null){
                                    if (names.Code.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                        suggestions.add(names);
                                    }}
                        }}
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
                    List<Loan_products> filterList = (ArrayList<Loan_products>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Loan_products item : filterList) {
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



}
