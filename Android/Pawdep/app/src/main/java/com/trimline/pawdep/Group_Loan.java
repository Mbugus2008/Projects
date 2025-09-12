package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.text.InputType;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;
import android.widget.SpinnerAdapter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Index;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.pawdep.databinding.Group_Loanissue;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity(indices = {@Index(value =  {"Transaction_No","Loan_No","Group_Code","Pawdep_No"},unique = true)})
public class Group_Loan {
    public String Key ;
    @NonNull
    public String Transaction_No ;
    @NonNull
    public String Loan_No ;
    @NonNull
    public String Pawdep_No ;
    
    public String Member_Name ;

    public float getDisbursed_Amount() {
        return Disbursed_Amount;
    }

    public void setDisbursed_Amount(float disbursed_Amount) {
        Disbursed_Amount = disbursed_Amount;
    }

    public float Disbursed_Amount ;
    public Boolean Disbursed_AmountSpecified ;
    public float Instalments ;
    public Boolean InstalmentsSpecified ;

    public String Group_Code ;
    public String Group_Name ;
    public String No_series ;
    @PrimaryKey
@NonNull
    public Long No ;
    public Boolean NoSpecified ;
    public float Group_Loan_Fees ;
    public Boolean Group_Loan_FeesSpecified ;
    public float Loan_Aplication_Fee ;
    public Boolean Loan_Aplication_FeeSpecified ;
    public String Loan_Code ;
    public String Member_ID ;
    public String Disbursement_Date ;
    public Boolean Loan_Disbursement_DateSpecified ;
    public float Interest ;
    public Boolean InterestSpecified ;
    public float Group_Loan_Balance ;
    public Boolean Group_Loan_BalanceSpecified ;
    public String Loan_Type ;
    public String Pawdep_No2 ;
    public String Branch_Code ;
    public String Member_No ;

    public float getAmount_Applied() {
        return Amount_Applied;
    }

    public void setAmount_Applied(float amount_Applied) {
        Amount_Applied = amount_Applied;
    }

    public float getAmount_Approved() {
        return Amount_Approved;
    }

    public void setAmount_Approved(float amount_Approved) {
        Amount_Approved = amount_Approved;
    }

    public float Amount_Applied ;
    public Boolean Amount_AppliedSpecified ;
    public float Amount_Approved ;
    public Boolean Amount_ApprovedSpecified ;
    public Boolean Partial ;
    public Boolean PartialSpecified ;

    public boolean Sent =false;

    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Group_Loan t);
        @Update
        int Update(Group_Loan t);
        @Delete
        void delete(Group_Loan t);

        @Query("SELECT * FROM Group_Loan")
        List<Group_Loan> getAll();

        @Query("SELECT * FROM Group_Loan where Transaction_No =:a")
        List<Group_Loan> Groupadvances(String a);
        @Query("SELECT * FROM Group_Loan where Sent =0 and Transaction_No =:transaction_no")
        List<Group_Loan> unsent(String transaction_no);
