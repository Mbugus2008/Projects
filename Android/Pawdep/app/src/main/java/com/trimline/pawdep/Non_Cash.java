package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Spinner;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Index;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.pawdep.databinding.Noncash;
import com.google.gson.Gson;

import java.util.ArrayList;
import java.util.List;

@Entity(indices = {@Index(value = {"Transaction_Code", "Pawdep_No","Transaction_Type"},
                unique = true)})
public class Non_Cash {
    public String Key;
    @NonNull
    public String Transaction_Code;
    public String Member_No;
    public String Member_Name;
    @NonNull
    public int Transaction_Type;

    public String getTransactionType() {
        TransactionType = com.trimline.pawdep.Transaction_Type.values()[Transaction_Type].getText();
        return TransactionType;
    }

    public void setTransactionType(String transactionType) {
        Transaction_Type = com.trimline.pawdep.Transaction_Type.valueOf(transactionType
                .replace("Select", "_blank_")
                .replace(" ", "_")
        ).code;
        TransactionType = transactionType;
    }

    @Ignore
    public String TransactionType;
    public Boolean Transaction_TypeSpecified;
    public float Amount;
    public Boolean AmountSpecified;
    public int MCOUNT;
    public Boolean MCOUNTSpecified;

    public String Loan_No;
    public String Branch_Code;
    @NonNull
    public String Pawdep_No;
    @PrimaryKey()
    @NonNull
    public long Auto;
    public Boolean AutoSpecified;
    public String Loan_Type;

    public String getKey() {
        return Key;
    }

    public void setKey(String key) {
        Key = key;
    }

    @NonNull
    public String getTransaction_Code() {
        return Transaction_Code;
    }

    public void setTransaction_Code(@NonNull String transaction_Code) {
        Transaction_Code = transaction_Code;
    }

    @NonNull
    public String getMember_No() {
        return Member_No;
    }

    public void setMember_No(@NonNull String member_No) {
        Member_No = member_No;
    }

    public String getMember_Name() {
        return Member_Name;
    }

    public void setMember_Name(String member_Name) {
        Member_Name = member_Name;
    }

    public int getTransaction_Type() {
        return Transaction_Type;
    }

