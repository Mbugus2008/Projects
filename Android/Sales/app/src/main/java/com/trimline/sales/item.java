package com.trimline.sales;

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
public class item {
    @PrimaryKey
    @NonNull
    public String No;
    public String Description;
    public Boolean Blocked;
    public String Type;
    public String Base_Unit_of_Measure;
    public java.sql.Date Last_Date_Modified;
    public String GTIN;
    public String Item_Category_Code;
    public String Product_Group_Code;
    public String Service_Item_Group;
    public Boolean Automatic_Ext_Texts;
    public String Shelf_No;
    public Boolean Created_From_Nonstock_Item;
    public String Search_Description;
    public float Inventory;
    public float Qty_on_Purch_Order;
    public float Qty_on_Prod_Order;
    public float Qty_on_Component_Lines;
    public float Qty_on_Sales_Order;
    public float Qty_on_Service_Order;
    public float Qty_on_Job_Order;
    public float Qty_on_Assembly_Order;
    public float Qty_on_Asm_Component;
    public String StockoutWarningDefaultYes;
    public String PreventNegInventoryDefaultYes;
    public float Net_Weight;
    public float Gross_Weight;
    public float Unit_Volume;
    public String Costing_Method;
    public float Standard_Cost;
    public float Unit_Cost;
    public float Indirect_Cost_Percent;
    public float Last_Direct_Cost;
    public float Net_Invoiced_Qty;
    public Boolean Cost_is_Adjusted;
    public Boolean Cost_is_Posted_to_G_L;
    public String SpecialPurchPricesAndDiscountsTxt;
    public String Gen_Prod_Posting_Group;
    public String VAT_Prod_Posting_Group;
    public String Inventory_Posting_Group;
    public String Default_Deferral_Template_Code;
    public String Tariff_No;
    public String Country_Region_of_Origin_Code;
    public float Unit_Price;
    public float CalcUnitPriceExclVAT;
    public Boolean Price_Includes_VAT;
    public String Price_Profit_Calculation;
    public float Profit_Percent;
    public String SpecialPricesAndDiscountsTxt;
    public Boolean Allow_Invoice_Disc;
    public String Item_Disc_Group;
    public String Sales_Unit_of_Measure;
    public String Application_Wksh_User_ID;
    public String Replenishment_System;
    public String Lead_Time_Calculation;
    public String Vendor_No;
    public String Vendor_Item_No;
    public String Purch_Unit_of_Measure;
    public String Manufacturing_Policy;
    public String Routing_No;
    public String Production_BOM_No;
    public float Rounding_Precision;
    public String Flushing_Method;
    public float Overhead_Rate;
    public float Scrap_Percent;
    public float Lot_Size;
    public String Assembly_Policy;
    public Boolean Assembly_BOM;
    public String Reordering_Policy;
    public String Reserve;
    public String Order_Tracking_Policy;
    public Boolean Stockkeeping_Unit_Exists;
    public String Dampener_Period;
    public float Dampener_Quantity;
    public Boolean Critical;
    public String Safety_Lead_Time;
    public float Safety_Stock_Quantity;
    public Boolean Include_Inventory;
    public String Lot_Accumulation_Period;
    public String Rescheduling_Period;
    public float Reorder_Point;
    public float Reorder_Quantity;
    public float Maximum_Inventory;
    public float Overflow_Level;
    public String Time_Bucket;
    public float Minimum_Order_Quantity;
    public float Maximum_Order_Quantity;
    public float Order_Multiple;
    public String Item_Tracking_Code;
    public String Serial_Nos;
    public String Lot_Nos;
    public String Expiration_Calculation;
    public String Warehouse_Class_Code;
    public String Special_Equipment_Code;
    public String Put_away_Template_Code;
    public String Put_away_Unit_of_Measure_Code;
    public String Phys_Invt_Counting_Period_Code;
    public java.sql.Date Last_Phys_Invt_Date;
    public java.sql.Date Last_Counting_Period_Update;
    public java.sql.Date Next_Counting_Start_Date;
    public java.sql.Date Next_Counting_End_Date;
    public String Identifier_Code;
    public Boolean Use_Cross_Docking;
    public String Global_Dimension_1_Filter;
    public String Global_Dimension_2_Filter;
    public String Location_Filter;
    public String Drop_Shipment_Filter;
    public String Variant_Filter;
    public String Lot_No_Filter;
    public String Serial_No_Filter;
    public String Date_Filter;
    public String ETag;
    @Dao
    public interface dao  {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(item t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<item> t);

        @Update
        void Update(item t);

        @Delete
        void delete(item t);

        @Query("SELECT * FROM item ")
        LiveData<List<item>> getAll();
        @Query("SELECT * FROM item")
        List<item> All();


    }
    public static class Repository {
        private static dao Dao;
        private LiveData<List<item>> allReceipt_liness;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.iDao();
        }

        public void insert(item member) {
            new InsertReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void insert(List<item> member) {
            new InsertReceipt_linessAsyncTask(Dao).execute(member);
        }

        public void update(item member) {
            new UpdateReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void delete(item member) {
            new DeleteReceipt_linesAsyncTask(Dao).execute(member);
        }

        public LiveData<List<item>> allReceipt_liness() {
            return allReceipt_liness;
        }


        private class InsertReceipt_linesAsyncTask extends AsyncTask<item, Void, Void> {
            private dao Dao;

            private InsertReceipt_linesAsyncTask(dao Dao) {

                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(item... members) {
                try {
                    //if(members[0].Amount!= 0)
                    Dao.Insert(members[0]);
                }
                catch (Exception ex){ex.printStackTrace();}
                return null;
            }
        }

        private class InsertReceipt_linessAsyncTask extends AsyncTask<List<item>, Void, Void> {
            private item.dao Dao;

            private InsertReceipt_linessAsyncTask(dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(List<item>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateReceipt_linesAsyncTask extends AsyncTask<item, Void, Void> {
            private item.dao memberDao;

            private UpdateReceipt_linesAsyncTask(item.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(item... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteReceipt_linesAsyncTask extends AsyncTask<item, Void, Void> {
            private item.dao memberDao;

            private DeleteReceipt_linesAsyncTask(item.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(item... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }
        public void members(AutoCompleteTextView h, String groupname) {
            new getgroupmembers(h).execute(groupname);
        }
        private class getgroupmembers extends AsyncTask<String, Void, List<item>> {
            AutoCompleteTextView h;

            public getgroupmembers(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<item> doInBackground(String... advance) {

                List<item> n = new ArrayList<>();
                try {

                        n = Dao.All();

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<item> res) {

                simpleadapter adapter = new simpleadapter(app.getApplicationContext(), R.layout.itemnames, res);
                h.setAdapter(adapter);

            }
        }
    }
    public static class Model extends AndroidViewModel {
        public Sales_invoice t;
        item.dao Dao;

        private List<item> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.iDao();
        }

       

        public void insert(item t) {
            new item.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<item, Void, Void> {
            private item.dao Dao;

            private InsertAsyncTask(item.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(item... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<item> groups;
        private List<item> tempItems;
        private List<item> suggestions;

        public simpleadapter(Context context, int resource, List<item> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<item>(items);
            suggestions = new ArrayList<item>();
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
            item item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.No);
            branchname.setText(item.Description);
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
                item str = (item) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (item names : tempItems) {

                        if (names.Description != null) {
                            if (names.Description.toLowerCase().contains(constraint.toString().toLowerCase()))
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
                    List<item> filterList = (ArrayList<item>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (item item : filterList) {
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
