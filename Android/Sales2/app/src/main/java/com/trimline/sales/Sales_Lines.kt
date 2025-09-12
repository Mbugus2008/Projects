package com.trimline.sales

import android.app.Application
import androidx.annotation.NonNull
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import androidx.room.Dao
import androidx.room.Entity
import androidx.room.Query
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
import java.sql.Date
@Entity(primaryKeys = arrayOf("Item_No", "Document_No"))
class Sales_Lines {
    var Key: String? = null
    @NonNull
    var Document_No: String?= null;
    @NonNull
    var Item_No: String? = null
    var Description: String? = null
    var Unit_of_Measure: String? = null
    var Quantity: Double? = null
    var Amount_Sold: Double? = null
    var Unit_Price: Double? = null
    var Total_Price: Double? = null
    var Location_Code: String? = null
    var Start_Reading_Ksh: Double? = null
    var End_Reading_Ksh: Double? = null
    var Posting_Date: Date? = null
    var Total_Other_Sales_Lines: Double? = null
    var Item_Type: Item_Type? = null

    @Dao
    abstract class dao : BaseDao<Sales_Lines> {

        /**
         * Get all data from the Data table.
         */
        @Query("SELECT * FROM Sales_Lines")
        abstract fun getData(): List<Sales_Lines>

        @Query("SELECT * from Sales_Lines ")
        abstract fun getall(): LiveData<List<Sales_Lines>>

        @Query("delete from Sales_Lines")
        abstract fun deleteall()
    }
    class Repository(private val dao: dao) {

        // Room executes all queries on a separate thread.
        // Observed LiveData will notify the observer when the data has changed.
        val all: LiveData<List<Sales_Lines>> = dao.getall()

        suspend fun insert(word: Sales_Lines) {
            dao.insert(word)
        }
    }
    class Model(application: Application) : AndroidViewModel(application) {

        private val repository: Repository
        // Using LiveData and caching what getAlphabetizedWords returns has several benefits:
        // - We can put an observer on the data (instead of polling for changes) and only update the
        //   the UI when the data actually changes.
        // - Repository is completely separated from the UI through the ViewModel.
        val allSales_Liness: LiveData<List<Sales_Lines>>

        init {
            val dao = DB.getDatabase(application).saleslinesdao()
            repository = Repository(dao)
            allSales_Liness = repository.all
        }

        /**
         * Launching a new coroutine to insert the data in a non-blocking way
         */
        fun insert(Sales_Lines: Sales_Lines) = viewModelScope.launch(Dispatchers.IO) {
            repository.insert(Sales_Lines)
        }
    }

}
    
