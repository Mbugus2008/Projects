package com.mobile.afrecash.network;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.AsyncTask;
import android.util.Log;

import com.mobile.afrecash.listeners.ConnectionListener;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.DataOutputStream;
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

import static com.mobile.afrecash.network.Connect.LOG_TAG;

public class JsonParser {
    private static final String TAG = "HttpClient";
    static InputStream iStream = null;
    static String jarray = null;
    static String json = "";
    public static SharedPreferences preferences;
    public static String WEBSERVICE_URL = "/Collect.asmx";
    public static String url = "http://open.ngrok.io/api/";
    public static boolean isError = false;

    public static void makeRequest(final Context context, final String request, final Map<String, Object> postData, final ConnectionListener connectionListener) {

        Log.d("HTTP_CALL", postData == null ? "PARAMS : " : "PARAMS : " + postData.toString());

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

                    String newUrl = url + request;

                    Log.d(LOG_TAG, "URL : " + newUrl);

                    URL myUrl = new URL(newUrl);

                    /**
                     * Use HttpsUrlConnection if its a secure request
                     */

                    if (newUrl.startsWith("https://")) {
                        HttpsURLConnection httpURLConnection = (HttpsURLConnection) myUrl.openConnection();

                        httpURLConnection.setInstanceFollowRedirects(true);
                        httpURLConnection.setRequestMethod("POST");
                        httpURLConnection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
                        httpURLConnection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
                        httpURLConnection.setDoOutput(true);
                        httpURLConnection.setConnectTimeout(600000);
                        httpURLConnection.setReadTimeout(600000);

                        if (postData != null) {
                            Uri.Builder builder = new Uri.Builder();
                            Set<Map.Entry<String, Object>> set = postData.entrySet();
                            for (Map.Entry<String, Object> aSet : set) {
                                builder.appendQueryParameter(aSet.getKey(), aSet.getValue().toString());
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
                        httpURLConnection.setInstanceFollowRedirects(true);
                        httpURLConnection.setRequestMethod("POST");
                        httpURLConnection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
                        httpURLConnection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
                        httpURLConnection.setDoOutput(true);
                        httpURLConnection.setConnectTimeout(600000);
                        httpURLConnection.setReadTimeout(600000);

                        if (postData != null) {
                            Uri.Builder builder = new Uri.Builder();
                            Set<Map.Entry<String, Object>> set = postData.entrySet();
                            for (Map.Entry<String, Object> aSet : set) {
                                builder.appendQueryParameter(aSet.getKey(), aSet.getValue().toString());
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


    public static String postjson(String Method, String param, String json) {
        StringBuilder result = new StringBuilder();
        try {
           // String value = preferences.getString("IP", "");

           //URL url = new URL("Http://" + value + WEBSERVICE_URL + "/" + Method);
            //URL url = new URL("Http://192.168.8.102:806/Wrapper.asmx/" + Method);
           // URL url = new URL("Http://192.168.0.28:806/Wrapper.asmx/" + Method);
            //URL url = new URL("Http://192.168.100.104:806/Wrapper.asmx/" + Method);


            URL url = new URL("http://open.ngrok.io/api/" + Method);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            String urlParameters = json;
            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
            connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
            connection.setDoOutput(true);
            connection.setConnectTimeout(600000);
            connection.setReadTimeout(600000);

            DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
            dStream.writeBytes(urlParameters);
            dStream.flush();
            dStream.close();
            int responseCode = connection.getResponseCode();

            System.out.println("\nSending 'POST' request to URL : " + url);
            System.out.println("Post parameters : " + urlParameters);
            System.out.println("Response Group_No : " + responseCode);

            final StringBuilder output = new StringBuilder("Request URL " + url);
            output.append(System.getProperty("line.separator") + "Request Parameters " + urlParameters);
            output.append(System.getProperty("line.separator") + "Response Group_No " + responseCode);
            output.append(System.getProperty("line.separator") + "Type " + "POST");
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            StringBuilder responseOutput = new StringBuilder();
            System.out.println("output===============" + br);
            while ((line = br.readLine()) != null) {
                responseOutput.append(line);
            }
            br.close();
            output.append(System.getProperty("line.separator") + "Response " + System.getProperty("line.separator") + System.getProperty("line.separator") + responseOutput.toString());
            result = responseOutput;
        } catch (Exception e) {
            e.printStackTrace();
            try {
                throw new Exception(e);
            } catch (Exception ex) {
            }
        } finally {

        }

        Log.i("data", result.toString());
        return result.toString();
    }


    private static String convertStreamToString(InputStream paramInputStream) {
        BufferedReader localBufferedReader = new BufferedReader(
                new InputStreamReader(paramInputStream));
        StringBuilder localStringBuilder = new StringBuilder();
        for (; ; ) {
            try {
                String str = localBufferedReader.readLine();
                if (str != null) {
                    localStringBuilder.append(str + "\n");
                    continue;
                }
            } catch (IOException localIOException) {
                localIOException = localIOException;
                localIOException.printStackTrace();
                try {
                    paramInputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                continue;
            } finally {
            }
            try {
                paramInputStream.close();
                return localStringBuilder.toString();
            } catch (IOException ex) {
                ex.printStackTrace();
            }
        }
        /*
         * try { paramInputStream.close(); throw (""); } catch (IOException exc)
         * { for (;;) { exc.printStackTrace(); }
         */
    }


    //This method is to handle response
    private static String convertStreamToStrings(InputStream is) {
        /*
         * To convert the InputStream to String we use the BufferedReader.readLine()
         * method. We iterate until the BufferedReader return null which means
         * there's no more data to read. Each line will appended to a StringBuilder
         * and returned as String.
         */
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();

        String line = null;
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line + "\n");
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return sb.toString();
    }


}
