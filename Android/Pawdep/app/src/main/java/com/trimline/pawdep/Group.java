package com.trimline.pawdep;

import android.app.Application;
import android.content.Context;
import android.os.AsyncTask;
import android.text.Html;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Filter;
import android.widget.TextView;


import java.util.ArrayList;
import java.util.List;

import androidx.annotation.NonNull;
import androidx.lifecycle.AndroidViewModel;
import androidx.lifecycle.LiveData;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

@Entity(tableName = "Groups")
public  class  Group {

    @Ignore
    public String Key;

    public void setGroup_No(@NonNull String group_No) {
        Group_No = group_No;
    }

    public void setGroup_Name(String group_Name) {
        Group_Name = group_Name;
    }

    public void setBranch_Code(String branch_Code) {
        Branch_Code = branch_Code;
    }

    public void setBranch_Name(String branch_Name) {
        Branch_Name = branch_Name;
    }

    @NonNull
    public String getGroup_No() {
        return Group_No;
    }

    public String getGroup_Name() {
        return Group_Name;
    }

    public String getBranch_Code() {
        return Branch_Code;
    }

    public String getBranch_Name() {
        return Branch_Name;
    }

    @PrimaryKey
    @NonNull
    public String Group_No;
    public String Group_Name;
    public String Branch_Code;
    public String Branch_Name;
    public String Old_Group_No;
    public java.sql.Date Start_Date;
    public float Total_Perfomance;
    public float Principal_Paid;
    public float Interest_Paid;
    public float Savings_Paid;

    @Ignore
    public String balances() {

        StringBuilder b = new StringBuilder();
        b.append(Html.fromHtml(String.format("Total Perfomance:  <b>%,2d</b>")));

        return b.toString();

    }

    @Dao
    public interface dao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Group t);

        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void insertAll(Iterable<Group> order);

        @Update
        void Update(Group t);

        @Delete
        void delete(Group t);

        @Query("SELECT * FROM groups")
        LiveData<List<Group>> getAll();
        
        @Query("SELECT * FROM groups")
        List<Group> All();
        
        @Query("select distinct * from Groups")
        List<Group> Groups();

        @Query("select Group_Name from Groups where Group_No =:groupno")
        String groupname(String groupno);
    }
    public static class Groupsadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Group> groups;
        private List<Group> tempItems;
        private List<Group> suggestions;

        public Groupsadapter(Context context, int resource, List<Group> items) {
            super(context, resource, 0, items);

            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Group>(items);
            suggestions = new ArrayList<Group>();
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
            Group item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.getGroup_Name());
            branchname.setText(item.getBranch_Name());
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
                Group str = (Group) resultValue;
                return str.Group_Name;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Group names : tempItems) {
                        if (names.Group_Name != null)
                            if (names.Group_Name.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);

//                            else if (names.Branch_Name.toLowerCase().contains(constraint.toString().toLowerCase())) {
//                                suggestions.add(names);
//                            }
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
                    List<Group> filterList = (ArrayList<Group>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Group item : filterList) {
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

        Repository repository;
        private LiveData<List<Group>> all;

        public Model(@NonNull Application application) {
            super(application);
            repository = new Repository(application);


        }

        public void getgroups(AutoCompleteTextView a) {
            repository.Groups(a);
        }


    }

    public static class Repository {
        private static dao Dao;
        private LiveData<List<Group>> all;
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.groupDao();
            Log.i("Start agent", "Group");
            all = Dao.getAll();
        }
       
        public void Groups(AutoCompleteTextView h) {
            new getgroupmembers(h).execute();
        }

        private class getgroupmembers extends AsyncTask<Void, Void, List<Group>> {
            AutoCompleteTextView h;

            public getgroupmembers(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Group> doInBackground(Void... advance) {

                List<Group> n = new ArrayList<>();
                try {
                    
                        n = Dao.All();

                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Group> res) {

               Groupsadapter adapter = new   Groupsadapter(app.getApplicationContext(), R.layout.groupnames, res);
                h.setAdapter(adapter);

            }
        }
    }
   
}