    public void setTransaction_Type(int transaction_Type) {
        Transaction_Type = transaction_Type;
    }

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float amount) {
        Amount = amount;
    }

    public int getMCOUNT() {
        return MCOUNT;
    }

    public void setMCOUNT(int MCOUNT) {
        this.MCOUNT = MCOUNT;
    }

    public String getLoan_No() {
        return Loan_No;
    }

    public void setLoan_No(String loan_No) {
        Loan_No = loan_No;
    }

    public String getBranch_Code() {
        return Branch_Code;
    }

    public void setBranch_Code(String branch_Code) {
        Branch_Code = branch_Code;
    }

    public String getPawdep_No() {
        return Pawdep_No;
    }

    public void setPawdep_No(String pawdep_No) {
        Pawdep_No = pawdep_No;
    }

    public String getLoan_Type() {
        return Loan_Type;
    }

    public void setLoan_Type(String loan_Type) {
        Loan_Type = loan_Type;
    }

    public boolean isSent() {
        return Sent;
    }

    public void setSent(boolean sent) {
        Sent = sent;
    }

    public boolean Sent = false;


    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Non_Cash t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Non_Cash> t);

        @Update
        int Update(Non_Cash t);

        @Delete
        void delete(Non_Cash t);

        @Query("SELECT * FROM Non_Cash where Auto =:t")
        Non_Cash exist(long t);

        @Query("SELECT * FROM Non_Cash")
        List<Non_Cash> getAll();

        @Query("SELECT * FROM Non_Cash where Transaction_Code =:t")
        List<Non_Cash> getgrouptransaction(String t);

        @Query("Select * from `Non_Cash` where Sent= 0 and Transaction_Code =:transaction_no")
        List<Non_Cash> unsent(String transaction_no);

        @Query("update `Non_Cash` set Pawdep_No =:newm  where `Pawdep_No` =:old")
        void updatpawdep(String old,String newm );
    }


    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<Non_Cash> advance = new ArrayList<>();
        private Non_Cash.adapter.OnItemClickListener listener;
        Member.Repository mrepository;
        Loan_products.Repository lprepository;
        Loan.Repository lrepository;
        DB db;
        dao d;
        Member m;
        Transaction t;
        Context c;
        Noncash binding;

        public adapter(Context cc, Transaction tt) {
            this.t = tt;
            this.c = cc;
            mrepository = new Member.Repository((Application) cc.getApplicationContext());
            lprepository = new Loan_products.Repository((Application) cc.getApplicationContext());
            lrepository = new Loan.Repository((Application) cc.getApplicationContext());
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.non_cash, parent, false);
            db = DB.getInstance(parent.getContext());
            d = db.nondao();
            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            Non_Cash current = advance.get(position);
            holder.bind(current);


            Pawdep.bind(holder.binding.ttype, com.trimline.pawdep.Transaction_Type.class, c, true);
            lprepository.bindlist(holder.binding.loantype, true);
            mrepository.members(holder.binding.PAWDEPNo, t.Group_Name);


            AdapterView.OnItemClickListener loantype = new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Loan_products type = (Loan_products) parent.getItemAtPosition(position);
                    Non_Cash t = holder.binding.getNoncash();
                    System.out.println(type.Code);
                    Log.i("Loantype", t.TransactionType);
                    switch (t.TransactionType.toLowerCase()) {
                        case "repayment":
                        case "interest due":
                        case "loan":
                        case "interest paid":
                            t.Loan_No = "";
                            lrepository.bindmemberloans(holder.binding.LoanNo, 0, t.Pawdep_No, true);
                            break;
                    }
                    try {
                        notifyItemChanged(position, t);
                        new saveAsyncTask().execute(t);

                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            };
            holder.binding.loantype.setOnItemClickListener(loantype);


            holder.binding.PAWDEPNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Member g = (Member) parent.getItemAtPosition(position);
                    if (g != null) {
                        holder.binding.MemberName.setText(g.Name);

                        Non_Cash t = holder.binding.getNoncash();
                        t.Member_Name = g.Name;
                        t.Member_No =String.valueOf(g.GID);
                        try {
                            new saveAsyncTask().execute(t);
                            notifyItemChanged(position, t);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }

                    }
                }
            });
            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        Non_Cash t = holder.binding.getNoncash();
                        try {
                            new saveAsyncTask().execute(t);
                            notifyItemChanged(position, t);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            };
            holder.binding.Amount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.PAWDEPNo.setOnFocusChangeListener(focusChangeListener);
            holder.binding.ttype.setOnFocusChangeListener(focusChangeListener);
            holder.binding.loantype.setOnFocusChangeListener(focusChangeListener);
            holder.binding.LoanNo.setOnFocusChangeListener(focusChangeListener);
            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Non_Cash t = holder.binding.getNoncash();
                    advance.remove(t);
                    new deletetrans().execute(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });
        }

        @Override
        public void onEditTextChanged(String planetName) {

        }

        private class deletetrans extends AsyncTask<Non_Cash, Void, Void> {

            @Override
            protected Void doInBackground(Non_Cash... advance) {
                try {
                    d.delete(advance[0]);


                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        }

        private class saveAsyncTask extends AsyncTask<Non_Cash, Void, Void> {
            @Override
            protected Void doInBackground(Non_Cash... advance) {
                try {
                    Log.i("Saving", new Gson().toJson(advance[0]));
                    if (d.exist(advance[0].Auto) == null)
                        d.Insert(advance[0]);
                    else
                        Log.i("Updating", String.valueOf(d.Update(advance[0])));

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        }

        private class updateTask extends AsyncTask<Non_Cash, Void, Void> {
            @Override
            protected Void doInBackground(Non_Cash... advance) {
                try {
                    Log.i("Saved", String.valueOf(d.Update(advance[0])));
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        }

        @Override
        public int getItemCount() {
            return advance.size();
        }

        public void sett_line(List<Non_Cash> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Noncash binding;
            Spinner s, loanno;

            public Holder(@NonNull ViewGroup parent, Noncash itemView) {
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

            public void bind(Non_Cash object) {
                binding.setNoncash(object);
                binding.executePendingBindings();
                Log.i("Binding", "Binding");
            }

            public Noncash getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Non_Cash note);
        }

        public void setOnItemClickListener(Non_Cash.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }

    public static class Model extends AndroidViewModel {
        public Transaction t;
        Non_Cash.dao Dao;

        private List<Non_Cash> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.nondao();
        }

        public List<Non_Cash> getAll() {
            return Dao.getAll();
        }

        public void insert(Non_Cash t) {
            new Non_Cash.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Non_Cash, Void, Void> {
            private Non_Cash.dao Dao;

            private InsertAsyncTask(Non_Cash.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Non_Cash... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }

    public static class Repository {
        private static dao Dao;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.nondao();
        }

        public void insert(Non_Cash Non_Cash) {
            new InsertMemberAsyncTask(Dao).execute(Non_Cash);
        }

        public void insert(List<Non_Cash> Non_Cash) {
            new InsertMembersAsyncTask(Dao).execute(Non_Cash);
        }

        public void update(Non_Cash Non_Cash) {
            new UpdateMemberAsyncTask(Dao).execute(Non_Cash);
        }

        public void delete(Non_Cash Non_Cash) {
            new DeleteMemberAsyncTask(Dao).execute(Non_Cash);
        }

        private class InsertMemberAsyncTask extends AsyncTask<Non_Cash, Void, Void> {
            private Non_Cash.dao memberDao;

            private InsertMemberAsyncTask(Non_Cash.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Non_Cash... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Non_Cash>, Void, Void> {
            private Non_Cash.dao memberDao;

            private InsertMembersAsyncTask(Non_Cash.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Non_Cash>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Non_Cash, Void, Void> {
            private Non_Cash.dao memberDao;

            private UpdateMemberAsyncTask(Non_Cash.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Non_Cash... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Non_Cash, Void, Void> {
            private Non_Cash.dao memberDao;

            private DeleteMemberAsyncTask(Non_Cash.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Non_Cash... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }
    }
}
