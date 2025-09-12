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
import androidx.room.ColumnInfo;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.pawdep.databinding.Advanceissue;

@Entity(primaryKeys = {"Transaction_No","Pawdep_No"})
public  class Advance implements Serializable
{
    public boolean Sent =false;

    public int getNo() {
        return No;
    }

    public void setNo(int no) {
        No = no;
    }

    public String getTransaction_No() {
        return Transaction_No;
    }

    public void setTransaction_No(String transaction_No) {
        Transaction_No = transaction_No;
    }

    public String getAdv_Loan_No() {
        return Adv_Loan_No;
    }

    public void setAdv_Loan_No(String adv_Loan_No) {
        Adv_Loan_No = adv_Loan_No;
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

    public float getAmount() {
        return Amount;
    }

    public void setAmount(float amount) {
        Amount = amount;
    }

    public float getInstalments() {
        return Instalments;
    }

    public void setInstalments(float instalments) {
        Instalments = instalments;
    }

    public String getGroup_Code() {
        return Group_Code;
    }

    public void setGroup_Code(String group_Code) {
        Group_Code = group_Code;
    }

    public String getGroup_Name() {
        return Group_Name;
    }

    public void setGroup_Name(String group_Name) {
        Group_Name = group_Name;
    }

    public float getAdvance_Fees() {
        return Advance_Fees;
    }

    public void setAdvance_Fees(float advance_Fees) {
        Advance_Fees = advance_Fees;
    }

    public float getLoan_Aplication_Fee() {
        return Loan_Aplication_Fee;
    }

    public void setLoan_Aplication_Fee(float loan_Aplication_Fee) {
        Loan_Aplication_Fee = loan_Aplication_Fee;
    }

    public String getLoan_Code() {
        return Loan_Code;
    }

    public void setLoan_Code(String loan_Code) {
        Loan_Code = loan_Code;
    }

    public String getMember_ID() {
        return Member_ID;
    }

    public void setMember_ID(String member_ID) {
        Member_ID = member_ID;
    }



    public float getInterest() {
        return Interest;
    }

    public void setInterest(float interest) {
        Interest = interest;
    }

    public float getAdvance_Balance() {
        return Advance_Balance;
    }

    public void setAdvance_Balance(float advance_Balance) {
        Advance_Balance = advance_Balance;
    }

    public String getLoan_Type() {
        return Loan_Type;
    }

    public void setLoan_Type(String loan_Type) {
        Loan_Type = loan_Type;
    }

    public String getPawdep_No() {
        return Pawdep_No;
    }

    public void setPawdep_No(String pawdep_No) {
        Pawdep_No = pawdep_No;
    }

    public String getBranch_Code() {
        return Branch_Code;
    }

    public void setBranch_Code(String branch_Code) {
        Branch_Code = branch_Code;
    }
    public String Key;

    @ColumnInfo(index = true)
    public int No ;
    @NonNull
    public String Transaction_No;
    public String Adv_Loan_No;
    public String Member_No;
    public String Member_Name;
    public float Amount;
    public boolean AmountSpecified;
    public float Instalments;
    public boolean InstalmentsSpecified;
    public String Group_Code;
    public String Group_Name;

    public boolean NoSpecified;
    public float Advance_Fees;
    public boolean Advance_FeesSpecified;
    public float Loan_Aplication_Fee;
    public boolean Loan_Aplication_FeeSpecified;
    public String Loan_Code;
    public String Member_ID;

    public float Interest;
    public boolean InterestSpecified;
    public float Advance_Balance;
    public boolean Advance_BalanceSpecified;
    public String Loan_Type;
    @NonNull
    public String Pawdep_No;
    public String Branch_Code;



    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Advance t);
        @Update
        int Update(Advance t);
        @Delete
        void delete(Advance t);

        @Query("SELECT * FROM Advance")
        List<Advance> getAll();

