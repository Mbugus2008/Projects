package com.trimline.pawdep;

import android.app.Application;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;

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
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;


import com.trimline.pawdep.databinding.Advanceitems;

@Entity(primaryKeys = {"Transaction_No","Pawdep_No","Loan_No"})
    public class Repayment implements Serializable {
    @NonNull

    public int No;
    public String Key;
    @NonNull  public String Transaction_No;
    public String Date;
    public boolean DateSpecified;
    public String Member_No;
    public int getNo() {
        return No;
    }
    public void setNo(int no) {
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
    public String getDate() {
        return Date;
    }
    public void setDate(String date) {
        Date = date;
    }
    public boolean isDateSpecified() {
        return DateSpecified;
    }
    public void setDateSpecified(boolean dateSpecified) {
        DateSpecified = dateSpecified;
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

    public float getAmount_Total() {
        return Amount_Total;
    }

    public void setAmount_Total(float amount_Total) {
        Amount_Total = amount_Total;
    }

    public boolean isAmount_TotalSpecified() {
        return Amount_TotalSpecified;
    }

    public void setAmount_TotalSpecified(boolean amount_TotalSpecified) {
        Amount_TotalSpecified = amount_TotalSpecified;
    }

    public float getExpected_Interest() {
        return Expected_Interest;
    }

    public void setExpected_Interest(float expected_Interest) {
        Expected_Interest = expected_Interest;
    }

    public boolean isExpected_InterestSpecified() {
        return Expected_InterestSpecified;
    }

    public void setExpected_InterestSpecified(boolean expected_InterestSpecified) {
        Expected_InterestSpecified = expected_InterestSpecified;
    }

    public String getLoan_No() {
        return Loan_No;
    }

    public void setLoan_No(String loan_No) {
        Loan_No = loan_No;
    }

    public float getExpected_Repayment() {
        return Expected_Repayment;
    }

    public void setExpected_Repayment(float expected_Repayment) {
        Expected_Repayment = expected_Repayment;
    }

    public boolean isExpected_RepaymentSpecified() {
        return Expected_RepaymentSpecified;
    }

    public void setExpected_RepaymentSpecified(boolean expected_RepaymentSpecified) {
        Expected_RepaymentSpecified = expected_RepaymentSpecified;
    }

    public String getGroup_Code() {
        return Group_Code;
    }

    public void setGroup_Code(String group_Code) {
        Group_Code = group_Code;
    }

    public boolean isNoSpecified() {
        return NoSpecified;
    }

    public void setNoSpecified(boolean noSpecified) {
        NoSpecified = noSpecified;
    }

    public float getPrinciple_Paid() {
        return Principle_Paid;
    }

    public void setPrinciple_Paid(float principle_Paid) {
        Principle_Paid = principle_Paid;
    }

    public boolean isPrinciple_PaidSpecified() {
        return Principle_PaidSpecified;
    }

    public void setPrinciple_PaidSpecified(boolean principle_PaidSpecified) {
        Principle_PaidSpecified = principle_PaidSpecified;
    }

    public float getInterest_Paid() {
        return Interest_Paid;
    }

    public void setInterest_Paid(float interest_Paid) {
        Interest_Paid = interest_Paid;
    }

    public boolean isInterest_PaidSpecified() {
        return Interest_PaidSpecified;
    }

    public void setInterest_PaidSpecified(boolean interest_PaidSpecified) {
        Interest_PaidSpecified = interest_PaidSpecified;
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

    public float getPenalty() {
        return Penalty;
    }

    public void setPenalty(float penalty) {
        Penalty = penalty;
    }

    public float getAdvance_Balance() {
        return Advance_Balance;
    }
    public void setAdvance_Balance(float advance_Balance) {
        Advance_Balance = advance_Balance;
    }
    public String Member_Name;
    public float Amount_Total;
    public boolean Amount_TotalSpecified;
    public float Expected_Interest;
    public boolean Expected_InterestSpecified;
    @NonNull     public String Loan_No;
    public float Expected_Repayment;
    public boolean Expected_RepaymentSpecified;
    public String Group_Code;
    public boolean NoSpecified;
    public float Principle_Paid;
    public boolean Principle_PaidSpecified;
    public float Interest_Paid;
    public boolean Interest_PaidSpecified;
    public String Branch_Code;
@NonNull    public String Pawdep_No;
    public float Penalty ;
    public boolean Sent=false;
    public float Advance_Balance;
    public Boolean saved;
    public String Error;
    public java.sql.Date Latest_Payment_Date;
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Repayment t);
        @Update
        int Update(Repayment t);
        @Delete
        void delete(Repayment t);
//        @Query("SELECT * FROM Repayment")
//        LiveData<List<Repayment>> getAll();

        @Query("SELECT * FROM Repayment")
        List<Repayment> getAll();

        @Query("SELECT * FROM Repayment where Transaction_No =:t")
        List<Repayment> GroupLoans(String t);

        @Query("SELECT * FROM Repayment where Transaction_No =:t and Pawdep_No =:p")
        List<Repayment> GroupLoans(String t,String p);

        @Query("SELECT * FROM Repayment where Transaction_No =:t and Sent=0 ")
        List<Repayment> unsentloans(String t);

        @Query("update Repayment set Sent = 1 where `No` =:id")
        int updatesent(int id);

        @Query("Select * from Repayment where sent =0 and Transaction_No=:transaction_no")
        List<Repayment> unsent(String transaction_no);

        @Query("SELECT * FROM Repayment where Transaction_No =:No  and Group_Code=:group and Pawdep_No=:member")
        List<Repayment> Loaninserted(String No, String group, String member);
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> {
        private List<Repayment> advance = new ArrayList<>();
        private Repayment.adapter.OnItemClickListener listener;
        DB db;
        dao d;
        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
           Advanceitems  binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.advanceitem, parent, false);


            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            Repayment current = advance.get(position);
            holder.bind(current);
            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        Repayment t = holder.binding.getAdvance();
                        try {


                            new saveAsyncTask().execute(t);
                            notifyItemChanged(position, t);
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                }
            };
            holder.binding.PrinciplePaid.setOnFocusChangeListener(focusChangeListener);
            holder.binding.InterestPaid.setOnFocusChangeListener(focusChangeListener);
            holder.binding.Penalty.setOnFocusChangeListener(focusChangeListener);

        }
        private class saveAsyncTask extends AsyncTask<Repayment, Void, Void> {
            @Override
            protected Void doInBackground(Repayment... advance) {
                try {

                    Log.i("Saved",String.valueOf(d.Update(advance[0])));
                    // notifyDataSetChanged();
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

        public void sett_line(List<Repayment> advance) {
            this.advance = advance;
            notifyDataSetChanged();
        }
        class Holder extends RecyclerView.ViewHolder {
            private Advanceitems binding;


            public Holder(@NonNull ViewGroup parent, Advanceitems itemView) {
                super(itemView.getRoot());
                db = DB.getInstance(parent.getContext());
                d = db.adao();

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

            public void bind(Repayment object) {
                binding.setAdvance(object);
                binding.executePendingBindings();
            }

            public Advanceitems getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Repayment note);
        }

        public void setOnItemClickListener(Repayment.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
    public static class Model extends AndroidViewModel {
        Repayment.dao Dao;
        private List<Repayment> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.adao();

        }

        public List<Repayment> getAll() {
            return Dao.getAll();
        }

        public void insert(Repayment t) {
            new Repayment.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Repayment, Void, Void> {
            private Repayment.dao Dao;

            private InsertAsyncTask(Repayment.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Repayment... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }

}
