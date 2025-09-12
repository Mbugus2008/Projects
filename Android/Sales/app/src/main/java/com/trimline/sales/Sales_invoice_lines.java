package com.trimline.sales;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.google.gson.Gson;
import com.trimline.sales.databinding.Receiptline;

import java.util.ArrayList;
import java.util.List;

@Entity(primaryKeys ={"Document_No","Line_No"})

public class Sales_invoice_lines {
    public String Document_Type;
    @NonNull
    public String Document_No;
    @NonNull
    public int Line_No;
    public String Type;
    public String FilteredTypeField;
    public String No;
    public String Cross_Reference_No;
    public String IC_Partner_Code;
    public String IC_Partner_Ref_Type;
    public String IC_Partner_Reference;
    public String Variant_Code;
    public Boolean Nonstock;
    public String VAT_Prod_Posting_Group;
    public String Description;
    public String Return_Reason_Code;
    public String Location_Code;
    public String Bin_Code;

    public float getQuantity() {
        return Quantity;
    }

    public void setQuantity(float quantity) {
        Quantity = quantity;
    }

    public float getUnit_Price() {
        return Unit_Price;
    }

    public void setUnit_Price(float unit_Price) {
        Unit_Price = unit_Price;
    }

    public float getLine_Amount() {
        return Line_Amount;
    }

    public void setLine_Amount(float line_Amount) {
        Line_Amount = line_Amount;
    }

    public float Quantity;
    public String Unit_of_Measure_Code;
    public String Unit_of_Measure;
    public float Unit_Cost_LCY;
    public Boolean PriceExists;
    public float Unit_Price;
    public float Line_Discount_Percent;
    public transient  float Line_Amount;
    public Boolean LineDiscExists;
    public float Line_Discount_Amount;
    public Boolean Allow_Invoice_Disc;
    public float Inv_Discount_Amount;
    public Boolean Allow_Item_Charge_Assignment;
    public float Qty_to_Assign;
    public float Qty_Assigned;
    public String Job_No;
    public String Job_Task_No;
    public int Job_Contract_Entry_No;
    public String Tax_Category;
    public String Shipping_Agent_Code;
    public String Shipping_Agent_Service_Code;
    public String Work_Type_Code;
    public String Blanket_Order_No;
    public int Blanket_Order_Line_No;
    public java.sql.Date FA_Posting_Date;
    public Boolean Depr_until_FA_Posting_Date;
    public String Depreciation_Book_Code;
    public Boolean Use_Duplication_List;
    public String Duplicate_in_Depreciation_Book;
    public int Appl_from_Item_Entry;
    public int Appl_to_Item_Entry;
    public String Deferral_Code;
    public String Shortcut_Dimension_1_Code;
    public String Shortcut_Dimension_2_Code            ;

    public transient float TotalSalesLine_Line_Amount;
    public transient float Invoice_Discount_Amount;
    public transient float Invoice_Disc_Pct;
    public transient float Total_Amount_Excl_VAT;
    public transient float Total_VAT_Amount;
    public transient float Total_Amount_Incl_VAT;
    public String ETag;


