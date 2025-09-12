package com.trimline.pawdep;


import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AutoCompleteTextView;
import android.widget.ImageView;

import com.trimline.pawdep.databinding.Grouplist;


import androidx.constraintlayout.widget.ConstraintLayout;
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
import androidx.room.PrimaryKey;
import androidx.annotation.NonNull;
import androidx.room.Query;
import androidx.room.Update;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by Paul on 09-Dec-16.
 */
@Entity(tableName = "Transaction")
public class Transaction implements Serializable {
    public void setDescription(String description) {
        Description = description;
    }

    public void setGroup_Code(String group_Code) {
        Group_Code = group_Code;
    }

    public void setGroup_Name(String group_Name) {
        Group_Name = group_Name;
    }

    public void setProject(String project) {
        Project = project;
    }


    public void setDateSpecified(boolean dateSpecified) {
        DateSpecified = dateSpecified;
    }

    public void setReceipt_No(String receipt_No) {
        Receipt_No = receipt_No;
    }

    public void setBranch_Code(String branch_Code) {
        Branch_Code = branch_Code;
    }

    public void setBranch_Name(String branch_Name) {
        Branch_Name = branch_Name;
    }

    public void setGroup_Officer_Code(String group_Officer_Code) {
        Group_Officer_Code = group_Officer_Code;
    }

    public void setGroup_Officer_Name(String group_Officer_Name) {
        Group_Officer_Name = group_Officer_Name;
    }

    public void setLoan_Principle_Paid(float loan_Principle_Paid) {
        Loan_Principle_Paid = loan_Principle_Paid;
    }

    public void setLoan_Interest_Paid(float loan_Interest_Paid) {
        Loan_Interest_Paid = loan_Interest_Paid;
    }

    public void setSavings_Received(float savings_Received) {
        Savings_Received = savings_Received;
    }

    public void setAdvance_Principle_Paid(float advance_Principle_Paid) {
        Advance_Principle_Paid = advance_Principle_Paid;
    }

    public void setAdvance_Interest_Paid(float advance_Interest_Paid) {
        Advance_Interest_Paid = advance_Interest_Paid;
    }

    public void setAdvances_Issued(float advances_Issued) {
        Advances_Issued = advances_Issued;
    }

    public void setOther_Transactions_Paid(float other_Transactions_Paid) {
        Other_Transactions_Paid = other_Transactions_Paid;
    }

    public void setCredit_Officer_Totals(float credit_Officer_Totals) {
        Credit_Officer_Totals = credit_Officer_Totals;
    }

    public void setBank_Account(String bank_Account) {
        Bank_Account = bank_Account;
    }

    public static void setStatus(Transaction.Status status) {
        Status = status;
    }

    public void setHall_Received(float hall_Received) {
        Hall_Received = hall_Received;
    }

    public void setHall_Paid(float hall_Paid) {
        Hall_Paid = hall_Paid;
    }

    public void setGroup_Fines(float group_Fines) {
        Group_Fines = group_Fines;
    }

    public void setPenalty(float penalty) {
        Penalty = penalty;
    }

    public void setAdvance_Fine(float advance_Fine) {
        Advance_Fine = advance_Fine;
    }

    public void setPosted(boolean posted) {
        Posted = posted;
    }

    public void setPosted_Advance(float posted_Advance) {
        Posted_Advance = posted_Advance;
    }

    public Integer Id;
    @NonNull
    @PrimaryKey()
    public String Transaction_No;
    public String Description;
    public String Group_Code;
    public String Group_Name;
    public String Project;

    public String StringDate;

    @Ignore
    public boolean DateSpecified;
    public String Receipt_No;
    public String Branch_Code;
    public String Branch_Name;
    public String Group_Officer_Code;
    public String Group_Officer_Name;

    public float getLoan_Principle_Paid() {

        return Loan_Principle_Paid;
    }

    @Ignore
    public float Loan_Principle_Paid;
    @Ignore
    public float Loan_Interest_Paid;
    @Ignore
    public float Savings_Received;
    @Ignore
    public float Advance_Principle_Paid;
    @Ignore
    public float Advance_Penalty;
    @Ignore
    public float Advance_Interest_Paid;
    @Ignore
    public float Advances_Issued;
    @Ignore
    public float Other_Transactions_Paid;
    @Ignore
    public float TotalPaid;
    @Ignore
    public float Disbursement;


