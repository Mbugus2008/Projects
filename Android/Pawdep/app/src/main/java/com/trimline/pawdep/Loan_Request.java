package com.trimline.pawdep;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.TypeConverters;
import androidx.room.Update;

import com.google.android.material.progressindicator.ProgressIndicator;
import com.trimline.pawdep.databinding.Loanguarantors;
import com.trimline.pawdep.databinding.Loanrequest;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Entity(primaryKeys = {"Request_No","Member_Code"})
public class Loan_Request extends BaseObservable implements Serializable {
    public String Key;
    @NonNull
    public String Request_No;
    public String Loan_Type;
    public float Outstanding_Loans;
    public Boolean Outstanding_LoansSpecified;
    public float Current_Savings;
    public Boolean Current_SavingsSpecified;
    @NonNull
    public String Member_Code;
@Bindable
    public String getMember_Name() {
        return Member_Name;
    }

    public void setMember_Name(String member_Name) {
        Member_Name = member_Name;
        notifyPropertyChanged(BR.member_Name);
    }

    public String Member_Name;
    public String ID_No;
    public String Loan_Product_Name;
    @TypeConverters(Converters.class)
    public java.sql.Date Date;
    public Boolean DateSpecified;
    public String Contact;
    public float Loan_Guarantee_Fund;
    public Boolean Loan_Guarantee_FundSpecified;
@Bindable
    public boolean isSent() {
        return Sent;
    }

    public void setSent(boolean sent) {
        Sent = sent;
        notifyPropertyChanged(BR.sent);
    }

    public boolean Sent =false;

    public float getAmount_Applied() {
        return Amount_Applied;
    }
    public void setAmount_Applied(float amount_Applied) {
        Amount_Applied = amount_Applied;
    }
    public float Amount_Applied;
    public Boolean Amount_AppliedSpecified;
    public String Remarks;
    public String Branch_Code;
    public String Branch_Name;
    public String Group_Code;
    public String Group_Name;
    public String No_series;

    public int Loan_Status;
    public Boolean Loan_StatusSpecified;
    public Boolean Posted;
    public Boolean PostedSpecified;
    public String Loan_No;

    public int Member_Category;
    public Boolean Member_CategorySpecified;
    public String Credit_officer_Code;
    public String Credit_Officer_Name;

    public int Gender;
    public Boolean GenderSpecified;
    public String Phone_No;

    public int Target_Category;
    public Boolean Target_CategorySpecified;

    public int Product_Category;

    public Boolean Product_CategorySpecified;
    public String Sector;
    public String Sub_Sector;

    public Loan_Request() {
    }

    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Loan_Request t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Loan_Request> t);

        @Query("SELECT * FROM Loan_Request")
        LiveData<List<Loan_Request>> getAll();
        
        @Update
        void Update(Loan_Request t);

        @Delete
        void delete(Loan_Request t);

        @Query("Select * from Loan_Request where Group_Name =:group")
        List<Loan_Request> Groupbookings(String group);

        @Query("Select * from Loan_Request ")
        List<Loan_Request> Groupbookingsall();

        @Query("SELECT * FROM `Loan_Request`")
        List<Loan_Request> All();
        @Query("Select * from Loan_Request where Sent =0")
        List<Loan_Request> unsent();

        @Query("update `Loan_Request` set Member_Code =:newm  where `Member_Code` =:old")
        void updatpawdep(String old,String newm );

