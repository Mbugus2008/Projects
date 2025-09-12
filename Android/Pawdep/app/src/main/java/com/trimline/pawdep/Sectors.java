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

import androidx.annotation.NonNull;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Ignore;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import java.util.ArrayList;
import java.util.List;

@Entity
public class Sectors {

    public String Key;
    /// <remarks/>
    @NonNull
    @PrimaryKey
    public String Code;
    /// <remarks/>
    public String Description;
    @Ignore
    public Sub_Sector[] Sub_Sector;
    @Override
    public String toString(){return Code;}
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Sectors t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Sectors> t) ;
        @Update
        int Update(Sectors t);
        @Delete
        void delete(Sectors t);
        @Query("SELECT * FROM Sectors")
        List<Sectors> getAll();
    }
    public static class Repository {
        private static dao Dao;
     
        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.sdao();
            
        }

        public void insert(Sectors Sectors) {
            new InsertMemberAsyncTask(Dao).execute(Sectors);
        }

        public void insert(List<Sectors> Sectors) {
            new InsertMembersAsyncTask(Dao).execute(Sectors);
        }

        public void update(Sectors Sectors) {
            new UpdateMemberAsyncTask(Dao).execute(Sectors);
        }

        public void delete(Sectors Sectors) {
            new DeleteMemberAsyncTask(Dao).execute(Sectors);
        }


        private class InsertMemberAsyncTask extends AsyncTask<Sectors, Void, Void> {
            private Sectors.dao memberDao;

            private InsertMemberAsyncTask(Sectors.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sectors... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Sectors>, Void, Void> {
            private Sectors.dao memberDao;

            private InsertMembersAsyncTask(Sectors.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Sectors>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Sectors, Void, Void> {
            private Sectors.dao memberDao;

            private UpdateMemberAsyncTask(Sectors.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sectors... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Sectors, Void, Void> {
            private Sectors.dao memberDao;

            private DeleteMemberAsyncTask(Sectors.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sectors... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }
        public void bindlist(AutoCompleteTextView h, String groupname) {
            new bind(h).execute(groupname);
        }
        private class bind extends AsyncTask<String, Void, List<Sectors>> {
            AutoCompleteTextView h;

            public bind(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Sectors> doInBackground(String... advance) {

                List<Sectors> n = new ArrayList<>();
                try {

                        n = Dao.getAll();
                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Sectors> res) {

                Sectors.simpleadapter adapter = new Sectors.simpleadapter(app.getApplicationContext(), R.layout.membernames, res,true);
                h.setAdapter(adapter);

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Sectors> groups;
        private List<Sectors> tempItems;
        private List<Sectors> suggestions;
        private boolean asdropdown;

        public simpleadapter(Context context, int resource, List<Sectors> items,boolean asdropdown ) {
            super(context, resource, 0, items);
            this.asdropdown= asdropdown;
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Sectors>(items);
            suggestions = new ArrayList<Sectors>();
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
            Sectors item = groups.get(position);

//                if (item != null && view instanceof TextView)
//                {
            //  ((TextView) view).setText(item);

            groupname.setText(item.Code);
            branchname.setText(item.Description);
            memberno.setVisibility(View.GONE);
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
                Sectors str = (Sectors) resultValue;
                return str.Code;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Sectors names : tempItems) {
                        if (asdropdown)
                            suggestions.add(names);
                        else
                        {
                        if (names.Description != null)
                            if (names.Description.toLowerCase().contains(constraint.toString().toLowerCase()))
                                suggestions.add(names);
                            else if (names.Code !=null){
                                if (names.Code.toLowerCase().contains(constraint.toString().toLowerCase())) {
                                    suggestions.add(names);
                                }}
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
                    List<Sectors> filterList = (ArrayList<Sectors>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Sectors item : filterList) {
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

