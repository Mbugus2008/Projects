package com.trimline.investments;

import android.content.Context;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.Filter;
import android.widget.TextView;

import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;

import java.util.ArrayList;
import java.util.List;
import java.util.Observable;

import static android.content.ContentValues.TAG;

public class Transactions extends BaseObservable {
    public String Key ;
    public String Reference;
    public members.Member_Accounts_Listpart getAccountNo() {
        return AccountNo;
    }
    public void setAccountNo(members.Member_Accounts_Listpart account_No) {
        AccountNo = account_No;
        Account_No = account_No.No;
        Account_Name =account_No.Name;
        Account_Bal =account_No.Balance;
        Source = account_No.type;

        notifyPropertyChanged(BR.account_No);
        notifyPropertyChanged(BR.account_Bal);
        notifyPropertyChanged(BR.account_Name);

    }

    public members.Member_Accounts_Listpart AccountNo ;
    @Bindable
    public String getAccount_No() {
        return Account_No;
    }

    public void setAccount_No(String account_No) {
        Account_No = account_No;
    }
    @Bindable
    public String getAccount_Name() {
        return Account_Name;
    }

    public void setAccount_Name(String account_Name) {
        Account_Name = account_Name;
    }
    @Bindable
    public double getAccount_Bal() {
        return Account_Bal;
    }

    public void setAccount_Bal(double account_Bal) {
        Account_Bal = account_Bal;
    }


    public String Account_No ;

    public String Account_Name ;
    public String Document_No ;
    public java.util.Date Document_Date ;
    public java.util.Date Transaction_Time ;
    public int Transaction_Type ;
    public String Telephone_Number ;
    public boolean Posted ;
    public java.util.Date Date_Posted ;
    public String Member_No;

    public members.Deposit_Account getAccount2() {
        return Account2;
    }

    public void setAccount2(members.Deposit_Account account2) {

        Account2 = account2;
        Account_2=account2.Account;
        Account_2_Name = account2.Description;
        Account_2_Bal = account2.Balance;
        notifyPropertyChanged(BR.account_2);
        notifyPropertyChanged(BR.account_2_Bal);
        notifyPropertyChanged(BR.account_2_Name);

    }

    public members.Deposit_Account Account2 ;
    public String Loan_No ;
    public int Status ;
    public String Comments ;
    public double Amount ;
    @Bindable
    public String getAccount_2_Name() {
        return Account_2_Name;
    }

    public void setAccount_2_Name(String account_2_Name) {
        Account_2_Name = account_2_Name;
    }

    public double Account_Bal ;
    public String Account_2_Name ;

    public String Account_2 ;

    @Bindable
    public String getAccount_2() {
        return Account_2;
    }

    public void setAccount_2(String account_2) {
        Account_2 = account_2;
    }
    @Bindable
    public double getAccount_2_Bal() {
        return Account_2_Bal;
    }

    public void setAccount_2_Bal(double account_2_Bal) {
        Account_2_Bal = account_2_Bal;
    }

    public double Account_2_Bal ;
    public Double Charge ;
    public String Description ;
    public String Client ;
    public int Source ;

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<members.Member_Accounts_Listpart> groups;
        private List<members.Member_Accounts_Listpart> tempItems;
        private List<members.Member_Accounts_Listpart> suggestions;

        public simpleadapter(Context context, int resource, List<members.Member_Accounts_Listpart> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<members.Member_Accounts_Listpart>(items);
            suggestions = new ArrayList<members.Member_Accounts_Listpart>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView acc = view.findViewById(R.id.acc);
            TextView accname = view.findViewById(R.id.accName);

            members.Member_Accounts_Listpart item = groups.get(position);

            acc.setText(item.No);
            accname.setText(item.Name);

            //            // }

            return view;
        }

        @Override
        public Filter getFilter() {
            return nameFilter;
        }

        Filter nameFilter = new Filter() {
            @Override
            public CharSequence convertResultToString(Object resultValue) {
                members.Member_Accounts_Listpart str = (members.Member_Accounts_Listpart) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (members.Member_Accounts_Listpart names : tempItems) {
                        if (names.Name != null) {
                            if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);
                        }
                        if (names.No != null) {
                            if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
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
                    List<members.Member_Accounts_Listpart> filterList = (ArrayList<members.Member_Accounts_Listpart>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (members.Member_Accounts_Listpart item : filterList) {
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

    public static class SpinAdapter extends ArrayAdapter<members.Member_Accounts_Listpart>{

        // Your sent context
        private Context context;
        // Your custom values for the spinner (User)
        private List<members.Member_Accounts_Listpart> values;

        public SpinAdapter(Context context, int textViewResourceId,
                           List<members.Member_Accounts_Listpart> values) {
            super(context, textViewResourceId, values);
            this.context = context;
            this.values = values;
        }

        @Override
        public int getCount(){
            return ( values.size());
        }

        @Override
        public members.Member_Accounts_Listpart getItem(int position){
            return values.get(position);
        }

        @Override
        public long getItemId(int position){
            return position;
        }


        // And the "magic" goes here
        // This is for the "passive" state of the spinner
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(R.layout.accs, parent, false);
            }

            TextView acc = view.findViewById(R.id.acc);
            TextView accname = view.findViewById(R.id.accName);

            members.Member_Accounts_Listpart item = values.get(position);

            acc.setText(item.No);
            accname.setText(item.Name);

            //            // }

            return view;
        }

        // And here is when the "chooser" is popped up
        // Normally is the same view, but you can customize it if you want
        @Override
        public View getDropDownView(int position, View convertView,
                                    ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(R.layout.accs, parent, false);
            }

            TextView acc = view.findViewById(R.id.acc);
            TextView accname = view.findViewById(R.id.accName);

            members.Member_Accounts_Listpart item = values.get(position);

            acc.setText(item.No);
            accname.setText(item.Name);

            //            // }

            return view;
        }
    }
    public static class DeposittoAdapter extends ArrayAdapter<members.Deposit_Account>{

        // Your sent context
        private Context context;
        // Your custom values for the spinner (User)
        private List<members.Deposit_Account> values;

        public DeposittoAdapter(Context context, int textViewResourceId,
                           List<members.Deposit_Account> values) {
            super(context, textViewResourceId, values);
            this.context = context;
            this.values = values;
        }

        @Override
        public int getCount(){
            return ( values.size());
        }

        @Override
        public members.Deposit_Account getItem(int position){
            return values.get(position);
        }

        @Override
        public long getItemId(int position){
            return position;
        }


        // And the "magic" goes here
        // This is for the "passive" state of the spinner
        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(R.layout.accs, parent, false);
            }

            TextView acc = view.findViewById(R.id.acc);
            TextView accname = view.findViewById(R.id.accName);

            members.Deposit_Account item = values.get(position);

            acc.setText(item.Account);
            accname.setText(item.Description);

            //            // }

            return view;
        }

        // And here is when the "chooser" is popped up
        // Normally is the same view, but you can customize it if you want
        @Override
        public View getDropDownView(int position, View convertView,
                                    ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(R.layout.accs, parent, false);
            }

            TextView acc = view.findViewById(R.id.acc);
            TextView accname = view.findViewById(R.id.accName);

            members.Deposit_Account item = values.get(position);

            acc.setText(item.Account);
            accname.setText(item.Description);

            //            // }

            return view;
        }
    }
}
