package com.trimline.sales

import android.app.Application
import androidx.annotation.NonNull
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import androidx.room.*
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.sql.Date
@Entity
class Sales {
    var Key: String? = null
    @PrimaryKey
    @NonNull
    var Document_No: String? = null
    var Posting_Date: Date? = null
    var Description: String? = null
    var Vehicle_No: String? = null
    var Customer_Account: String? = null
    var Receiving_Account: String? = null
    var Total_Sales: Double? = null
    var Amount_Received: Double? = null
    var Balance: Double? = null
    var Final_Reading: Boolean? = null
    var Invoice_No: String? = null
    var Created_By: String? = null
    var Created_On: Date? = null
    @Ignore
    lateinit var Quick_Sale_Lines: Array<Sales_Lines>

    @Dao
    abstract class dao : BaseDao<Sales> {
        /**
         * Get all data from the Data table.
         */
        @Query("SELECT * FROM Sales")
        abstract fun getData(): List<Sales>

        @Query("SELECT * from Sales ")
        abstract fun getall(): LiveData<List<Sales>>

        @Query("delete from Sales")
        abstract fun deleteall()
    }
    class Repository(private val dao: dao) {

        // Room executes all queries on a separate thread.
        // Observed LiveData will notify the observer when the data has changed.
        val all: LiveData<List<Sales>> = dao.getall()

        suspend fun insert(word: Sales) {
            dao.insert(word)
        }
    }
    class Model(application: Application) : AndroidViewModel(application) {

        private val repository: Repository
        // Using LiveData and caching what getAlphabetizedWords returns has several benefits:
        // - We can put an observer on the data (instead of polling for changes) and only update the
        //   the UI when the data actually changes.
        // - Repository is completely separated from the UI through the ViewModel.
        val allSaless: LiveData<List<Sales>>

        init {
            val dao = DB.getDatabase(application).salesdao()
            repository = Repository(dao)
            allSaless = repository.all
        }

        /**
         * Launching a new coroutine to insert the data in a non-blocking way
         */
        fun insert(Sales: Sales) = viewModelScope.launch(Dispatchers.IO) {
            repository.insert(Sales)
        }
    }
   
}

enum class Item_Type {
    /// <remarks/>
    General,  /// <remarks/>
    Fuel
}