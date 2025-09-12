package com.trimline.pawdep;


import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;


import com.trimline.pawdep.databinding.Tline;


import java.io.Serializable;
import java.util.ArrayList;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

@Entity(tableName = "t_line",primaryKeys = {"PAWDEP_No","Transaction_No"})
public  class T_line implements Serializable {

    public String Key;
    public int No;
    @NonNull
    public String PAWDEP_No;
    @NonNull
    public String Transaction_No;
    public String Member_Name;
    public String Loan_No;
    public String Group_Code;
    public float Savings_B_F;
    public float Loan_Balance_B_F;
    public float Expected_Interest;
    public float Total_Paid;
    public float Principle_Paid;
    public float Interest_Paid;
    public float Monthly_Savings;
    public float Savings__Shares_C_F;
    public float Loan_Balance_C_F;
    public float Interest_Balance_C_F;
    public float Fines;
    public String t_lineaction_No;
    public float Unpaid_Penalty;
    public float Penalty_Charged;
    public boolean Non_Cash;
    public float Expected_Principal;
    public String Member_No;

    public int getMemberNo() {
            int r =0;
        try {
           r=  Integer.valueOf(Member_No);
        }catch (Exception e){}
        return  r;

    }

    public void setMemberNo(int memberNo) {
        MemberNo = memberNo;
    }

    @Ignore
    public int MemberNo;
    public float Principle_Recovered;
    public float Intrerest_Recovered;
    public float Hall;
    public String Branch_Code;
    public boolean sent = false;
    public Boolean saved;
    public String Error;
    public  float Total;

    public float getTotal() {
        return Total;
    }

    public void setTotal(float total) {
        Total = total;
    }



    @NonNull
    public int getNo() {
        return No;
    }

    public String getPAWDEP_No() {
        return PAWDEP_No;
    }

    public String getTransaction_No() {
        return Transaction_No;
    }

    public String getMember_Name() {
        return Member_Name;
    }

    public String getLoan_No() {
        return Loan_No;
    }

    public String getGroup_Code() {
        return Group_Code;
    }

    public float getSavings_B_F() {
        return Savings_B_F;
    }

    public float getExpected_Interest() {
        return Expected_Interest;
    }

    public float getTotal_Paid() {
        return Total_Paid;
    }

    public float getPrinciple_Paid() {
        return Principle_Paid;
    }

    public float getInterest_Paid() {
        return Interest_Paid;
    }

    public float getMonthly_Savings() {
        return Monthly_Savings;
    }

    public float getSavings__Shares_C_F() {
        return Savings__Shares_C_F;
    }

    public float getLoan_Balance_C_F() {
        return Loan_Balance_C_F;
    }

    public float getInterest_Balance_C_F() {
        return Interest_Balance_C_F;
    }

    public float getFines() {
        return Fines;
    }

    public String getT_lineaction_No() {
        return t_lineaction_No;
    }

    public float getUnpaid_Penalty() {
        return Unpaid_Penalty;
    }

    public float getPenalty_Charged() {
        return Penalty_Charged;
    }

    public boolean isNon_Cash() {
        return Non_Cash;
    }

    public float getExpected_Principal() {
        return Expected_Principal;
    }

    public String getMember_No() {
        return Member_No;
    }

    public float getPrinciple_Recovered() {
        return Principle_Recovered;
    }

    public float getIntrerest_Recovered() {
        return Intrerest_Recovered;
    }

    public float getHall() {
        return Hall;
    }

    public String getBranch_Code() {
        return Branch_Code;
    }

    public boolean isSent() {
        return sent;
    }

    public String getT_line_Header() {
        return t_line_Header;
    }

    public float getLoan_Balance_B_F() {
        return Loan_Balance_B_F;
    }


    public void setNo(int no) {
        No = no;
    }

    public void setPAWDEP_No(String PAWDEP_No) {
        this.PAWDEP_No = PAWDEP_No;
    }

    public void setMember_Name(String member_Name) {
        Member_Name = member_Name;
    }

    public void setLoan_No(String loan_No) {
        Loan_No = loan_No;
    }

    public void setSavings_B_F(float savings_B_F) {
        Savings_B_F = savings_B_F;
    }

    public void setLoan_Balance_B_F(float loan_Balance_B_F) {
        Loan_Balance_B_F = loan_Balance_B_F;
    }

    public void setExpected_Interest(float expected_Interest) {
        Expected_Interest = expected_Interest;
    }

