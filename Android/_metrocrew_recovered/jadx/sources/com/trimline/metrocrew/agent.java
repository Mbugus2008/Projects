package com.trimline.metrocrew;

import android.app.Application;
import android.os.AsyncTask;
import androidx.lifecycle.AndroidViewModel;
import java.util.List;

/* JADX INFO: loaded from: classes5.dex */
public class agent {
    public String Account;
    public int Account_type;
    public String Agent_Code;
    public double Balance;
    public String Constituency;
    public String Customer_ID_No;
    public String Mobile_No;
    public String Name;
    public String Password;
    public int Status;

    public static abstract class dao {
        abstract void delete(agent entity);

        abstract agent getagent(String agentcode, String pass);

        abstract List<agent> getagents();

        abstract void insert(agent entity);

        abstract void update(agent entity);
    }

    public static class Repository {
        private dao dao;

        public Repository(Application application) {
            DB database = DB.getInstance(application);
            this.dao = database.aDao();
        }

        public agent getagent(agent agent) {
            return this.dao.getagent(agent.Agent_Code.toUpperCase(), agent.Password);
        }

        public void insert(agent agent) {
            new InsertagentAsyncTask(this.dao).execute(agent);
        }

        public void update(agent agent) {
            new UpdateagentAsyncTask(this.dao).execute(agent);
        }

        public void delete(agent agent) {
            new DeleteagentAsyncTask(this.dao).execute(agent);
        }

        private class InsertagentAsyncTask extends AsyncTask<agent, Void, Void> {
            private dao dao;

            private InsertagentAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(agent... agents) {
                this.dao.insert(agents[0]);
                return null;
            }
        }

        private class UpdateagentAsyncTask extends AsyncTask<agent, Void, Void> {
            private dao dao;

            private UpdateagentAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(agent... agents) {
                this.dao.update(agents[0]);
                return null;
            }
        }

        private class DeleteagentAsyncTask extends AsyncTask<agent, Void, Void> {
            private dao dao;

            private DeleteagentAsyncTask(dao dao) {
                this.dao = dao;
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // android.os.AsyncTask
            public Void doInBackground(agent... agents) {
                this.dao.delete(agents[0]);
                return null;
            }
        }
    }

    public static class Model extends AndroidViewModel {
        public static agent CurrentAgent;
        private Repository repository;

        public Model(Application application) {
            super(application);
            this.repository = new Repository(application);
        }

        public void insert(agent agent) {
            this.repository.insert(agent);
        }

        public void update(agent agent) {
            this.repository.update(agent);
        }

        public void delete(agent agent) {
            this.repository.delete(agent);
        }

        public agent agent(agent agent) {
            return this.repository.getagent(agent);
        }
    }
}
