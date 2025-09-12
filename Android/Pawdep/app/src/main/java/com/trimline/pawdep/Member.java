package com.trimline.pawdep;


import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;

import com.trimline.pawdep.databinding.Grouplist;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.recyclerview.widget.RecyclerView;
import androidx.room.ColumnInfo;
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

/**
 * Created by Paul on 11-Dec-16.
 */

@Entity(tableName = "Members")
public class Member implements Serializable {
    @Ignore
    public String Key;
    @PrimaryKey
    @NonNull
    public String No;
    public String Name;
    public String Phone_No;
    public String Group_No;
    public String Branch_Code;
    public String DOB;
    public String ID_No;
    public int Status;
    public int Account_Category;
    public double Member_Deposits;
    public double Group_Savings;
    public String Group_Name;
    public String GID;
    public int getMemberNo() {
        int r =0;
        try {
            r=  Integer.valueOf(GID);
        }catch (Exception e){}
        return  r;
    }
    public void setMemberNo(int memberNo) {
        MemberNo = memberNo;
    }
    @Ignore
    public int MemberNo;
    public float Share_Capital ;
    public float Total_Loans ;
    public float Minimum_Required;
    public int Loans_Guaranteed;
    public float Mabawa_Balance;
    @Ignore
    public float Principle_Paid;
    @Ignore
    public float Interest_Paid;
    @Ignore
    public float Monthly_Savings;
    @Ignore
    public float Fines;
    @Ignore
    public float Unpaid_Penalty;
    @Ignore
    public float Penalty_Charged;
    @Ignore
    public float Hall;
    @Ignore
    public float Total;


    @Ignore
    public float Advance_Fees;
    @Ignore
    public float Advance_Paid;

    @Ignore
    public float Loan_Paid;

    @Ignore
    public float Advance_Principle_Paid;
    @Ignore
    public float Advance_Interest_Paid;
    @Ignore
    public float Penalty;

    @Ignore
    public List<PW_Transactions> othertrans;
    @Ignore
    public float Advances_Issued;

    @Ignore
    public String Transaction_No;

    @Ignore
    public String StringDate;

    @Ignore
    public float Advance_Penalty;

    @ColumnInfo(defaultValue = "0")
    public int update =0;

    public int getGender() {
        Genderr = gender.values()[Gender].name();
        return Gender;
    }

    public void setGender(int gender) {
        Gender = gender;
    }

    public int Gender ;

    public String getGenderr() {
        return Genderr;
    }

    public void setGenderr(String genderr) {
        Gender = gender.valueOf(genderr).ordinal();

        Genderr = genderr;
    }
@Ignore
    public String Genderr ;

    public enum gender {

        /// <remarks/>
        Female,

        /// <remarks/>
        Male,
    }
    public enum status {
        /// <remarks/>
        Active(0),

        /// <remarks/>
        Non_Active(1),

        /// <remarks/>
        Blocked(2),

        /// <remarks/>
        Dormant(3),

        /// <remarks/>
        Re_instated(4),

        /// <remarks/>
        Deceased(5),

        /// <remarks/>
        Withdrawal(6),

        /// <remarks/>
        Retired(7),

        /// <remarks/>
        Termination(8),

        /// <remarks/>
        Resigned(9),

        /// <remarks/>
        Ex_Company(10),

        /// <remarks/>
        Casuals(11),

        /// <remarks/>
        Family_Member(12),

        /// <remarks/>
        Defaulter(13),

        /// <remarks/>
        Closed(14),

        /// <remarks/>
        Suspended(15);
        private int code;

        status(int code) {
            this.code = code;
        }

        public int getCode() {
            return code;
        }

    }

    public enum account_Category {

        /// <remarks/>
        Group,

        /// <remarks/>
        Individual,

