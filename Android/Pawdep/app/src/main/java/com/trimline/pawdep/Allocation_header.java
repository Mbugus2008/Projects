package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.databinding.BaseObservable;
import androidx.databinding.Bindable;
import androidx.databinding.DataBindingUtil;
import androidx.databinding.ObservableArrayList;
import androidx.databinding.ObservableList;
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
import androidx.room.Transaction;
import androidx.room.TypeConverters;
import androidx.room.Update;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;
import com.trimline.pawdep.databinding.Allocations_binding;
import com.trimline.pawdep.databinding.Grouplist;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Nonnull;

import static android.content.Context.MODE_PRIVATE;

@Entity(tableName = "Allocation_header")
public class Allocation_header  extends BaseObservable implements  Serializable {

    public String Key;
    @PrimaryKey
    @NonNull
    public String No;
    @TypeConverters(Converters.class)
    public java.sql.Date Allocation_Date;
    public Boolean Allocation_DateSpecified;

    @Bindable
    public String getPawdep_No() {
        return Pawdep_No;
    }

    public void setPawdep_No(String pawdep_No) {
        Pawdep_No = pawdep_No;
        notifyPropertyChanged(BR.pawdep_No);
    }

    public String Pawdep_No;
    public String Member_Names;
    public String Allocated_By;
    public String Allocation_Description;
    public Statuss Status;
    public Boolean StatusSpecified;
    public String Document_No;
    public Boolean Posted;
    public Boolean PostedSpecified;
    public String No_series;
    public String Captured_by;
    @Bindable
    public double getAmount() {
        return Amount;
    }

    public void setAmount(double amount) {
        Amount = amount;
        notifyPropertyChanged(BR.amount);
    }

    public double Amount;
    public Boolean AmountSpecified;
    public double Line_Amount;
    public Boolean Line_AmountSpecified;
    public String Group_Code;
    public String Group_Name;
    public String Branch_Code;
    public String Branch_Name;
@Bindable
    public String getMember_No() {
        return Member_No;
    }

    public void setMember_No(String member_No) {
        Member_No = member_No;
        notifyPropertyChanged(BR.member_No);
    }

    public String Member_No;
@Bindable
    public Date getAllocation_Date() {
        return Allocation_Date;
    }

    public void setAllocation_Date(Date allocation_Date) {
        Allocation_Date = allocation_Date;
        notifyPropertyChanged(BR.allocation_Date);
    }
@Bindable
    public String getMember_Names() {
        return Member_Names;
    }

    public void setMember_Names(String member_Names) {
        Member_Names = member_Names;
        notifyPropertyChanged(BR.member_Names);
    }

    public String getDocument_No() {
        return Document_No;
    }

    public void setDocument_No(String document_No) {
        Document_No = document_No;
    }

    public String getGroup_Code() {
        return Group_Code;
    }

    public void setGroup_Code(String group_Code) {
        Group_Code = group_Code;
    }
@Bindable
    public String getGroup_Name() {
        return Group_Name;
    }

    public void setGroup_Name(String group_Name) {
        Group_Name = group_Name;notifyPropertyChanged(BR.group_Name);
    }

    @Bindable
    public String getTransaction_No() {
        return Transaction_No;
    }

    public void setTransaction_No(String transaction_No) {
        Transaction_No = transaction_No;
        notifyPropertyChanged(BR.transaction_No);
    }

    public Categorys getCategory() {
        return Category;
    }

    public void setCategory(Categorys category) {
        Category = category;
    }

    @Bindable
    public String getTransaction_Description() {
        return Transaction_Description;
    }

    public void setTransaction_Description(String transaction_Description) {
        Transaction_Description = transaction_Description;
        notifyPropertyChanged(BR.transaction_Description);
    }

    public String Transaction_No;
    public String Transaction_Description;
    public String ID_No;
    public Categorys Category;
    public Boolean CategorySpecified;
    public String Unidentified_Transaction_No;


    public ObservableArrayList<Allocation_Line> getAllocation_lines() {
        return allocation_lines;
    }

    public void setAllocation_lines(ObservableArrayList<Allocation_Line> allocation_lines) {
        this.allocation_lines = allocation_lines;
    }

