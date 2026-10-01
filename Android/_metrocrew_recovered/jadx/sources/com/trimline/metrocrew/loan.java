package com.trimline.metrocrew;

import android.app.Application;
import android.os.AsyncTask;
import android.text.Html;
import androidx.lifecycle.AndroidViewModel;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class loan {
    public String Application_Date;
    public Double Balance;
    public String Client_Code;
    public String Key;
    public String Loan_No;
    public String Loan_Product_Type;
    public String Loan_Product_Type_Name;

    public static abstract class dao {
        abstract void delete(loan entity);

        public abstract List<loan> getall();

        public abstract List<loan> getmemberloans(String member);

        abstract void insert(loan entity);

        public abstract void removelclientloans(String no);

        abstract void update(loan entity);
    }

    public String toString() {
        StringBuilder l = new StringBuilder();
        if (this.Loan_No != null) {
            l.append(Html.fromHtml(String.format("<b>%s</b> - %s<br/>", this.Loan_No, this.Loan_Product_Type)).toString());
            l.append(Html.fromHtml(String.format("Balance: <b>%s</b>", String.format("%,.2f", this.Balance))).toString());
        }
        return l.toString();
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.ldao();
        }

        public List<loan> getloans() {
            return this.dao.getall();
        }

        public List<loan> getmemberloans(String s) {
            return this.dao.getmemberloans(s);
        }

        public void insert(loan loan) {
            new InsertloanAsyncTask(this.dao).execute(loan);
        }

        public void update(loan loan) {
            new UpdateloanAsyncTask(this.dao).execute(loan);
        }

        public void delete(loan loan) {
            new DeleteloanAsyncTask(this.dao).execute(loan);
        }

        private class InsertloanAsyncTask extends AsyncTask<loan, Void, Void> {
            private dao dao;

            private InsertloanAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(loan... loans) {
                this.dao.insert(loans[0]);
                return null;
            }
        }

        private class UpdateloanAsyncTask extends AsyncTask<loan, Void, Void> {
            private dao dao;

            private UpdateloanAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(loan... loans) {
                this.dao.update(loans[0]);
                return null;
            }
        }

        private class DeleteloanAsyncTask extends AsyncTask<loan, Void, Void> {
            private dao dao;

            private DeleteloanAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(loan... loans) {
                this.dao.delete(loans[0]);
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

        public void insert(loan loan) {
            this.repository.insert(loan);
        }

        public void update(loan loan) {
            this.repository.update(loan);
        }

        public void delete(loan loan) {
            this.repository.delete(loan);
        }

        public List<loan> getall() {
            return this.repository.getloans();
        }

        public List<loan> getcustomerloans(String s) {
            return this.repository.getmemberloans(s);
        }
    }
}
