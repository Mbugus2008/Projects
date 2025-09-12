package com.trimline.paul.m_branch.teller;

import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.app.Activity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.text.Html;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.paul.m_branch.Api;
import com.trimline.paul.m_branch.Myvariables;
import com.trimline.paul.m_branch.R;
import com.trimline.paul.m_branch.Results;
import com.trimline.paul.m_branch.jsonhandlers.Doublserializer;
import com.trimline.paul.m_branch.jsonhandlers.UnparseableDateHandler;
import com.trimline.paul.m_branch.agent;
import com.trimline.paul.m_branch.enums.transaction_Type;

import java.lang.reflect.Type;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;

import javax.security.auth.login.LoginException;

public class tellertranslist extends Activity {
    Teller.Adapter adapter;
    RecyclerView recyclerView;
    Button add;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_tellertranslist);

        recyclerView = findViewById(R.id.tableview);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(true);
        add = findViewById(R.id.Add);
        add.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Teller t = new Teller();
                t.From_Account = Myvariables.CurrentAgent.Account;
                t.Transaction_Type = transaction_Type.Inter_Teller_Transfers;
                t.Transaction_Date = new Date();
                new inittellertrans().execute(t);
            }
        });
        adapter = new Teller.Adapter(new DeleteListener() {
            @Override
            public void onDelete(Teller transaction, int i) {

            }
        });

        new getagent().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
        new getmytransaction().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);

    }

    private class getmytransaction extends AsyncTask<Void, String, Results<Teller[]>> {
        @Override
        protected void onPreExecute() {
        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected Results<Teller[]> doInBackground(Void... params) {
            //  publishProgress("Getting Vehicles");
            Results<Teller[]> results = null;
            try {
                String key = new String();
                Gson g = new Gson();
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("Agent", Myvariables.CurrentAgent.Agent_Code);
                key = null;
                String res = new Api().apicalli_get(new String[]{"gettellertrans"}, param); //JsonParser.postjson("Vehicles", null, null);
                Type localType = new TypeToken<Results<Teller[]>>() {
                }.getType();
                results = new Api().gsonBuilder().create().fromJson(String.valueOf(res), localType);
                Log.i("Response", new Gson().toJson(results));
            } catch (Exception e) {
                publishProgress("Unable to get transactionss");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(Results<Teller[]> results) {
            try {
                if (results.Code == 0) {
                    adapter.submitList(Arrays.asList(results.Contents));
                    adapter.notifyDataSetChanged();
                    recyclerView.setAdapter(adapter);
                    // kgridview.setAdapter(new adapter(getApplicationContext(), Arrays.asList(results.Contents)));
                } else
                    Toast.makeText(getApplicationContext(), "No transactions", Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private class getagent extends AsyncTask<Void, String, Results<agent>> {
        @Override
        protected void onPreExecute() {
        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected Results<agent> doInBackground(Void... params) {
            //  publishProgress("Getting Vehicles");
            Results<agent> results = null;
            try {
                String key = new String();
                Gson g = new Gson();
                HashMap<String, String> param = new HashMap<String, String>();
                param.put("agent", Myvariables.CurrentAgent.Agent_Code);
                key = null;
                String res = new Api().apicalli_get(new String[]{"agent"}, param); //JsonParser.postjson("Vehicles", null, null);
                Type localType = new TypeToken<Results<agent>>() {
                }.getType();
                results = new GsonBuilder().setDateFormat("dd/MM/yyyy").create().fromJson(String.valueOf(res), localType);
                Log.i("Response", new Gson().toJson(results));
            } catch (Exception e) {
                publishProgress("Unable to get transactionss");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(Results<agent> results) {
            try {
                if (results.Code == 0) {
                    TextView agnbal = findViewById(R.id.balance);
                    agnbal.setText(Html.fromHtml(String.format("Balance: <b>%s</b>", String.format("%,.2f", results.Contents.Account_Balance))));
                } else
                    Toast.makeText(getApplicationContext(), "No transactions", Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    private class inittellertrans extends AsyncTask<Teller, String, Results<Teller>> {
        @Override
        protected void onPreExecute() {
        }

        protected void onProgressUpdate(String... progress) {
            Toast.makeText(getApplicationContext(), progress[0], Toast.LENGTH_LONG).show();
        }

        @Override
        protected Results<Teller> doInBackground(Teller... params) {
            //  publishProgress("Getting Vehicles");
            Results<Teller> results = null;
            try {
                String res = new Api().apicalli_post(new String[]{"tellertrans"},new Api().gsonBuilder().create().toJson(params[0])); //JsonParser.postjson("Vehicles", null, null);
                Type localType = new TypeToken<Results<Teller>>() {
                }.getType();
                results =new Api().gsonBuilder().create().fromJson(String.valueOf(res), localType);
                //Log.i("Response", new GsonBuilder().setDateFormat("dd/MM/yyyy").create().toJson(results));
            } catch (Exception e) {
                publishProgress("Unable to get transactionss");
                e.printStackTrace();
            }
            return results;
        }

        @Override
        protected void onPostExecute(Results<Teller> results) {
            try {
                if (results.Code == 0) {
                    Intent intent = new Intent(tellertranslist.this, AddedittellertransActivity.class);
                    intent.putExtra("teller", results.Contents);
                    startActivity(intent);
                } else
                    Toast.makeText(getApplicationContext(), results.Desc, Toast.LENGTH_LONG).show();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}