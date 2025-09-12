package com.trimline.m_branch.db.Models;

import androidx.lifecycle.LiveData;
import androidx.lifecycle.ViewModel;

import com.trimline.m_branch.db.repository.IRepository;

import java.util.List;

public class BaseViewModel<T, R extends IRepository<T>> extends ViewModel {
    private final R repository;
   // private final LiveData<List<T>> allData;

    public BaseViewModel(R repository) {
        this.repository = repository;
      //  this.allData = repository.getAll();
    }

//    public LiveData<List<T>> getAllData() {
//        return allData;
//    }

    public void insert(T item) {
        repository.insert(item);
    }

    public void update(T item) {
        repository.update(item);
    }

    public void delete(T item) {
        repository.delete(item);
    }
}