package com.trimline.m_branch.db.dao;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;
import com.trimline.m_branch.vehicles.vehicles;


import java.util.ArrayList;
import java.util.List;

@Dao
    public  interface d_vehicle extends B_Dao<vehicles> {

    @Query("SELECT * FROM vehicles")
    abstract List<vehicles> getvehicles();

    @Query("Delete from vehicles where Code =:member")
    abstract void deletevehiclesforMember(String member);

    @Query("select * from vehicles where Code =:c")
    abstract List<vehicles> getcustomervehicles(String c);

    @Query("select * from vehicles where Vehicle_Number =:c")
    abstract vehicles getvehicle(String c);

}