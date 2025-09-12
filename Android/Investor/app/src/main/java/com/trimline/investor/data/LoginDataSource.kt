package com.trimline.investor.data

import android.os.AsyncTask
import com.google.gson.Gson
import com.google.gson.reflect.TypeToken
import com.trimline.investor.data.model.LoggedInUser
import com.trimline.investor.member
import com.trimline.sales.JsonParser
import java.io.IOException
import java.lang.reflect.Type

/**
 * Class that handles authentication w/ login credentials and retrieves user information.
 */
class LoginDataSource {
     var m :member?=null;
    fun login(username: String, password: String): Result<LoggedInUser> {
        try {
            // TODO: handle loggedInUser authentication
            getmember().execute().get()
        return   Result.Success( )

        } catch (e: Throwable) {
            return Result.Error(IOException("Error logging in", e))
        }
    }
     class getmember internal constructor(ff: String?) :
        AsyncTask<String?, Void?, member?>() {
        var f: String? = null
        override fun onPreExecute() {}
        protected override fun doInBackground(vararg params: String?): member? {
            var results: member? = null
            var result: String? = null
            try {
                val g = Gson()
                val result = JsonParser.postjson("getmember", "No", params[0].toString())
                val localType: Type = object : TypeToken<member?>() {}.getType()
                val results: member = Gson().fromJson<member>(result, localType)

            } catch (e: Exception) {
                e.printStackTrace()
            }
            return results
        }

        override fun onPostExecute(result: member?) {
            try {
               if (result != null)
               {
                m = result;
               }
            } catch (ex: Exception) {
                ex.printStackTrace()
            }
        }

        init {
            f = ff
        }
    }
    fun logout() {
        // TODO: revoke authentication
    }
}