    @Ignore
    public ObservableArrayList<Allocation_Line> allocation_lines;
    @Bindable
    public double getAmount_Distributed() {
        return Amount_Distributed;
    }
    public void setAmount_Distributed(double amount_Distributed) {
        Amount_Distributed = amount_Distributed;
        notifyPropertyChanged(BR.amount_Distributed);
    }

    @Ignore
    public double Amount_Distributed;

    public enum Statuss {

        /// <remarks/>
        @SerializedName("0")
        None,

        /// <remarks/>
        @SerializedName("1")
        Pending,

        /// <remarks/>
        @SerializedName("2")
        Approved,
    }

    public enum Categorys {
        /// <remarks/>
        @SerializedName("0")
        Identified,
        /// <remarks/>
        @SerializedName("1")
        Unidentified,
    }

    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Allocation_header t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void Insertall(Iterable<Allocation_header> t);
        @Update
        int Update(Allocation_header t);
        @Delete
        void delete(Allocation_header t);
        @Query("SELECT * FROM Allocation_header order by 'No' asc")
        LiveData<List<Allocation_header>> getAll();
        @Query("SELECT * FROM Allocation_Line where `No` =:no")
        LiveData<List<Allocation_Line>> getlines(String no);
        @Transaction
        @Query("SELECT * FROM allocation_header")
        abstract List<all_lines> allocation_n_lines();
    }
    public static class Allocation_headeradapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Allocation_header> groups;
        private List<Allocation_header> tempItems;
        private List<Allocation_header> suggestions;

        public Allocation_headeradapter(Context context, int resource, List<Allocation_header> items) {
            super(context, resource, 0, items);
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Allocation_header>(items);
            suggestions = new ArrayList<Allocation_header>();
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
            Allocation_header item = groups.get(position);

            groupname.setText(item.No);
            branchname.setText(item.Allocation_Description);


            return view;
        }

        @Override
        public Filter getFilter() {
            return nameFilter;
        }

        Filter nameFilter = new Filter() {
            @Override
            public CharSequence convertResultToString(Object resultValue) {
                Allocation_header str = (Allocation_header) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Allocation_header names : tempItems) {
                        if (names.Allocation_Description != null)
                            if (names.Allocation_Description.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);

                            else if (names.No != null)
                                if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                    suggestions.add(names);
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
                    List<Allocation_header> filterList = (ArrayList<Allocation_header>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Allocation_header item : filterList) {
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
        public  Allocation_header current;
        Repository repository;


        public List<Allocation_Line> currentlines = new ArrayList<>();



        private LiveData<List<Allocation_header>> all;

        public Model(@NonNull Application application) {
            super(application);
            repository = new Allocation_header.Repository(application);
            all = repository.getall();


        }

        public LiveData<List<Allocation_header>> getall() {
            return all;
        }

        public void insert(Allocation_header a) {
            repository.insert(a);
        }

        public void update(Allocation_header a) {
            repository.update(a);
        }
    }

    public static class Repository {
        private static Allocation_header.dao Dao;
        private LiveData<List<Allocation_header>> all;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.allheaderdao();
            all = Dao.getAll();

        }


        public LiveData<List<Allocation_header>> getall() {
            return all;
        }

        public void insert(Allocation_header a) {
            new insert(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        public void update(Allocation_header a) {
            new update(a).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        }
        private class insert extends AsyncTask<Void, Void, Void> {
            private Allocation_header a;
            public insert(Allocation_header aa) {
                this.a = aa;
            }
            @Override
            protected Void doInBackground(Void... m) {
                Dao.Insert(a);
                return null;
            }
        }
        private class update extends AsyncTask<Void, Void, Void> {
            private Allocation_header a;
            public update(Allocation_header aa) {
                this.a = aa;
            }

            @Override
            protected Void doInBackground(Void... m) {
                Log.i("Updating", new Gson().toJson(a));
                Dao.Update(a);
                return null;
            }
        }
    }

    public static class adapter extends RecyclerView.Adapter<Allocation_header.adapter.NoteHolder> {
        private List<Allocation_header> notes = new ArrayList<>();
        Allocations_binding binding;
        boolean isFABOpen = false;
        private Allocation_header.adapter.OnItemClickListener listener;
        Allocation_Line.Model alinemodel;
        Context c;

        public adapter(Context cc, Allocation_Line.Model alm) {

            this.c = cc;
            this.alinemodel = alm;
        }

        @NonNull
        @Override
        public adapter.NoteHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {

            this.binding = DataBindingUtil.inflate(
                    LayoutInflater.from(parent.getContext()),
                    R.layout.all_line, parent, false);

            return new adapter.NoteHolder(binding);
        }

        @Override
        public void onBindViewHolder(@NonNull Allocation_header.adapter.NoteHolder holder, int position) {

            Allocation_header currentNote = notes.get(position);
            holder.bind(currentNote);
            if (currentNote.Posted != null){
                if (currentNote.Posted == true) {
                    holder.grouptrans.setBackgroundResource(R.drawable.backgroundposted);
                   // holder.clear.setVisibility(View.GONE);
                    holder.clear.setImageDrawable(c.getDrawable(R.drawable.print));
                } //else
                    //holder.clear.setVisibility(View.VISIBLE);
        } //else
            //    holder.clear.setVisibility(View.VISIBLE);

            holder.clear.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                   if (currentNote.Posted == false){
                    notes.remove(currentNote);
                    //     repo.delete(currentNote);
                    notifyItemRemoved(position);
                    notifyItemRangeChanged(position, getItemCount());}
                    else {
                       new getlines(currentNote,alinemodel).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                    }
                }
            });

        }

        private class getlines extends AsyncTask<Void, Void, List<Allocation_Line>> {
            private Allocation_header a;
            private Allocation_Line.Model alm;

            public getlines(Allocation_header aa
                    , Allocation_Line.Model m) {
                this.a = aa;
                this.alm = m;
            }

            @Override
            protected List<Allocation_Line> doInBackground(Void... m) {
                return alm.getlines(a.No);

            }

            @Override
            protected void onPostExecute(List<Allocation_Line> allocation_lines) {
                if (allocation_lines!=null)
                    if(allocation_lines.size()>0){
                        ObservableArrayList<Allocation_Line> alines = new ObservableArrayList<>();
                        alines.addAll(0,allocation_lines);
                        a.allocation_lines= alines;
                    Printer.printer p = new Printer.printer();
                SharedPreferences preferences =c.getSharedPreferences("Settings", MODE_PRIVATE);
                JsonParser.preferences = preferences;
                p.printallocation(a);}
            }
        }
            @Override
        public int getItemCount() {
            return notes.size();
        }

        public Allocation_header getTransAt(int position) {
            return notes.get(position);
        }

        public void setTrans(List<Allocation_header> notes) {
            this.notes = notes;
            notifyDataSetChanged();
        }

        class NoteHolder extends RecyclerView.ViewHolder {
            private Allocations_binding binding;
            ConstraintLayout grouptrans;
            ImageView clear;

            public NoteHolder(Allocations_binding itemView) {
                super(itemView.getRoot());
                this.binding = itemView;
                clear = itemView.getRoot().findViewById(R.id.clear);
                grouptrans = (ConstraintLayout) itemView.getRoot().findViewById(R.id.all_container);
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

            public void bind(Allocation_header object) {
                binding.setAll(object);
                binding.executePendingBindings();
            }
        }

        public interface OnItemClickListener {
            void onItemClick(Allocation_header note);
        }

        public void setOnItemClickListener(adapter.OnItemClickListener listener) {
            this.listener = listener;
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Allocation_header> groups;
        private List<Allocation_header> tempItems;
        private List<Allocation_header> suggestions;

        public simpleadapter(Context context, int resource, List<Allocation_header> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Allocation_header>(items);
            suggestions = new ArrayList<Allocation_header>();
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
            Allocation_header item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.No);
            branchname.setText(item.Allocation_Description);
            memberno.setText(item.Document_No);
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
                Allocation_header str = (Allocation_header) resultValue;
                return str.No;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Allocation_header names : tempItems) {
                        if (names.Allocation_Description != null) {
                            if (names.Allocation_Description.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);
                        }
                        if (names.No != null) {
                            if (names.No.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                suggestions.add(names);
                            }
                        }
                        if (String.valueOf(names.Document_No) != null) {
                            if (String.valueOf(names.Document_No).contains(constraint.toString().toLowerCase())) {
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
                    List<Allocation_header> filterList = (ArrayList<Allocation_header>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Allocation_header item : filterList) {
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
