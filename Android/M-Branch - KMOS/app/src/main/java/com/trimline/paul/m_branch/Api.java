package com.trimline.paul.m_branch;

import android.content.SharedPreferences;
import android.net.Uri;
import android.text.TextUtils;
import android.util.Log;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.m_branch.jsonhandlers.Doublserializer;
import com.trimline.paul.m_branch.jsonhandlers.UnparseableDateHandler;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

public class Api {
    private static final String TAG = "HttpClient";
    static InputStream iStream = null;
    static String jarray = null;
    static String json = "";
    public static SharedPreferences preferences;
   public static String WEBSERVICE_URL = "5.189.167.52:4005/Lopha/api";
   //public static String WEBSERVICE_URL = "5.189.167.52:4000/Lopha/Collect.asmx";
    public String apicalli_get(String[] path, HashMap<String,String> args) {
        String result = new String();
        try {
//            String value = preferences.getString("IP", "");
            //String urlParameters = param + "=" + json;
            Uri.Builder builder = new Uri.Builder();
            builder.scheme("http");
            builder.encodedAuthority(WEBSERVICE_URL);
            Arrays.stream(path).forEach(builder::appendPath);
            if (args!=null)
            args.keySet().forEach(h -> builder.appendQueryParameter(h, args.get(h)));

            URL url = new URL( builder.build().toString());

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            Log.i("url",builder.build().toString());


            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod("GET");
            connection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
            connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
            //connection.setDoOutput(true);
            connection.setConnectTimeout(90000);
            connection.setReadTimeout(90000);
            //DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
            //dStream.writeBytes(urlParameters);
            //dStream.flush();
            //dStream.close();

            int responseCode = connection.getResponseCode();
            System.out.println("\nSending 'POST' request to URL : " + url);

            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            StringBuilder responseOutput = new StringBuilder();

            while ((line = br.readLine()) != null) {
                responseOutput.append(line);
            }
            br.close();
            System.out.println("output===============" + responseOutput);

            result    = String.valueOf(responseOutput) ;// new Gson().fromJson(String.valueOf(responseOutput), localType);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                throw new Exception(e);
            } catch (Exception ex) {
            }
        } finally {

        }


        return result;
    }
    public String apicalli_post(String[] path, String args) {
        String result = new String();
        try {

           String  paths= TextUtils.join("/", path);
            URL url = new URL("http://"+WEBSERVICE_URL + "/"+ paths );

            HttpURLConnection connection = (HttpURLConnection) url.openConnection();

            connection.setInstanceFollowRedirects(true);
            connection.setRequestMethod("POST");
            connection.setRequestProperty("USER-AGENT", "Mozilla/5.0");
            connection.setRequestProperty("ACCEPT-LANGUAGE", "en-US,en;0.5");
            //connection.setDoOutput(true);
            connection.setConnectTimeout(90000);
            connection.setReadTimeout(90000);
            DataOutputStream dStream = new DataOutputStream(connection.getOutputStream());
//            StringBuilder builder = new StringBuilder();
//            for (String value : args.values()) {
//                builder.append(value);
//            }
            //Arrays.stream(args).forEach(builder::append);
            dStream.writeBytes( args );
            dStream.flush();
            dStream.close();

            int responseCode = connection.getResponseCode();
            System.out.println("\nSending 'POST' request to URL : " + url);

            System.out.println("Post parameters : " + args);
            System.out.println("Response Group_No : " + responseCode);
            BufferedReader br = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line = "";
            StringBuilder responseOutput = new StringBuilder();

            while ((line = br.readLine()) != null) {
                responseOutput.append(line);
            }
            br.close();
            System.out.println("output===============" + responseOutput);

            result    = String.valueOf(responseOutput) ;// new Gson().fromJson(String.valueOf(responseOutput), localType);
        } catch (Exception e) {
            e.printStackTrace();
            try {
                throw new Exception(e);
            } catch (Exception ex) {
            }
        } finally {

        }


        return result;
    }

public GsonBuilder gsonBuilder (){
    GsonBuilder gsonBuilder = new GsonBuilder();
                gsonBuilder.registerTypeAdapter(Date .class, new UnparseableDateHandler("dd/MM/yyyy"));
                gsonBuilder.registerTypeAdapter(Double.class, new Doublserializer());
            return gsonBuilder;
}
}
