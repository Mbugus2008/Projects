package com.trimline.m_branch.db.repository;

import android.os.AsyncTask;

import androidx.lifecycle.LiveData;

import com.trimline.m_branch.db.dao.B_Dao;

import java.util.List;

public class Repository<T> implements IRepository<T> {
    public final B_Dao<T> dao;

    public Repository(B_Dao<T> dao) {
        this.dao = dao;
    }

//    @Override
//    public LiveData<List<T>> getAll() {
//        return dao.getAll();
//    }

//    @Override
//    public LiveData<T> getById(int id) {
//        return dao.getById(id);
//    }

    @Override
    public void insert(T item) {
        new InsertAsyncTask(dao).execute(item);
    }

    @Override
    public void update(T item) {
        new UpdateAsyncTask(dao).execute(item);
    }

    @Override
    public void delete(T item) {
        new DeleteAsyncTask(dao).execute(item);
    }

    private static class InsertAsyncTask<T> extends AsyncTask<T, Void, Void> {
        private B_Dao<T> dao;

        InsertAsyncTask(B_Dao<T> dao) {
            this.dao = dao;
        }

        @Override
        protected Void doInBackground(T... items) {
            dao.insert(items[0]);
            return null;
        }
    }

    private static class UpdateAsyncTask<T> extends AsyncTask<T, Void, Void> {
        private B_Dao<T> dao;

        UpdateAsyncTask(B_Dao<T> dao) {
            this.dao = dao;
        }

        @Override
        protected Void doInBackground(T... items) {
            dao.update(items[0]);
            return null;
        }
    }

    private static class DeleteAsyncTask<T> extends AsyncTask<T, Void, Void> {
        private B_Dao<T> dao;

        DeleteAsyncTask(B_Dao<T> dao) {
            this.dao = dao;
        }

        @Override
        protected Void doInBackground(T... items) {
            dao.delete(items[0]);
            return null;
        }
    }
}