        /// <remarks/>
        Non_Member,
    }


    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Member t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Member> t);

        @Update
        void Update(Member t);

       @Query("Delete from members where `No` =:no")
        void delete(String no);

        @Query("SELECT * FROM members")
        LiveData<List<Member>> getAll();

        @Query("SELECT * FROM members")
        List<Member> All();

        @Query("SELECT * FROM members where Group_Name =:group")
        List<Member> getbygroupmembers(String group);

        @Query("SELECT * FROM members where `No` =:no")
        Member getmember(String no);

        @Query("select distinct Group_No from members")
        List<String> groups();
        @Query("select * from members where `update` = 1 ")
        List<Member> getnewmembers();
    }

    public static class adapter extends RecyclerView.Adapter<adapter.MemberHolder> {
        private List<Member> members = new ArrayList<>();
        private Member.adapter.OnItemClickListener listener;

        @NonNull
        @Override
        public MemberHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            Grouplist binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.grouplistitem, parent, false);
            return new MemberHolder(binding);
        }

        @Override
        public void onBindViewHolder(@NonNull MemberHolder holder, int position) {
            Member currentMember = members.get(position);
            holder.bind(currentMember);
        }

        @Override
        public int getItemCount() {
            return members.size();
        }

        public void setmember(List<Member> members) {
            this.members = members;
            notifyDataSetChanged();
        }

        class MemberHolder extends RecyclerView.ViewHolder {
            private Grouplist binding;

            public MemberHolder(Grouplist itemView) {
                super(itemView.getRoot());
                this.binding = itemView;
                itemView.getRoot().setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        int position = getAdapterPosition();
                        if (listener != null && position != RecyclerView.NO_POSITION) {
                            listener.onItemClick(members.get(position));
                        }
                    }
                });

            }

            public void bind(Member object) {

                //binding.setTransaction(object);
                //  binding.executePendingBindings();
            }

        }

        public interface OnItemClickListener {
            void onItemClick(Member member);
        }

        public void setOnItemClickListener(Member.adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }

    public static class Model extends AndroidViewModel {

        Repository repository;
        private LiveData<List<Member>> all;
public  List<Loan> memberloans;
        public Model(@NonNull Application application) {
            super(application);
            repository = new Repository(application);
            all = repository.allMembers();
        }
        public  void members(AutoCompleteTextView h, String groupname) {

            repository.members(h,groupname);
        }
        public void getgroupmembers(AutoCompleteTextView a, String groupname) {
            repository.members(a,groupname);
        }

        public List<Member> getAll() {
            return all.getValue();
        }
        public Member getmember(String no){
                    return repository.getmember(no);
        }
        public void insert(List<Member> m) {
            repository.insert(m);
        }
        public void insert(Member m) {
            repository.insert(m);
        }
        public void update(Member m) {
            repository.update(m);
        }
        public List<Member> Groupmembers(String group) {
            return repository.GroupMembers(group);
        }
    }

    public static class Repository {
        private static dao Dao;
        private LiveData<List<Member>> allMembers;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.memberDao();
            allMembers = Dao.getAll();
        }

        public Member getmember(String no) {
            return Dao.getmember(no);
        }

        public void insert(Member member) {
            new InsertMemberAsyncTask(Dao).execute(member);
        }

        public void insert(List<Member> member) {
            new InsertMembersAsyncTask(Dao).execute(member);
        }

        public void update(Member member) {
            new UpdateMemberAsyncTask(Dao).execute(member);
        }

        public void delete(Member member) {
            new DeleteMemberAsyncTask(Dao).execute(member);
        }

        public LiveData<List<Member>> allMembers() {
            return allMembers;
        }

        public List<Member> GroupMembers(String Groupname) {
            return allMembers.getValue().stream().filter(o -> o.Group_Name.contentEquals(Groupname)).collect(Collectors.toList());
        }

        private class InsertMemberAsyncTask extends AsyncTask<Member, Void, Void> {
            private Member.dao memberDao;

            private InsertMemberAsyncTask(Member.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Member... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Member>, Void, Void> {
            private Member.dao memberDao;

            private InsertMembersAsyncTask(Member.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Member>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Member, Void, Void> {
            private Member.dao memberDao;

            private UpdateMemberAsyncTask(Member.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Member... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Member, Void, Void> {
            private Member.dao memberDao;

            private DeleteMemberAsyncTask(Member.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Member... members) {
                memberDao.delete(members[0].No);
                return null;
            }
        }

        public void members(AutoCompleteTextView h, String groupname) {
            new getgroupmembers(h).execute(groupname);
        }

        private class getgroupmembers extends AsyncTask<String, Void, List<Member>> {
            AutoCompleteTextView h;

            public getgroupmembers(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Member> doInBackground(String... advance) {

                List<Member> n = new ArrayList<>();
                try {
                    if (advance[0].contentEquals(""))
                        n = Dao.All();
                    else
                        n = Dao.getbygroupmembers(advance[0]);

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Member> res) {

                Member.simpleadapter adapter = new Member.simpleadapter(app.getApplicationContext(), R.layout.membernames, res);
                h.setAdapter(adapter);

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Member> groups;
        private List<Member> tempItems;
        private List<Member> suggestions;

        public simpleadapter(Context context, int resource, List<Member> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Member>(items);
            suggestions = new ArrayList<Member>();
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            View view = convertView;
            if (convertView == null) {
                LayoutInflater inflater = (LayoutInflater) context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
                view = inflater.inflate(resource, parent, false);
            }

            TextView groupname = view.findViewById(R.id.groupname);
            TextView branchname = view.findViewById(R.id.branchname);
            TextView memberno = view.findViewById(R.id.memberNo);
            Member item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.No);
            branchname.setText(item.Name);
            memberno.setText(item.GID);
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
                Member str = (Member) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Member names : tempItems) {
                        if (names.Name != null) {
                            if (names.Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);
                        }
                        if (names.No != null) {
                            if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                            }
                        }
                        if (String.valueOf(names.GID) != null) {
                            if (String.valueOf(names.GID).contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                            }
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
                    List<Member> filterList = (ArrayList<Member>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Member item : filterList) {
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
