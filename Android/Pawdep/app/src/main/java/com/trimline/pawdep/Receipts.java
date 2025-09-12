package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Spinner;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.pawdep.databinding.Receiptsheader;
import com.google.gson.Gson;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity(primaryKeys ={"No"})
public class Receipts implements Serializable {
    @NonNull
    public String No;
    public String Key;

    public String getReceipt_Date() {
        return Receipt_Date;
    }

    public void setReceipt_Date(String receipt_Date) {
        Receipt_Date = receipt_Date;
    }

    public String Receipt_Date;
    public boolean Receipt_DateSpecified;
    public String Bank_Code;

    public int getReceipt_Mode() {
        return Receipt_Mode;
    }

    public void setReceipt_Mode(int receipt_Mode) {
        Receipt_Mode = receipt_Mode;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float amount) {
        Amount = amount;
    }

    public int Receipt_Mode;

    public String getReceiptMode() {
        ReceiptMode = com.trimline.pawdep.Receipts.Receipt_Modes.values()[Receipt_Mode].name();
        return ReceiptMode;
    }

    public void setReceiptMode(String receiptMode) {
        ReceiptMode = receiptMode;
        Receipt_Mode = Receipt_Modes.valueOf(receiptMode.replace("Select", "_blank_").replace(" ", "_")).ordinal();
    }

    @Ignore
    public String ReceiptMode;

    public boolean Receipt_ModeSpecified;
    public String Document_No;
    public float Amount;
    public boolean AmountSpecified;
    public String Received_From;
    public String Group_Code;
    public String Group_Name;
    public String Branch_Code;
    public String Branch_Name;
    public String Member_No;
    public String Member_Name;
    public Boolean Sent_for_Approval;
    public Boolean Sent = false;
    @Ignore
    public List<Receipt_lines> receipt_lines;

    public enum Receipt_Modes {

        /// <remarks/>
        Cash("Cash"),

        /// <remarks/>
        Cheque("Cheque"),

        /// <remarks/>
        EFT("EFT"),

        /// <remarks/>
        Bank_slip("Bank slip");
        String name;

        Receipt_Modes(String t) {
            name = t;
        }
    }


    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Receipts t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Receipts> t);

        @Update
        int Update(Receipts t);

        @Delete
        void delete(Receipts t);

        @Query("SELECT * FROM Receipts")
        List<Receipts> getAll();

        @Query("update Receipts set Sent_for_Approval =1 where `No` =:no")
        int sendforapproval(String no);
        @Query("SELECT * FROM Receipts where Sent =0 ")
        List<Receipts> unsent();

        @Query("update `Receipts` set Member_No =:newm  where `Member_No` =:old")
        void updatpawdep(String old,String newm );
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> {
        private List<Receipts> advance = new ArrayList<>();
        private adapter.OnItemClickListener listener;
        DB db;
        dao d;
        Receipts m;
        Transaction t;
        Context c;
        List<Receipts> mm;
        Receipts.dao mdao;
        Receiptsheader binding;
        Repository repository;

        public adapter(Context cc) {

            this.c = cc;
            repository = new Repository((Application) c.getApplicationContext());
        }

        @NonNull
        @Override
        public adapter.Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.receipts_list_line, parent, false);
            db = DB.getInstance(parent.getContext());
            d = db.rdao();
            mdao = db.rdao();

            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull adapter.Holder holder, int position) {
            Receipts current = advance.get(position);
            holder.bind(current);
            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Receipts t = holder.binding.getReceipt();
                    advance.remove(t);
                    repository.delete(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });
        }

        @Override
        public int getItemCount() {
            return advance.size();
        }

        public void sett_line(List<Receipts> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Receiptsheader binding;
            Spinner s;

            public Holder(@NonNull ViewGroup parent, Receiptsheader itemView) {
                super(itemView.getRoot());


                this.binding = itemView;

                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(advance.get(position));
                        }
                    }
                });


            }

            public void bind(Receipts object) {
                binding.setReceipt(object);
                binding.executePendingBindings();
            }

            public Receiptsheader getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Receipts note);
        }

        public void setOnItemClickListener(Receipts.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }

    public static class Repository {
        private static dao Dao;
        private static Receipt_lines.dao rldao;
        private LiveData<List<Receipts>> allReceiptss;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.rdao();
            rldao = database.rldao();
        }

        public void insert(Receipts member) {
            new InsertReceiptsAsyncTask(Dao).execute(member);
        }

        public void insert(List<Receipts> member) {
            new InsertReceiptssAsyncTask(Dao).execute(member);
        }

        public void update(Receipts member) {
            new UpdateReceiptsAsyncTask(Dao).execute(member);
        }

        public void delete(Receipts member) {
            new DeleteReceiptsAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Receipts>> allReceiptss() {
            return allReceiptss;
        }

        public List<Receipts> GroupReceiptss(String Groupname) {

            return allReceiptss.getValue().stream().filter(o -> o.Group_Name.contentEquals(Groupname)).collect(Collectors.toList());
        }

        private class InsertReceiptsAsyncTask extends AsyncTask<Receipts, Void, Void> {
            private dao Dao;

            private InsertReceiptsAsyncTask(Receipts.dao memberDao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Receipts... members) {
                Dao.Insert(members[0]);
                return null;
            }
        }

        private class InsertReceiptssAsyncTask extends AsyncTask<List<Receipts>, Void, Void> {
            private Receipts.dao Dao;

            private InsertReceiptssAsyncTask(dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Receipts>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateReceiptsAsyncTask extends AsyncTask<Receipts, Void, Void> {
            private Receipts.dao memberDao;

            private UpdateReceiptsAsyncTask(Receipts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Receipts... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteReceiptsAsyncTask extends AsyncTask<Receipts, Void, Void> {
            private Receipts.dao memberDao;

            private DeleteReceiptsAsyncTask(Receipts.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Receipts... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

        public void printreceipts(Receipts r) {
            System.out.println(new Gson().toJson(r));
            new PrintReceipts().execute(r);
        }

        private class PrintReceipts extends AsyncTask<Receipts, Void, Receipts> {
            @Override
            protected Receipts doInBackground(Receipts... members) {
                Receipts r = members[0];
                List<Receipt_lines> rl = rldao.getreceiptlines(r.No);
                System.out.println(new Gson().toJson(rl));
                if (rl!=null)
                r.receipt_lines=rl;
                return r;
            }

            @Override
            protected void onPostExecute(Receipts res) {
                if (res.receipt_lines != null) {
                    new Printer.printer().printreceipts(res);
                }
            }
        }
    }

    public static class Model extends AndroidViewModel {
        public Transaction t;
        public Receipts r;
        dao Dao;
        dao rldap;
        private List<Receipts> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.rdao();
            rldap = db.rdao();
        }

        public List<Receipts> getAll() {
            return Dao.getAll();
        }

        public List<Receipts> getAllreceiptsline() {
            return rldap.getAll();
        }

        public void insert(Receipts t) {
            new Receipts.Model.InsertAsyncTask(Dao).execute(t);

        }

        public void sendforapproval(Receipts t) {
            new Receipts.Model.sendforapproval(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Receipts, Void, Void> {
            private Receipts.dao Dao;

            private InsertAsyncTask(Receipts.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Receipts... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }

        private class sendforapproval extends AsyncTask<Receipts, Void, Void> {
            private Receipts.dao Dao;

            private sendforapproval(Receipts.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Receipts... notes) {
                long l = Dao.sendforapproval(notes[0].No);
                return null;
            }
        }
    }
}
