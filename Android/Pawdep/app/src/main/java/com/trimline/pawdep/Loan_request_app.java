package com.trimline.pawdep;

import androidx.appcompat.app.AppCompatActivity;
import androidx.databinding.DataBindingUtil;
import androidx.lifecycle.ViewModelProviders;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.widget.Toast;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.trimline.pawdep.databinding.Loanrequest;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class Loan_request_app extends AppCompatActivity {
    Loan_Request.Model amodel;
    RecyclerView recyclerView;
    Member.Model mmodel;
    Loan_Request. adapter adapter;
    List<Loan_Request> advances;
    Loanrequest b;
    Loan_products.Model lpmodel;
    Group.Model gmodel;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.loan_request_app);
        amodel = ViewModelProviders.of(this).get(Loan_Request.Model.class);
        lpmodel = ViewModelProviders.of(this).get(Loan_products.Model.class);
        gmodel = ViewModelProviders.of(this).get(Group.Model.class);
        mmodel = ViewModelProviders.of(this).get(Member.Model.class);

        Intent i = getIntent();
        amodel.t= (Transaction) i.getSerializableExtra("list");
        b= DataBindingUtil.setContentView(this, R.layout.loan_request_app);
       // getSupportActionBar().setTitle(amodel.t.Group_Name );
        getSupportActionBar().setTitle("Loan Booking");
      //  getSupportActionBar().setSubtitle("Loan Booking");
        recyclerView = findViewById(R.id.loan_request_list);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        recyclerView.setHasFixedSize(false);

        new getadapterdata().execute();
    }


    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        MenuInflater menuInflater = getMenuInflater();
        menuInflater.inflate(R.menu.advances_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newrans:
                Loan_Request a = new Loan_Request();
               // a.Group_Name = amodel.t.Group_Name;
                //a.Group_Code = amodel.t.Group_Code;
                Date c = Calendar.getInstance().getTime();
                SimpleDateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
                a.Request_No  = df.format(c);
                a.Member_Name = "";
              
                if (advances == null)
                    advances = new ArrayList<>();

                advances.add(a);
                if (adapter == null) {
                    adapter = new Loan_Request.adapter(getApplicationContext(),this, amodel.t,gmodel,mmodel,lpmodel);
                    adapter.sett_line(advances);
                    recyclerView.setAdapter(adapter);
                }
                adapter.notifyItemInserted(advances.size() - 1);
                recyclerView.scrollToPosition(adapter.getItemCount() - 1);
                return true;

            case R.id.save:
                recyclerView.requestFocus();
                new postloanrequest().executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
                finish();
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
    private class getadapterdata extends AsyncTask<Void, Void, List<Loan_Request>> {

        @Override
        protected List<Loan_Request> doInBackground(Void... notes) {
            return   amodel.Dao.Groupbookingsall();
        }
        @Override
        protected void onPostExecute(List<Loan_Request> res) {
            if(res.size()>0) {
                advances =res;
                adapter = new Loan_Request.adapter(getApplicationContext(),Loan_request_app.this, amodel.t,gmodel,mmodel,lpmodel);
                adapter.sett_line(advances);
                recyclerView.setAdapter(adapter);
            }

        }
    }
    private class postloanrequest extends AsyncTask<Void, Void, List<Loan_Request>> {

        @Override
        protected List<Loan_Request> doInBackground(Void... notes) {

            List<Loan_Request> n = null;
            try {

                Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
                String data = g.toJson(amodel.unsent());
                String result = JsonParser.postjson("loanrequest", "data", data);
                Type localType = new TypeToken<List<Loan_Request>>() {
                }.getType();
                n = new GsonBuilder().setDateFormat("yyyy-MM-dd").create().fromJson(result, localType);

            } catch (Exception e) {
                e.printStackTrace();
            }
            return n;
        }

        @Override
        protected void onPostExecute(List<Loan_Request> res) {
            if (res != null) {
                Boolean success = true;
                for (Loan_Request al : res
                ) {
                    if (al.Key.equals("")) {
                        Toast.makeText(Loan_request_app.this, "Failed to post transaction, please try again", Toast.LENGTH_SHORT).show();
                        success = false;
                    }
                    else {
al.setSent(true);
                        amodel.update(al);
                    }
                }

                finish();
            } else
                Toast.makeText(Loan_request_app.this, "Failed to post transaction, Please try again", Toast.LENGTH_SHORT).show();

        }
    }
}
