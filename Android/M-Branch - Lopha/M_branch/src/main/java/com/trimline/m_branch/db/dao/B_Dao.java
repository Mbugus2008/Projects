package com.trimline.m_branch.db.dao;

import androidx.lifecycle.LiveData;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.RawQuery;
import androidx.room.Update;

import java.util.List;

@androidx.room.Dao
public interface B_Dao<T> {


        @Insert(onConflict = OnConflictStrategy.REPLACE)
     abstract    long insert(T item);

        @Update
     abstract    void update(T item);

        @Delete
     abstract    void delete(T item);


}