    public void setTotal_Paid(float total_Paid) {
        Total_Paid = total_Paid;
    }

    public void setPrinciple_Paid(float principle_Paid) {
        Principle_Paid = principle_Paid;
    }

    public void setInterest_Paid(float interest_Paid) {
        Interest_Paid = interest_Paid;
    }

    public void setMonthly_Savings(float monthly_Savings) {
        Monthly_Savings = monthly_Savings;
    }

    public void setSavings__Shares_C_F(float savings__Shares_C_F) {
        Savings__Shares_C_F = savings__Shares_C_F;
    }

    public void setLoan_Balance_C_F(float loan_Balance_C_F) {
        Loan_Balance_C_F = loan_Balance_C_F;
    }

    public void setInterest_Balance_C_F(float interest_Balance_C_F) {
        Interest_Balance_C_F = interest_Balance_C_F;
    }

    public void setFines(float fines) {
        Fines = fines;
    }

    public void setT_lineaction_No(String t_lineaction_No) {
        this.t_lineaction_No = t_lineaction_No;
    }

    public void setUnpaid_Penalty(float unpaid_Penalty) {
        Unpaid_Penalty = unpaid_Penalty;
    }

    public void setPenalty_Charged(float penalty_Charged) {
        Penalty_Charged = penalty_Charged;
    }

    public void setNon_Cash(boolean non_Cash) {
        Non_Cash = non_Cash;
    }

    public void setExpected_Principal(float expected_Principal) {
        Expected_Principal = expected_Principal;
    }

    public void setMember_No(String member_No) {

        Member_No = member_No;
        try {
            MemberNo = Integer.valueOf(Member_No);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void setPrinciple_Recovered(float principle_Recovered) {
        Principle_Recovered = principle_Recovered;
    }

    public void setIntrerest_Recovered(float intrerest_Recovered) {
        Intrerest_Recovered = intrerest_Recovered;
    }

    public void setHall(float hall) {
        Hall = hall;
    }

    public void setBranch_Code(String branch_Code) {
        Branch_Code = branch_Code;
    }

    public void setT_line_Header(String t_line_Header) {
        this.t_line_Header = t_line_Header;
    }

    public String t_line_Header;
    public java.sql.Date Latest_Payment_Date;
    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(T_line t);

        @Update
        int Update(T_line t);

        @Delete
        void delete(T_line t);

        @Query("SELECT * FROM `T_line`")
        List<T_line> getAll();

        @Query("Select * from `T_line` where sent =0 and Transaction_No=:t")
        List<T_line> unsent(String t);

        @Query("update `t_line` set sent = 1 where `No` =:id")
        int updatesent(int id);

        @Query("update `t_line` set PAWDEP_No =:newm  where `PAWDEP_No` =:old")
        int updatpawdep(String old, String newm);

        @Query("SELECT * FROM `t_line` where Group_Code =:Group and PAWDEP_No =:No and Transaction_No =:t")
        List<T_line> Transctionline(String Group, String t, String No);


        @Query("SELECT * FROM `t_line` where Transaction_No =:t")
        List<T_line> Transctionline(String t);

    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> {
        private List<T_line> t_lines = new ArrayList<>();
        private T_line.adapter.OnItemClickListener listener;

        DB db;
        dao d;
        Context c;


        public adapter(Context ct){
            this.c= ct;
        }
        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            Tline binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.t_lineitem, parent, false);

            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            T_line current = t_lines.get(position);
            holder.bind(current);

            holder.binding.advances.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent advance = new Intent(c, Advance_Repayment.class);
                    advance.putExtra("line", current);
                    c.startActivity (advance);
                }
            });


            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {
                        try{
                        T_line t = holder.binding.getTransaction();
                    float amount;
//                       if (t.Total_Paid>0)
//                       {
                           amount = t.Total_Paid ;
//                           if (t.Unpaid_Penalty> 0)
//                               t.Penalty_Charged= (amount>=t.Unpaid_Penalty?t.Unpaid_Penalty:amount);
//                           amount -=t.Penalty_Charged;
                          // if ((t.Expected_Interest>0))
                               t.Interest_Paid= (amount>=t.Expected_Interest?t.Expected_Interest:amount);
                           amount -=t.Interest_Paid;
                           //if (t.Expected_Principal>0)
                               t.Principle_Paid= (amount>=t.Expected_Principal?t.Expected_Principal:amount);
                           amount -=t.Principle_Paid;
//                           if (amount>0)
                               t.Monthly_Savings =amount;
//                       }

                       t.Total = t.Total_Paid + t.Fines+t.Penalty_Charged+ t.Hall;
                           try{ new saveAsyncTask().execute(t);
                        notifyItemChanged(position, t);
                           }catch (Exception ex)
                           {ex.printStackTrace();}
                        calctotals();}
                        catch (Exception ex)
                        {ex.printStackTrace();}
                    }
                }
            };
            //holder.binding.savings.setOnFocusChangeListener(focusChangeListener);
            holder.binding.Totalpaid.setOnFocusChangeListener(focusChangeListener);
            holder.binding.expectedinterest.setOnFocusChangeListener(focusChangeListener);
            holder.binding.expectedprincipal.setOnFocusChangeListener(focusChangeListener);
            //holder.binding.fines.setOnFocusChangeListener(focusChangeListener);
            holder.binding.hall.setOnFocusChangeListener(focusChangeListener);
            //holder.binding.Penaltycharged.setOnFocusChangeListener(focusChangeListener);


        }
        @Override
        public int getItemCount() {
            return t_lines.size();
        }
