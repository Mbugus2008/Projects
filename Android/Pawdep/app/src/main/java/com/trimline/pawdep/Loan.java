package com.trimline.pawdep;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.text.InputType;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import java.io.Serializable;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import androidx.annotation.NonNull;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.BindingAdapter;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.InverseBindingAdapter;
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
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.pawdep.databinding.Loanhistory;
import com.trimline.pawdep.databinding.Loanlist;
import com.google.gson.Gson;

@Entity
public class Loan extends BaseObservable implements Serializable {
  @Ignore
    public String Key;

    public String getKey() {
        return Key;
    }

    public void setKey(String key) {
        Key = key;
    }

    @NonNull
    public String getLoan_No() {
        return Loan_No;
    }

    public void setLoan_No(@NonNull String loan_No) {
        Loan_No = loan_No;
    }
@Bindable
    public String getMember_No() {
        return Member_No;
    }

    public void setMember_No(String member_No) {
        Member_No = member_No;
        notifyPropertyChanged(BR.member_No);
    }
@Bindable
    public String getMember_Name() {
        return Member_Name;
    }

    public void setMember_Name(String member_Name) {
        Member_Name = member_Name;
        notifyPropertyChanged(BR.member_Name);
    }

    public String getID_No() {
        return ID_No;
    }

    public void setID_No(String ID_No) {
        this.ID_No = ID_No;
    }

    public int getLoan_Status() {
        return Loan_Status;
    }

    public void setLoan_Status(int loan_Status) {
        Loan_Status = loan_Status;
    }

    public int getInstallments() {
        return Installments;
    }

    public void setInstallments(int installments) {
        Installments = installments;
    }

    public String getDate_Approved() {
        return Date_Approved;
    }

    public void setDate_Approved(String date_Approved) {
        Date_Approved = date_Approved;
    }

    public String getDisbursement_Date() {
        return Disbursement_Date;
    }

    public void setDisbursement_Date(String disbursement_Date) {
        Disbursement_Date = disbursement_Date;
    }

    public int getMode_of_Disbursement() {
        return Mode_of_Disbursement;
    }

    public void setMode_of_Disbursement(int mode_of_Disbursement) {
        Mode_of_Disbursement = mode_of_Disbursement;
    }
    public float getRepayment() {
        return Repayment;
    }

    public void setRepayment(float repayment) {
        Repayment = repayment;
    }

    public float getOutstanding_Balance() {
        return Outstanding_Balance;
    }
    public void setOutstanding_Balance(float outstanding_Balance) {
        Outstanding_Balance = outstanding_Balance;
    }
    public String getGroup_No() {
        return Group_No;
    }

    public void setGroup_No(String group_No) {
        Group_No = group_No;
    }
@Bindable
    public String getLoan_Type() {
        return Loan_Type;
    }

    public void setLoan_Type(String loan_Type) {
        Loan_Type = loan_Type;
        notifyPropertyChanged(BR.loan_Type);
    }

    public double getPAWDEP_Schedule_Repayment() {
        return PAWDEP_Schedule_Repayment;
    }

    public void setPAWDEP_Schedule_Repayment(Float PAWDEP_Schedule_Repayment) {
        this.PAWDEP_Schedule_Repayment = PAWDEP_Schedule_Repayment;
    }

    public double getPAWDEP_Schedule_Interest() {
        return PAWDEP_Schedule_Interest;
    }

    public void setPAWDEP_Schedule_Interest(Float PAWDEP_Schedule_Interest) {
        this.PAWDEP_Schedule_Interest = PAWDEP_Schedule_Interest;
    }

    public double getInterest_Paid() {
        return Interest_Paid;
    }

    public void setInterest_Paid(Float interest_Paid) {
        Interest_Paid = interest_Paid;
    }

    public double getCurrent_Repayments() {
        return Current_Repayments;
    }

    public void setCurrent_Repayments(Float current_Repayments) {
        Current_Repayments = current_Repayments;
    }

