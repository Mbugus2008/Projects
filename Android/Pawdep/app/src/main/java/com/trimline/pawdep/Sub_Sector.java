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
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import java.util.ArrayList;
import java.util.List;
@Entity(primaryKeys = {"Code","Sector"})
public class Sub_Sector {
    public String Key;
    @NonNull
    public String Code;
    public String Description;
    @NonNull
    public String Sector;
    @Override
    public String toString(){return Code;}

    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Sub_Sector t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Sub_Sector> t) ;
        @Update
        int Update(Sub_Sector t);
        @Delete
        void delete(Sub_Sector t);
        @Query("SELECT * FROM Sub_Sector")
        List<Sub_Sector> getAll();
        @Query("SELECT * FROM Sub_Sector where Sector =:s")
        List<Sub_Sector> getbysector(String s);
    }

    public static class Repository {
        private static dao Dao;

        static Application app;

        public Repository(Application application) {
            this.app = application;
            DB database = DB.getInstance(application);
            Dao = database.sbdao();

        }

        public void insert(Sub_Sector Sub_Sector) {
            new InsertMemberAsyncTask(Dao).execute(Sub_Sector);
        }

        public void insert(List<Sub_Sector> Sub_Sector) {
            new InsertMembersAsyncTask(Dao).execute(Sub_Sector);
        }

        public void update(Sub_Sector Sub_Sector) {
            new UpdateMemberAsyncTask(Dao).execute(Sub_Sector);
        }

        public void delete(Sub_Sector Sub_Sector) {
            new DeleteMemberAsyncTask(Dao).execute(Sub_Sector);
        }


        private class InsertMemberAsyncTask extends AsyncTask<Sub_Sector, Void, Void> {
            private Sub_Sector.dao memberDao;

            private InsertMemberAsyncTask(Sub_Sector.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sub_Sector... members) {
                memberDao.Insert(members[0]);
                return null;
            }
        }

        private class InsertMembersAsyncTask extends AsyncTask<List<Sub_Sector>, Void, Void> {
            private Sub_Sector.dao memberDao;

            private InsertMembersAsyncTask(Sub_Sector.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(List<Sub_Sector>... members) {
                memberDao.Insertall(members[0]);
                return null;
            }
        }

        private class UpdateMemberAsyncTask extends AsyncTask<Sub_Sector, Void, Void> {
            private Sub_Sector.dao memberDao;

            private UpdateMemberAsyncTask(Sub_Sector.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sub_Sector... members) {
                memberDao.Update(members[0]);
                return null;
            }
        }

        private class DeleteMemberAsyncTask extends AsyncTask<Sub_Sector, Void, Void> {
            private Sub_Sector.dao memberDao;

            private DeleteMemberAsyncTask(Sub_Sector.dao memberDao) {
                this.memberDao = memberDao;
            }

            @Override
            protected Void doInBackground(Sub_Sector... members) {
                memberDao.delete(members[0]);
                return null;
            }
        }
        public void bindlist(AutoCompleteTextView h, String groupname) {
            new bind(h).execute(groupname);
        }
        private class bind extends AsyncTask<String, Void, List<Sub_Sector>> {
            AutoCompleteTextView h;

            public bind(AutoCompleteTextView hh) {
                this.h = hh;
            }

            @Override
            protected List<Sub_Sector> doInBackground(String... advance) {

                List<Sub_Sector> n = new ArrayList<>();
                try {
                    if (!advance[0].equals(""))
                        n = Dao.getbysector(advance[0]);
                    else
                    n = Dao.getAll();
                    // notifyDataSetChanged();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return n;
            }

            @Override
            protected void onPostExecute(List<Sub_Sector> res) {

                Sub_Sector.simpleadapter adapter = new Sub_Sector.simpleadapter(app.getApplicationContext(), R.layout.membernames, res,true);
                h.setAdapter(adapter);

            }
        }
    }

    public static class simpleadapter extends ArrayAdapter {
        private Context context;
        private int resource;
        private List<Sub_Sector> groups;
        private List<Sub_Sector> tempItems;
        private List<Sub_Sector> suggestions;
        private boolean asdropdown;

        public simpleadapter(Context context, int resource, List<Sub_Sector> items,boolean asdropdown ) {
            super(context, resource, 0, items);
            this.asdropdown= asdropdown;
            this.context = context;
            this.resource = resource;
            this.groups = items;
            tempItems = new ArrayList<Sub_Sector>(items);
            suggestions = new ArrayList<Sub_Sector>();
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
            Sub_Sector item = groups.get(position);

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
                Sub_Sector str = (Sub_Sector) resultValue;
                return str.Code;
            }

            @Override
            protected FilterResults performFiltering(CharSequence constraint) {
                if (constraint != null) {
                    suggestions.clear();
                    for (Sub_Sector names : tempItems) {
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
                    List<Sub_Sector> filterList = (ArrayList<Sub_Sector>) results.values;
                    if (results != null && results.count > 0) {
                        clear();
                        for (Sub_Sector item : filterList) {
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
