package com.trimline.m_branch.db.dao;

import androidx.room.Dao;
import androidx.room.Query;

import com.trimline.m_branch.vehicles.vehicles;
import com.trimline.m_branch.agent;
import java.util.List;

@Dao
    public  interface d_agent extends B_Dao<agent> {

    @Query("SELECT * FROM agent")
    abstract List<agent> getall();


}