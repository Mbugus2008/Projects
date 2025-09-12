package com.trimline.investments;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;

import com.google.android.material.floatingactionbutton.ExtendedFloatingActionButton;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.google.android.material.snackbar.Snackbar;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investments.databinding.Funditems;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.util.Log;
import android.view.View;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class activefunds extends AppCompatActivity {
    RecyclerView recyclerView;
    ExtendedFloatingActionButton newfund;
    Funditems fun;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.fund_applicaitons);
        fun = DataBindingUtil.setContentView(this, R.layout.fund_applicaitons);
        recyclerView = findViewById(R.id.applications);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);
        newfund =(ExtendedFloatingActionButton) findViewById(R.id.newfund);
        newfund.setVisibility(View.GONE);

        newfund.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                RealEstate r = new RealEstate();
                r.Member_No = Investments.member.No;
                r.Member_Category = Investments.member.Member_Category;
                r.Member_Name = Investments.member.Name;
                Intent intent = new Intent(activefunds.this, addeditfund.class);
                intent.putExtra("list", r);
                startActivityForResult(intent, 0);
            }
        });
        new getadapterdata().execute();
    }
    @Override
    public void onResume(){
        super.onResume();
        new getadapterdata().execute();
    }
    private class getadapterdata extends AsyncTask<Void, Void, List<RealEstate>> {
        @Override
        protected List<RealEstate> doInBackground(Void... notes) {
            List<RealEstate> p = null ;
            try {
                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String result = JsonParser.postjson("Funds", "data", g.toJson(Investments.member));
                Type localType = new TypeToken<List<RealEstate>>() {
                }.getType();
                p = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return  p;
        }
        @Override
        protected void onPostExecute(List<RealEstate> res) {
            if(res.size()>0) {
                Log.i("hapa",new Gson().toJson(res));
                List<RealEstate> runing = new ArrayList<>();
                for (RealEstate r :res
                     ) {
                    if (r.Status ==1)
                        runing.add(r);
                }
                RealEstate.adapter    adapter = new RealEstate.adapter(activefunds.this);
                adapter.sett_line(runing);
                recyclerView.setAdapter(adapter);
            }
        }
    }

}
