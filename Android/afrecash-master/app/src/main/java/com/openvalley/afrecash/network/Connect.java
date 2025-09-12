package com.openvalley.afrecash.network;

import android.content.Context;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;

import android.util.Log;

import androidx.annotation.Nullable;

import com.openvalley.afrecash.datasets.ProfileHolder;
import com.openvalley.afrecash.listeners.ConnectionListener;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.HttpsURLConnection;


/**
 * Created by Geek Nat on 5/16/2016.
 */

public class Connect {

    public static String LOG_TAG = "HTTP_CALL";

    public static String METHOD_POST = "POST";
    public static String METHOD_GET = "GET";
    public static String METHOD_DELETE = "DELETE";

    public static String url = "http://geeknat.com/yumbu/api/";
    public static String LOG_IN = "auth/login";
    public static String RESET_PIN = "auth/reset_pin";
    public static String VERIFY_PIN = "auth/verify_pin";
    public static String CHANGE_PIN = "auth/change_pin";
    public static String VERIFY = "auth/verify";
    public static String REQUEST_LOAN = "add/loan";
    public static String GET_LOANS = "get/user_loans";
    public static String UPDATE_NAME = "auth/update_details";
    public static String GET_HOME = "get/home";
    public static String GET_STATEMENT = "get/statement";
    public static String GET_UNIVERSITIES = "get/universities_app";
    private static String method = "POST";

    private static boolean isError = false;

    public static String getDeviceModelName() {
        String manufacturer = Build.MANUFACTURER;
        String model = Build.MODEL + Build.ID;
        if (model.startsWith(manufacturer)) {
            return model.toUpperCase();
        } else {
            return manufacturer.toUpperCase() + " " + model;
        }
    }


    public static void makeRequest(final Context context, final String request, @Nullable final Map<String, String> postData, final ConnectionListener connectionListener) {
        if (!ConnectionManager.checkConnectivity(context)) {
            connectionListener.onError("No connection");
            return;
        }

        if (postData != null) {

            if (!request.equals(LOG_IN)) {
                ProfileHolder profileHolder = new ProfileHolder(context);
                if (profileHolder.getAccessToken() != null) {
                    postData.put("access_token", profileHolder.getAccessToken());
                }
            }

            postData.put("app_id", "E0001");
            postData.put("device_id", Build.ID + "-" + Build.SERIAL);
            postData.put("device_name", getDeviceModelName());
        }


        Log.d(LOG_TAG, postData == null ? "" : postData.toString());

        AsyncTask<String, Integer, String> connectTask = new AsyncTask<String, Integer, String>() {
            InputStream inputStream;

            @Override
            protected void onPreExecute() {
                connectionListener.onStart();
            }

            @Override
            protected String doInBackground(String... strings) {

                String result = null;

                try {

                    String newUrl = postData != null ? url + request : request;

                    Log.d(LOG_TAG, "URL : " + newUrl);

                    URL myUrl = new URL(newUrl);

                    /**
                     * Use HttpsUrlConnection if its a secure request
                     */

                    if (newUrl.startsWith("https://")) {
                        HttpsURLConnection httpURLConnection = (HttpsURLConnection) myUrl.openConnection();
                        if (method.equals("POST")) {
                            httpURLConnection.setDoInput(true);
                            httpURLConnection.setDoOutput(true);
                            httpURLConnection.setRequestMethod(method);
                        }
                        httpURLConnection.setConnectTimeout(20000);

                        if (postData != null && method.equals("POST")) {
                            Uri.Builder builder = new Uri.Builder();
                            Set<Map.Entry<String, String>> set = postData.entrySet();
                            for (Map.Entry<String, String> aSet : set) {
                                builder.appendQueryParameter(aSet.getKey(), aSet.getValue());
                            }

                            String query = builder.build().getEncodedQuery();
                            OutputStream os = httpURLConnection.getOutputStream();
                            BufferedWriter writer = new BufferedWriter(
                                    new OutputStreamWriter(os, "UTF-8"));
                            writer.write(query);
                            writer.flush();
                            writer.close();
                            os.close();
                        }

                        httpURLConnection.connect();
                        Log.d(LOG_TAG, "STATUS_CODE : " + httpURLConnection.getResponseCode() + "");
                        inputStream = new BufferedInputStream(httpURLConnection.getInputStream());
                    } else {
                        HttpURLConnection httpURLConnection = (HttpURLConnection) myUrl.openConnection();

                        if (method.equals("POST")) {
                            httpURLConnection.setDoInput(true);
                            httpURLConnection.setDoOutput(true);
                            httpURLConnection.setRequestMethod(method);
                        }

                        httpURLConnection.setConnectTimeout(20000);

                        if (postData != null && method.equals("POST")) {
                            Uri.Builder builder = new Uri.Builder();
                            Set<Map.Entry<String, String>> set = postData.entrySet();
                            for (Map.Entry<String, String> aSet : set) {
                                builder.appendQueryParameter(aSet.getKey(), aSet.getValue());
                            }

                            String query = builder.build().getEncodedQuery();
                            OutputStream os = httpURLConnection.getOutputStream();
                            BufferedWriter writer = new BufferedWriter(
                                    new OutputStreamWriter(os, "UTF-8"));
                            writer.write(query);
                            writer.flush();
                            writer.close();
                            os.close();
                        }

                        httpURLConnection.connect();
                        Log.d("HTTP_STATUS_CODE", httpURLConnection.getResponseCode() + "");
                        inputStream = new BufferedInputStream(httpURLConnection.getInputStream());
                    }

                    /**
                     * Convert stream into a string and return it
                     */
                    StringBuilder sb = new StringBuilder();
                    BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
                    String inputLine = "";
                    while ((inputLine = br.readLine()) != null) {
                        sb.append(inputLine);
                    }
                    isError = false;
                    result = sb.toString();
                    return result;
                } catch (Exception e) {
                    isError = true;
                    Log.d(LOG_TAG, "Could not connect : " + e.getMessage());
                    result = "Could not connect to server.Please check your network connection.";
                } finally {
                    if (inputStream != null) {
                        try {
                            inputStream.close();
                        } catch (IOException e) {
                            Log.i(LOG_TAG, "Error closing InputStream");
                            isError = true;
                            result = e.getMessage();
                        }
                    }
                }
                return result;
            }

            @Override
            protected void onPostExecute(String s) {
                Log.d(LOG_TAG, "RESULT : " + s);
                connectionListener.onComplete();
                if (s != null) {
                    if (s.isEmpty()) {
                        connectionListener.onError("Check your connection");
                    } else {
                        if (isError) {
                            connectionListener.onError(s);
                        } else {
                            connectionListener.onSuccess(s);
                        }
                    }
                } else {
                    connectionListener.onError("Please check your connection");
                }
            }
        };
        connectTask.execute();

    }

}
