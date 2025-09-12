package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.InputType;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Filter;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Floatshares;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class float_shares extends AppCompatActivity {
    properties p;
   Floatshares f;
    Button floatshares;
    Share_Setup share_setup;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
       // setContentView(R.layout.activity_float_shares);
        f = DataBindingUtil.setContentView(this, R.layout.activity_float_shares);
        floatshares = (Button) findViewById(R.id.floatshare);

        p = (properties) getIntent().getSerializableExtra("Propertyid");
        Shares s = new Shares();

        s.Member_No = Investments.member.No;
        f.setShares(s);
        List<members.Member_Accounts_Listpart>ma= new ArrayList<>();

        if (Investments.member.Member_Accounts != null) {
            if (Investments.member.Member_Accounts!=null)
            {
                for (members.Member_Accounts_Listpart m :Investments.member.Member_Accounts
                     ) {
                    if(m.Share_Trading_Account)
                    ma.add(m);
                }}
            f.shareSharetype.setAdapter(new Sharesetupautofill(this,
                    R.layout.enums, Investments.share_setups));
            f.shareSharetype.setInputType(InputType.TYPE_NULL);
            f.shareSharetype.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    f.shareSharetype.showDropDown();
                    return false;
                }
            });

            f.shareSharetype.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    share_setup = (Share_Setup) adapterView.getItemAtPosition(i);
                    Shares s = f.getShares();
                    s.Share_Type = share_setup.Document_No;
                    s.Account_Type = share_setup.Account_Type;
                    s.Par_Value = share_setup.Base_Price;
                    s.Par_ValueSpecified = true;
                    s.Global_Dimension_2_Code = share_setup.Document_No;
                    s.Global_Dimension_1_Code = "NRD";
                    if (Investments.member.Global_Dimension_1_Code!=null)
                        if(!Investments.member.Global_Dimension_1_Code.equals(""))
                            s.Global_Dimension_1_Code =Investments.member.Global_Dimension_1_Code;

                    s.Reserve_Price = share_setup.Reserve_Price;
                    s.Reserve_PriceSpecified = true;
                    s.Share_Life = share_setup.Share_Life;
                    members.Member_Accounts_Listpart m = null;
                    for (members.Member_Accounts_Listpart mm : Investments.member.Member_Accounts) {
                        Log.i( "Balance1",String.valueOf(mm.Balance));
                        if (mm.Account_Type.equals(s.Account_Type)) {
                            Toast.makeText(float_shares.this, String.valueOf(mm.Balance), Toast.LENGTH_SHORT).show();
                            Log.i( "Balance",String.valueOf(mm.Balance));
                            m = mm;
                        }
                    }
                    if (m != null) {
                        s.Minimum_Balance = m.Minimum_Balance;
                        s.Account_Balance = m.Balance;
                        s.Account_No = m.No;
                    }
                    s.Total_Shares = (s.Account_Balance - s.Minimum_Balance) / s.Par_Value;
                    if (s.Total_Shares < 0)
                        s.Total_Shares = 0;
                    f.setShares(s);
                    //  new floatshares().execute(s);
                }
            });
            List<String>  floattypes = new ArrayList<>();
            for (Shares.Float_Types ft:Shares.Float_Types.values()
                 ) {
                floattypes.add(ft.name());
            }
            f.sharesFloattype.setAdapter(new floattypes(this,
                    R.layout.enums, floattypes));
            f.sharesFloattype.setInputType(InputType.TYPE_NULL);
            f.sharesFloattype.setOnTouchListener(new View.OnTouchListener() {
                @Override
                public boolean onTouch(View v, MotionEvent event) {
                    f.sharesFloattype.showDropDown();
                    return false;
                }
            });
            f.sharesFloattype.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    String ff = (String) adapterView.getItemAtPosition(i);
                    Shares s = f.getShares();
                    Log.i( "Balance",String.valueOf(s.Account_No));
                    members.Member_Accounts_Listpart m=null;
                    for (members.Member_Accounts_Listpart mm :Investments.member.Member_Accounts
                         ) {
                        Log.i( "aacc",String.valueOf(mm.No));
                        if (mm.No.equals(s.Account_No)) {
                            Log.i( "aaccs",String.valueOf(mm.No));
                            m = mm;
                        }
                    }
                    if (m != null) {
                        switch (ff)
                        {
                            case "Partial":
                                Log.i( "tty",String.valueOf(m.Minimum_Balance));

                                s.Minimum_Balance = m.Minimum_Balance;
                                s.Total_Shares = (s.Account_Balance - s.Minimum_Balance) / s.Par_Value;
                                if (s.Total_Shares < 0)
                                s.Total_Shares = 0;
                                f.sharestofloat.setEnabled(true);
                                break;
                            case "Full":
                                Log.i( "ttyp",String.valueOf(s.Minimum_Balance));
                                s.Minimum_Balance = 0;
                                s.Total_Shares = (s.Account_Balance - s.Minimum_Balance) / s.Par_Value;
                                s.Shares_to_Float = s.Total_Shares;
                                f.sharestofloat.setEnabled(false);
                                if (s.Total_Shares < 0)
                                    s.Total_Shares = 0;
                                break;
                        }
                      }

                    f.setShares(s);
                }
            });
        }
        floatshares.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Shares s = f.getShares();

                if (s.Shares_to_Float > s.Total_Shares){
                   f.sharestofloat.setError("Shares to float must not be greater than total shares");
                    return;
            }
                if (s.Minimum_Acceptable_Price < s.Reserve_Price){
                   f.minimuntofloat.setError("Minimum Price must be greater than the reserve Price");
                    return;
                }
                if (s.Minimum_Acceptable_Price > s.Par_Value){
                    f.minimuntofloat.setError(String.format("You Cannot go Higher Than %,.2f",s.Par_Value));
                    return;
                }
                new floatshares().execute(s);

            }
        });
    }
    public static class Sharesetupautofill extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Share_Setup> groups;
        private List<Share_Setup> tempItems;
        private List<Share_Setup> suggestions;
        public Sharesetupautofill(Context context, int resource, List<Share_Setup> items) {
            super(context, resource, 0, items);
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Share_Setup>(items);
            suggestions = new ArrayList<Share_Setup>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.name);

            Share_Setup item = groups.get(position);

            groupname.setText(item.Description);

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
                Share_Setup str = (Share_Setup) resultValue;
                return str.Document_No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Share_Setup names : tempItems) {
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
                    List<Share_Setup> filterList = (ArrayList<Share_Setup>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Share_Setup item : filterList) {
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
    private class floatshares extends AsyncTask<Shares, Void, Shares> {
        String results= "";
        @Override
        protected Shares doInBackground(Shares... agents) {
            Shares p = null;
            String result= "";
            try {
                result = JsonParser.postjson("floatshares", "data",  new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(agents[0]));
                Type localType = new TypeToken<Shares>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
             results=result;
                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(Shares p) {
             try {
                if (p == null)
                    Toast.makeText(float_shares.this, results, Toast.LENGTH_LONG).show();
                 //   Toast.makeText(getApplicationContext(), "Unable to float shares", Toast.LENGTH_LONG).show();
                else {
                    f.setShares(p);
                    new getmember(Investments.member.National_ID_No).execute();
                    Toast.makeText(float_shares.this, "Share Floating successful", Toast.LENGTH_SHORT).show();
                    finish();
                }
            } catch (Exception ex) {
                ex.printStackTrace();

            }
        }
    }
    private class getmember extends AsyncTask<Void, String, members> {
        private String emails;
        public getmember(String s) {
            emails = s;
        }
        @Override
        protected members doInBackground(Void... agents) {
            members p = null;
            try {
                String result = JsonParser.postjson("members", "email", emails);
                Type localType = new TypeToken<members>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return p;
        }
        @Override
        protected void onPostExecute(members p) {

            if (p != null) {

                p.member_type = members.Member_type.Member;
                Investments.member = p;
            }
        }
    }
    public static class floattypes extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<String> groups;
        private List<String> tempItems;
        private List<String> suggestions;
        public floattypes(Context context, int resource, List<String> items) {
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
}
