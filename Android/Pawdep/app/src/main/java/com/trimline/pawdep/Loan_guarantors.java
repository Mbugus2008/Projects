package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
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

import com.trimline.pawdep.databinding.Loanguarantors;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity(primaryKeys = {"Loan_No","Member_No"})
public class Loan_guarantors extends BaseObservable implements Serializable {

    public String Key;
    @NonNull
    public String Loan_No;
    @NonNull
    public String Member_No;
@Bindable
    @NonNull
    public String getMember_No() {
        return Member_No;
    }

    public void setMember_No(@NonNull String member_No) {
        Member_No = member_No;
    }
    @Bindable
    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
        notifyPropertyChanged(BR.description);
    }
    @Bindable
    public float getOutstanding_Balance() {
        return Outstanding_Balance;
    }

    public void setOutstanding_Balance(float outstanding_Balance) {
        Outstanding_Balance = outstanding_Balance;
        notifyPropertyChanged(BR.outstanding_Balance);
    }
    @Bindable
    public float getCurrent_Loan_Balance() {
        return Current_Loan_Balance;
    }

    public void setCurrent_Loan_Balance(float current_Loan_Balance) {
        Current_Loan_Balance = current_Loan_Balance;
        notifyPropertyChanged(BR.current_Loan_Balance);
    }
    @Bindable
    public float getSavings() {
        return Savings;
    }

    public void setSavings(float savings) {
        Savings = savings;
    }
    @Bindable
    public int getLoans_Guaranted() {
        return Loans_Guaranted;
    }

    public void setLoans_Guaranted(int loans_Guaranted) {
        Loans_Guaranted = loans_Guaranted;
    }
    @Bindable
    public Boolean getLoan_Substituted() {
        return Loan_Substituted;
    }

    public void setLoan_Substituted(Boolean loan_Substituted) {
        Loan_Substituted = loan_Substituted;
    }
    @Bindable
    public float getAmount_Guaranteed() {
        return Amount_Guaranteed;
    }

    public void setAmount_Guaranteed(float amount_Guaranteed) {
        Amount_Guaranteed = amount_Guaranteed;
    }
    @Bindable
    public Boolean getMember_Signed() {
        return Member_Signed;
    }

    public void setMember_Signed(Boolean member_Signed) {
        Member_Signed = member_Signed;
    }
    @Bindable
    public float getAmount_Available() {
        return Amount_Available;
    }

    public void setAmount_Available(float amount_Available) {
        Amount_Available = amount_Available;
    }

    public String getID_Number() {
        return ID_Number;
    }

    public void setID_Number(String ID_Number) {
        this.ID_Number = ID_Number;
    }

    public float getGuaranteed_Loan_Outstanding() {
        return Guaranteed_Loan_Outstanding;
    }

    public void setGuaranteed_Loan_Outstanding(float guaranteed_Loan_Outstanding) {
        Guaranteed_Loan_Outstanding = guaranteed_Loan_Outstanding;
    }

    public static com.trimline.pawdep.Loan_Category getLoan_Category() {
        return Loan_Category;
    }

    public static void setLoan_Category(com.trimline.pawdep.Loan_Category loan_Category) {
        Loan_Category = loan_Category;
    }

    public boolean isSent() {
        return Sent;
    }

    public void setSent(boolean sent) {
        Sent = sent;
    }

    public String Description;
    public float Outstanding_Balance;
    public Boolean Outstanding_BalanceSpecified;
    public float Current_Loan_Balance;
    public Boolean Current_Loan_BalanceSpecified;
    public float Savings;
    public Boolean SavingsSpecified;
@Bindable
    public float getRequired_Percent_of_Outstanding_Loan() {
        return Required_Percent_of_Outstanding_Loan;
    }

    public void setRequired_Percent_of_Outstanding_Loan(float required_Percent_of_Outstanding_Loan) {
        Required_Percent_of_Outstanding_Loan = required_Percent_of_Outstanding_Loan;
   notifyPropertyChanged(BR.required_Percent_of_Outstanding_Loan);
    }

    public float Required_Percent_of_Outstanding_Loan;
    public Boolean Required_Percent_of_Outstanding_LoanSpecified;
    public int Loans_Guaranted;
    public Boolean Loans_GuarantedSpecified;
    public Boolean Loan_Substituted;
    public Boolean Loan_SubstitutedSpecified;
    public float Amount_Guaranteed;
    public Boolean Amount_GuaranteedSpecified;
    public Boolean Member_Signed;
    public Boolean Member_SignedSpecified;
    public float Amount_Available;
    public Boolean Amount_AvailableSpecified;
    public float Risk;
    public Boolean RiskSpecified;
