package com.trimline.sales

import android.app.Application
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import androidx.annotation.NonNull
import androidx.lifecycle.AndroidViewModel
import androidx.lifecycle.LiveData
import androidx.lifecycle.viewModelScope
import androidx.recyclerview.widget.RecyclerView
import androidx.room.Dao
import androidx.room.Entity
import androidx.room.PrimaryKey
import androidx.room.Query
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

/**
 * Created by Paul on 11-Dec-16.
 */
@Dao
abstract class agentdao : BaseDao<agent> {

    /**
     * Get all data from the Data table.
     */
    @Query("SELECT * FROM agent")
    abstract fun getData(): List<agent>
    @Query("SELECT * from agent ")
    abstract  fun getall(): LiveData<List<agent>>
}
@Entity()
class agent {
    @PrimaryKey
    @NonNull
    var Agent_Code: String? = null
    var Customer_ID_No: String? = null
    var Mobile_No: String? = null
    var Status = 0
    var Name: String? = null
    var Account: String? = null
    var Password: String? = null
    var Constituency: String? = null
    var Account_type = 0

    @Dao
    abstract class dao : BaseDao<agent> {

        /**
         * Get all data from the Data table.
         */
        @Query("SELECT * FROM agent")
        abstract fun getData(): List<agent>

        @Query("SELECT * from agent ")
        abstract fun getall(): LiveData<List<agent>>

        @Query("delete from agent")
        abstract fun deleteall()
    }
    class Repository(private val dao: dao) {

        // Room executes all queries on a separate thread.
        // Observed LiveData will notify the observer when the data has changed.
        val allWords: LiveData<List<agent>> = dao.getall()

        suspend fun insert(word: agent) {
            dao.insert(word)
        }
    }
    class Model(application: Application) : AndroidViewModel(application) {

        private val repository: Repository
        // Using LiveData and caching what getAlphabetizedWords returns has several benefits:
        // - We can put an observer on the data (instead of polling for changes) and only update the
        //   the UI when the data actually changes.
        // - Repository is completely separated from the UI through the ViewModel.
        val allagents: LiveData<List<agent>>

        init {
            val dao = DB.getDatabase(application).agendao()
            repository = Repository(dao)
            allagents = repository.allWords
        }

        /**
         * Launching a new coroutine to insert the data in a non-blocking way
         */
        fun insert(agent: agent) = viewModelScope.launch(Dispatchers.IO) {
            repository.insert(agent)
        }
    }

//    class WordListAdapter internal constructor(
//        context: Context
//    ) : RecyclerView.Adapter<WordListAdapter.WordViewHolder>() {
//
//        private val inflater: LayoutInflater = LayoutInflater.from(context)
//        private var words = emptyList<agent>() // Cached copy of words
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
