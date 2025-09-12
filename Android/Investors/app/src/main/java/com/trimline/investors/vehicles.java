package com.trimline.investors;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.investors.databinding.Dailytrans;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

public class vehicles extends AppCompatActivity {
Dailytrans dailytrans;
RecyclerView dailytran;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //setContentView(R.layout.activity_vehicles);
        dailytrans = DataBindingUtil.setContentView(this, R.layout.activity_vehicles);
        Intent i = getIntent();
        Vehicle v = (Vehicle) i.getSerializableExtra("veh");

        dailytran = (RecyclerView) findViewById(R.id.dailytrans);
        dailytran.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        dailytran.setHasFixedSize(false);

      if (v!=null){
          getSupportActionBar().setTitle("Vehicle Daily Summary" );
          getSupportActionBar().setSubtitle(v.Vehicle_Number + " | " + v.Fleet_No );
          new getdailytrans(v.Code).executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
    }}

    private class getdailytrans extends AsyncTask<Void, Daily_Transactions, List< Daily_Transactions>> {
        String aa;
        public getdailytrans(String a) {
            this.aa = a;
        }
        @Override
        protected List<Daily_Transactions> doInBackground(Void... params) {
            // publishProgress("Getting Credits");
            List<Daily_Transactions> results = null;
            String result = null;
            try {
                Gson g = new Gson();
                result = JsonParser.postjson("getdailytrans", "No", aa);
                Type localType = new TypeToken<List<Daily_Transactions>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(result, localType);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(List<Daily_Transactions> res) {
            try {
                if (res==null)
                {
                    Toast.makeText(vehicles.this, "Issue getting transactions", Toast.LENGTH_SHORT).show();
                    return;
                }

                dailytran.setAdapter(new adapter<Daily_Transactions, Dailytrans>(vehicles.this,(ArrayList<Daily_Transactions>) res) {
                    @Override
                    public int getLayoutResId() {
                        return R.layout.vehicle_item;
                    }

                    @Override
                    public void onBindData(Daily_Transactions model, int position, Dailytrans dataBinding) {
                       dataBinding.setD(model);
                        //dataBinding.txtName.setText("String " + position);
                    }

                    @Override
                    public void onItemClick(Daily_Transactions model, int position) {
                        //Toast.makeText(SampleActivity.this, "" + model.toString() + " - " + position, Toast.LENGTH_SHORT).show();
                    }
                });

            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}