@Bindable
    public float getMinimum_Savings_Required() {
        return Minimum_Savings_Required;
    }

    public void setMinimum_Savings_Required(float minimum_Savings_Required) {
        Minimum_Savings_Required = minimum_Savings_Required;
        notifyPropertyChanged(BR.minimum_Savings_Required);
    }

    public float Minimum_Savings_Required;
    public Boolean Minimum_Savings_RequiredSpecified;
    public String ID_Number;
    public float Guaranteed_Loan_Outstanding;
    public Boolean Guaranteed_Loan_OutstandingSpecified;
    public static Loan_Category Loan_Category;
    public Boolean Loan_CategorySpecified;
    public boolean Sent=false;


    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Loan_guarantors t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Loan_guarantors> t);

        @Update
        void Update(Loan_guarantors t);

        @Delete
        void delete(Loan_guarantors t);

        @Query("SELECT * FROM `Loan_guarantors`")
        List<Loan_guarantors> getAll();

        @Query("SELECT * FROM `Loan_guarantors` where Loan_No =:loan")
        List<Loan_guarantors> Getloanguarantors(String loan);
        @Query("SELECT * FROM `Loan_guarantors` where Sent =0")
        List<Loan_guarantors> unsent();

        @Query("update `Loan_guarantors` set Member_No =:newm  where `Member_No` =:old")
        void updatpawdep(String old,String newm );
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements  IDataChangeListener {
        private List<Loan_guarantors> loanRequests = new ArrayList<>();
        private Loan_guarantors.adapter.OnItemClickListener listener;
        DB db;
        dao d;
        Member m;
        Loan_Request t ;
        Loan loan ;
        Context c;
        Member.dao mdao;
        Member.Repository mrepo;
        Repository repo ;
        Loanguarantors binding;

        public  adapter(Context cc) {

            this.c = cc;

            mrepo = new Member.Repository((Application)cc.getApplicationContext());
            repo = new Repository((Application)cc.getApplicationContext());
        }
        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.loan_guarantors_line, parent, false);
            db = DB.getInstance(parent.getContext());
            d = db.lgdao();

            mdao = db.memberDao();
         
            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {

            Loan_guarantors current = loanRequests.get(position);
            holder.bind(current);
            if (t != null)
                mrepo.members(holder.binding.memberNo, t.Group_Name);
            else if (loan != null)
                mrepo.members(holder.binding.memberNo, loan.Group_Name);


            holder.binding.memberNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Member g = (Member) parent.getItemAtPosition(position);
                    if (g != null) {
                        current.setMember_No(g.No);
                       current.setDescription(g.Name);
                       current.setCurrent_Loan_Balance(g.Total_Loans);
                        current.setSavings(g.Monthly_Savings);
                        current.setMinimum_Savings_Required (g.Minimum_Required);
                        current.setRequired_Percent_of_Outstanding_Loan(g.Minimum_Required);
                        current.setAmount_Available( g.Minimum_Required);
                        current.setLoans_Guaranted( g.Loans_Guaranteed);

                        repo.insert(current);
                    }

                }
            });

            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {

                        Loan_guarantors t = holder.binding.getGuarantors();
                        //try {
                        repo.insert(t);

                        notifyItemChanged(position, t);


                    }

                }
            };

            holder.binding.memberNo.setOnFocusChangeListener(focusChangeListener);


            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Loan_guarantors t = holder.binding.getGuarantors();
                    loanRequests.remove(t);
                    repo.delete(t);

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
            return loanRequests.size();
        }

        public void sett_line(List<Loan_guarantors> advance) {
            this.loanRequests = advance;
            notifyDataSetChanged();
        }
        public void setloan(Loan l) {
            this.loan = l;

        }
        public void setrequest(Loan_Request l) {
            this.t = l;

        }
        class Holder extends RecyclerView.ViewHolder {
            private Loanguarantors binding;


            public Holder(@NonNull ViewGroup parent, Loanguarantors itemView) {
                super(itemView.getRoot());
                this.binding = itemView;


                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(loanRequests.get(position));
                        }
                    }
                });


            }
            private class getmembers extends AsyncTask<String, Void, List<Member>> {
                Holder h ;
                public getmembers(Holder hh)
                {this.h = hh;}
                @Override
                protected List<Member> doInBackground(String... advance) {

                    List<Member> mm= new ArrayList<>();
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
                    h.binding.memberNo.setAdapter(adapter);
                }
            }

            public void bind(Loan_guarantors object) {
                binding.setGuarantors(object);
                binding.executePendingBindings();
            }

            public Loanguarantors getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Loan_guarantors note);
        }

        public void setOnItemClickListener(Loan_guarantors.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }

    public static class Repository {
        private dao Dao;
        public List<Loan_guarantors> all;
        Application application;
        Loan_Request request_no   = null;
        public Repository(Application application) {
            DB database = DB.getInstance(application);
            Dao = database.lgdao();
            this.application = application;

        }

        public void insert(Loan_guarantors member) {
            new InsertMemberAsyncTask(Dao).execute(member);
        }
        public void insert(List<Loan_guarantors> member) {
            new InsertMembersAsyncTask(Dao).execute(member);
        }
        public void update(Loan_guarantors member) {
            new UpdateMemberAsyncTask(Dao).execute(member);
        }
        public void delete(Loan_guarantors member) {
            new DeleteMemberAsyncTask(Dao).execute(member);
        }
        private class InsertMemberAsyncTask extends AsyncTask<Loan_guarantors, Void, Void> {
            private dao memberDao;

            private InsertMemberAsyncTask(dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan_guarantors... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }
        private class InsertMembersAsyncTask extends AsyncTask<List<Loan_guarantors>, Void, Void> {
            private dao memberDao;

            private InsertMembersAsyncTask(dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Loan_guarantors>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }
        private class UpdateMemberAsyncTask extends AsyncTask<Loan_guarantors, Void, Void> {
            private dao memberDao;

            private UpdateMemberAsyncTask(dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan_guarantors... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }
        private class DeleteMemberAsyncTask extends AsyncTask<Loan_guarantors, Void, Void> {
            private dao memberDao;

            private DeleteMemberAsyncTask(dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan_guarantors... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

        public void bind(RecyclerView r,Loan loanstatus){
            new bind(r,loanstatus).execute();
        }
        private class bind extends AsyncTask<Void, Void, List<Loan_guarantors>> {
            RecyclerView h;
            Loan loanstatus;
            public bind(RecyclerView hh,Loan loan) {

                this.loanstatus = loan;
                this.h = hh;
            }
            @Override
            protected List<Loan_guarantors> doInBackground(Void... advance) {

                List<Loan_guarantors> n = new ArrayList<>();
                try {
//                    if (advance[0].contentEquals(""))
                    n = Dao.getAll().stream().filter(o-> o.Loan_No.contentEquals(loanstatus.Loan_Request_No)).collect(Collectors.toList());
//                    else
//                        n = Dao.(advance[0]);

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan_guarantors> res) {

                adapter  adapter = new adapter(application.getApplicationContext());
                adapter.setloan(loanstatus);
                adapter.sett_line(res);
                h.setAdapter(adapter);

            }
        }
        
    }
    public static class Model extends AndroidViewModel {
        Repository repository;
        public Loan_Request t;
        Loan_guarantors.dao Dao;

        private List<Loan_guarantors> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.lgdao();
            repository = new Repository(application);
        }
        public List<Loan_guarantors> getAll() {
            return Dao.getAll();
        }

        public void insert(Loan_guarantors t) {
            new Loan_guarantors.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Loan_guarantors, Void, Void> {
            private Loan_guarantors.dao Dao;

            private InsertAsyncTask(Loan_guarantors.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_guarantors... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }
}