    public double Credit_Officer_Totals;
    @Ignore
    public String Bank_Account;

    public static Status Status;
    @Ignore
    public float Hall_Received;

    public float getHall_Paid() {
        return Hall_Paid;
    }

    public float Hall_Paid;

    public float Group_Fines;
    @Ignore
    public float Penalty;
    @Ignore
    public float Advance_Fine;
    @Ignore
    public float Advance_Fees;
    public boolean Posted;
    public boolean sent = false;
    @Ignore
    public float Posted_Advance;

    @Ignore
    public  float NonCash;


    @Override
    public String toString() {
        return Description;
    }

    @Ignore
    public transient T_line[] t_lines;
    @Ignore
    public transient Advance_Repayment[] advance_repayments;
    @Ignore
    public transient Advance[] advances;
    @Ignore
    public transient Member[] members;


    public enum Status {
        /// <remarks/>
        Pending,
        /// <remarks/>
        Approved,
    }

    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Transaction t);

        @Update
        void Update(Transaction t);

        @Delete
        void delete(Transaction t);

        @Query("SELECT * FROM `Transaction` order by Transaction_No desc")
        LiveData<List<Transaction>> getAll();

        @Query("SELECT * FROM `Transaction` order by Transaction_No desc")
        List<Transaction> getAllt();

        @Query("SELECT * FROM `Transaction` where Transaction_No =:t order by Transaction_No desc")
        Transaction gettrans(String t);

        @Query("Select * from `Transaction` where sent =0 and Posted =1")
        List<Transaction> unsent();
        @Query("Select * from `Transaction` where  Posted =0")
        List<Transaction> unposted();

        @Query("update `Transaction` set sent = 1 where Transaction_No =:id")
        int updatesent(String id);

        @Query("update `Transaction` set Posted = 1 where Transaction_No =:id")
        int Post(String id);
    }

    public static class adapter extends RecyclerView.Adapter<adapter.NoteHolder> {
        private List<Transaction> notes = new ArrayList<>();
        Grouplist binding;
        boolean isFABOpen = false;
        private OnItemClickListener listener;
        Repository repo ;
        Context c;
        public adapter(Context cc){

            this.c= cc;
            repo = new Repository((Application)c.getApplicationContext());
        }

        @NonNull
        @Override
        public NoteHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.grouplistitem, parent, false);

            return new NoteHolder(binding);
        }

        @Override
        public void onBindViewHolder(@NonNull NoteHolder holder, int position) {

            Transaction currentNote = notes.get(position);
            holder.bind(currentNote);
            if (currentNote.Posted)
                holder.grouptrans.setBackgroundResource(R.drawable.backgroundposted);
            if (currentNote.sent)
                holder.grouptrans.setBackgroundResource(R.drawable.backgroundsent);

            if (currentNote.Posted)
                holder.clear.setVisibility(View.GONE);
            else
                holder.clear.setVisibility(View.VISIBLE);



                holder.clear.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        notes.remove(currentNote);
                        repo.delete(currentNote);
                        notifyItemRemoved(position);
                        notifyItemRangeChanged(position, getItemCount());
                    }
                });

        }


        @Override
        public int getItemCount() {
            return notes.size();
        }

        public Transaction getTransAt(int position) {
            return notes.get(position);
        }

        public void setTrans(List<Transaction> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }

        class NoteHolder extends RecyclerView.ViewHolder {
            private Grouplist binding;
            ConstraintLayout grouptrans;
                ImageView clear ;
            public NoteHolder(Grouplist itemView) {
                super(itemView.getRoot());
                this.binding = itemView;
                clear = itemView.getRoot().findViewById(R.id.clear);
                grouptrans = (ConstraintLayout) itemView.getRoot().findViewById(R.id.grouptrans);
                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(notes.get(position));
                        }
                    }
                });
            }

            public void bind(Transaction object) {
                binding.setTransaction(object);
                binding.executePendingBindings();
            }
        }

        public interface OnItemClickListener {
            void onItemClick(Transaction note);
        }

        public void setOnItemClickListener(OnItemClickListener listener) {
            this.listener = listener;
        }
    }
    public static class Repository {
        private static Transaction.dao Dao;
        private LiveData<List<Transaction>> all;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.transactiondao();
            all = Dao.getAll();

        }

        public void insert(Transaction member) {
            new Transaction.Repository.InsertMemberAsyncTask(Dao).execute(member);
        }



        public void update(Transaction member) {
            new Transaction.Repository.UpdateMemberAsyncTask(Dao).execute(member);
        }

        public void delete(Transaction member) {
            new Transaction.Repository.DeleteMemberAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Transaction>> allMembers() {
            return all;
        }

        public List<Transaction> GroupMembers(String Groupname) {

            return all.getValue().stream().filter(o -> o.Group_Name.contentEquals(Groupname)).collect(Collectors.toList());
        }

        private class InsertMemberAsyncTask extends AsyncTask<Transaction, Void, Void> {
            private Transaction.dao Dao;

            private InsertMemberAsyncTask(Transaction.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Transaction... members) {
                Dao.Insert(members[0]);
                return null;
            }
        }



        private class UpdateMemberAsyncTask extends AsyncTask<Transaction, Void, Void> {
            private Transaction.dao Dao;

            private UpdateMemberAsyncTask(Transaction.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Transaction... members) {
                Dao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Transaction, Void, Void> {
            private Transaction.dao Dao;

            private DeleteMemberAsyncTask(Transaction.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Transaction... members) {
                Dao.delete(members[0]);
                return null;
            }
        }

    }
    public static class Model extends AndroidViewModel {
        Transaction.dao Dao;
        Advance.dao advanceDao;
        T_line.dao tdao;
        Member.dao mdao;
        Group_Loan.dao gldao;
        Non_Cash.dao ncdao;
        Loan.dao ldao;
        Repayment.dao adao;
        PW_Transactions.dao ptdao;
        private LiveData<List<Transaction>> allNotes;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);

            Dao = db.transactiondao();
            advanceDao = db.advissuedao();
            tdao = db.t_linedao();
            mdao = db.memberDao();
            ncdao = db.nondao();
            ldao = db.loandao();
            adao = db.adao();
            ptdao = db.ptadao();
            gldao = db.gdao();
            allNotes = Dao.getAll();
        }

        public List<Transaction> getAll() {
            List<Transaction> transactions = Dao.getAllt();
            for (Transaction t : transactions
            ) {
                t = calcfields(t);
            }
            return transactions;
        } public List<Transaction> notposted() {
           return  Dao.unposted();

        }

        public Transaction gettransaction(String tt) {
            Transaction t = Dao.gettrans(tt);


            return calcfields(t);
        }

        private Transaction calcfields(Transaction t) {
            if (t != null) {
                List<T_line> t_lines = tdao.Transctionline(t.Transaction_No);
                List<Repayment> repayments = adao.GroupLoans(t.Transaction_No);
                List<Advance> advances = advanceDao.Groupadvances(t.Transaction_No);
                List<Group_Loan> group_loans = gldao.Groupadvances(t.Transaction_No);
                List<Non_Cash> noncash = ncdao.getgrouptransaction(t.Transaction_No);

                t.Advances_Issued = (float) advances.stream().mapToDouble(a -> a.Amount).sum();
                t.Advance_Fees = (float) advances.stream().mapToDouble(a -> a.Advance_Fees).sum();
                t.Other_Transactions_Paid = (float) ptdao.getgrouptransaction(t.Transaction_No).stream().mapToDouble(a -> a.Amount).sum();
                t.Advance_Principle_Paid = (float) repayments.stream().mapToDouble(a -> a.Principle_Paid).sum();
                t.Advance_Interest_Paid = (float) repayments.stream().mapToDouble(a -> a.Interest_Paid).sum();
                t.Advance_Penalty = (float) repayments.stream().mapToDouble(a -> a.Penalty).sum();
                t.Loan_Interest_Paid = (float) t_lines.stream().mapToDouble(a -> a.Interest_Paid).sum();
                t.Loan_Principle_Paid = (float) t_lines.stream().mapToDouble(a -> a.Principle_Paid).sum();
                t.Savings_Received = (float) t_lines.stream().mapToDouble(a -> a.Monthly_Savings).sum();
                t.Group_Fines = (float) t_lines.stream().mapToDouble(a -> a.Fines).sum();
                t.Hall_Received = (float) t_lines.stream().mapToDouble(a -> a.Hall).sum();
                t.Penalty = (float) t_lines.stream().mapToDouble(a -> a.Penalty_Charged).sum();
                t.TotalPaid = (float) t_lines.stream().mapToDouble(a -> a.Total_Paid).sum();
                t.Disbursement = (float) group_loans.stream().mapToDouble(a -> a.Disbursed_Amount).sum();
                t.NonCash = (float) noncash.stream().mapToDouble(a -> a.Amount).sum();

                t.Credit_Officer_Totals = (t.Penalty+t.Advance_Penalty + t.Advance_Fees + t.Advance_Fine + t.Loan_Principle_Paid + t.Loan_Interest_Paid + t.Advance_Interest_Paid + t.Advance_Principle_Paid + t.Savings_Received + t.Group_Fines + t.Other_Transactions_Paid + t.Hall_Received) - t.Hall_Paid - t.Advances_Issued - t.Disbursement;

            }
            return t;
        }
        public void insert(Transaction t) {
            new InsertAsyncTask(Dao).execute(t);
        }

        private class InsertAsyncTask extends AsyncTask<Transaction, Void, Void> {
            private Transaction.dao Dao;

            private InsertAsyncTask(Transaction.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Transaction... notes) {
                Transaction tr = notes[0];
                long l = Dao.Insert(notes[0]);
                List<Member> members = mdao.getbygroupmembers(notes[0].Group_Name);
                Integer i = 1;
                for (Member m : members
                ) {
                    T_line t;
                    t = new T_line();
                    java.util.Date c = Calendar.getInstance().getTime();
                    SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                    //t.No = df.format(c) + i.toString();
                    t.Transaction_No = tr.Transaction_No;
                    t.Member_No =String.valueOf(m.GID);
                    t.PAWDEP_No = m.No;
                    t.Member_Name = m.Name;
                    t.Savings_B_F = (float) m.Group_Savings;
                    t.Group_Code = tr.Group_Code;
                    t.Branch_Code = tr.Branch_Code;
                    t.Loan_Balance_B_F = m.Mabawa_Balance;

                    List<Loan> ll = ldao.memberloansnonmambawa(m.No);
                    for (Loan loan : ll
                    ) {
                        if (loan.Outstanding_Balance > 0) {
                            //  t.Loan_Balance_B_F += loan.Outstanding_Balance;//  ll.stream().mapToDouble(n -> n.Outstanding_Balance).sum();
                            t.Expected_Interest += loan.PAWDEP_Schedule_Interest + loan.Interest_Paid;
                            t.Expected_Principal += loan.PAWDEP_Schedule_Repayment + loan.Current_Repayments;

                            t.Loan_No = loan.Loan_No;
                        }
                    }
                    List<T_line> t_lines = tdao.Transctionline(tr.Group_Code, tr.Transaction_No, m.No);
                    if (t_lines.size() > 0) {
                        t.No = t_lines.get(0).No;
                        // tdao.Update(t);
                    } else {
                        tdao.Insert(t);
                        i++;
                    }
                    List<Loan> harakaloans = ldao.memberloansharaka(m.No);
                    if (harakaloans.size() > 0) {
                        for (Loan loan : harakaloans
                        ) {
                            Repayment adv = new Repayment();
                            adv.Transaction_No = tr.Transaction_No;
                            adv.Group_Code = tr.Group_Code;
                            adv.Pawdep_No = m.No;
                            adv.Member_No =String.valueOf( m.GID);
                            adv.Branch_Code = m.Branch_Code;
                            adv.Member_Name = m.Name;
                            adv.Expected_Repayment = (float) loan.Haraka_Balance;
                            System.out.println(adv.Expected_Repayment);
                            adv.Expected_Interest = (float) (adv.Expected_Repayment * 0.05);// * (5 / 100));
                            System.out.println(adv.Expected_Interest);
                            adv.Loan_No = loan.Loan_No;
                            if (loan.Outstanding_Balance > 0) {
                                if (adao.Loaninserted(tr.Transaction_No, tr.Group_Code, m.No).size() == 0)
                                    adao.Insert(adv);
                                //else
                                //  adao.Update(adv);
                            }
                        }
                    }
                }
                return null;
            }
        }
    }
}

