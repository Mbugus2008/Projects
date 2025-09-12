package com.trimline.m_branch.db.repository;

import androidx.lifecycle.LiveData;

import java.util.List;

public interface IRepository<T> {
   // LiveData<List<T>> getAll();
   // LiveData<T> getById(int id);
    void insert(T item);
    void update(T item);
    void delete(T item);
}
