package com.trimline.sales;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.databinding.BindingAdapter;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.InverseBindingAdapter;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import com.google.gson.Gson;
import com.trimline.sales.databinding.Sales_invoices;

import java.text.DateFormat;
import java.text.ParseException;
import  java.sql.Date;
import java.util.ArrayList;
import java.util.List;
@Entity
public class Sales_invoice {

    public String Document_Type;
    @PrimaryKey
    @NonNull
    public String No;
    public String Sell_to_Customer_No;
    public String Sell_to_Customer_Name;
    public String Sell_to_Address;
    public String Sell_to_Address_2;
    public String Sell_to_Post_Code;
    public String Sell_to_City;
    public String Sell_to_Contact_No;
    public String Sell_to_Contact;
    public String Your_Reference;

    public Date getDocument_Date() {
        return Document_Date;
    }

    public void setDocument_Date(Date document_Date) {
        Document_Date = document_Date;
    }

    public Date Document_Date;
    public String DocumentDate;
    public Date Posting_Date;
    public Date Due_Date;
    public int Incoming_Document_Entry_No;
    public String External_Document_No;
    public String Salesperson_Code;
    public String Campaign_No;
    public String Responsibility_Center;
    public String Assigned_User_ID;
    public String Status;
    public String Job_Queue_Status;
    public String WorkDescription;
    public String Currency_Code;
    public Date Shipment_Date;
    public String Quote_No;
    public Boolean Prices_Including_VAT;
    public String VAT_Bus_Posting_Group;
    public String Payment_Terms_Code;
    public String Payment_Method_Code;
    public Boolean EU_3_Party_Trade;
    public String SelectedPayments;
    public String Transaction_Type;
    public String Shortcut_Dimension_1_Code;
    public String Shortcut_Dimension_2_Code;
    public float Payment_Discount_Percent;
    public Date Pmt_Discount_Date;
    public String Direct_Debit_Mandate_ID;
    public String Location_Code;
    public String ShippingOptions;
    public String Ship_to_Code;
    public String Ship_to_Name;
    public String Ship_to_Address;
    public String Ship_to_Address_2;
    public String Ship_to_Post_Code;
    public String Ship_to_City;
    public String Ship_to_Country_Region_Code;
    public String Ship_to_Contact;
    public String Shipment_Method_Code;
    public String Shipping_Agent_Code;
    public String Shipping_Agent_Service_Code;
    public String Package_Tracking_No;
    public String BillToOptions;
    public String Bill_to_Name;
    public String Bill_to_Address;
    public String Bill_to_Address_2;
    public String Bill_to_Post_Code;
    public String Bill_to_City;
    public String Bill_to_Contact_No;
    public String Bill_to_Contact;
    public String Transaction_Specification;
    public String Transport_Method;
    public String Exit_Point;
    public String Area;
    public String ETag;

    public float getTotal() {
        return Total;
    }

    public void setTotal(float total) {
        Total = total;
    }

