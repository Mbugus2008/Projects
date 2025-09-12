package com.trimline.sales

import android.content.Context
import androidx.room.Database
import androidx.room.Room
import androidx.room.RoomDatabase
import androidx.room.TypeConverters

// Annotates class to be a Room Database with a table (entity) of the Word class
@Database(entities = arrayOf(agent::class,item::class,Sales::class,Sales_Lines::class), version = 1, exportSchema = false)
@TypeConverters(Converters::class)
public abstract class DB : RoomDatabase() {

    abstract fun agendao(): agent.dao
    abstract fun itemdao(): item.dao
    abstract fun salesdao(): Sales.dao
    abstract fun saleslinesdao(): Sales_Lines.dao

    companion object {
        // Singleton prevents multiple instances of database opening at the
        // same time.
        @Volatile
        private var INSTANCE: DB? = null

        fun getDatabase(context: Context): DB {
            val tempInstance = INSTANCE
            if (tempInstance != null) {
                return tempInstance
            }
            synchronized(this) {
                val instance = Room.databaseBuilder(
                    context.applicationContext,
                    DB::class.java,
                    "word_database"
                ).build()
                INSTANCE = instance
                return instance
            }
        }
    }
}