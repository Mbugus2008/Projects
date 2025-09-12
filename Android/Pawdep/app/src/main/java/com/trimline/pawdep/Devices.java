package com.trimline.pawdep;

import androidx.annotation.NonNull;
import androidx.room.Dao;
import androidx.room.Delete;
import androidx.room.Entity;
import androidx.room.Insert;
import androidx.room.OnConflictStrategy;
import androidx.room.PrimaryKey;
import androidx.room.Query;
import androidx.room.Update;

import java.util.List;
@Entity
public class Devices {
    public String Key ;
    public int Id ;
    public String Device_Name ;
    @PrimaryKey
    @NonNull
    public String Device_id ;
    public String Last_Known_location ;
    public Boolean Active  = false;
    @Dao
    public interface dao extends Basedao {
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        long Insert(Devices t);
        @Insert(onConflict = OnConflictStrategy.REPLACE)
        void   Insertall(Iterable<Devices> t) ;
        @Update
        int Update(Devices t);
        @Delete
        void delete(Devices t);
        @Query("SELECT * FROM Devices")
        List<Devices> getAll();


    }
}