private void calctotals(){
         T_linetotals tline = new T_linetotals();
         tline.Expected_Interest =(float) t_lines.stream().mapToDouble(a-> a.Expected_Interest).sum();
         tline.Expected_Principal =(float) t_lines.stream().mapToDouble(a-> a.Expected_Principal).sum();
         tline.Monthly_Savings =(float) t_lines.stream().mapToDouble(a-> a.Monthly_Savings).sum();
         tline.Loan_Balance_B_F =(float) t_lines.stream().mapToDouble(a-> a.Loan_Balance_B_F).sum();
         tline.Principle_Paid =(float) t_lines.stream().mapToDouble(a-> a.Principle_Paid).sum();
         tline.Interest_Paid =(float) t_lines.stream().mapToDouble(a-> a.Interest_Paid).sum();
         tline.Penalty_Charged =(float) t_lines.stream().mapToDouble(a-> a.Penalty_Charged).sum();
         tline.Fines =(float) t_lines.stream().mapToDouble(a-> a.Fines).sum();
         tline.Hall =(float) t_lines.stream().mapToDouble(a-> a.Hall).sum();
         tline.Fines =(float) t_lines.stream().mapToDouble(a-> a.Fines).sum();
         tline.Total =(float) t_lines.stream().mapToDouble(a-> a.Total).sum();
         tline.Total_Paid =(float) t_lines.stream().mapToDouble(a-> a.Total_Paid).sum();
            //t.setT(tline);
}
        public void sett_line(List<T_line> notes) {

            this.t_lines = notes.stream().sorted(Comparator.comparing(T_line::getMemberNo)) .collect(Collectors.toList());
            notifyDataSetChanged();
        }
        private   class saveAsyncTask extends AsyncTask<T_line, Void, Void> {
            @Override
            protected Void doInBackground(T_line... notes) {
                try {

                    Log.i("Saved", String.valueOf(d.Update(notes[0])));
                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        }
        class Holder extends RecyclerView.ViewHolder {
            public Tline binding;



            public Holder(@NonNull ViewGroup parent, Tline itemView) {
                super(itemView.getRoot());
                db = DB.getInstance(parent.getContext());
                d = db.t_linedao();

                this.binding = itemView;

                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(t_lines.get(position));
                        }
                    }
                });


            }


            public void bind(T_line object) {
                binding.setTransaction(object);
                binding.executePendingBindings();
            }

            public Tline getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(T_line note);
        }

        public void setOnItemClickListener(T_line.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }

    public static class Model extends AndroidViewModel {
        T_line.dao Dao;
        private List<T_line> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.t_linedao();
        }



        public List<T_line> getAll() {
            return Dao.getAll();
        }
        public void insert(T_line t) {
            new InsertAsyncTask(Dao).execute(t);
        }

        public  Double Getloanpaid(String transactionid){
Double l=0.0;
          List<T_line> t = Dao.Transctionline(transactionid);
          if (t!=null) {
              l = t.stream()
                      .mapToDouble(a -> a.Principle_Paid)
                      .sum();
          }
          return l;
        }
        private class InsertAsyncTask extends AsyncTask<T_line, Void, Void> {
            private T_line.dao Dao;
            private InsertAsyncTask(T_line.dao Dao) {
                this.Dao = Dao;
            }
            @Override
            protected Void doInBackground(T_line... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }
}
