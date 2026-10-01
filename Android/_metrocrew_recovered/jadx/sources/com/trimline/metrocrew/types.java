package com.trimline.metrocrew;

import android.app.Application;
import android.os.AsyncTask;
import androidx.lifecycle.AndroidViewModel;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class types {
    public String Account;
    public Boolean Active;
    public String Code;
    public String Name;
    public int Order;

    public static abstract class dao {
        abstract void delete(types entity);

        abstract void deleteall();

        abstract List<types> getypes();

        abstract void insert(types entity);

        abstract void update(types entity);
    }

    public String toString() {
        return this.Name;
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.trandao();
        }

        public List<types> gettypes() {
            return this.dao.getypes();
        }

        public void insert(types types) {
            new InserttypesAsyncTask(this.dao).execute(types);
        }

        public void update(types types) {
            new UpdatetypesAsyncTask(this.dao).execute(types);
        }

        public void delete(types types) {
            new DeletetypesAsyncTask(this.dao).execute(types);
        }

        private class InserttypesAsyncTask extends AsyncTask<types, Void, Void> {
            private dao dao;

            private InserttypesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(types... typess) {
                this.dao.insert(typess[0]);
                return null;
            }
        }

        private class UpdatetypesAsyncTask extends AsyncTask<types, Void, Void> {
            private dao dao;

            private UpdatetypesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(types... typess) {
                this.dao.update(typess[0]);
                return null;
            }
        }

        private class DeletetypesAsyncTask extends AsyncTask<types, Void, Void> {
            private dao dao;

            private DeletetypesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(types... typess) {
                this.dao.delete(typess[0]);
                return null;
            }
        }
    }

    public static class Model extends AndroidViewModel {
        private Repository repository;

        public Model(Application application) {
            super(application);
            this.repository = new Repository(application);
        }

        public void insert(types types) {
            this.repository.insert(types);
        }

        public void update(types types) {
            this.repository.update(types);
        }

        public void delete(types types) {
            this.repository.delete(types);
        }

        public List<types> getalltypes() {
            return this.repository.gettypes();
        }
    }
}