    @Dao
    public interface dao  {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Sales_invoice_lines t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Sales_invoice_lines> t);
        @Update
        int Update(Sales_invoice_lines t);
        @Delete
        void delete(Sales_invoice_lines t);
        @Query("SELECT * FROM Sales_invoice_lines")
        List<Sales_invoice_lines> getAll();
        @Query("SELECT * FROM Sales_invoice_lines where Document_No =:note")
        List<Sales_invoice_lines> getreceiptlines(String note);
    }


    public static class adapter extends RecyclerView.Adapter<Sales_invoice_lines.adapter.Holder> {
        private List<Sales_invoice_lines> data = new ArrayList<>();
        private Sales_invoice_lines.adapter.OnItemClickListener listener;
        DB db;
        Sales_invoice receipts;
        //Member m;
        // Transaction t;
        Context c;
        //List<Member> mm;
        //Member.dao mdao;
        Receiptline binding;
        Repository repository ;
        item.Repository irepo;


        public adapter(Context cc, Sales_invoice r) {
            this.receipts = r;
            this.c = cc;

        }

        @NonNull
        @Override
        public Sales_invoice_lines.adapter.Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
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
        public void onBindViewHolder(@NonNull final Sales_invoice_lines.adapter.Holder holder, final int position) {
            Sales_invoice_lines current = data.get(position);
            holder.bind(current);

            irepo.members(holder.binding.receiptItem,"");

            holder.binding.receiptItem.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                    item it = (item) adapterView.getItemAtPosition(i);
                    if (it!=null)
                        Toast.makeText(c, "Stock Balance for "+ it.Description + " is "+ it.Inventory, Toast.LENGTH_SHORT).show();
                }
            });

            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        Sales_invoice_lines t = holder.binding.getReceipt();
                        System.out.println(new Gson().toJson(t));
                        try {
                            t.Line_Amount = t.Quantity * t.Unit_Price;

                            repository.insert(t);
                            notifyItemChanged(position, t);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            };
            holder.binding.receiptItem.setOnFocusChangeListener(focusChangeListener);
            holder.binding.receiptDescription.setOnFocusChangeListener(focusChangeListener);
            holder.binding.receiptAmount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.receiptQuantity.setOnFocusChangeListener(focusChangeListener);


            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Sales_invoice_lines t = holder.binding.getReceipt();
                    data.remove(t);
                    repository.delete(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });

        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Sales_invoice_lines> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Receiptline binding;
            Spinner s;

            public Holder(@NonNull ViewGroup parent, Receiptline itemView) {
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

            public void bind(Sales_invoice_lines object) {
                binding.setReceipt(object);
                binding.executePendingBindings();
            }

            public Receiptline getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Sales_invoice_lines note);
        }

        public void setOnItemClickListener(Sales_invoice_lines.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
    public static class Repository {
        private static dao Dao;
        private LiveData<List<Sales_invoice_lines>> allReceipt_liness;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            System.out.println("herrrre");
            Dao = database.slDao();
        }

        public void insert(Sales_invoice_lines member) {
            new InsertReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void insert(List<Sales_invoice_lines> member) {
            new InsertReceipt_linessAsyncTask(Dao).execute(member);
        }

        public void update(Sales_invoice_lines member) {
            new UpdateReceipt_linesAsyncTask(Dao).execute(member);
        }

        public void delete(Sales_invoice_lines member) {
            new DeleteReceipt_linesAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Sales_invoice_lines>> allReceipt_liness() {
            return allReceipt_liness;
        }


        private class InsertReceipt_linesAsyncTask extends AsyncTask<Sales_invoice_lines, Void, Void> {
            private dao Dao;

            private InsertReceipt_linesAsyncTask(dao Dao) {

                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Sales_invoice_lines... members) {
                try {
                    //if(members[0].Amount!= 0)
                    Dao.Insert(members[0]);
                }
                catch (Exception ex){ex.printStackTrace();}
                return null;
            }
        }

        private class InsertReceipt_linessAsyncTask extends AsyncTask<List<Sales_invoice_lines>, Void, Void> {
            private Sales_invoice_lines.dao Dao;

            private InsertReceipt_linessAsyncTask(dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Sales_invoice_lines>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateReceipt_linesAsyncTask extends AsyncTask<Sales_invoice_lines, Void, Void> {
            private Sales_invoice_lines.dao memberDao;

            private UpdateReceipt_linesAsyncTask(Sales_invoice_lines.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sales_invoice_lines... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteReceipt_linesAsyncTask extends AsyncTask<Sales_invoice_lines, Void, Void> {
            private Sales_invoice_lines.dao memberDao;

            private DeleteReceipt_linesAsyncTask(Sales_invoice_lines.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sales_invoice_lines... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

    }
    public static class Model extends AndroidViewModel {
        public Sales_invoice t;
        Sales_invoice_lines.dao Dao;

        private List<Sales_invoice_lines> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.slDao();
        }

        public List<Sales_invoice_lines> getAll() {
            return Dao.getAll();
        }

        public void insert(Sales_invoice_lines t) {
            new Sales_invoice_lines.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Sales_invoice_lines, Void, Void> {
            private Sales_invoice_lines.dao Dao;

            private InsertAsyncTask(Sales_invoice_lines.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Sales_invoice_lines... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }
}
