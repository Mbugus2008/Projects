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

public class My_Properties extends AppCompatActivity {
    RecyclerView recyclerView;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_my__properties);


        recyclerView = (RecyclerView)findViewById(R.id.myproperties);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        if (Investments.member!=null)
            new getadapterdata().execute(Investments.member.No);
    }

    private class getadapterdata extends AsyncTask<String, Void, List<MyProperties>> {
        @Override
        protected List<MyProperties> doInBackground(String... notes) {
            List<MyProperties> results = new ArrayList<>();
            try {
                String  result = JsonParser.postjson("myproperties", "data", notes[0]);
                Type localType = new TypeToken<List<MyProperties>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {

                e.printStackTrace();
            }
            return results;
        }
        @Override
        protected void onPostExecute(List<MyProperties> res) {
            if (res!=null) {
               MyProperties.adapter adapter = new MyProperties.adapter(My_Properties.this);
                adapter.setTrans(res);
                recyclerView.setAdapter(adapter);
            }
        }
    }
}
