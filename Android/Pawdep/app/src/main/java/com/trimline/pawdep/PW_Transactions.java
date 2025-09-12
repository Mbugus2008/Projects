package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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

import com.trimline.pawdep.databinding.Pwtrans;

@Entity(indices = {@Index(value = {"Transaction_No","Pawdep_No","Transaction_Type",},
        unique = true)})
public class PW_Transactions implements Serializable {
    @PrimaryKey()
    @NonNull
    public String No;
    public String Key;
    @NonNull
    public String Transaction_No;
    public String Group_Code;
    @NonNull
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
                .replace("Select","_blank_")
                .replace(" ","_")
        ).code;
        TransactionType = transactionType;
    }

    @Ignore
    public String TransactionType;
    @Ignore
    public boolean Transaction_TypeSpecified;
    public float Amount;
    @Ignore
    public boolean AmountSpecified;
    public String Description;
    public String G_L_Account;
    public String Bank_Account;
    public String Comments;
    @Ignore
    public boolean NoSpecified;
    public String Branch_Code;
    public String Pawdep_No;
    public boolean posted = false;


    public String getNo() {
        return No;
    }

    public void setNo(String no) {
        No = no;
    }

    public String getKey() {
        return Key;
    }

    public void setKey(String key) {
        Key = key;
    }

    public String getTransaction_No() {
        return Transaction_No;
    }

    public void setTransaction_No(String transaction_No) {
        Transaction_No = transaction_No;
    }

    public String getGroup_Code() {
        return Group_Code;
    }

    public void setGroup_Code(String group_Code) {
        Group_Code = group_Code;
    }

    public String getMember_No() {
        return Member_No;
    }

    public void setMember_No(String member_No) {
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

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getG_L_Account() {
        return G_L_Account;
    }

    public void setG_L_Account(String g_L_Account) {
        G_L_Account = g_L_Account;
    }

    public String getBank_Account() {
        return Bank_Account;
    }

    public void setBank_Account(String bank_Account) {
        Bank_Account = bank_Account;
    }

    public String getComments() {
        return Comments;
    }

    public void setComments(String comments) {
        Comments = comments;
    }

    public boolean isNoSpecified() {
        return NoSpecified;
    }

    public void setNoSpecified(boolean noSpecified) {
        NoSpecified = noSpecified;
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

    public boolean isPosted() {
        return posted;
    }

    public void setPosted(boolean posted) {
        this.posted = posted;
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
        long Insert(PW_Transactions t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<PW_Transactions> t) ;
        @Update
        int Update(PW_Transactions t);

        @Delete
        void delete(PW_Transactions t);


        @Query("SELECT * FROM PW_Transactions")
        List<PW_Transactions> getAll();

        @Query("SELECT * FROM PW_Transactions where Transaction_No =:t")
        List<PW_Transactions> getgrouptransaction(String t);

        @Query("Select * from `PW_Transactions` where Sent= 0 and Transaction_No =:transaction_no")
        List<PW_Transactions> unsent(String transaction_no);
        @Query("update `PW_Transactions` set Pawdep_No =:newm  where `Pawdep_No` =:old")
        void updatpawdep(String old,String newm );

    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<PW_Transactions> advance = new ArrayList<>();
        private PW_Transactions.adapter.OnItemClickListener listener;
        DB db;
        dao d;
    
        Transaction t;
        Context c;
     Member.Repository mrepo;
     Repository repository;
        Pwtrans binding;

        public adapter(Context cc, Transaction tt) {
            this.t = tt;
            this.c = cc;
            mrepo   = new Member.Repository((Application)cc.getApplicationContext());
            repository   = new Repository((Application)cc.getApplicationContext());
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.pw_trans, parent, false);
            db = DB.getInstance(parent.getContext());
            d = db.ptadao();
        
            return new Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            PW_Transactions current = advance.get(position);
            holder.bind(current);
            Pawdep.bind(holder.binding.ttyespinner, com.trimline.pawdep.Transaction_Type.class,c,true);
            mrepo.members(holder.binding.PAWDEPNo,t.Group_Name);
            
            holder.binding.PAWDEPNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Member g = (Member) parent.getItemAtPosition(position);
                    if (g != null) {
                        PW_Transactions t = holder.binding.getPwtrans();
                        t.Member_Name = g.Name;
                        t.Member_No = String.valueOf(g.No);
                       try{
                        notifyItemChanged(position, t);

                    }catch (Exception ex)
                    {ex.printStackTrace();}
                    }
                }
            });
            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        PW_Transactions t = holder.binding.getPwtrans();
                        try{
                        repository.insert(t);

                        notifyItemChanged(position, t);   }catch (Exception ex)
                        {ex.printStackTrace();}
                    }
                }
            };
            holder.binding.Amount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.PAWDEPNo.setOnFocusChangeListener(focusChangeListener);
            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    PW_Transactions t = holder.binding.getPwtrans();
                    advance.remove(t);
                    repository.delete(t);

                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());
                }
            });


        }

        @Override
        public void onEditTextChanged(String planetName) {

        }

        @Override
        public int getItemCount() {
            return advance.size();
        }

        public void sett_line(List<PW_Transactions> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Pwtrans binding;
          

            public Holder(@NonNull ViewGroup parent, Pwtrans itemView) {
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

            public void bind(PW_Transactions object) {
                binding.setPwtrans(object);
                binding.executePendingBindings();
            }

            public Pwtrans getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(PW_Transactions note);
        }

        public void setOnItemClickListener(PW_Transactions.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }

    public static class Model extends AndroidViewModel {
        public Transaction t;
        PW_Transactions.dao Dao;

        private List<PW_Transactions> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.ptadao();
        }

        public List<PW_Transactions> getAll() {
            return Dao.getAll();
        }

        public void insert(PW_Transactions t) {
            new PW_Transactions.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<PW_Transactions, Void, Void> {
            private PW_Transactions.dao Dao;

            private InsertAsyncTask(PW_Transactions.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(PW_Transactions... notes) {
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
            Dao = database.ptadao();

        }

        public void insert(PW_Transactions PW_Transactions) {
            new InsertMemberAsyncTask(Dao).execute(PW_Transactions);
        }

        public void insert(List<PW_Transactions> PW_Transactions) {
            new InsertMembersAsyncTask(Dao).execute(PW_Transactions);
        }

        public void update(PW_Transactions PW_Transactions) {
            new UpdateMemberAsyncTask(Dao).execute(PW_Transactions);
        }

        public void delete(PW_Transactions PW_Transactions) {
            new DeleteMemberAsyncTask(Dao).execute(PW_Transactions);
        }


        private class InsertMemberAsyncTask extends AsyncTask<PW_Transactions, Void, Void> {
            private dao Dao;

            private InsertMemberAsyncTask(dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(PW_Transactions... members) {
                Dao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<PW_Transactions>, Void, Void> {
            private dao Dao;

            private InsertMembersAsyncTask(dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(List<PW_Transactions>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<PW_Transactions, Void, Void> {
            private PW_Transactions.dao Dao;

            private UpdateMemberAsyncTask(PW_Transactions.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(PW_Transactions... members) {
                Dao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<PW_Transactions, Void, Void> {
            private PW_Transactions.dao Dao;

            private DeleteMemberAsyncTask(PW_Transactions.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(PW_Transactions... members) {
                Dao.delete(members[0]);
                return null;
            }
        }


    }
}