    @PrimaryKey
    @NonNull
    public String Loan_No;
    public String Member_No;
    public String Member_Name;
    public String ID_No;
    public int Loan_Status;
    public int Installments;
    public String Date_Approved;
    public String Disbursement_Date;
    public int Mode_of_Disbursement;
    public float Repayment;
    public float Outstanding_Balance;
    public String Group_No;
    public String Loan_Type;
    public Float PAWDEP_Schedule_Repayment;
    public Float PAWDEP_Schedule_Interest;
    public Float Interest_Paid;
    public Float Current_Repayments;
    public Float Haraka_Balance;
    public String Group_Name ;
    public Boolean Posted ;
    public Boolean PostedSpecified ;
    public float Amount_approved ;
    public Boolean Amount_approvedSpecified ;
@Bindable
    public float getAmount_Applied() {
        return Amount_Applied;
    }

    public void setAmount_Applied(float amount_Applied) {
        Amount_Applied = amount_Applied;
        notifyPropertyChanged(BR.amount_Applied);
    }

    public float Amount_Applied ;
    public Boolean Amount_AppliedSpecified ;
    public int Client_Category ;

    public String getClientCategory() {
        ClientCategory = Client_Categorys.values()[Client_Category].name();
        return ClientCategory;
    }

    public void setClientCategory(String clientCategory) {
        Client_Category = Client_Categorys.valueOf(clientCategory).ordinal();
        ClientCategory = clientCategory;
    }
    public String ClientCategory ;
    public Boolean Client_CategorySpecified ;
    public String Sector ;
    public String Sub_Sector ;
    public java.sql.Date Repayment_Start_Date ;
    public Boolean Repayment_Start_DateSpecified ;
@Bindable
    public String getGroup_Name() {
        return Group_Name;
    }

    public void setGroup_Name(String group_Name) {
        Group_Name = group_Name;
        notifyPropertyChanged(BR.group_Name);
    }
@Bindable
    public float getAmount_approved() {
        return Amount_approved;

    }

    public void setAmount_approved(float amount_approved) {
        Amount_approved = amount_approved;
        notifyPropertyChanged(BR.amount_approved);
    }
@Bindable
    public int getClient_Category() {
        return Client_Category;
    }

    public void setClient_Category(int client_Category) {
        Client_Category = client_Category;
        notifyPropertyChanged(BR.client_Category);
    }
@Bindable
    public String getSector() {
        return Sector;
    }

    public void setSector(String sector) {
        Sector = sector;
        notifyPropertyChanged(BR.sector);
    }
@Bindable
    public String getSub_Sector() {
        return Sub_Sector;
    }

    public void setSub_Sector(String sub_Sector) {
        Sub_Sector = sub_Sector;
        notifyPropertyChanged(BR.sub_Sector);
    }

    public String getLoan_Request_No() {
        return Loan_Request_No;
    }

    public void setLoan_Request_No(String loan_Request_No) {
        Loan_Request_No = loan_Request_No;
    }
@Bindable
    public String getLoan_Purpose() {
        return Loan_Purpose;
    }

    public void setLoan_Purpose(String loan_Purpose) {
        Loan_Purpose = loan_Purpose;
        notifyPropertyChanged(BR.loan_Purpose);
    }

    public String Loan_Request_No;
    public String Loan_Purpose;

    public Date getLatest_Payment_Date() {

        return Latest_Payment_Date;
    }

    public void setLatest_Payment_Date(Date latest_Payment_Date) {
        Latest_Payment_Date = latest_Payment_Date;
    }
    public java.sql.Date Latest_Payment_Date;

    public Boolean Sent;


    public enum Client_Categorys {

        /// <remarks/>
        None,

        /// <remarks/>
        Individual,

