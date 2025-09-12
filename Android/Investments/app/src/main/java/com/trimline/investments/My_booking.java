package com.trimline.investments;

import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.os.AsyncTask;
import android.os.Bundle;

import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class My_booking extends AppCompatActivity {

    RecyclerView recyclerView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my_booking);

        recyclerView = (RecyclerView)findViewById(R.id.mybooking);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        if (Investments.member!=null)
        new getadapterdata().execute(Investments.member.No);
    }

    private class getadapterdata extends AsyncTask<String, Void, List<Property_sales>> {
        @Override
        protected List<Property_sales> doInBackground(String... notes) {
            List<Property_sales> results = new ArrayList<>();
            try {

                String  result = JsonParser.postjson("bookings", "data", notes[0]);
                Type localType = new TypeToken<List<Property_sales>>() {
                }.getType();
               results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(List<Property_sales> res) {
            if (res!=null) {

             Property_sales.adapter adapter = new Property_sales.adapter();
                adapter.setTrans(res);
                recyclerView.setAdapter(adapter);
            }
        }
    }
}