        @Query("SELECT * FROM Advance where Transaction_No =:a")
        List<Advance> Groupadvances(String a);
        @Query("SELECT * FROM Advance where Sent =0 and Transaction_No =:transaction_no")
        List<Advance> unsent(String transaction_no);
        @Query("update `Advance` set Pawdep_No =:newm  where `Pawdep_No` =:old")
        void updatpawdep(String old,String newm );
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements  IDataChangeListener {
        private List<Advance> advance = new ArrayList<>();
        private Advance.adapter.OnItemClickListener listener;
        DB db;
        dao d;
        Member m;
        Transaction t ;
        Context c;
        List<Member> mm;
        Member.dao mdao;
        Advanceissue binding;
        public  adapter(Context cc, Transaction tt) {
            this.t = tt;
            this.c = cc;
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.advance_issue, parent, false);
            db = DB.getInstance(parent.getContext());
            d = db.advissuedao();
            mdao = db.memberDao();


            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            Advance current = advance.get(position);
            holder.bind(current);
            new getmembers(holder).execute(t.Group_Name);
            holder.binding.PAWDEPNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Member g = (Member) parent.getItemAtPosition(position);
                    if (g != null) {
                        Advance t = holder.binding.getAdvanceissue();
                        t.Member_Name = g.Name;
                        t.Member_No = String.valueOf(g.GID);
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

                        Advance t = holder.binding.getAdvanceissue();
                        try{
                        notifyItemChanged(position, t);
                        }catch (Exception ex)
                        {ex.printStackTrace();}
                        if (view.getId()== R.id.Amount)
                            new saveAsyncTask().execute(t);
                    }
                }
            };
            holder.binding.Amount.setOnFocusChangeListener(focusChangeListener);
            holder.binding.PAWDEPNo.setOnFocusChangeListener(focusChangeListener);

            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Advance t = holder.binding.getAdvanceissue();
                    advance.remove(t);
                    new deleteadvance().execute(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());

                }
            });


        }

        @Override
        public void onEditTextChanged(String planetName) {

        }

        private class getmembers extends AsyncTask<String, Void, List<Member>> {

            Holder h ;
            public getmembers(Holder hh)
            {this.h = hh;}
            @Override
            protected List<Member> doInBackground(String... advance) {
                try {

                    mm = mdao.getbygroupmembers(t.Group_Name);

                    // notifyDataSetChanged();
                }
                catch (Exception e)
                {e.printStackTrace();}
                return mm;
            }
            @Override
            protected void onPostExecute(List<Member> res) {

                Member.simpleadapter adapter = new  Member.simpleadapter(c, R.layout.membernames, res);
                h.binding.PAWDEPNo.setAdapter(adapter);

            }
        }
        private class deleteadvance extends AsyncTask<Advance, Void,Void> {

            @Override
            protected Void doInBackground(Advance... advance) {
                try {
                    d.delete(advance[0]);


                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }

        }

        private class saveAsyncTask extends AsyncTask<Advance, Void, Void> {
            @Override
            protected Void doInBackground(Advance... advance) {
                try {

                    Log.i("Saved",String.valueOf(d.Insert(advance[0])));

                }
                catch (Exception e)
                {e.printStackTrace();}
                return null;
            }
        }
        @Override
        public int getItemCount() {
            return advance.size();
        }

        public void sett_line(List<Advance> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }
        class Holder extends RecyclerView.ViewHolder {
            private Advanceissue binding;


            public Holder(@NonNull ViewGroup parent, Advanceissue itemView) {
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

            public void bind(Advance object) {
                binding.setAdvanceissue(object);
                binding.executePendingBindings();
            }

            public Advanceissue getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Advance note);
        }

        public void setOnItemClickListener(Advance.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
    public static class Model extends AndroidViewModel {
        public Transaction t;
        Advance.dao Dao;

        private List<Advance> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.advissuedao();
        }
        public List<Advance> getAll() {
            return Dao.getAll();
        }

        public void insert(Advance t) {
            new Advance.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Advance, Void, Void> {
            private Advance.dao Dao;

            private InsertAsyncTask(Advance.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Advance... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }


}