        /// <remarks/>
        Group,
    }
public static class attachparams{
    AutoCompleteTextView  autoCompleteTextView;
    int loanstatus;
    String Memberno;
    boolean isdropdown;
    List<Loan> l;

}
    @BindingAdapter("android:date")
    public static void setText(TextView view, Date date) {
        System.out.println(date);

        if (date!=null) {
            DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
            String localizedDate = df.format(date);
            view.setText(localizedDate);
            if(localizedDate.equals("1 Jan 1"))
                view.setText("");
        }
    }
    @InverseBindingAdapter(attribute = "android:date", event = "android:textAttrChanged")
    public static Date DateValue(TextView view) {
        CharSequence date = view.getText();
        SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");

        Date date1 = null;
        if (date!=null) {
            try {
                date1 =(java.sql.Date) df.parse(date.toString());
            }
            catch (ParseException pe)
            {

            }

        }


        return date1;
    }
    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long  Insert(Loan t) ;
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Loan> t) ;
        @Update
        void Update(Loan t);
        @Delete
        void delete(Loan t);

        @Query("SELECT * FROM `Loan`")
        List<Loan> getAll();

        @Query("SELECT * FROM `Loan` where Loan_Status =1")
        LiveData<List<Loan>> All();

        @Query("Select * From loan where Member_No IN (:groupname) and Loan_Type =  'MABAWA' and Posted = 0 and Loan_Status = 4")
        List<Loan> Approvedgrouploans(String[] groupname);

        @Query("SELECT * FROM `Loan` where Member_No =:No ")
        List<Loan> memberloans(String No);
        
        @Query("SELECT * FROM `Loan` where Member_No =:No and Loan_Type <> 'HARAKA'")
        List<Loan> memberloansnonharaka(String No);
        
        @Query("SELECT * FROM `Loan` where Member_No =:No and Loan_Type <> 'MABAWA'")
        List<Loan> memberloansnonmambawa(String No);

        @Query("SELECT * FROM `Loan` where Member_No =:No and Loan_Type = 'HARAKA'")
        List<Loan> memberloansharaka(String No);

        @Query("SELECT * FROM `Loan` where Sent =0")
        List<Loan> unsent();
    }
    public static class Repository {
        private dao Dao;
        public List<Loan> all;
        Application application;
        public LiveData<List<Loan>> allloans;
        public Repository(Application application) {
            DB database = DB.getInstance(application);
            Dao = database.loandao();
            this.application = application;
            allloans = Dao.All();
        }
        public  LiveData<List<Loan>> getAllloans()
        {
            return   allloans;
        }
public List<Loan> unsent() {
    return Dao.unsent();
}


        public void insert(Loan member) {
            new InsertMemberAsyncTask(Dao).execute(member);
        }
        public void insert(List<Loan> member) {
            new InsertMembersAsyncTask(Dao).execute(member);
        }
        public void update(Loan l) {
            new UpdateMemberAsyncTask(l).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        public void delete(Loan member) {
            new DeleteMemberAsyncTask(Dao).execute(member);
        }

        private class InsertMemberAsyncTask extends AsyncTask<Loan, Void, Void> {
            private Loan.dao memberDao;

            private InsertMemberAsyncTask(Loan.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }
        private class InsertMembersAsyncTask extends AsyncTask<List<Loan>, Void, Void> {
            private Loan.dao memberDao;

            private InsertMembersAsyncTask(Loan.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Loan>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }
        private class UpdateMemberAsyncTask extends AsyncTask<Void, Void, Void> {
            private Loan ll;

            private UpdateMemberAsyncTask(Loan l) {
                this.ll = l;
            }

            @Override
            protected Void doInBackground(Void... members) {
                Dao.Update(ll);
                return null;
            }
        }
        private class DeleteMemberAsyncTask extends AsyncTask<Loan, Void, Void> {
            private Loan.dao memberDao;

            private DeleteMemberAsyncTask(Loan.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }

        public void bind(RecyclerView r,int loanstatus){
            new bind(r,loanstatus).execute();
        }

        private class bind extends AsyncTask<Void, Void, List<Loan>> {
            RecyclerView h;
            int loanstatus;
            public bind(RecyclerView hh,int Loanstatus) {
                this.loanstatus = Loanstatus;
                this.h = hh;
            }
            @Override
            protected List<Loan> doInBackground(Void... advance) {
                List<Loan> n = new ArrayList<>();
                try {
//                    if (advance[0].contentEquals(""))
                    n = Dao.getAll().stream().filter(o-> o.Loan_Status ==loanstatus).collect(Collectors.toList());
//                    else
//                        n = Dao.(advance[0]);

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan> res) {

              adapter  adapter = new adapter(application.getApplicationContext());

                adapter.sett_line(res);
                h.setAdapter(adapter);

            }
        }
        public void bindmemberloans(AutoCompleteTextView r,int loanstatus,String Memberno,String loantype ,boolean isdropdown){
            new bindloansandtype(r,loanstatus,loantype,isdropdown).execute(Memberno);
        }

        public void bindmemberloans(AutoCompleteTextView r,int loanstatus,String Memberno,boolean isdropdown){
            new bindmemberloans(r,loanstatus,isdropdown).execute(Memberno);
        }
        private class bindmemberloans extends AsyncTask<String, Void, List<Loan>> {
            AutoCompleteTextView h;
            int loanstatus;
            boolean dropdown;

            public bindmemberloans(
                    AutoCompleteTextView hh,
                    int Loanstatus,
                    boolean dropdown
                  )
            {
                this.dropdown = dropdown;
                this.loanstatus = Loanstatus;
                this.h = hh;

            }

            @Override
            protected List<Loan> doInBackground(String... advance) {

                List<Loan> n = new ArrayList<>();
                try {

                    n = Dao.memberloans(advance[0]);

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan> res) {

                simpleadapter adapter = new simpleadapter(application.getApplicationContext(), R.layout.loans, res, true);
                h.setAdapter(adapter);
                if (dropdown) {
                    h.setInputType(InputType.TYPE_NULL);
                    h.setOnTouchListener(new View.OnTouchListener() {
                        @Override
                        public boolean onTouch(View v, MotionEvent event) {
                            h.showDropDown();
                            return false;
                        }
                    });
                    //h.showDropDown();
                }

            }
        }

        public void bindmemberloans2( Loan.attachparams a){
            new bindmemberloans2(  a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }

        private class bindmemberloans2 extends AsyncTask<Void, Void, List<Loan>> {
            Loan.attachparams a;

            public bindmemberloans2(Loan.attachparams aa)
            {
                this.a = aa;
            }

            @Override
            protected List<Loan> doInBackground(Void... advance) {

                List<Loan> n = new ArrayList<>();
                try {
                    if (a.l != null)
                        return a.l;
                    n = Dao.memberloans(a.Memberno);

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan> res) {

                simpleadapter adapter = new simpleadapter(application.getApplicationContext(), R.layout.loans, res.stream().filter(o -> o.Outstanding_Balance !=0).collect(Collectors.toList()), true);
               a.autoCompleteTextView.setAdapter(adapter);
                if (a.isdropdown) {
                    a.autoCompleteTextView.setInputType(InputType.TYPE_NULL);
                    a.autoCompleteTextView.setOnTouchListener(new View.OnTouchListener() {
                        @Override
                        public boolean onTouch(View v, MotionEvent event) {
                            a.autoCompleteTextView.showDropDown();
                            return false;
                        }
                    });
                    //h.showDropDown();
                }

            }
        }
        private class bindloansandtype extends AsyncTask<String, Void, List<Loan>> {
            AutoCompleteTextView h;
            int loanstatus;boolean dropdown;
            String loantype;
            public bindloansandtype(AutoCompleteTextView hh,int Loanstatus,String loantype,boolean dropdown) {
                this.dropdown = dropdown;
                this.loanstatus = Loanstatus;
                this.loantype= loantype;
                this.h = hh;
            }

            @Override
            protected List<Loan> doInBackground(String... advance) {

                List<Loan> n = new ArrayList<>();
                try {

                    n = Dao.memberloans(advance[0]).stream().filter(o-> o.Loan_Status ==loanstatus && o.Loan_Type.equals(loantype) ).collect(Collectors.toList());

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan> res) {
                Log.i("okkkk", new Gson().toJson(res));
                simpleadapter adapter = new simpleadapter(application.getApplicationContext(), R.layout.loans, res, true);
                h.setAdapter(adapter);
                if (dropdown) {
                    h.setInputType(InputType.TYPE_NULL);
                    h.setOnTouchListener(new View.OnTouchListener() {
                        @Override
                        public boolean onTouch(View v, MotionEvent event) {
                            h.showDropDown();
                            return false;
                        }
                    });

                    h.showDropDown();
                }

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Loan> groups;
        private List<Loan> tempItems;
        private List<Loan> suggestions;
        private boolean asdropdown;

        public simpleadapter(Context context, int resource, List<Loan> items,boolean asdropdown ) {
            super(context, resource, 0, items);
            this.asdropdown= asdropdown;
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Loan>(items);
            suggestions = new ArrayList<Loan>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.Loan_No);
            TextView branchname = view.findViewById(R.id.loantype);
            TextView memberno = view.findViewById(R.id.balance);
            Loan item = groups.get(position);

            groupname.setText(item.Loan_No);
            branchname.setText(item.Loan_Type);
            memberno.setText(String.format("%,.2f",item.Outstanding_Balance));
            //if (item.Outstanding_Balance==0)
            //memberno.setText(String.format("%,.2f",item.Amount_approved));
            // }

            return view;
        }

        @Override
        public Filter getFilter() {
            return nameFilter;
        }

        Filter nameFilter = new Filter() {
            @Override
            public CharSequence convertResultToString(Object resultValue) {
                Loan str = (Loan) resultValue;
                return str.Loan_No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Loan names : tempItems) {
                        if (asdropdown)
                            suggestions.add(names);
                        else
                        {
                            if (names.Loan_Type != null)
                                if (names.Loan_Type.toLowerCase().contains(constraint.toString().toLowerCase()))
                                    suggestions.add(names);

                        }}
                    FilterResults filterResults = new FilterResults();
                    filterResults.values = suggestions;
                    filterResults.count = suggestions.size();
                    return filterResults;
                } else {
                    return new FilterResults();
                }
            }

            @Override
            protected void publishResults(CharSequence constraint, FilterResults results) {
                try {
                    List<Loan> filterList = (ArrayList<Loan>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Loan item : filterList) {
                            add(item);
                            notifyDataSetChanged();
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
        };
    }
    public static class Model extends AndroidViewModel {
        public Transaction t;
        public Repository repository;
        private LiveData<List<Loan>> all;

        public Model(@NonNull Application application) {
            super(application);
            repository = new Repository(application);

        }
public List<Loan> unsent(){
        return    repository.unsent();
}
        public void update(Loan l) {
            repository.update(l);
        }
        public  LiveData<List<Loan>> getAllloans()
        {
            return   repository.getAllloans();
        }

        public void bindmemberloans(AutoCompleteTextView r, int loanstatus, String Memberno, boolean isdropdown) {
            repository.bindmemberloans(r, loanstatus, Memberno, isdropdown);
        }
        public void bindmemberloans2(Loan.attachparams a) {
            repository.bindmemberloans2(a);
        }
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<Loan> data = new ArrayList<>();
        private Loan.adapter.OnItemClickListener listener;
        DB db;
        Loanlist binding;
        Context c;
        Activity a;
        private Transaction t;
        public adapter(Context cc) {

            this.c = cc;


        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.loan_app_list_item, parent, false);

            return new Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {
            Loan current = data.get(position);
            holder.bind(current);


        }
        @Override
        public void onEditTextChanged(String planetName) {
        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Loan> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Loanlist binding;


            public Holder(@NonNull ViewGroup parent, Loanlist itemView) {
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

            public void bind(Loan object) {
                binding.setLoans(object);
                binding.executePendingBindings();
            }

            public Loanlist getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Loan note);
        }
        public void setOnItemClickListener(Loan.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }

    public static class loanhistory extends RecyclerView.Adapter<loanhistory.Holder> implements IDataChangeListener {
        private List<Loan> data = new ArrayList<>();
        private Loan.adapter.OnItemClickListener listener;
        DB db;
        Loanhistory binding;
        Context c;
        Activity a;
        private Transaction t;
        public loanhistory(Context cc) {

            this.c = cc;

        }
        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.loan_history_line, parent, false);

            return new Holder(parent, binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {
            Loan current = data.get(position);
            holder.bind(current);


        }
        @Override
        public void onEditTextChanged(String planetName) {
        }

        @Override
        public int getItemCount() {
            return data.size();
        }

        public void sett_line(List<Loan> advance) {
            this.data = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Loanhistory binding;


            public Holder(@NonNull ViewGroup parent, Loanhistory itemView) {
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

            public void bind(Loan object) {
                binding.setLoan(object);
                binding.executePendingBindings();
            }

            public Loanhistory getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Loan note);
        }
        public void setOnItemClickListener(Loan.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }

    }
}
