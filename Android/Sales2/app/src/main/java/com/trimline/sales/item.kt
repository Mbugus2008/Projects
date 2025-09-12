package com.trimline.sales

import android.app.Application
import androidx.annotation.NonNull
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import androidx.room.Dao
import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Query
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch
@Entity
class item {

    var Key: String? = null

    @PrimaryKey
    @NonNull
    var No: String? = null
    var Description: String? = null
    var Base_Unit_of_Measure: String? = null
    var Location_Code: String? = null
    var Shelf_No: String? = null
    var Inventory = 0.0
    var Blocked = false
    var Unit_Price = 0.0

    @Dao
    abstract class dao : BaseDao<item> {

        /**
         * Get all data from the Data table.
         */
        @Query("SELECT * FROM item")
        abstract fun getData(): List<item>

        @Query("SELECT * from item ")
        abstract fun getall(): LiveData<List<item>>

        @Query("delete from item")
       abstract fun deleteall()
    }

    class Repository(private val dao: dao) {

        // Room executes all queries on a separate thread.
        // Observed LiveData will notify the observer when the data has changed.
        val allWords: LiveData<List<item>> = dao.getall()

        suspend fun insert(word: item) {
            dao.insert(word)
        }
    }

    class Model(application: Application) : AndroidViewModel(application) {

        private val repository: Repository

        // Using LiveData and caching what getAlphabetizedWords returns has several benefits:
        // - We can put an observer on the data (instead of polling for changes) and only update the
        //   the UI when the data actually changes.
        // - Repository is completely separated from the UI through the ViewModel.
        val allitems: LiveData<List<item>>

        init {
            val dao = DB.getDatabase(application).itemdao()
            repository = Repository(dao)
            allitems = repository.allWords
        }

        /**
         * Launching a new coroutine to insert the data in a non-blocking way
         */
        fun insert(item: item) = viewModelScope.launch(Dispatchers.IO) {
            repository.insert(item)
        }
    }

//    class WordListAdapter internal constructor(
//        context: Context
//    ) : RecyclerView.Adapter<WordListAdapter.WordViewHolder>() {
//
//        private val inflater: LayoutInflater = LayoutInflater.from(context)
//        private var words = emptyList<item>() // Cached copy of words
//
//        inner class WordViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
//            val wordItemView: TextView = itemView.findViewById(R.id.textView)
//        }
//
//        override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): WordViewHolder {
//            val itemView = inflater.inflate(R.layout.recyclerview_item, parent, false)
//            return WordViewHolder(itemView)
//        }
//
//        override fun onBindViewHolder(holder: WordViewHolder, position: Int) {
//            val current = words[position]
//            holder.wordItemView.text = current.word
//        }
//
//        internal fun setWords(words: List<Word>) {
//            this.words = words
//            notifyDataSetChanged()
//        }
//
//        override fun getItemCount() = words.size
//    } 


}