@Query("Select * from Group_Loan where Transaction_No =:g")
        List<Group_Loan> Grouploans(String g);
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements  IDataChangeListener {
        private List<Group_Loan> group_loans = new ArrayList<>();
        private Group_Loan.adapter.OnItemClickListener listener;
        private List<Loan> loansadapter ;
        Loan.Repository lrepository ;
        DB db;
        dao d;
        Loan.dao ldao;
        Member m;
        Transaction t ;
        Context c;
        List<Member> mm;
        Member.dao mdao;
        Group_Loanissue binding;
        public  adapter(Context cc, Transaction tt) {
            this.t = tt;
            this.c = cc;
            lrepository = new Loan.Repository((Application)cc.getApplicationContext());
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.group_loan, parent, false);
            db = DB.getInstance(parent.getContext());
            ldao = db.loandao();
            d = db.gdao();
            mdao = db.memberDao();
            return new Holder(parent, binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {
            Group_Loan current = group_loans.get(position);
            holder.bind(current);
            new getapprovedloans(holder).execute(t.Group_Name);

            holder.binding.LoanNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Loan type = (Loan) parent.getItemAtPosition(position);
                    System.out.println("Loading");
                    current.Loan_No = type.Loan_No;
                    current.Pawdep_No = type.Member_No;
                    current.Member_Name = type.Member_Name;
                    current.Amount_Applied = type.Amount_Applied;
                    current.Amount_Approved = type.Amount_approved;
                    notifyItemChanged(position, current);
                }
            });





            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {

                        Group_Loan t = holder.binding.getGrouploan();
                       try{
                        new saveAsyncTask().execute(t);
                        notifyItemChanged(position, t);
                       }catch (Exception ex)
                       {ex.printStackTrace();}

                    }
                }
            };
            holder.binding.Disbursedamount.setOnFocusChangeListener(focusChangeListener);


            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Group_Loan t = holder.binding.getGrouploan();
                    group_loans.remove(t);
                    new deleteadvance().execute(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());

                }
            });


        }

        @Override
        public void onEditTextChanged(String planetName) {

        }

        private class getapprovedloans extends AsyncTask<String, Void, List<Loan>> {

            Holder h;

            public getapprovedloans(Holder hh) {
                this.h = hh;
            }
            @Override
            protected List<Loan> doInBackground(String... g) {
                List<Loan> loans = new ArrayList<>();
                try {
                    List<Member> m = mdao.getbygroupmembers(g[0]);
                    List<String> s = new ArrayList<>();
                    for (Member mm:m
                    ) {
                        s.add(mm.No);
                    }
                    s.stream().forEach(a -> {
                        System.out.println(String.format("Members: %s" , a) );
                    });
                    loans = ldao.Approvedgrouploans(s.stream().toArray(String[]::new)).stream().filter(o-> o.Outstanding_Balance ==0).collect(Collectors.toList());
                    System.out.println(String.format("Loans: %s" , loans.size()) );
                    // notifyDataSetChanged();

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return loans;
            }

            @Override
            protected void onPostExecute(List<Loan> res) {
                loansadapter = res;
                Loan.simpleadapter s = new Loan.simpleadapter(c,R.layout.loans,res,true);
                //LoansAdapter adapter = new LoansAdapter(binding.getRoot().getContext(), loansadapter.stream().toArray(Loan[]::new));
         h.binding.LoanNo.setAdapter(s);
         h.binding.LoanNo.showDropDown();
                h.binding.LoanNo.setInputType(InputType.TYPE_NULL);
                h.binding.LoanNo.setOnTouchListener(new View.OnTouchListener() {
                    @Override
                    public boolean onTouch(View v, MotionEvent event) {
                        h.binding.LoanNo.showDropDown();
                        return false;
                    }
                });

            }
        }
        private class deleteadvance extends AsyncTask<Group_Loan, Void,Void> {

            @Override
            protected Void doInBackground(Group_Loan... advance) {
                try {
                    d.delete(advance[0]);


                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }

        }
        private class saveAsyncTask extends AsyncTask<Group_Loan, Void, Void> {
            @Override
            protected Void doInBackground(Group_Loan... advance) {
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
            return group_loans.size();
        }

        public void sett_line(List<Group_Loan> advance) {
            this.group_loans = advance;
            notifyDataSetChanged();
        }
        class Holder extends RecyclerView.ViewHolder {
            private Group_Loanissue binding;


            public Holder(@NonNull ViewGroup parent, Group_Loanissue itemView) {
                super(itemView.getRoot());
                this.binding = itemView;













                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(group_loans.get(position));
                        }
                    }
                });
            }

            public void bind(Group_Loan object) {
                binding.setGrouploan(object);
                binding.executePendingBindings();
            }

            public Group_Loanissue getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Group_Loan note);
        }

        public void setOnItemClickListener(Group_Loan.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }


    public static class Model extends AndroidViewModel {
        public Transaction t;
        Group_Loan.dao Dao;

        private List<Group_Loan> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            Dao = db.gdao();
        }

        public List<Group_Loan> getAll() {
            return Dao.getAll();
        }

        public void insert(Group_Loan t) {
            new Group_Loan.Model.InsertAsyncTask(Dao).execute(t);

        }

        private class InsertAsyncTask extends AsyncTask<Group_Loan, Void, Void> {
            private Group_Loan.dao Dao;

            private InsertAsyncTask(Group_Loan.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Group_Loan... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }

    public static class LoansAdapter  extends BaseAdapter implements SpinnerAdapter {

        Loan[] loans;
        Context context;
        String[] colors = {"#13edea","#e20ecd","#15ea0d"};
        String[] colorsback = {"#FF000000","#FFF5F1EC","#ea950d"};

        public LoansAdapter(Context context, Loan[] company) {
            this.loans = company;
            this.context = context;
        }

        @Override
        public int getCount() {
            return loans.length;
        }

        @Override
        public Object getItem(int position) {
            return loans[position];
        }

        @Override
        public long getItemId(int position) {
            return position;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view =  View.inflate(context, R.layout.member_approved_loans, null);
            TextView loanno = (TextView) view.findViewById(R.id.loanno);
            TextView memberno = (TextView) view.findViewById(R.id.memberNo);
            TextView membername = (TextView) view.findViewById(R.id.Member_Name);
            TextView applied = (TextView) view.findViewById(R.id.AmountApplied);
            TextView approved = (TextView) view.findViewById(R.id.Amountapproved);

            loanno.setText(loans[position].Loan_No);
            memberno.setText(loans[position].Member_No);
            membername.setText(loans[position].Member_Name);
            applied.setText(String.valueOf(loans[position].Amount_Applied));
            approved.setText(String.valueOf(loans[position].Amount_approved));


            return view;
        }

//        @Override
//        public View getDropDownView(int position, View convertView, ViewGroup parent) {
//
//            View view;
//            view =  View.inflate(context, R.layout.company_dropdown, null);
//            final TextView textView = (TextView) view.findViewById(R.id.dropdown);
//            textView.setText(company[position]);
//
//            textView.setTextColor(Color.parseColor(colors[position]));
//            textView.setBackgroundColor(Color.parseColor(colorsback[position]));
//
//
//            return view;
//        }
    }

}