    public  float Total;

//    @BindingAdapter("android:date")
//    public static void setDate(TextView view, Date date) {
//        if (date!=null) {
//            DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
//            String localizedDate = df.format(date);
//
//            view.setText(localizedDate);
//        }
//    }
//    @InverseBindingAdapter(attribute = "android:text", event = "android:textAttrChanged")
//    public static Date captureDateValue(TextView view) {
//        CharSequence date = view.getText();
//        DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
//        Date date1 = new Date();
//        if (date!=null) {
//            try {
//                date1 = df.parse(date.toString());
//            }
//            catch (ParseException pe)
//            {
//
//            }
//
//        }
//
//
//        return date1;
//    }
//    @BindingAdapter("android:text")
//    public static void setText(TextView view, Date date) {
//        if (date!=null) {
//            DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
//            String localizedDate = df.format(date);
//
//            view.setText(localizedDate);
//        }
//    }
    //public global::System.Collections.ObjectModel.Collection<Sales_InvoiceSalesLines> Sales_InvoiceSalesLines
    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Sales_invoice t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Sales_invoice> t);

        @Update
        void Update(Sales_invoice t);

        @Delete
        void delete(Sales_invoice t);

        @Query("SELECT * FROM Sales_invoice ")
        LiveData<List<Sales_invoice>> getAll();

        @Query("SELECT * FROM Sales_invoice")
        List<Sales_invoice> All();
    }

    public static class adapter extends RecyclerView.Adapter<Sales_invoice.adapter.Holder> {
        private List<Sales_invoice> data = new ArrayList<>();
        private Sales_invoice.adapter.OnItemClickListener listener;
        DB db;
        Sales_invoice receipts;
        //Member m;
        // Transaction t;
        Context c;
        //List<Member> mm;
        //Member.dao mdao;
        Sales_invoices binding;
        Repository repository ;
        item.Repository irepo;


        public adapter(Context cc, Sales_invoice r) {
            this.receipts = r;
            this.c = cc;

        }

        @NonNull
        @Override
        public Sales_invoice.adapter.Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.receipts_line, parent, false);
            db = DB.getInstance(parent.getContext());
            //d = db.rldao();


            repository = new Repository((Application)c.getApplicationContext());
            irepo = new item. Repository((Application)c.getApplicationContext());

            return new adapter.Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull final Sales_invoice.adapter.Holder holder, final int position) {
            Sales_invoice current = data.get(position);
            holder.bind(current);


//
//            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
//                @Override
//                public void onClick(View v) {
//                    Sales_invoice t = holder.binding.getReceipt();
//                    data.remove(t);
//                    repository.delete(t);
//                    notifyItemRemoved(position);
//                    notifyItemRangeChanged(position, getItemCount());
//                }
//            });

        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Sales_invoice> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Sales_invoices binding;
            Spinner s;

            public Holder(@NonNull ViewGroup parent, Sales_invoices itemView) {
                super(itemView.getRoot());


                this.binding = itemView;

                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(data.get(position));
                        }
                    }
                });


            }

            public void bind(Sales_invoice object) {
                binding.setInvoice(object);
                binding.executePendingBindings();
            }

            public Sales_invoices getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Sales_invoice note);
        }

        public void setOnItemClickListener(Sales_invoice.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
    public static class Repository {
        private static dao Dao;
        private LiveData<List<Sales_invoice>> allReceipt_liness;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            System.out.println("herrrre");
            Dao = database.sDao();
        }

        public void insert(Sales_invoice member) {
            new InsertReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void insert(List<Sales_invoice> member) {
            new InsertReceipt_linessAsyncTask(Dao).execute(member);
        }

        public void update(Sales_invoice member) {
            new UpdateReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void delete(Sales_invoice member) {
            new DeleteReceipt_linesAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Sales_invoice>> allReceipt_liness() {
            return allReceipt_liness;
        }


        private class InsertReceipt_linesAsyncTask extends AsyncTask<Sales_invoice, Void, Void> {
            private dao Dao;

            private InsertReceipt_linesAsyncTask(dao Dao) {

                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Sales_invoice... members) {
                try {
                    //if(members[0].Amount!= 0)
                    Dao.Insert(members[0]);
                }
                catch (Exception ex){ex.printStackTrace();}
                return null;
            }
        }

        private class InsertReceipt_linessAsyncTask extends AsyncTask<List<Sales_invoice>, Void, Void> {
            private Sales_invoice.dao Dao;

            private InsertReceipt_linessAsyncTask(dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Sales_invoice>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateReceipt_linesAsyncTask extends AsyncTask<Sales_invoice, Void, Void> {
            private Sales_invoice.dao memberDao;

            private UpdateReceipt_linesAsyncTask(Sales_invoice.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sales_invoice... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteReceipt_linesAsyncTask extends AsyncTask<Sales_invoice, Void, Void> {
            private Sales_invoice.dao memberDao;

            private DeleteReceipt_linesAsyncTask(Sales_invoice.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sales_invoice... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

    }
    public static class Model extends AndroidViewModel {
        public Sales_invoice t;
        Sales_invoice.dao Dao;

        private List<Sales_invoice> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.sDao();
        }

        public List<Sales_invoice> getAll() {
            return Dao.All();
        }

        public void insert(Sales_invoice t) {
            new Sales_invoice.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Sales_invoice, Void, Void> {
            private Sales_invoice.dao Dao;

            private InsertAsyncTask(Sales_invoice.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Sales_invoice... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }
}
