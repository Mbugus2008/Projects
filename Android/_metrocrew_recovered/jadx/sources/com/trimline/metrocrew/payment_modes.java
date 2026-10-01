package com.trimline.metrocrew;

import android.app.Application;
import android.os.AsyncTask;
import androidx.lifecycle.AndroidViewModel;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class payment_modes {
    public String Code;
    public String Name;

    public static abstract class dao {
        abstract void delete(payment_modes entity);

        abstract void deleteall();

        abstract List<payment_modes> getall();

        abstract void insert(payment_modes entity);

        abstract void update(payment_modes entity);
    }

    public String toString() {
        return this.Name;
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.pdao();
        }

        public List<payment_modes> getall() {
            return this.dao.getall();
        }

        public void insert(payment_modes payment_modes) {
            new Insertpayment_modesAsyncTask(this.dao).execute(payment_modes);
        }

        public void update(payment_modes payment_modes) {
            new Updatepayment_modesAsyncTask(this.dao).execute(payment_modes);
        }

        public void delete(payment_modes payment_modes) {
            new Deletepayment_modesAsyncTask(this.dao).execute(payment_modes);
        }

        private class Insertpayment_modesAsyncTask extends AsyncTask<payment_modes, Void, Void> {
            private dao dao;

            private Insertpayment_modesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(payment_modes... payment_modess) {
                this.dao.insert(payment_modess[0]);
                return null;
            }
        }

        private class Updatepayment_modesAsyncTask extends AsyncTask<payment_modes, Void, Void> {
            private dao dao;

            private Updatepayment_modesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(payment_modes... payment_modess) {
                this.dao.update(payment_modess[0]);
                return null;
            }
        }

        private class Deletepayment_modesAsyncTask extends AsyncTask<payment_modes, Void, Void> {
            private dao dao;

            private Deletepayment_modesAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(payment_modes... payment_modess) {
                this.dao.delete(payment_modess[0]);
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

        public void insert(payment_modes payment_modes) {
            this.repository.insert(payment_modes);
        }

        public void update(payment_modes payment_modes) {
            this.repository.update(payment_modes);
        }

        public void delete(payment_modes payment_modes) {
            this.repository.delete(payment_modes);
        }

        public List<payment_modes> getall() {
            return this.repository.getall();
        }
    }
}
