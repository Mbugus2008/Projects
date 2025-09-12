package com.trimline.sales

import android.app.Activity
import android.content.SharedPreferences
import android.util.Log
import java.io.*
import java.net.HttpURLConnection
import java.net.URL

object JsonParser {
    private const val TAG = "HttpClient"
    var iStream: InputStream? = null
    var jarray: String? = null
    var json = ""
    var preferences: SharedPreferences? = null


    var WEBSERVICE_URL = "http://5.189.167.52:4000/Metro/Collect.asmx"
    fun postjson(Method: String, param: String, json: String): String {
        var result = StringBuilder()
        try {
            Log.i("sendingurl", "here")
           // val value = preferences!!.getString("IP", "")
            //URL url = new URL("Http://" + value + WEBSERVICE_URL + "/" + Method);
            val url = URL("$WEBSERVICE_URL/$Method")
            val connection =
                url.openConnection() as HttpURLConnection
            val urlParameters = "$param=$json"
            connection.instanceFollowRedirects = true
            connection.requestMethod = "POST"
            connection.setRequestProperty("USER-AGENT", "Mozilla/5.0")
            connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5")
            connection.doOutput = true
            connection.connectTimeout = 90000
            connection.readTimeout = 90000
            val dStream =
                DataOutputStream(connection.outputStream)
            dStream.writeBytes(urlParameters)
            dStream.flush()
            dStream.close()
            val responseCode = connection.responseCode
            println("\nSending 'POST' request to URL : $url")
            println("Post parameters : $urlParameters")
            println("Response Group_No : $responseCode")
            val output = StringBuilder("Request URL $url")
            output.append(System.getProperty("line.separator") + "Request Parameters " + urlParameters)
            output.append(System.getProperty("line.separator") + "Response Group_No " + responseCode)
            output.append(System.getProperty("line.separator") + "Type " + "POST")
            val br =
                BufferedReader(InputStreamReader(connection.inputStream))
            var line: String? = ""
            val responseOutput = StringBuilder()
            println("output===============$br")
            while (br.readLine().also { line = it } != null) {
                responseOutput.append(line)
            }
            br.close()
            output.append(
                System.getProperty("line.separator") + "Response " + System.getProperty(
                    "line.separator"
                ) + System.getProperty("line.separator") + responseOutput.toString()
            )
            result = responseOutput
        } catch (e: Exception) {
            e.printStackTrace()
            try {
                throw Exception(e)
            } catch (ex: Exception) {
            }
        } finally {
        }
        Log.i("data", result.toString())
        return result.toString()
    }



}