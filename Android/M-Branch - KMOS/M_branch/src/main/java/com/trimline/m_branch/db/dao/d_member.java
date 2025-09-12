package com.trimline.m_branch.db.dao;

import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.Query;
import androidx.room.Update;

import com.trimline.m_branch.members.member;

import java.util.List;

@Dao
    public  interface  d_member extends B_Dao<member> {
    @Query("SELECT * FROM member")
    abstract List<member> getmembers();

}