//        @Query("SELECT * FROM `Loan_Request` where M")
//        List<Loan_Request> Allbycategory();
    }

    public static class adapter extends RecyclerView.Adapter<adapter.Holder> implements IDataChangeListener {
        private List<Loan_Request> loanRequests = new ArrayList<>();
        private Loan_Request.adapter.OnItemClickListener listener;
        DB db;
        dao d;
        Loan_Request m;
        Transaction t;
        Context c;
        Activity a;
        List<Loan_Request> mm;
        Loan_Request.dao dao;
        Loan_products.dao lpdao;
        List<Sub_Sector> sub_sectors;
        List<Loan_products> loan_products = new ArrayList<>();
        List<Sectors> sectors = new ArrayList<>();
        Sectors.dao sdao;
        Sub_Sector.dao sbdao;
        Loanrequest binding;
        Member.Repository mrepository;
        Sectors.Repository srepo;
        Sub_Sector.Repository sbrepo;
        Group.Model gmodel ;
        Member.Model mmodel;
        Loan_products.Model lpmodel;

        public adapter(Context cc, Activity a, Transaction tt, Group.Model Gmodel, Member.Model mmodel,Loan_products.Model lpmodel) {
            this.t = tt;
            this.c = cc;
            this.a = a;
            db = DB.getInstance(cc);
            d = db.lrdao();
            dao = db.lrdao();

            sdao = db.sdao();
            sbdao = db.sbdao();
            this.gmodel= Gmodel;
            this.mmodel = mmodel;
            this.lpmodel = lpmodel;
            new getloantypes().execute();
            mrepository = new Member.Repository((Application)c.getApplicationContext());
            srepo = new Sectors.Repository((Application)c.getApplicationContext());
            sbrepo = new Sub_Sector.Repository((Application)c.getApplicationContext());
        }

        @NonNull
        @Override
        public Holder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.loan_request_line, parent, false);

            return new Holder( binding);
        }
        @Override
        public void onBindViewHolder(@NonNull Holder holder, int position) {
            Loan_Request current = loanRequests.get(position);
            gmodel.getgroups(holder.binding.Groupname);
            srepo.bindlist(holder.binding.sector,"");
            lpmodel.bindlist(holder.binding.Loantype,false);
            mmodel.getgroupmembers(holder.binding.memberNo,current.Group_Name);
            sbrepo.bindlist(holder.binding.subsector,current.Sector);
            holder.binding.Groupname.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Group g = (Group)parent.getItemAtPosition(position);
                    if (g!=null)
                    {
                      mmodel.getgroupmembers( holder.binding.memberNo,g.Group_Name);

                    }
                }
            });


            holder.binding.guarantors.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Intent loanrequest = new Intent(c, Loan_guarantor_app.class);
                    loanrequest.putExtra("list", current);
                    a.startActivity(loanrequest, null);
                }
            });
            holder.binding.memberNo.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Member g = (Member) parent.getItemAtPosition(position);
                    if (g != null) {
                        current.Member_Name = g.Name;

                    }

                }
            });
            holder.binding.sector.setOnItemClickListener(new AdapterView.OnItemClickListener() {
                @Override
                public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                    Sectors s = (Sectors) parent.getItemAtPosition(position);
                    if (s != null) {
                     sbrepo.bindlist(holder.binding.subsector,s.Code);

                    }
                }
            });
            View.OnFocusChangeListener focusChangeListener = new View.OnFocusChangeListener() {
                @Override
                public void onFocusChange(View view, boolean b) {
                    if (b == false) {

                        Loan_Request t = holder.binding.getLoan();

                        new saveAsyncTask().execute(t);
                        notifyItemChanged(position, t);

                        //} catch (Exception ex) {
                        //   ex.printStackTrace();
                        //}


                    } else {
                        if (view.getId() == binding.Loantype.getId())
                            binding.Loantype.showDropDown();
                        if (view.getId() == binding.sector.getId())
                            binding.sector.showDropDown();
                        if (view.getId() == binding.subsector.getId())
                            binding.subsector.showDropDown();
                    }
                }
            };
            holder.binding.Amountapplied.setOnFocusChangeListener(focusChangeListener);
            holder.binding.memberNo.setOnFocusChangeListener(focusChangeListener);
            holder.binding.Loantype.setOnFocusChangeListener(focusChangeListener);
            holder.binding.subsector.setOnFocusChangeListener(focusChangeListener);
            holder.binding.sector.setOnFocusChangeListener(focusChangeListener);

            holder.binding.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Loan_Request t = holder.binding.getLoan();
                    loanRequests.remove(t);

                    new deleteadvance().execute(t);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());

                }
            });

            holder.bind(current);
        }
        @Override
        public void onEditTextChanged(String planetName) {
        }

        private class deleteadvance extends AsyncTask<Loan_Request, Void, Void> {
            @Override
            protected Void doInBackground(Loan_Request... advance) {
                try {
                    d.delete(advance[0]);
                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }

        }
        private class saveAsyncTask extends AsyncTask<Loan_Request, Void, Void> {
            @Override
            protected Void doInBackground(Loan_Request... advance) {
                try {

                    Log.i("Saved", String.valueOf(d.Insert(advance[0])));

                } catch (Exception e) {
                    e.printStackTrace();
                }
                return null;
            }
        }

        @Override
        public int getItemCount() {
            return loanRequests.size();
        }

        public void sett_line(List<Loan_Request> advance) {
            this.loanRequests = advance;
            notifyDataSetChanged();
        }

        class Holder extends RecyclerView.ViewHolder {
            private Loanrequest binding;


            public Holder( Loanrequest itemView) {
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

            public void bind(Loan_Request object) {
                binding.setLoan(object);
                binding.executePendingBindings();
            }

            public Loanrequest getdata() {
                return binding;
            }


        }

        public interface OnItemClickListener {
            void onItemClick(Loan_Request note);
        }

        public void setOnItemClickListener(Loan_Request.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
        private class getloantypes extends AsyncTask<Void, Void, List<Loan_products>> {
            @Override
            protected List<Loan_products> doInBackground(Void... advance) {
                List<Loan_products> lp = new ArrayList<>();
                try {
                    loan_products = lpdao.getAll();
                    sectors = sdao.getAll();
                    sub_sectors = sbdao.getAll();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return lp;
            }

            @Override
            protected void onPostExecute(List<Loan_products> res) {
                System.out.println("binding");



            }
        }
    }

    public static class Model extends AndroidViewModel {
        public Transaction t;
        Loan_Request.dao Dao;
        public Repository repository;
        private List<Loan_Request> all;

        public Model(@NonNull Application application) {
            super(application);
            DB db = DB.getInstance(application);
            repository = new Repository(application);
            Dao = db.lrdao();
        }
        public List<Loan_Request> unsent() {
            return repository.unsent();
        }
        public void update(Loan_Request l){
            repository.update(l);
        }
        public List<Loan_Request> getAll() {
            return Dao.All();
        }

        public void insert(Loan_Request t) {
            new Loan_Request.Model.InsertAsyncTask(Dao).execute(t);

        }
        public void bindautocomplete(AutoCompleteTextView h, String data) {
             repository.bindautocomplete(h,data);
        }
        private class InsertAsyncTask extends AsyncTask<Loan_Request, Void, Void> {
            private Loan_Request.dao Dao;

            private InsertAsyncTask(Loan_Request.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_Request... notes) {
                long l = Dao.Insert(notes[0]);
                Log.i("insert", String.valueOf(l));
                return null;
            }
        }
    }

    public static class Repository {
        private static dao Dao;
        private LiveData<List<Loan_Request>> All;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.lrdao();
            All = Dao.getAll();
        }

        public List<Loan_Request> unsent() {
            return Dao.unsent();
        }

        public void insert(Loan_Request member) {
            new InsertMemberAsyncTask(Dao).execute(member);
        }

        public void insert(List<Loan_Request> member) {
            new InsertMembersAsyncTask(Dao).execute(member);
        }

        public void update(Loan_Request member) {
            new UpdateMemberAsyncTask(member).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }

        public void delete(Loan_Request member) {
            new DeleteMemberAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Loan_Request>> allMembers() {
            return All;
        }

        private class InsertMemberAsyncTask extends AsyncTask<Loan_Request, Void, Void> {
            private Loan_Request.dao Dao;

            private InsertMemberAsyncTask(Loan_Request.dao memberDao) {
                this.Dao = memberDao;
            }

            @Override
            protected Void doInBackground(Loan_Request... members) {
                Dao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Loan_Request>, Void, Void> {
            private Loan_Request.dao Dao;

            private InsertMembersAsyncTask(Loan_Request.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(List<Loan_Request>... members) {
                Dao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Void, Void, Void> {
            private Loan_Request l;

            private UpdateMemberAsyncTask(Loan_Request l) {
                this.l = l;
            }

            @Override
            protected Void doInBackground(Void... members) {
                Dao.Update(l);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Loan_Request, Void, Void> {
            private Loan_Request.dao Dao;

            private DeleteMemberAsyncTask(Loan_Request.dao Dao) {
                this.Dao = Dao;
            }

            @Override
            protected Void doInBackground(Loan_Request... members) {
                Dao.delete(members[0]);
                return null;
            }
        }

        public void bindautocomplete(AutoCompleteTextView h, String data) {
            new bind(h).execute(data);
        }

        private class bind extends AsyncTask<String, Void, List<Loan_Request>> {
            AutoCompleteTextView h;

            public bind(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Loan_Request> doInBackground(String... advance) {

                List<Loan_Request> n = new ArrayList<>();
                try {
                    if (!advance[0].contentEquals(""))
                        n = Dao.All().stream().filter(o -> o.Member_Code.equals(advance[0])).collect(Collectors.toList());
                    else
                        n = Dao.All();

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Loan_Request> res) {

                simpleadapter adapter = new simpleadapter(app.getApplicationContext(), R.layout.requestlist, res);
                h.setAdapter(adapter);

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Loan_Request> groups;
        private List<Loan_Request> tempItems;
        private List<Loan_Request> suggestions;

        public simpleadapter(Context context, int resource, List<Loan_Request> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Loan_Request>(items);
            suggestions = new ArrayList<Loan_Request>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.groupname);
            TextView branchname = view.findViewById(R.id.membername);
            TextView memberno = view.findViewById(R.id.Pawdepno);
            Loan_Request item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.Group_Name);
            branchname.setText(item.Member_Name);
            memberno.setText(item.Member_Code);
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
                Loan_Request str = (Loan_Request) resultValue;
                return str.Request_No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Loan_Request names : tempItems) {
                        if (names.Member_Name != null)
                            if (names.Member_Name.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }


                        if (names.Member_Code != null)
                            if (names.Member_Code.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }

                        if (names.Group_Name != null)
                            if (names.Group_Name.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
                        if (names.Request_No != null)
                            if (names.Request_No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                                continue;
                            }
                    }

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
                    List<Loan_Request> filterList = (ArrayList<Loan_Request>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Loan_Request item : filterList) {
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
}



