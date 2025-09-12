package com.trimline.sales


import android.content.Context
import android.os.AsyncTask
import android.util.Log
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.google.gson.reflect.TypeToken
import com.trimline.sales.DB
import com.trimline.sales.JsonParser.postjson

import java.lang.reflect.Type

class worker// @NonNull Context context,
// @NonNull WorkerParameters params) {
// super(context, params);
//        Log.v("Posting Trans==>", "Starting worker..");
//        PeriodicWorkRequest.Builder b = new PeriodicWorkRequest.Builder(worker.class, 20, TimeUnit.SECONDS);
//        PeriodicWorkRequest myWork = b.build();
//        WorkManager.getInstance().enqueueUniquePeriodicWork("updates", ExistingPeriodicWorkPolicy.REPLACE, myWork);
//    }
    (//} extends Worker {
    var c: Context
) {

    // @Override
    fun doWork() {
        try {
            val myRunnable4 = Runnable {
                getlogins()
                getitems()

            }
            Thread(myRunnable4).start()

        } catch (ex: Exception) {
            ex.printStackTrace()
        }
    }



    private fun getitems() {
        val Dao: item.dao
        val db: DB = DB.getDatabase(c)
        Dao = db.itemdao()
        try {
            val g = Gson()
            val result =
                postjson("PaymentModes", "", "")
            val localType: Type =
                object : TypeToken<List<item?>?>() {}.getType()
            val results: List<item> =
                Gson().fromJson(result, localType)
            if (results != null) {
                try {
                    if (result.length > 0) Dao.deleteall()
                    for (f in results) {
                        Dao.insert(f)
                    }
                } catch (ex: Exception) {
                    ex.printStackTrace()
                }
            } else {
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }

    private fun getlogins() {
        val Dao: agent.dao
        val db: DB = DB.getDatabase(c)
        Dao = db.agendao()
        try {
            val g = Gson()
            val result = postjson("Users", "", "")
            val localType: Type = object :
                TypeToken<List<agent?>?>() {}.getType()
            val results: List<agent> =
                Gson().fromJson(result, localType)
            if (results != null) {
                try {
                    for (f in results) {
                        Dao.insert(f)
                    }
                } catch (ex: Exception) {
                    ex.printStackTrace()
                }
            } else {
                Log.i("members", "Empty")
            }
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }


}