package com.trimline.investors;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.text.method.LinkMovementMethod;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investors.databinding.Memberbinding;

import java.lang.reflect.Type;

public class MainActivity extends AppCompatActivity {
    Members.Model model;
    Memberbinding b;
    RecyclerView vehiclelist, Loanlist;
    SwipeRefreshLayout pullToRefresh;
    Vehicle.adapter adapter;
    Loans.adapter l_adapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_main);
        b = DataBindingUtil.setContentView(this, R.layout.activity_main);
        model = ViewModelProviders.of(this)
                .get(Members.Model.class);
        b.setM(model.member);
        b.setStatistics(model.member.statistics);

        // getSupportActionBar().setDisplayOptions(ActionBar.DISPLAY_SHOW_CUSTOM); //bellow setSupportActionBar(toolbar);
        // getSupportActionBar().setCustomView(R.layout.actionbar);
        getSupportActionBar().setTitle(model.member.Name);
        //getSupportActionBar().setTitle(Html.fromHtml("<small> "+model.member.No + "|" + model.member.Phone_No+"|" +model.member.E_Mail +"</small>"));

        pullToRefresh = findViewById(R.id.swiperefresh);
        pullToRefresh.setOnRefreshListener(new SwipeRefreshLayout.OnRefreshListener() {
            @Override
            public void onRefresh() {
                new getmember(model.member.No).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

            }
        });

        adapter = new Vehicle.adapter(MainActivity.this);
        adapter.sett_line(model.member.vehicles);
        vehiclelist = (RecyclerView) findViewById(R.id.vehiclelist);
        vehiclelist.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        vehiclelist.setHasFixedSize(false);
        vehiclelist.setAdapter(adapter);
        adapter.setOnItemClickListener(new Vehicle.adapter.OnItemClickListener() {
            @Override
            public void onItemClick(Vehicle note) {
                Toast.makeText(getApplicationContext(), note.Fleet_No, Toast.LENGTH_LONG).show();

               Intent intent = new Intent(MainActivity.this, vehicles.class);
               intent.putExtra("veh", note);
               startActivity(intent);
            }
        });

        l_adapter = new Loans.adapter(MainActivity.this);
        l_adapter.sett_line(model.member.loans);
        Loanlist = (RecyclerView) findViewById(R.id.loanslist);
        Loanlist.setLayoutManager(new LinearLayoutManager(this));
        Loanlist.setHasFixedSize(false);
        Loanlist.setAdapter(l_adapter);
    }

    private class getmember extends AsyncTask<Void, Members, Members> {
        String aa;

        public getmember(String a) {
            this.aa = a;
        }

        @Override
        protected Members doInBackground(Void... params) {
            // publishProgress("Getting Credits");
            Members results = null;
            String result = null;
            try {
                Gson g = new Gson();
                result = JsonParser.postjson("getmember", "No", aa);
                Type localType = new TypeToken<Members>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(Members res) {
            try {

                pullToRefresh.setRefreshing(false);
                if (res != null) {
                    b.setStatistics(res.statistics);
                    b.setM(res);
                    adapter.sett_line(res.vehicles);
                    l_adapter.sett_line(res.loans);
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}